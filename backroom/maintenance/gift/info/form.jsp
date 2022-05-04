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

	String[] daytagStr = {"1","2","3","4","5","6","7","8", "�w��s��"};

	String[] sending_timestrS = {"�w��s��","�ߑO,12-16��,16-19��,19-22��","�ߑO,12-14��,16-20��,20-21��","�ߑO,12-15��,15-18��,18-21��","9-12��,13-16��,17-19��,19-21��","�ߑO,16-18��,18-20��","�ߑO,�ߌ�,18-20��","�ߑO,�ߌ�"};

	String[] etc_flgS = {"","1"};

	String[] etc_flgStr = {"","�e�L�X�g�v"};

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
            <td colspan="3" align='center' class="b" bgcolor="#999999"> ���i�ڍ׏�� - <%= giftinfo.jan_cd %></td>
            <td colspan="1" align='center' class="b" bgcolor="#999999">
            <input type="button" value="���J�e�S���[" onClick="javascript:PopUpScatMaintenace('<%= giftinfo.jan_cd %>', '<%= type_cd %>');"> </td>
          </tr>
          <tr>
          	<td align="left" class="b" colspan="1" <%= WebUtil.getErrorColor( giftinfo.error_flg[13] ) %>>�\��</td>
            <td width="120" class="b" align="left" <%= WebUtil.getErrorColor( giftinfo.error_flg[1] ) %>>���i�R�[�h</td>
            <td align="left" class="b" colspan="2" bgcolor="#CCCCCC">�T�v���C���[��</td>
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
            <td class="b" align="left" <%= WebUtil.getErrorColor( giftinfo.error_flg[5] ) %> colspan="4">���i�T�v�T�u�^�C�g���i�S�p�P�Q�W�����j</td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td class="b" align="left" colspan='4'>
            	<input type='text' size='80' maxlength='90' name='product_sub_title' value='<%= giftinfo.product_sub_title %>' />
            </td>
          </tr>
          <tr>
            <td align="left" class="b" colspan='4' <%= WebUtil.getErrorColor( giftinfo.error_flg[4] ) %> colspan='4'>���i���i�S�p�T�O�����j</td>
          </tr>
          <tr bgcolor="#FFFFFF">
						<td align="left" colspan="4" bgcolor="#FFFFFF">
              <input type="text" name="product_name" class="textbox" size="100" maxlength='50' value='<%= giftinfo.product_name %>'/>
            </td>
          </tr>

          <tr>
            <td class="b" colspan='4' <%= WebUtil.getErrorColor( giftinfo.error_flg[7] ) %>>���i�L���b�`�R�s�[�i�S�p�Q�T�O�����j</td>
          </tr>
          <tr>
            <td class="b" bgcolor="#FFFFFF" colspan="4">
              <textarea name="price_catch" rows="3" cols="58" wrap="virtual" class="textarea"><%= giftinfo.price_catch %></textarea>
              <br>
            </td>
          </tr>

          <tr>
            <td class="b" <%= WebUtil.getErrorColor( giftinfo.error_flg[6] ) %> colspan='4'>�L���b�`�R�s�[�i�S�p�P�O�O�O�����j</td>
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
						    <td  class="b" align="left" width="90" <%= WebUtil.getErrorColor( giftinfo.error_flg[14] ) %>>���i</td>
						    <td  class="b" align="left" width="90" <%= WebUtil.getErrorColor( giftinfo.error_flg[15] ) %>><input type='button' onclick='calcTax();' value='�ŋ�'></td>
						    <td  class="b" align="left" width="115" <%= WebUtil.getErrorColor( giftinfo.error_flg[16] ) %>>�w��z����<Br/>������܂���<BR>���t�w��(yyyymmdd)</td>
						    <!--<td  class="b" align="left" width="110" <%= WebUtil.getErrorColor( giftinfo.error_flg[18] ) %>>�w��z����(����)</td>-->
						  	<td  class="b" align="left" width="110" <%= WebUtil.getErrorColor( giftinfo.error_flg[27] ) %>>�w��z������</td>
								<td  class="b" align="left" width="100" <%= WebUtil.getErrorColor( giftinfo.error_flg[23] ) %>>�w�莞��</td>
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
		     		<input type="submit" onClick="return doUpdate();" value="���f�[�^���X�V���遄">
		    		</td>
		  		</tr>

          <tr>
            <td class="b" <%= WebUtil.getErrorColor( giftinfo.error_flg[21] ) %> colspan='4'>�v���_�E��(�u,�v�ő����Ă�������)</td>
          </tr>
          <tr>
            <td class="b" bgcolor="#FFFFFF" colspan="4">
              <input type='text' name="mixed_types" size="80" value='<%= giftinfo.mixed_types %>' />
              <br>
            </td>
          </tr>

          <tr>
					  	<td  class="b" align="left" >�e�L�X�g</td>
          </tr>
          <tr>
            <td class="b" bgcolor="#FFFFFF" colspan="4">
				    <select name='etc_flg'>
 							<%= WebUtil.getComboByList( etc_flgS, etc_flgStr, "" + giftinfo.etc_flg + "" )	%>
 						</select>���K�v�ł����H�@�e�L�X�g�̃^�C�g��<input type="text" name="textvalue" value="<%= giftinfo.textvalue %>">
            </td>
          </tr>

					<!--
          <tr>
            <td class="b" align="left" <%= WebUtil.getErrorColor( giftinfo.error_flg[8] ) %> colspan="4">���f�ڊ���</td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td class="b" align="left" colspan="4">
            	<textarea name="opening" rows="3" cols="62" wrap="virtual" class="textarea"><%= giftinfo.opening %></textarea>
            </td>
          </tr>
					-->

          <tr>
          	<td class="b" <%= WebUtil.getErrorColor( giftinfo.error_flg[12] ) %> colspan="4">���ē��i�S�p�P�T�O�O����/HTML�^�O�g�p�j</td>
          </tr>
          <tr>
            <td class="b" bgcolor="#FFFFFF" colspan="4">
              <textarea name="body" rows="24" cols="58" wrap="virtual" class="textarea"><%= giftinfo.body %></textarea>
            </td>
          </tr>
          <tr>
            <td class="b" align="left" <%= WebUtil.getErrorColor( giftinfo.error_flg[9] ) %> colspan="4">���i�d�l�i�S�p�P�O�O�O�����j</td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td class="b" align="left" colspan="4">
            	<textarea name="specword" rows="12" cols="58" wrap="virtual" class="textarea"><%= giftinfo.specword %></textarea>
            </td>
          </tr>
          <tr>
          	<td class="b" <%= WebUtil.getErrorColor( giftinfo.error_flg[10] ) %> colspan="4">�����ӎ����i�S�p�P�T�O�O�����j</td>
          </tr>
          <tr>
            <td class="b" bgcolor="#FFFFFF" colspan="4">
              <textarea name="moreinfo" rows="24" cols="58" wrap="virtual" class="textarea"><%= giftinfo.moreinfo %></textarea>
            </td>
          </tr>

          <tr>
          	<td class="b" <%= WebUtil.getErrorColor( giftinfo.error_flg[11] ) %> colspan="4">�T�v���C���[���</td>
          </tr>
          <tr>
            <td class="b" bgcolor="#FFFFFF" colspan="4">
              <textarea name="c_coment" rows="24" cols="58" wrap="virtual" class="textarea"><%= giftinfo.c_coment %></textarea>
            </td>
          </tr>

          <tr>
          	<td class="b" <%= WebUtil.getErrorColor( giftinfo.error_flg[22] ) %> colspan="4">�����NURL�i���p�P�Q�W�����j</td>
          </tr>
					<tr>
            <td class="b" bgcolor="#FFFFFF" colspan="4">
            http://<input type='text' name="linkedurl" size="80" maxlength='80' value='<%= giftinfo.linkedurl %>' /><BR>
            ����<input type='text' name="linkedurlvalue" size="80" maxlength='80' value='<%= giftinfo.linkedurlvalue %>' />
            </td>
          </tr>
        </table>