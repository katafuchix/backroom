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

	LocalArea[] localAreas = handler.getList( localarea );

	if( localAreas == null ){
		return;
	}
	String[] options = new String[ localAreas.length ];
	String[] vals = new String[ localAreas.length ];

	for( int i=0; i<localAreas.length; i++){
		options[ i ] = "" + localAreas[i].local_area_code + "";
		vals[ i ] = options[ i ]+ ":" + localAreas[i].local_area_code_name;
	}
	String target = "" + localarea.parent_code +"";
%>
<html>
<head>
<script language='javascript'>
function setOtherForm(){
		var nexttag = document.forms[0].elements['parent_code'].value;
		document.forms[1].elements['local_area_code'].value = nexttag;
}
</script>
</head>
<body>
<table border='0' witdh='500' cellpadding="0" cellspacing="0">
	<tr>
		<td bgcolor="#999999">
<table width='500' border="0" cellspacing="1" cellpadding="2">
<form action='./index.jsp' metghod='get'>
	<tr>
		<td bgcolor="#CCCCCC">特殊エリアから</td>
		<td bgcolor="#FFFFFF" colspan='2'>
		<select name='parent_code' onChange="setOtherForm();">
<%= WebUtil.getComboByList( options, vals, target) %>
		</select>
		</td>
		<td bgcolor="#FFFFFF"><input type='submit' value='Search'/></td>
	</tr>
</form>
<form action='./updatelocalarea.jsp' method='post'>
	<input type='hidden' name='local_area_code' value='' />
	<input type='hidden' name='parent_code' value='<%= localAreas[0].parent_code %>' />
	<tr>
		<td bgcolor="#CCCCCC">更新用</td>
		<td bgcolor="#FFFFFF" colspan='2'><input type='text' name='local_area_code_name' size='30' maxlength='35'/></td>
		<td bgcolor="#FFFFFF"><input type='submit' value='Update'/></td>
	</tr>
</form>
<form action='./insertarea.jsp' method='post>
	<input type='hidden' name='parent_code' value='<%= localAreas[0].parent_code %>' />
	<tr>
		<td bgcolor="#CCCCCC">追加用</td>
		<td bgcolor="#FFFFFF">コード<input type='text' name='local_area_code' size='8' maxlength='8' value='' style="ime-mode:disabled;"/></td>
		<td bgcolor="#FFFFFF">地域名：<input type='text' name='local_area_code_name' size='30' maxlength='35'/></td>
		<td bgcolor="#FFFFFF"><input type='submit' value='Add'/></td>
	</tr>
</form>
</table>
		</td>
	</tr>
</table>
</body>
</html>