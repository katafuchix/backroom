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
								jp.co.lastminute.maintenance.ticket.model.*" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%
	response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
	response.setHeader("Pragma","no-cache"); //HTTP 1.0
	response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

	int type_cd = jp.co.lastminute.maintenance.ticket.Property.product_type_cd;
	//int type_cd = 93; //Property.product_type_cd;

	HandlerCondition condition = new HandlerCondition();
	condition = condition.getRequest( request,  "" + type_cd + "" );
	condition.setLimittype(2);
	ServletContext servletContext = getServletContext();
	DataSource Datasouce  = (DataSource)servletContext.getAttribute( Action.DATA_SOURCE_KEY );
	TicketAllothandler handler = new TicketAllothandler();
	handler.setDataSource( Datasouce );

	TicketAllot allot = handler.getDetail( condition );

	request.setAttribute("allot", allot);
%>
<html>
<link rel="stylesheet" href="/backroom/maintenance/maintenance.css" type="text/css">
<head>
<META http-equiv="Content-Type" content="text/html; charset=Shift_JIS">
<SCRIPT language="JavaScript" src="/backroom/maintenance/JavaScriptCommonLib.js"></SCRIPT>
<title>商品情報追加</title>
</head>
<body bgcolor = "white">

<!-- ========================== 商品 ============================== -->
  <form name='MainForm' method='post' action='productupdateCtr.jsp'>
  <table width="280" border="0" cellpadding="0" cellspacing="0" align="left">
  <tr>
    <td bgcolor="#999999">
<jsp:include page="form.jsp" />
    	</td>
    	</tr>
    	<tr>
    		<td bgcolor="#FFFFFF" align="center">
     		<input type="submit" onClick="return doUpdate();" value="登録">
    		</td>
  		</tr>
	</table>
</form>



<!-- ========================== //ギフト商品 ============================== -->
<script language="JavaScript">
<!--
	function doUpdate(){
		return true;
	}

	function returnLine(obj){
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
