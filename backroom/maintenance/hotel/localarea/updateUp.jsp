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
								jp.co.lastminute.maintenance.hotel.localarea.*,
								jp.co.lastminute.maintenance.common.*,
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

	ServletContext servletContext = getServletContext();
	DataSource Datasouce  = (DataSource)servletContext.getAttribute( ContextProperty.Lmjdatas_ );
	String[] lists = jp.co.lastminute.maintenance.Property.lists;
	String[] values = jp.co.lastminute.maintenance.Property.values;

	LocalArea localarea = new LocalArea();
	localarea = localarea.getRequest( request );
	LocalAreahandler handler = new LocalAreahandler();
	handler.setDataSource( Datasouce );

	LocalAreaSupNbr localareasupnbr = new LocalAreaSupNbr();
	localareasupnbr = localareasupnbr.getRequest( request );
	LocalAreaSupNbrhandler handlersupnbr = new LocalAreaSupNbrhandler();
	handlersupnbr.setDataSource( Datasouce );

	LocalArea[] localAreas = handler.getList( localarea );

	if( localAreas == null ){
		return;
	}
	request.setAttribute("localarea", localarea);
	request.setAttribute("localAreas", localAreas);
	request.setAttribute("localareasupnbr", localareasupnbr);
%>
<html>
<head>
<script language='javascript'>
function setInputFormSelf(){
		var nexttag = document.forms[0].elements['parent_code'].value;
		document.forms[1].elements['local_area_code'].value = nexttag;
}
</script>
</head>
<body>
<jsp:include page="localAreaList.jsp" />
<jsp:include page="addForm.jsp" />
<%
	LocalAreaSupNbr[] localareasupnbrs = handlersupnbr.getList( localareasupnbr );
	if( localareasupnbrs != null ){
		request.setAttribute("localareasupnbrs", localareasupnbrs);
%>
<jsp:include page="LocalAreaSupNbrList.jsp"/>
<%	}else{	%>
<h4>“ÁêƒGƒŠƒA‚Íİ’è‚³‚ê‚Ä‚¢‚Ü‚¹‚ñB</h4>
<%	}	%>
</body>
</html>