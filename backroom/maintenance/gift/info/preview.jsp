<%@ page contentType="text/html; charset=shift_jis"%>
<%@ page import="org.apache.struts.action.*,
								jp.co.yobrain.util.*,
								javax.naming.*,
								javax.sql.*,
								java.util.*,
								java.io.*,
								java.sql.*,
								jp.co.yobrain.util.DataFormat,
								jp.co.lastminute.maintenance.*,
								jp.co.lastminute.maintenance.util.WebUtil,
								jp.co.lastminute.maintenance.gift.*,
								jp.co.lastminute.maintenance.gift.model.*,
								jp.co.lastminute.maintenance.common.CommonDBOCache,
								jp.co.lastminute.maintenance.common.AgentWrapper" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%
	int type_cd = jp.co.lastminute.maintenance.gift.Property.product_type_cd;

	ServletContext servletContext = getServletContext();
	DataSource Datasouce  = (DataSource)servletContext.getAttribute( Action.DATA_SOURCE_KEY );

	GiftInfo giftinfo = (GiftInfo)request.getAttribute("giftinfo");

	CommonDBOCache cache = null;
	AgentWrapper agtWrapper = null;
	if(session.getAttribute("agtWrapper") == null){
		agtWrapper = new AgentWrapper( null, Datasouce );
		agtWrapper.getAgentMaps( "" + type_cd + "" );
		session.setAttribute("agtWrapper", agtWrapper.getCache() );
	}else{
		cache  = (CommonDBOCache)session.getAttribute("agtWrapper");
		agtWrapper = new AgentWrapper( cache, Datasouce );
	}
	List agents = agtWrapper.getCombos( "" + type_cd + "" );
	String[] daytag = {"1","2","3","4","5","6","7","8", "99"};
	String[] daytagStr = {"1","2","3","4","5","6","7","8", "指定不可"};
	String[] sending_timestrS = {"指定不可","午前,12-16時,16-19時,19-22時","午前,12-14時,16-20時,20-21時","午前,12-15時,15-18時,18-21時","9-12時,13-16時,17-19時,19-21時","午前,16-18時,18-20時","午前,午後,18-20時","午前,午後"};
	String[] etc_flgS = {"","1"};
	String[] etc_flgStr = {"","テキスト要"};
%>
        <table width="100%" border="0" cellspacing="1" cellpadding="2">
          <tr>
            <td colspan="3" align='center' class="b" bgcolor="#999999"> 商品詳細情報 </td>
            <td colspan="1" align='center' class="b" bgcolor="#999999">
            <input type="button" value="小カテゴリー" onClick="javascript:PopUpScatMaintenace('<%= giftinfo.jan_cd %>', '<%= type_cd %>');"> </td>
          </tr>
          <tr>
          	<td align="left" class="b" colspan="1" bgcolor="#CCCCCC">表示</td>
            <td width="120" class="b" align="left" bgcolor="#CCCCCC">商品コード</td>
            <td align="left" class="b" colspan="2" bgcolor="#CCCCCC">エージェント名</td>
          </tr>
          <tr>
          	<td class="b" align="left" bgcolor="#FFFFFF">
          		<input type="hidden" name="havealt" value='<%= giftinfo.havealt %>' />
<%= WebUtil.getStopOptionStr( "" + giftinfo.havealt + "" ) %>
            </td>
            <td align="left" bgcolor="#FFFFFF">
            	<input type="hidden" name="agt_product_cd" value='<%= giftinfo.agt_product_cd %>' />
            	<%= giftinfo.agt_product_cd %>
            </td>
            <td align="left" class="b" height="18" colspan="2" bgcolor="#FFFFFF">
            <input type="hidden" name="agt_cd" value='<%= giftinfo.agt_cd %>' />
<%= agtWrapper.getAgt_name( giftinfo.agt_cd ) %>
            </td>
          </tr>

          <input type="hidden" name="product_sub_title" value='<%= giftinfo.product_sub_title %>' />
          <tr>
            <td class="b" align="left" bgcolor="#CCCCCC" colspan="4">商品概要サブタイトル</td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td class="b" align="left" colspan='4'><%= giftinfo.product_sub_title %></td>
          </tr>


          <input type="hidden" name="product_name" value='<%= giftinfo.product_name %>' />
          <tr>
            <td align="left" class="b" colspan='4' bgcolor="#CCCCCC" colspan='4'>商品名</td>
          </tr>
          <tr bgcolor="#FFFFFF">
						<td align="left" colspan="4" bgcolor="#FFFFFF"><%= giftinfo.product_name %></td>
          </tr>


          <input type='hidden' name='price_catch' value='<%= giftinfo.price_catch %>'/>
          <tr>
            <td class="b" colspan='4' bgcolor="#CCCCCC">価格キャッチコピー</td>
          </tr>
          <tr>
            <td class="b" bgcolor="#FFFFFF" colspan="4"><%= giftinfo.price_catch %><br/></td>
          </tr>


          <input type="hidden" name="catchcopy" value='<%= giftinfo.catchcopy %>' />
          <tr>
            <td class="b" bgcolor="#CCCCCC" colspan='4'>キャッチコピー</td>
          </tr>
          <tr>
            <td class="b" bgcolor="#FFFFFF" colspan="4"><%= giftinfo.catchcopy %><br/></td>
          </tr>


          <tr>
          <td colspan=4>
			          <table border=0 width=100%>
			          <tr>
			          	<td class="b" align="left" width="90" bgcolor="#CCCCCC">価格</td>
			          	<td class="b" align="left" width="90" bgcolor="#CCCCCC">税金</td>
			          	<td class="b" align="left" width="115" bgcolor="#CCCCCC">指定送料日<br/>(yyyymmdd)</td>
			          	<td class="b" align="left" width="110" bgcolor="#CCCCCC">指定配送日(日後)</td>
			          	<td class="b" align="left" width="100" bgcolor="#CCCCCC">指定時間</td>
			          </tr>
			          <input type="hidden" name="price" value='<%= giftinfo.price %>' />
			          <input type="hidden" name="tax" value='<%= giftinfo.tax %>' />
			          <input type="hidden" name="sending" value='0' />
			          <input type="hidden" name="sending_tax" value='0' />
			          <input type="hidden" name="sending_calc_unit" value='<%= giftinfo.sending_calc_unit %>' />
			          <input type="hidden" name="sending_timestr" value='<%= giftinfo.sending_timestr %>' />
			          <input type="hidden" name="sending_date" value='<%= giftinfo.sending_date %>' />
			          <input type="hidden" name="sending_days" value='<%= giftinfo.sending_days %>' />
			         <input type="hidden" name="etc_flg" value='<%= giftinfo.etc_flg %>' />
			          <tr bgcolor="#FFFFFF">
			          	<td class="b" align="right" width="90"><%= giftinfo.price %></td>
			          	<td class="b" align="right" width="90"><%= giftinfo.tax %></td>
			          	<td class="b" align="right" width="115"><%= giftinfo.sending_date %></td>
			          	<td class="b" align="right" width="100"><%= giftinfo.sending_days	%></td>
			          	<td class="b" align="right" width="100"><%= WebUtil.getComboByListResult( sending_timestrS, sending_timestrS, giftinfo.sending_timestr  )	%></td>
			          </tr>
          		</table>
          	</td>
          </tr>

          <input type="hidden" name="mixed_types" value='<%= giftinfo.mixed_types %>' />
          <tr>
            <td class="b" bgcolor="#CCCCCC" colspan='4'>オプション</td>
          </tr>
          <tr>
            <td class="b" bgcolor="#FFFFFF" colspan="4"><%= giftinfo.mixed_types %></td>
          </tr>


          <input type="hidden" name="textvalue" value='<%= giftinfo.textvalue %>' />
          <tr>
            <td class="b" bgcolor="#CCCCCC" colspan='4'>テキスト</td>
          </tr>
          <tr>
          	<td class="b" bgcolor="#FFFFFF" colspan="4"><%= WebUtil.getComboByListResult( etc_flgS, etc_flgStr, giftinfo.etc_flg )	%>
						　<%= giftinfo.textvalue %></td>
          </tr>


          <tr>
          	<td class="b" bgcolor="#CCCCCC" colspan="4">ご案内</td>
          </tr>
          <tr>
            <td class="b" bgcolor="#FFFFFF" colspan="4">
						<textarea name='body' rows="8" cols="82"><%= giftinfo.body %></textarea><br>
						<!--<%= giftinfo.body %>--><br/></td>
          </tr>


					<!--
          <input type='hidden' name='opening' value='<%= giftinfo.opening %>'/>
          <tr>
            <td class="b" bgcolor="#FFFFFF" colspan="4"><%= giftinfo.price_catch %><br/></td>
          </tr>
          <tr>
            <td class="b" align="left" bgcolor="#CCCCCC" colspan="4">公開情報</td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td class="b" align="left" colspan="4"><%= giftinfo.opening %><br/></td>
          </tr>
					-->


          <input type='hidden' name='specword' value='<%= giftinfo.specword %>'/>
          <tr>
            <td class="b" align="left" bgcolor="#CCCCCC" colspan="4">製品仕様</td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td class="b" align="left" colspan="4"><%= giftinfo.specword %><br/></td>
          </tr>


          <input type='hidden' name='moreinfo' value='<%= giftinfo.moreinfo %>'/>
          <tr>
          	<td class="b" bgcolor="#CCCCCC" colspan="4">ご注意事項</td>
          </tr>
          <tr>
            <td class="b" bgcolor="#FFFFFF" colspan="4"><%= giftinfo.moreinfo %><br/></td>
          </tr>


          <input type='hidden' name='c_coment' value='<%= giftinfo.c_coment %>'/>
          <tr>
          	<td class="b" bgcolor="#CCCCCC" colspan="4">サプライヤー情報</td>
          </tr>
          <tr>
            <td class="b" bgcolor="#FFFFFF" colspan="4"><%= giftinfo.c_coment %><br/></td>
          </tr>


          <input type='hidden' name='linkedurl' value='<%= giftinfo.linkedurl %>'/>
          <input type='hidden' name='linkedurlvalue' value='<%= giftinfo.linkedurlvalue %>'/>
          <tr>
          	<td class="b" bgcolor="#CCCCCC" colspan="4">リンクURL</td>
          </tr>
          <tr>
            <td class="b" bgcolor="#FFFFFF" colspan="4">http://<%= giftinfo.linkedurl %><br/>
            説明<%= giftinfo.linkedurlvalue %>
						</td>
          </tr>

        </table>