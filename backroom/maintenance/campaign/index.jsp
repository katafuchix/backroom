<%@ page contentType="text/html; charset=shift_jis"%>
<%@ page import="org.apache.struts.action.*,
								jp.co.yobrain.util.*,
								javax.naming.*,
								javax.sql.*,
								java.util.*,
								java.io.*,
								java.sql.*,
								jp.co.yobrain.util.DataFormat,
								jp.co.yobrain.util.ParseFormat,
								jp.co.lastminute.ContextProperty,
								jp.co.lastminute.Hotel.lmjcampaign.*,
								jp.co.lastminute.maintenance.*,
								jp.co.lastminute.maintenance.campaign.*,
								jp.co.lastminute.maintenance.util.WebUtil" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/app.tld" prefix="app" %>
<app:CheckMaintenaceLogon/>
<%
	response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
	response.setHeader("Pragma","no-cache"); //HTTP 1.0
	response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

	ServletContext servletContext = getServletContext();
	DataSource Datasouce  = (DataSource)servletContext.getAttribute( ContextProperty.Lmjdatas_ );
	String[] lists = jp.co.lastminute.maintenance.Property.lists;
	String[] values = jp.co.lastminute.maintenance.Property.values;

	HandlerCondition condition = new HandlerCondition();

	//�f�[�^�x�[�X�̍쐬
	Lmj_campaignhandler db = new Lmj_campaignhandler( );
	db.setDataSource( Datasouce );
	Lmj_campaign[] lmj_campaigns = db.getList( condition );
%>
<HTML>
<HEAD>
<link REL="stylesheet" HREF="/backroom/maintenance/maintenance.css" TYPE="TEXT/CSS">
<meta HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=Shift_JIS">
<SCRIPT language="JavaScript" src="/backroom/maintenance/JavaScriptCommonLib.js"></SCRIPT>
<SCRIPT language="JavaScript" src="/backroom/maintenance/ImageMaintenance.js"></SCRIPT>
<TITLE>�z�e���L�����y�[���̃��X�g</TITLE>
</HEAD>
<body>
<!-- ========================== �z�e���L�����y�[�����X�g�{�b�N�X ============================== -->


  <table width="600" border="0" cellpadding="0" cellspacing="0" align="center">
    <tr>
    <td bgcolor="#999999">

        <table width="100%" border="0" cellspacing="1" cellpadding="2">
<form name='MainForm' method='post' action='./setUp2.jsp'>
          <tr bgcolor="#999999">
            <td align='center' class="b">�z�e���L�����y�[���ǉ�</td>
            <td align='right'><input type="submit" name="Submit" value="�R���e�L�X�g�X�V"/></td>
          </tr>
</form>
          <tr bgcolor="#CCCCCC">
            <td align="center" class="b" colspan='2'>�L�����y�[����</td>
          </tr>
<form name='MainForm' method='post' action='campaignInserter.jsp'>
          <tr bgcolor="#FFFFFF">
            <td align="left"  >
              <input type='text' name='campaign_name' class='textbox'  size='30' maxlength='13'>
            </td>
            <td align="center"  >
            	<input type="submit" name="Submit" value="�ǉ�">
            </td>
          </tr>
</form>
        </table>
    </td>
  </tr>
</table>


<!-- ========================== //�J�e�S���[���X�g�{�b�N�X ============================== -->
<!-- ========================== �M�t�g���i���X�g============================== -->
<br>
  <table width="600" border="0" cellpadding="0" cellspacing="0" align="center">
    <tr>
    <td bgcolor="#999999">
        <table width="100%" border="0" cellspacing="1" cellpadding="2">
          <tr bgcolor="#CCCCCC">
            <td width="356" class="b" align="center" width='89'>�L�����y�[����</td>
            <td class="b" align="center" width="44" >�C��</td>
          </tr>
<%	for( int i=0; i<lmj_campaigns.length; i++){		Lmj_campaign campaign = lmj_campaigns[ i ];	%>
					<form name='ListForm' method='post' action='campaignUpdater.jsp'>
					<input type='hidden' name='lmjcampaign' value='<%=	campaign.lmjcampaign	%>'/>
          <tr bgcolor="#FFFFFF">
            <td align="left" width="356">
            	<input type='text' name='campaign_name' class='textbox' size='30' maxlength='13' value='<%= campaign.campaign_name %>'/>
            </td>
            <td>
            	<input type='submit' value='�X�V'/>
            </td>
          </tr>
          </form>
<%	}	%>
        </table>
    </td>
  </tr>
</table>

<!-- ========================== �M�t�g���i���X�g============================== -->
</body>
</html>

