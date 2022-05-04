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

	//AgtInfo
	GiftInfohandler handler = new GiftInfohandler();
	handler.setDataSource( Datasouce );

	//String AgtInfo = handler.getAgtInfo( giftinfo.agt_cd );

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
<script language="javascript">

function calcTax( ){
	
	var tax = 5;
	var price = new Number( document.forms['0'].elements['price'].value );

	if (price != 0) {
		tax = (( price * tax ) / 100);
		price = price + tax;
		document.forms['0'].elements['tax'].value= Math.floor(tax);
		document.forms['0'].elements['price'].value= Math.floor(price);
	}

}
//-->
</SCRIPT>



        <table width="100%" border="0" cellspacing="1" cellpadding="2">
          <tr>
            <td colspan="3" align='center' class="b" bgcolor="#999999"> 商品詳細情報 - <%= giftinfo.jan_cd %></td>
            <td colspan="1" align='center' class="b" bgcolor="#999999">
            <input type="button" value="小カテゴリー" onClick="javascript:PopUpScatMaintenace('<%= giftinfo.jan_cd %>', '<%= type_cd %>');"> </td>
          </tr>
          <tr>
          	<td align="left" class="b" colspan="1" <%= WebUtil.getErrorColor( giftinfo.error_flg[13] ) %>>表示</td>
            <td width="120" class="b" align="left" <%= WebUtil.getErrorColor( giftinfo.error_flg[1] ) %>>商品コード</td>
            <td align="left" class="b" colspan="2" bgcolor="#CCCCCC">サプライヤー名</td>
          </tr>
          <tr>
          	<td class="b" align="left" bgcolor="#FFFFFF">
              <select name="havealt">
								<%= WebUtil.getStopOption( "" + giftinfo.havealt + "" ) %>
              </select>
            </td>
            <td align="left" bgcolor="#FFFFFF">
         <input type="text" name="agt_product_cd" class="textbox" size='15' maxlength='15' value='<%= giftinfo.agt_product_cd %>' style="ime-mode:disabled;" />
            </td>
            <td align="left" class="b" height="18" colspan="2" bgcolor="#FFFFFF">
            <select name="agt_cd">
<%= WebUtil.getComboByList( agents, giftinfo.agt_cd ) %>
              </select>
            </td>
          </tr>
          <tr>
            <td class="b" align="left" <%= WebUtil.getErrorColor( giftinfo.error_flg[5] ) %> colspan="4">商品概要サブタイトル（全角１２８文字）</td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td class="b" align="left" colspan='4'>
            	<input type='text' size='80' maxlength='90' name='product_sub_title' value='<%= giftinfo.product_sub_title %>' />
            </td>
          </tr>
          <tr>
            <td align="left" class="b" colspan='4' <%= WebUtil.getErrorColor( giftinfo.error_flg[4] ) %> colspan='4'>商品名（全角５０文字）</td>
          </tr>
          <tr bgcolor="#FFFFFF">
						<td align="left" colspan="4" bgcolor="#FFFFFF">
              <input type="text" name="product_name" class="textbox" size="100" maxlength='50' value='<%= giftinfo.product_name %>'/>
            </td>
          </tr>

          <tr>
            <td class="b" colspan='4' <%= WebUtil.getErrorColor( giftinfo.error_flg[7] ) %>>価格キャッチコピー（全角２５０文字）</td>
          </tr>
          <tr>
            <td class="b" bgcolor="#FFFFFF" colspan="4">
              <textarea name="price_catch" rows="3" cols="58" wrap="virtual" class="textarea"><%= giftinfo.price_catch %></textarea>
              <br>
            </td>
          </tr>

          <tr>
            <td class="b" <%= WebUtil.getErrorColor( giftinfo.error_flg[6] ) %> colspan='4'>キャッチコピー（全角１０００文字）</td>
          </tr>
          <tr>
            <td class="b" bgcolor="#FFFFFF" colspan="4">
              <textarea name="catchcopy" rows="5" cols="58" wrap="virtual" class="textarea"><%= giftinfo.catchcopy %></textarea>
              <br>
            </td>
          </tr>

          <tr>
          <td colspan=4>
						<table border=0 width=100%>
						  <tr>
						    <td  class="b" align="left" width="90" <%= WebUtil.getErrorColor( giftinfo.error_flg[14] ) %>>価格</td>
						    <td  class="b" align="left" width="90" <%= WebUtil.getErrorColor( giftinfo.error_flg[15] ) %>><input type='button' onclick='calcTax();' value='税金'></td>
						    <td  class="b" align="left" width="115" <%= WebUtil.getErrorColor( giftinfo.error_flg[16] ) %>>指定配送日<Br/>○日後または<BR>日付指定(yyyymmdd)</td>
						    <!--<td  class="b" align="left" width="110" <%= WebUtil.getErrorColor( giftinfo.error_flg[18] ) %>>指定配送日(日後)</td>-->
						  	<td  class="b" align="left" width="110" <%= WebUtil.getErrorColor( giftinfo.error_flg[27] ) %>>指定配送期間</td>
								<td  class="b" align="left" width="100" <%= WebUtil.getErrorColor( giftinfo.error_flg[23] ) %>>指定時間</td>
						  </tr>
						 	<input type='hidden' name='sending_tax' value='<%= giftinfo.sending_tax %>'/>
							<tr bgcolor="#FFFFFF">
						  	<td  class="b" align="left" width="90">
						    <input type='text' size='6' maxlength='6' name='price' value='<%= giftinfo.price %>' style='ime-mode:disabled;' />
						    </td>
						    <td  class="b" align="left" width="90">
						    <input type='text' size='6' maxlength='5' name='tax' value='<%= giftinfo.tax %>' style='ime-mode:disabled;' />
						    </td>
						    <!--<td  class="b" align="left" width="115">
						    <input type='text' size='9' maxlength='8' name='sending' value='<%= giftinfo.sending %>' style='ime-mode:disabled;' />
						    </td>-->
						    <td  class="b" align="left" width="115">
						    <input type='text' size='9' maxlength='8' name='sending_date' value='<%= giftinfo.sending_date %>' style='ime-mode:disabled;' />
						    </td>
						    <td  class="b" align="left" width="110">
						    <input type='text' size='4' maxlength='2' name='sending_days' value='<%= giftinfo.sending_days %>' style='ime-mode:disabled;' />
						    </td>
						    <td  class="b" align="left" width="100">
						    <select name='sending_timestr'>
						 <%= WebUtil.getComboByList( sending_timestrS, sending_timestrS, "" + giftinfo.sending_timestr + "" )	%>
						 		</select>
						    </td>
							</tr>
						</table>
          	</td>
          </tr>

		    	<tr>
		    		<td bgcolor="#FFFFFF" align="right" colspan="4">
		     		<input type="submit" onClick="return doUpdate();" value="＞データを更新する＞">
		    		</td>
		  		</tr>

          <tr>
            <td class="b" <%= WebUtil.getErrorColor( giftinfo.error_flg[21] ) %> colspan='4'>プルダウン(「,」で続けてください)</td>
          </tr>
          <tr>
            <td class="b" bgcolor="#FFFFFF" colspan="4">
              <input type='text' name="mixed_types" size="80" value='<%= giftinfo.mixed_types %>' />
              <br>
            </td>
          </tr>

          <tr>
					  	<td  class="b" align="left" >テキスト</td>
          </tr>
          <tr>
            <td class="b" bgcolor="#FFFFFF" colspan="4">
				    <select name='etc_flg'>
 							<%= WebUtil.getComboByList( etc_flgS, etc_flgStr, "" + giftinfo.etc_flg + "" )	%>
 						</select>←必要ですか？　テキストのタイトル<input type="text" name="textvalue" value="<%= giftinfo.textvalue %>">
            </td>
          </tr>

					<!--
          <tr>
            <td class="b" align="left" <%= WebUtil.getErrorColor( giftinfo.error_flg[8] ) %> colspan="4">情報掲載期間</td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td class="b" align="left" colspan="4">
            	<textarea name="opening" rows="3" cols="62" wrap="virtual" class="textarea"><%= giftinfo.opening %></textarea>
            </td>
          </tr>
					-->

          <tr>
          	<td class="b" <%= WebUtil.getErrorColor( giftinfo.error_flg[12] ) %> colspan="4">ご案内（全角１５００文字/HTMLタグ使用可）</td>
          </tr>
          <tr>
            <td class="b" bgcolor="#FFFFFF" colspan="4">
              <textarea name="body" rows="24" cols="58" wrap="virtual" class="textarea"><%= giftinfo.body %></textarea>
            </td>
          </tr>
          <tr>
            <td class="b" align="left" <%= WebUtil.getErrorColor( giftinfo.error_flg[9] ) %> colspan="4">製品仕様（全角１０００文字）</td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td class="b" align="left" colspan="4">
            	<textarea name="specword" rows="12" cols="58" wrap="virtual" class="textarea"><%= giftinfo.specword %></textarea>
            </td>
          </tr>
          <tr>
          	<td class="b" <%= WebUtil.getErrorColor( giftinfo.error_flg[10] ) %> colspan="4">ご注意事項（全角１５００文字）</td>
          </tr>
          <tr>
            <td class="b" bgcolor="#FFFFFF" colspan="4">
              <textarea name="moreinfo" rows="24" cols="58" wrap="virtual" class="textarea"><%= giftinfo.moreinfo %></textarea>
            </td>
          </tr>

          <tr>
          	<td class="b" <%= WebUtil.getErrorColor( giftinfo.error_flg[11] ) %> colspan="4">サプライヤー情報</td>
          </tr>
          <tr>
            <td class="b" bgcolor="#FFFFFF" colspan="4">
              <textarea name="c_coment" rows="24" cols="58" wrap="virtual" class="textarea"><%= giftinfo.c_coment %></textarea>
            </td>
          </tr>

          <tr>
          	<td class="b" <%= WebUtil.getErrorColor( giftinfo.error_flg[22] ) %> colspan="4">リンクURL（半角１２８文字）</td>
          </tr>
					<tr>
            <td class="b" bgcolor="#FFFFFF" colspan="4">
            http://<input type='text' name="linkedurl" size="80" maxlength='80' value='<%= giftinfo.linkedurl %>' /><BR>
            説明<input type='text' name="linkedurlvalue" size="80" maxlength='80' value='<%= giftinfo.linkedurlvalue %>' />
            </td>
          </tr>
        </table>