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

	LocalAreaSupNbr[] localareasupnbrs = (LocalAreaSupNbr[])request.getAttribute("localareasupnbrs");
%>
<table border='0' witdh='500' cellpadding="0" cellspacing="0">
	<tr>
		<td bgcolor="#999999">
<table width='500' border="0" cellspacing="1" cellpadding="1">
<%
		for(int i=0; i<localareasupnbrs.length; i++){
			LocalAreaSupNbr lsupnbr = localareasupnbrs[ i ];
%>
<form action='/backroom/maintenance/hotel/localarea/remove.jsp' method='post'>
<input type='hidden' name='supnbr' value='<%= lsupnbr.supnbr %>'/>
<input type='hidden' name='agt_cd' value='<%= lsupnbr.agt_cd %>'/>
<input type='hidden' name='local_area_code' value='<%= lsupnbr.local_area_code %>'/>
<input type='hidden' name='seq_no' value='<%= lsupnbr.seq_no %>'/>
	<tr>
		<td width='350' bgcolor="#FFFFFF"><%= lsupnbr.local_area_code_name %></td>
		<td width='50' bgcolor="#FFFFFF"><%= lsupnbr.seq_no %></td>
		<td width='50' bgcolor="#FFFFFF"><%= lsupnbr.supnbr %></td>
		<td width='50' bgcolor="#FFFFFF"><%= lsupnbr.agt_cd %></td>
		<td width='50' bgcolor="#FFFFFF"><input type='submit' value='Del'></td>
	</tr>
</form>
<%	}	%>
