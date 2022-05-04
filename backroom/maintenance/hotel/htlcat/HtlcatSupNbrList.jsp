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
								jp.co.lastminute.maintenance.hotel.htlcat.*,
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

	HtlcatSupNbr[] htlcatsupnbrs = (HtlcatSupNbr[])request.getAttribute("htlcatsupnbrs");
%>
<table border='0' witdh='500' cellpadding="0" cellspacing="0">
	<tr>
		<td bgcolor="#999999">
<table width='500' border="0" cellspacing="1" cellpadding="1">
<%
		for(int i=0; i<htlcatsupnbrs.length; i++){
			HtlcatSupNbr supnbrcat = htlcatsupnbrs[ i ];
%>
<form action='/backroom/maintenance/hotel/htlcat/remove.jsp' method='post'>
<input type='hidden' name='htlcat' value='<%= supnbrcat.htlcat %>'/>
<input type='hidden' name='supnbr' value='<%= supnbrcat.supnbr %>'/>
<input type='hidden' name='agt_cd' value='<%= supnbrcat.agt_cd %>'/>
<input type='hidden' name='seq_no' value='<%= supnbrcat.seq_no %>'/>
	<tr>
		<td width='350' bgcolor="#FFFFFF"><%= supnbrcat.htlcat_name %></td>
		<td width='50' bgcolor="#FFFFFF"><%= supnbrcat.seq_no %></td>
		<td width='50' bgcolor="#FFFFFF"><%= supnbrcat.supnbr %></td>
		<td width='50' bgcolor="#FFFFFF"><%= supnbrcat.agt_cd %></td>
		<td width='50' bgcolor="#FFFFFF"><input type='submit' value='Del'></td>
	</tr>
</form>
<%	}	%>
