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
								jp.co.lastminute.maintenance.hotel.*,
								jp.co.lastminute.maintenance.hotel.model.*,
								jp.co.lastminute.maintenance.common.*,
								jp.co.lastminute.maintenance.common.CommonDBOCache,
								jp.co.lastminute.maintenance.util.WebUtil" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/app.tld" prefix="app" %>
<app:CheckMaintenaceLogon/>
<%
	int type_cd = jp.co.lastminute.maintenance.hotel.Property.product_type_cd;

	ServletContext servletContext = getServletContext();
	DataSource Datasouce  = (DataSource)servletContext.getAttribute( ContextProperty.Lmjdatas_ );

	if( session.getAttribute("newHotelhandler") == null){
%><H3>‚m‚ƒZƒbƒVƒ‡ƒ“</h3><%
	return;
	}
	newHotelhandler handler = (newHotelhandler)session.getAttribute("newHotelhandler");
	boolean flag = handler.setdata();
%>
<html>
<body>
<%
	if( flag ){
		session.removeAttribute("newHotelhandler");
%>
<h3>‚g‚s‚s‚oŽ{Ý’Ç‰Á¬Œ÷</h3>
<%	}else{	%>
<h3>‚g‚s‚s‚oŽ{Ý’Ç‰ÁŽ¸”s</h3>
<% 	}	%>
</body>
</html>