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
								jp.co.lastminute.maintenance.*,
								jp.co.lastminute.maintenance.hotel.*,
								jp.co.lastminute.maintenance.hotel.model.*,
								jp.co.lastminute.maintenance.util.WebUtil" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/app.tld" prefix="app" %>
<app:CheckMaintenaceLogon/>
<%
	Madrsp[] madrsps = ( Madrsp[] )request.getAttribute("madrsps");
%>
<table border='0' witdh='500' cellpadding="0" cellspacing="0">
	<tr>
		<td bgcolor="#999999">
<table border='0' witdh='500' cellpadding="1" cellspacing="1">
	<tr>
		<td bgcolor="#CCCCCC" align='center'>アクション</td>
		<td bgcolor="#CCCCCC" align='center'>ファシリティコード</td>
		<td bgcolor="#CCCCCC" align='center'>ホテル名(ホテル名(Eng))</td>
		<td bgcolor="#CCCCCC" align='center'>地区</td>
	</tr>
<%	for(int i=0; i<madrsps.length; i++){
			Madrsp madrsp = madrsps[i];
%>
<form action="/backroom/maintenance/hotel/madrsp/edit.jsp" method="post">
<input type='hidden' name='supnbr' value='<%= madrsp.supnbr %>'/>
<input type='hidden' name='agt_cd' value='<%= madrsp.agt_cd %>'/>
	<tr>
		<td bgcolor="#FFFFFF" align='center'><input type='submit' value='Edit'></td>
		<td bgcolor="#FFFFFF"><a href="javascript:PopUpCategoryHotel('<%= madrsp.supnbr %>', '<%= madrsp.agt_cd %>');"><%= madrsp.supnbr %></a><br/>
		<a href="javascript:PopUpWriteHotel('<%= madrsp.supnbr %>', '<%= madrsp.agt_cd %>', 'Hotel');">
		|Preview & Contents Update| </a> </td>
		<td bgcolor="#FFFFFF"><%= madrsp.jpnnam %><br/>( <%= madrsp.supnm1 %> )</td>
		<td bgcolor="#FFFFFF"><%= madrsp.state_name %>/<%= madrsp.city_name %></td>
	</tr>
</form>
<%	}	%>
</table>
		</td>
	</tr>
</table>