<%@ page contentType="text/html; charset=Shift_JIS" %>
<%@ page import="org.apache.struts.action.*,
								jp.co.yobrain.util.*,
								javax.naming.*,
								javax.sql.*,
								java.util.*,
								java.io.*,
								java.sql.*,
								jp.co.yobrain.util.DataFormat,
								jp.co.lastminute.maintenance.*,
								jp.co.lastminute.maintenance.jdbc.*,
								jp.co.lastminute.maintenance.model.*,
								jp.co.lastminute.maintenance.pages.*,
								jp.co.lastminute.maintenance.detail.*" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%
	response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
	response.setHeader("Pragma","no-cache"); //HTTP 1.0
	response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

	HandlerCondition condition = new HandlerCondition();
	condition = condition.getRequestByProductSeq( request );

	ServletContext servletContext = getServletContext();
	DataSource datasouce = (DataSource)servletContext.getAttribute( Action.DATA_SOURCE_KEY );

	PageDetailHandler pagedetailhandler = new PageDetailHandler( condition.catClass, datasouce );

	String xmlstring = pagedetailhandler.getXmlString( condition );
	boolean result = pagedetailhandler.wriet( xmlstring, condition.product_seq + ".xml" );
%>
<html>
<head>

<title>No Title</title>
</head>
<body bgcolor="#FFFFFF">
<% if( result ){ %>
<h1>ê¨å˜ÇµÇ‹ÇµÇΩ</h1>
<%	}else{	%>
<h1>é∏îs</h1>

<%= xmlstring %>
<%= condition.product_seq + ".xml" %>

<%	}	%>
<A href="javascript:window.close()"><img SRC="/img/res_img/close_button.gif" WIDTH="58" HEIGHT="18" BORDER="0"></A>
</body>
</html>
