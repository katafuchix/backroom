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
								jp.co.lastminute.maintenance.gift.*,
								jp.co.lastminute.maintenance.gift.model.*,
								jp.co.lastminute.maintenance.common.CommonDBOCache,
								jp.co.lastminute.maintenance.common.AgentWrapper" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%

	response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
	response.setHeader("Pragma","no-cache"); //HTTP 1.0
	response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

	int type_cd = jp.co.lastminute.maintenance.gift.Property.product_type_cd;

	ServletContext servletContext = getServletContext();
	DataSource Datasouce  = (DataSource)servletContext.getAttribute( Action.DATA_SOURCE_KEY );

	GiftInfo giftinfo = new GiftInfo();
	giftinfo.getRequest( request );

	boolean dbflag = false;
	if( giftinfo.isError() ){
		GiftInfohandler giftInfohandler = new GiftInfohandler();
		giftInfohandler.setDataSource( Datasouce );
		dbflag = giftInfohandler.addGiftInfo( giftinfo );
		giftInfohandler = null;
	}

%>
<html>
<link rel="stylesheet" href="/backroom/maintenance/maintenance.css" type="text/css">
<head>
<META http-equiv="Content-Type" content="text/html; charset=Shift_JIS">
<SCRIPT language="JavaScript" src="/backroom/maintenance/ScatidMaintenance.js"></SCRIPT>
<SCRIPT language="JavaScript" src="/backroom/maintenance/JavaScriptCommonLib.js"></SCRIPT>
<title>商品情報追加</title>
</head>
<body bgcolor = "white" >
<!--dbflag<%= dbflag %><br/>-->
<!--giftinfo.isError()<%= giftinfo.isError() %><br/>-->
<!-- ========================== 商品 ============================== -->

<%	if(( giftinfo.isError() )&&( dbflag )){	%>
  <table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
  
	<tr>
    <td bgcolor="#999999"><h3>正常に更新されました。</h3></td>
  </tr>
	
	<tr>
    <td bgcolor="#FFFFFF">
			<form name='MainForm' method='post' action="/backroom/maintenance/gift/index_agent.jsp">
			<input type='hidden' name='agt_cd' value='<%= giftinfo.agt_cd %>'>
			<input type='hidden' name='limittype' value='2'>
      <input type="submit" value = "サプライヤー別管理へ" name="btnAdd"/>
			</form><br>
		</td>
  </tr>
	
	</table>
<%	}else{	%>
  <table width="100%" border="0" cellpadding="0" cellspacing="0" align="left">
  <tr>
    <td bgcolor="#999999">
    <h3>ごめんなさい。正常にデータの更新ができませんでした。</h3>
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
