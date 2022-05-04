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
	condition = condition.getRequestForHotel( request );

	ServletContext servletContext = getServletContext();
	DataSource datasouce = (DataSource)servletContext.getAttribute( Action.DATA_SOURCE_KEY );

	PageDetailHandler pagedetailhandler = new PageDetailHandler( condition.catClass, datasouce );

	String xmlstring = pagedetailhandler.getXmlString( condition );
	boolean result = pagedetailhandler.wriet( xmlstring, condition.agt_cd + "/" + condition.supnbr + ".xml" );
%>
<html
<head>
<title>No Title</title>
</head>
<body bgcolor="#FFFFFF">
xmlstring = <br/>
<%= xmlstring %>
<% if( result ){ %>
¬Œ÷
<%	}else{	%>
¸”s
<%	}	%>
</body>
</html>
