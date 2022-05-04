<%@ page contentType="text/html; charset=Shift_JIS" %>
<%@ page import="org.apache.struts.action.*,
								jp.co.yobrain.util.*,
								javax.naming.*,
								javax.sql.*,
								java.util.*,
								java.io.*,
								java.sql.*,
								jp.co.yobrain.util.DataFormat,
								jp.co.lastminute.ContextProperty,
								jp.co.lastminute.maintenance.*,
								jp.co.lastminute.maintenance.jdbc.*,
								jp.co.lastminute.maintenance.model.*,
								jp.co.lastminute.maintenance.pages.*,
								jp.co.lastminute.maintenance.detail.*" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c" %><%@ taglib uri="/WEB-INF/x.tld" prefix="xml" %><%@ taglib uri="/WEB-INF/fmt.tld" prefix="fmt" %>
<%	ParseFormat pf = null;	%>
<%
	response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
	response.setHeader("Pragma","no-cache"); //HTTP 1.0
	response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

	HandlerCondition condition = new HandlerCondition();
	condition = condition.getRequestForHotel( request );

	ServletContext servletContext = getServletContext();
	DataSource datasouce = (DataSource)servletContext.getAttribute( Action.DATA_SOURCE_KEY );

	PageDetailHandler pagedetailhandler = new PageDetailHandler( condition.catClass, datasouce );

	String xmlstring = pagedetailhandler.getXmlString( condition );
	request.setAttribute("xmlstring", xmlstring);

	String includfile = condition.catClass + ".jsp";
%>
<html
<head>
<title>ƒƒ“ƒeƒiƒ“ƒX</title>
</head>
<body BGCOLOR="#FFFFFF" TEXT="#000000" LEFTMARGIN="0" TOPMARGIN="0" MARGINWIDTH="0" MARGINHEIGHT="0">
<form action="./updateHotel.jsp" method="post">
	<input type="hidden" name="supnbr" value="<%= condition.supnbr %>">
	<input type="hidden" name="agt_cd" value="<%= condition.agt_cd %>">
	<input type="hidden" name="catClass" value="<%= condition.catClass %>">
	<input type="submit" value="Write">
</form>
<jsp:include page="<%= includfile %>" />
</body>
</html>
