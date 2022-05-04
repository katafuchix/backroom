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
	String[] lists = jp.co.lastminute.maintenance.Property.lists;
	String[] values = jp.co.lastminute.maintenance.Property.values;

%>
<HTML>
<HEAD>
<link REL="stylesheet" HREF="/backroom/maintenance/maintenance.css" TYPE="TEXT/CSS">
<meta HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=Shift_JIS">
<SCRIPT language="JavaScript" src="/backroom/maintenance/JavaScriptCommonLib.js">
</SCRIPT>
<TITLE>小カテゴリーメンテナンスのリスト</TITLE>
</HEAD>
<body>
<form name='MainForm' method='post' action='scatidInserter.jsp' onsubmit='return goInsert();'>
  <table width="600" border="0" cellpadding="0" cellspacing="0" align="center">
    <tr>
    <td bgcolor="#999999">

        <table width="100%" border="0" cellspacing="1" cellpadding="2">
          <tr bgcolor="#999999">
            <td colspan="3" align='center' class="b">小カテゴリー追加</td>
          </tr>
          <tr bgcolor="#CCCCCC">
            <td align="center" class="b" >カテゴリー名</td>
            <td align="center" class="b" >チャッチコピー</td>
            <td class="b" align="center">商品種類</td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td align="center"  >
              <input type="text" name="catch_copy" class="textbox"  size="40" maxlength="50">
            </td>
            <td align="center"  >
              <input type="text" name="description" class="textbox"  size="60" maxlength="60">
            </td>
            <td align="center" >
              <select name = "catid">
<%= WebUtil.getComboByList( lists, values, "" ) %>
              </select>
            </td>
          </tr>
          <tr bgcolor="#CCCCCC">
            <td align="center" colspan="3"  >
              <input type="submit" name="Submit" value="追加">
            </td>
          </tr>
        </table>
    </td>
  </tr>
</table>
</form>


<script language="JavaScript">
<!--

	function goInsert(){
		var valid = true;
		if (!js_CheckNecessary("MainForm","catch_copy",true,"小カテゴリー名は必須項目です。")){
					valid =  false;
		}
		return valid;
	}
//-->
</script>
</body>
</html>

