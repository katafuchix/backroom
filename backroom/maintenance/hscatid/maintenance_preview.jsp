<%@ page contentType="text/html;charset=Shift_JIS" %>
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
								jp.co.lastminute.maintenance.jdbc.*,
								jp.co.lastminute.maintenance.model.*,
								jp.co.lastminute.maintenance.scatid.*,
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

	ScatidList scatidlist = new ScatidList();
	scatidlist.getRequest( request );
	request.setAttribute("scatidlist", scatidlist);
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
<jsp:include page="preview.jsp" />
</body>
</html>