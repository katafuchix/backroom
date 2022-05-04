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
	LocalArea localarea = (LocalArea)request.getAttribute("localarea");
	LocalArea[] localAreas = (LocalArea[])request.getAttribute("localAreas");
	LocalAreaSupNbr localareasupnbr = (LocalAreaSupNbr)request.getAttribute("localareasupnbr");


	String[] options = new String[ localAreas.length ];
	String[] vals = new String[ localAreas.length ];

	for( int i=0; i<localAreas.length; i++){
		options[ i ] = "" + localAreas[i].local_area_code + "";
		vals[ i ] = options[ i ]+ ":" + localAreas[i].local_area_code_name;
	}
	String target = "" + localarea.parent_code +"";
%>
<table border='0' witdh='500' cellpadding="0" cellspacing="0">
	<tr>
		<td bgcolor="#999999">
<table width='500' border="0" cellspacing="1" cellpadding="2">
<form action='./updateUp.jsp' metghod='get'>
	<input type='hidden' name='supnbr' value='<%= localareasupnbr.supnbr %>'/>
	<input type='hidden' name='agt_cd' value='<%= localareasupnbr.agt_cd %>'/>
	<tr>
		<td bgcolor="#CCCCCC">“ÁŽêƒGƒŠƒA‚©‚ç</td>
		<td bgcolor="#FFFFFF" colspan='2'>
		<select name='parent_code' onChange="setInputFormSelf();">
<%= WebUtil.getComboByList( options, vals, target) %>
		</select>
		</td>
		<td bgcolor="#FFFFFF"><input type='submit' value='Search'/></td>
	</tr>
</form>
</table>
		</td>
	</tr>
</table>