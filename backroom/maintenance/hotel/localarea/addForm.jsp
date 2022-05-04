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
								jp.co.lastminute.maintenance.hotel.localarea.*,
								jp.co.lastminute.maintenance.common.*,
								jp.co.lastminute.maintenance.util.WebUtil" %>
<%
	LocalAreaSupNbr localareasupnbr = (LocalAreaSupNbr)request.getAttribute("localareasupnbr");
%>
<table border='0' witdh='500' cellpadding="0" cellspacing="0">
	<tr>
		<td bgcolor="#999999">
<table width='500' border="0" cellspacing="1" cellpadding="2">
<form action='./insertUp.jsp' metghod='get'>
	<input type='hidden' name='supnbr' value='<%= localareasupnbr.supnbr %>'/>
	<input type='hidden' name='agt_cd' value='<%= localareasupnbr.agt_cd %>'/>
	<tr>
		<td><input type='text' name='local_area_code' value=''/></td>
		<td align="center">
			<input type='submit' value='add'/>
		</td>
	</tr>
</table>
		</td>
	</tr>
</form>
</table>