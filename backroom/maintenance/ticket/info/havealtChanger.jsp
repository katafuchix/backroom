<%@ page contentType="text/html; charset=shift_jis"%>
<%@ page import="org.apache.struts.action.*,
								jp.co.yobrain.util.*,
								javax.naming.*,
								javax.sql.*,
								java.util.*,
								java.io.*,
								java.sql.*,
								jp.co.yobrain.util.DataFormat,
								jp.co.lastminute.maintenance.*,
								jp.co.lastminute.maintenance.util.WebUtil,
								jp.co.lastminute.maintenance.ticket.*,
								jp.co.lastminute.maintenance.ticket.model.*,
								jp.co.lastminute.maintenance.common.CommonDBOCache,
								jp.co.lastminute.maintenance.common.ProductTypeWrapper,
								jp.co.lastminute.maintenance.common.AgentWrapper" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%
	response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
	response.setHeader("Pragma","no-cache"); //HTTP 1.0
	response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

	int type_cd = jp.co.lastminute.maintenance.ticket.Property.product_type_cd;
	//int type_cd = 93; //Property.product_type_cd;
	ServletContext servletContext = getServletContext();
	DataSource Datasouce  = (DataSource)servletContext.getAttribute( Action.DATA_SOURCE_KEY );

	int product_seq = 0;
	int status = 0;
	boolean check_error = true;
	try{
		product_seq = Integer.parseInt( request.getParameter("product_seq") );
		status	= Integer.parseInt( request.getParameter("stop_flg") );
	}catch(Exception ex){
		check_error = false;

	}
	boolean dbflag = false;
	if( check_error ){
		TicketInfohandler ticketInfohandler = new TicketInfohandler();
		ticketInfohandler.setDataSource( Datasouce );
		dbflag = ticketInfohandler.setStopflg( product_seq, status );
		ticketInfohandler = null;
	}
%>
<html>
<link rel="stylesheet" href="/backroom/maintenance/maintenance.css" type="text/css">
<head>
<META http-equiv="Content-Type" content="text/html; charset=Shift_JIS">
<SCRIPT language="JavaScript" src="/backroom/maintenance/JavaScriptCommonLib.js"></SCRIPT>
<title>商品情報追加</title>
</head>
<!-- ========================== 商品 ============================== -->

<%	if(( check_error )&&( dbflag )){	%>
  <table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
  <tr>
    <td bgcolor="#999999"><h3>正常に更新されました。</h3>
    	</td>
    	</tr>
	</table>
<%	}else{	%>
  <table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
  <tr>
    <td bgcolor="#999999">
    <h3>ＳＹＳＴＥＭが不調です。</h3>
    	</td>
    	</tr>
	</table>
<%	}	%>




<!-- ========================== //ギフト商品 ============================== -->
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
