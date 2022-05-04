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
%>
<HTML>
<HEAD>
<link REL="stylesheet" HREF="/backroom/maintenance/maintenance.css" TYPE="TEXT/CSS">
<meta HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=Shift_JIS">
<SCRIPT language="JavaScript" src="/backroom/maintenance/JavaScriptCommonLib.js">
</SCRIPT>
<TITLE>ホテルキャンペーン管理</TITLE>
</HEAD>
<body>
<form name='MainForm' method='post' action='campaignInserter.jsp'>
  <table width="600" border="0" cellpadding="0" cellspacing="0" align="center">
    <tr>
    <td bgcolor="#999999">

        <table width="100%" border="0" cellspacing="1" cellpadding="2">
          <tr bgcolor="#999999">
            <td colspan="2" align='center' class="b">ホテルキャンペーン追加</td>
          </tr>
          <tr bgcolor="#CCCCCC">
            <td align="center" class="b" colspan='2'>キャンペーン名</td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td align="left"  >
              <input type='text' name='campaign_name' class='textbox'  size='30' maxlength='13'>
            </td>
            <td align="center"  >
            	<input type="submit" name="Submit" value="追加">
            </td>
          </tr>
        </table>
    </td>
  </tr>
</table>
</form>
</body>
</html>

