<%@ page contentType="text/html; charset=shift_jis"%>
<%@ page import="org.apache.struts.action.*,
								jp.co.yobrain.util.*,
								javax.naming.*,
								javax.sql.*,
								java.util.*,
								java.io.*,
								java.sql.*,
								jp.co.yobrain.util.DataFormat,
								jp.co.lastminute.ContextProperty,
								jp.co.lastminute.maintenance.*,
								jp.co.lastminute.maintenance.util.WebUtil,
								jp.co.lastminute.maintenance.hotel.*,
								jp.co.lastminute.maintenance.hotel.model.*,
								jp.co.lastminute.maintenance.common.*" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%
	response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
	response.setHeader("Pragma","no-cache"); //HTTP 1.0
	response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

	int type_cd = jp.co.lastminute.maintenance.hotel.Property.product_type_cd;

	ServletContext servletContext = getServletContext();
	DataSource Datasouce  = (DataSource)servletContext.getAttribute( ContextProperty.Lmjdatas_ );

	Mhtlcp mhtlcp = new Mhtlcp();
	mhtlcp.getRequest( request );

	boolean dbflag = false;
	if( mhtlcp.isError() ){
		Mhtlcphandler mhtlcphandler = new Mhtlcphandler();
		mhtlcphandler.setDataSource( Datasouce );
		dbflag = mhtlcphandler.updateMhtlcp( mhtlcp );
		mhtlcphandler = null;
	}
%>
<html>
<link rel="stylesheet" href="/backroom/maintenance/maintenance.css" type="text/css">
<head>
<META http-equiv="Content-Type" content="text/html; charset=Shift_JIS">
<SCRIPT language="JavaScript" src="/backroom/maintenance/JavaScriptCommonLib.js"></SCRIPT>
<title>���i���ǉ�</title>
</head>
<body bgcolor = "white" >
<!-- ========================== ���i ============================== -->

<%	if(( mhtlcp.isError() )&&( dbflag )){	%>
  <table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
  <tr>
    <td bgcolor="#999999"><h3>����ɍX�V����܂����B</h3>
    	</td>
    	</tr>
	</table>
<%	}else{	%>
  <table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
  <tr>
    <td bgcolor="#999999">
    <h3>�r�x�r�s�d�l���s���ł��B</h3>
    	</td>
    	</tr>
	</table>
<%	}	%>




<!-- ========================== //�M�t�g���i ============================== -->
<script language="JavaScript">
<!--
	function doUpdate(){
		return true;
	}
	function returnLine(obj)
	{
		var len = obj.value.length;
		if(len % 30 == 0 && len != 0)
		{
			obj.value = obj.value+"\r\n";
		}
	}

//-->
</script>

</body>
</html>