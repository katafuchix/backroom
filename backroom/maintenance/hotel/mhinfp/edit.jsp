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
								jp.co.lastminute.maintenance.*,
								jp.co.lastminute.maintenance.common.*,
								jp.co.lastminute.maintenance.hotel.*,
								jp.co.lastminute.maintenance.hotel.model.*,
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

	int type_cd = jp.co.lastminute.maintenance.hotel.Property.product_type_cd;

	ServletContext servletContext = getServletContext();
	DataSource Datasouce  = (DataSource)servletContext.getAttribute( ContextProperty.Lmjdatas_ );
	String[] lists = jp.co.lastminute.maintenance.Property.lists;
	String[] values = jp.co.lastminute.maintenance.Property.values;

	HotelhandlerCondition condition = new HotelhandlerCondition();
	condition.getRequestBySearch( request );

	Mhinfphandler handler = new Mhinfphandler();
	handler.setDataSource( Datasouce );

	Mhinfp mhinfp = handler.getDetail( condition );

	if( mhinfp == null ){
%><h3>ŒŸõ‚ÉŠY“–‚µ‚Ü‚¹‚ñ‚Å‚µ‚½B</h3><%
	}
	request.setAttribute("mhinfp", mhinfp );
%>
<html>
<head>
<SCRIPT language="JavaScript" src="/backroom/maintenance/hotelSupport.js"></SCRIPT>
</head>
<body>
<table border='0' witdh='500' cellpadding="0" cellspacing="0">
<form name='MainForm' method='post' action='productupdateCtr.jsp'>
	<tr>
		<td bgcolor="#000000">
<jsp:include page="form.jsp" />
		</td>
	</tr>
	<tr><td align='center'><input type='submit' value='XV'></td>
	</td>
</form>
</table>
</body>