<%@ page contentType="text/html; charset=shift_jis"%>
<%@ page import="org.apache.struts.action.*,
								jp.co.yobrain.util.*,
								javax.naming.*,
								javax.sql.*,
								java.util.*,
								java.io.*,
								java.sql.*,
								jp.co.lastminute.maintenance.amuse.AmuseRemover" %>
<%@ taglib uri="/WEB-INF/app.tld" prefix="app" %>
<app:CheckMaintenaceLogon/>
<%
	response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
	response.setHeader("Pragma","no-cache"); //HTTP 1.0
	response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

	ServletContext servletContext = getServletContext();
	DataSource Datasouce  = (DataSource)servletContext.getAttribute( Action.DATA_SOURCE_KEY );
	String[] lists = jp.co.lastminute.maintenance.Property.lists;
	String[] values = jp.co.lastminute.maintenance.Property.values;

	AmuseRemover handler = new AmuseRemover( Datasouce );
	handler.getNewReq( request );
	boolean flg = handler.isError();
	if( flg ){
		flg = handler.Remove( AmuseRemover.PRODUCT_remove_ );
	}
%>
<html>
<head>
</head>
<body>
<% if( flg ){	%><h3>Success</h3><%	}else{	%><h3>Fail</h3><%	}	%>
</body>
</html>