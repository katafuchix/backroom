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
	int type_cd = jp.co.lastminute.maintenance.hotel.Property.product_type_cd;

	ServletContext servletContext = getServletContext();
	DataSource Datasouce  = (DataSource)servletContext.getAttribute( ContextProperty.Lmjdatas_ );
	String[] lists = jp.co.lastminute.maintenance.Property.lists;
	String[] values = jp.co.lastminute.maintenance.Property.values;

	HotelhandlerCondition condition = new HotelhandlerCondition();
	condition.getRequestBySearch( request );

	Madrsphandler handler = new Madrsphandler();
	handler.setDataSource( Datasouce );

	Madrsp madrsp = handler.getDetail( condition );

	if( madrsp == null ){
%><h3>åüçıÇ…äYìñÇµÇ‹ÇπÇÒÇ≈ÇµÇΩÅB</h3><%
	}
	CommonDBOCache cache = null;
	AgentWrapper agtWrapper = null;
	if(session.getAttribute("agtWrapper") == null){
		agtWrapper = new AgentWrapper( null, Datasouce );
		agtWrapper.getAgentMaps( "" + type_cd + "" );
		session.setAttribute("agtWrapper", agtWrapper.getCache() );
	}else{
		cache  = (CommonDBOCache)session.getAttribute("agtWrapper");
		agtWrapper = new AgentWrapper( cache, Datasouce );
	}
	request.setAttribute("agtWrapper", agtWrapper );
	request.setAttribute("madrsp", madrsp );
%>
<html>
<head>
<SCRIPT language="JavaScript" src="/backroom/maintenance/hotelSupport.js"></SCRIPT>
</head>
<body>
<table border='0' witdh='500' cellpadding="0" cellspacing="0">
<tr>
	<td bgcolor="#AAAAAA">
	|<a href='/backroom/maintenance/hotel/mhfcwp/edit.jsp?supnbr=<%= madrsp.supnbr %>&agt_cd=<%= madrsp.agt_cd %>'>mhfcwp</a>|
	</td>
	<td bgcolor="#AAAAAA">
	|<a href='/backroom/maintenance/hotel/mhinfp/edit.jsp?supnbr=<%= madrsp.supnbr %>&agt_cd=<%= madrsp.agt_cd %>'>mhinfp</a>|
	</td>
	<td bgcolor="#AAAAAA">
	|<a href='/backroom/maintenance/hotel/mhtlcp/edit.jsp?supnbr=<%= madrsp.supnbr %>&agt_cd=<%= madrsp.agt_cd %>'>mhtlcp</a>|
	</td>
</tr>
</table>
<table border='0' witdh='500' cellpadding="0" cellspacing="0">
<form name='MainForm' method='post' action='productupdateCtr.jsp'>
	<tr>
		<td bgcolor="#000000">
<jsp:include page="form.jsp" />
		</td>
	</tr>
	<tr><td align='center'><input type='submit' value='çXêV'></td>
	</td>
</form>
</table>
</body>