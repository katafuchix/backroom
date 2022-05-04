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
	String[] daytagStr = {"1","2","3","4","5","6","7","8", "�w��s��"};
	String[] sending_timestrS = {"�w��s��","�ߑO,12-16��,16-19��,19-22��","�ߑO,12-14��,16-20��,20-21��","�ߑO,12-15��,15-18��,18-21��","9-12��,13-16��,17-19��,19-21��","�ߑO,16-18��,18-20��","�ߑO,�ߌ�,18-20��","�ߑO,�ߌ�"};
	String[] etc_flgS = {"","1"};
	String[] etc_flgStr = {"","�e�L�X�g�v"};
%>
        <table width="100%" border="0" cellspacing="1" cellpadding="2">
          <tr>
            <td colspan="3" align='center' class="b" bgcolor="#999999"> ���i�ڍ׏�� </td>
            <td colspan="1" align='center' class="b" bgcolor="#999999">
            <input type="button" value="���J�e�S���[" onClick="javascript:PopUpScatMaintenace('<%= giftinfo.jan_cd %>', '<%= type_cd %>');"> </td>
          </tr>
          <tr>
          	<td align="left" class="b" colspan="1" bgcolor="#CCCCCC">�\��</td>
            <td width="120" class="b" align="left" bgcolor="#CCCCCC">���i�R�[�h</td>
            <td align="left" class="b" colspan="2" bgcolor="#CCCCCC">�G�[�W�F���g��</td>
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
            <td class="b" align="left" bgcolor="#CCCCCC" colspan="4">���i�T�v�T�u�^�C�g��</td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td class="b" align="left" colspan='4'><%= giftinfo.product_sub_title %></td>
          </tr>


          <input type="hidden" name="product_name" value='<%= giftinfo.product_name %>' />
          <tr>
            <td align="left" class="b" colspan='4' bgcolor="#CCCCCC" colspan='4'>���i��</td>
          </tr>
          <tr bgcolor="#FFFFFF">
						<td align="left" colspan="4" bgcolor="#FFFFFF"><%= giftinfo.product_name %></td>
          </tr>


          <input type='hidden' name='price_catch' value='<%= giftinfo.price_catch %>'/>
          <tr>
            <td class="b" colspan='4' bgcolor="#CCCCCC">���i�L���b�`�R�s�[</td>
          </tr>
          <tr>
            <td class="b" bgcolor="#FFFFFF" colspan="4"><%= giftinfo.price_catch %><br/></td>
          </tr>


          <input type="hidden" name="catchcopy" value='<%= giftinfo.catchcopy %>' />
          <tr>
            <td class="b" bgcolor="#CCCCCC" colspan='4'>�L���b�`�R�s�[</td>
          </tr>
          <tr>
            <td class="b" bgcolor="#FFFFFF" colspan="4"><%= giftinfo.catchcopy %><br/></td>
          </tr>


          <tr>
          <td colspan=4>
			          <table border=0 width=100%>
			          <tr>
			          	<td class="b" align="left" width="90" bgcolor="#CCCCCC">���i</td>
			          	<td class="b" align="left" width="90" bgcolor="#CCCCCC">�ŋ�</td>
			          	<td class="b" align="left" width="115" bgcolor="#CCCCCC">�w�著����<br/>(yyyymmdd)</td>
			          	<td class="b" align="left" width="110" bgcolor="#CCCCCC">�w��z����(����)</td>
			          	<td class="b" align="left" width="100" bgcolor="#CCCCCC">�w�莞��</td>
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
            <td class="b" bgcolor="#CCCCCC" colspan='4'>�I�v�V����</td>
          </tr>
          <tr>
            <td class="b" bgcolor="#FFFFFF" colspan="4"><%= giftinfo.mixed_types %></td>
          </tr>


          <input type="hidden" name="textvalue" value='<%= giftinfo.textvalue %>' />
          <tr>
            <td class="b" bgcolor="#CCCCCC" colspan='4'>�e�L�X�g</td>
          </tr>
          <tr>
          	<td class="b" bgcolor="#FFFFFF" colspan="4"><%= WebUtil.getComboByListResult( etc_flgS, etc_flgStr, giftinfo.etc_flg )	%>
						�@<%= giftinfo.textvalue %></td>
          </tr>


          <tr>
          	<td class="b" bgcolor="#CCCCCC" colspan="4">���ē�</td>
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
            <td class="b" align="left" bgcolor="#CCCCCC" colspan="4">���J���</td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td class="b" align="left" colspan="4"><%= giftinfo.opening %><br/></td>
          </tr>
					-->


          <input type='hidden' name='specword' value='<%= giftinfo.specword %>'/>
          <tr>
            <td class="b" align="left" bgcolor="#CCCCCC" colspan="4">���i�d�l</td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td class="b" align="left" colspan="4"><%= giftinfo.specword %><br/></td>
          </tr>


          <input type='hidden' name='moreinfo' value='<%= giftinfo.moreinfo %>'/>
          <tr>
          	<td class="b" bgcolor="#CCCCCC" colspan="4">�����ӎ���</td>
          </tr>
          <tr>
            <td class="b" bgcolor="#FFFFFF" colspan="4"><%= giftinfo.moreinfo %><br/></td>
          </tr>


          <input type='hidden' name='c_coment' value='<%= giftinfo.c_coment %>'/>
          <tr>
          	<td class="b" bgcolor="#CCCCCC" colspan="4">�T�v���C���[���</td>
          </tr>
          <tr>
            <td class="b" bgcolor="#FFFFFF" colspan="4"><%= giftinfo.c_coment %><br/></td>
          </tr>


          <input type='hidden' name='linkedurl' value='<%= giftinfo.linkedurl %>'/>
          <input type='hidden' name='linkedurlvalue' value='<%= giftinfo.linkedurlvalue %>'/>
          <tr>
          	<td class="b" bgcolor="#CCCCCC" colspan="4">�����NURL</td>
          </tr>
          <tr>
            <td class="b" bgcolor="#FFFFFF" colspan="4">http://<%= giftinfo.linkedurl %><br/>
            ����<%= giftinfo.linkedurlvalue %>
						</td>
          </tr>

        </table>