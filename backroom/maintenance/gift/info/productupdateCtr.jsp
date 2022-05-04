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
								jp.co.lastminute.maintenance.common.ProductTypeWrapper,
								jp.co.lastminute.maintenance.common.AgentWrapper" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
	response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
	response.setHeader("Pragma","no-cache"); //HTTP 1.0
	response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

	int type_cd = jp.co.lastminute.maintenance.gift.Property.product_type_cd;
	String type_names = "�k�l�i�`�P�b�g";
	GiftInfo giftinfo = new GiftInfo();
	giftinfo.getRequest( request );

	request.setAttribute("giftinfo", giftinfo);
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

<% if( giftinfo.isError() ){	%>

	<table width="500" border="0" cellpadding="0" cellspacing="0" align="left">
		<form name='MainForm' method='post' action='dbUpdaterCtr.jsp'>
  	<input type='hidden' name='product_type' value='<%= type_cd %>' >
	  <input type='hidden' name='jan_cd' value='<%= giftinfo.jan_cd %>' >
	  <input type='hidden' name='type_names' value='<%= type_names %>' >
	  <tr>
	    <td bgcolor="#999999" colspan="2">
				<jsp:include page="preview.jsp" />
	    </td>
	  </tr>
    <tr>
    	<td bgcolor="#FFFFFF" align="left">
     		<BR>
				<input type="submit" onClick="return doUpdate();" value="���o�^���遄">
    	</td>
		</form>

		<form name='ToForm' method='post' action='edit.jsp'>
		<input type='hidden' name='product_type' value='<%= type_cd %>' >
		<input type="hidden" name="product_seq" value='<%= giftinfo.jan_cd %>'>
		<input type='hidden' name='type_names' value='<%= type_names %>' >
    <td bgcolor="#FFFFFF" align="right">
			<BR>
			<input type="submit" onClick="return doUpdate();" value="�� �߂� ��">
    </td>
		</form>
	</table>



<%	}else{	%>


	<table width="500" border="0" cellpadding="0" cellspacing="0" align="left">
		<form name='MainForm' method='post' action='productupdateCtr.jsp'>
  	<input type='hidden' name='product_type' value='<%= type_cd %>' >
	  <input type='hidden' name='jan_cd' value='<%= giftinfo.jan_cd %>' >
	  <input type='hidden' name='type_names' value='<%= type_names %>' >
	  <tr>
	    <td bgcolor="#999999" colspan="2">
				<jsp:include page="form.jsp" />
	    </td>
	  </tr>
    <tr>
    	<td bgcolor="#FFFFFF" align="left" colspan="2">
     		<BR>
				<input type="submit" onClick="return doUpdate();" value="���m�F���遄">
    	</td>
		</form>
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
