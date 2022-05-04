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
	String[] lists = jp.co.lastminute.maintenance.Property.lists;
	String[] values = jp.co.lastminute.maintenance.Property.values;

	HotelhandlerCondition condition = new HotelhandlerCondition();
	condition.getRequestBySearch( request );

	Madrsphandler handler = new Madrsphandler();
	handler.setDataSource( Datasouce );

	Madrsp[] madrsps = handler.getList( condition );

	if( madrsps == null ){
		%><H3>ŒŸõðŒ‚Éˆê’v‚µ‚Ü‚¹‚ñ‚Å‚µ‚½B</h3><%
		return;
	}
	request.setAttribute( "madrsps",  madrsps );
%>
<html>
<head>
<SCRIPT language="JavaScript" src="/backroom/maintenance/ScatidMaintenance.js"></SCRIPT>
</head>
<body>
<jsp:include page="productLists.jsp" />
</body>
</html>