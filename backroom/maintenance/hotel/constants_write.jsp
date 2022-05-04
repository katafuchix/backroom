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
								jp.co.lastminute.maintenance.xmlstruct.*,
								jp.co.lastminute.maintenance.pages.*,
								jp.co.lastminute.maintenance.util.WebUtil,
								jp.co.lastminute.maintenance.hotel.*" %>
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
	DataSource Datasouce = (DataSource)servletContext.getAttribute( ContextProperty.Lmjdatas_ );

	int type_cd = jp.co.lastminute.maintenance.hotel.Property.product_type_cd;

	int page_type = 0;
	try{
		page_type = Integer.parseInt( request.getParameterValues("page_type")[0] );
	}catch(Exception ex){	}

	//XMLƒtƒ@ƒCƒ‹‚Ìì¬
	Hotel xmlmakr = new Hotel();
	xmlmakr.init( Datasouce );
	xmlmakr.setpageamount( page_type );
	String xmlstring = xmlmakr.xmlString();
	String outout = "LEBEL 1";
	String outout1 = "LEBEL 2";
	boolean flg = true;
	outout = xmlmakr.makeXml( xmlstring, page_type );
	outout1 = xmlmakr.changeContextStr( );
%>
<%= outout %><br/>
<%= outout1 %>
<br/>