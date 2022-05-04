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
								jp.co.lastminute.maintenance.hotel.postalcode.*,
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

	PostalSupnbr postalsupnbr = new PostalSupnbr();
	postalsupnbr = postalsupnbr.getRequest( request );
	PostalSupnbrhandler handler = new PostalSupnbrhandler();
	handler.setDataSource( Datasouce );

	PostalSupnbr[] postalsupnbrs = handler.getList( postalsupnbr );

	if( postalsupnbrs == null ){
		return;
	}
	String[] options = new String[ postalsupnbrs.length ];
	String[] vals = new String[ postalsupnbrs.length ];

	for( int i=0; i<postalsupnbrs.length; i++){
		options[ i ] = "" + postalsupnbrs[i].city_cd + "";
		vals[ i ] = options[ i ]+ ":" + postalsupnbrs[i].city_name;
	}
	String target = "" + postalsupnbr.city_cd +"";
%>
<html>
<head>
<script language='javascript'>
function setInputForm(){
		var nexttag = document.forms[0].elements['city_cd'].value;
		opener.document.forms[0].elements['city_cd'].value = nexttag;
}
</script>
</head>
<body>
<table border='0' witdh='500' cellpadding="0" cellspacing="0">
	<tr>
		<td bgcolor="#999999">
<table width='500' border="0" cellspacing="1" cellpadding="2">
<form action='./setUp.jsp' metghod='get'>
	<tr>
		<td bgcolor="#CCCCCC">Žs‹æ’¬‘º</td>
		<td bgcolor="#FFFFFF" colspan='2'>
		<select name='city_cd' onChange="setInputForm();">
<%= WebUtil.getComboByList( options, vals, target) %>
		</select>
		</td>
	</tr>
</form>
</table>
		</td>
	</tr>
</table>
<form action="./setUp2.jsp" method="post">
	<input type="submit" value="all Update"/>
</form>
</body>
</html>