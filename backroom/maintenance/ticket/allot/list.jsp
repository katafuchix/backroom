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
	////////////////////////
	DataFormat df = null;
%>
<html>
<head>
<link rel="stylesheet" href="/backroom/maintenance/maintenance.css" type="text/css">
<META http-equiv="Content-Type" content="text/html; charset=Shift_JIS">

<SCRIPT language="JavaScript" src="/backroom/maintenance/JavaScriptCommonLib.js">
</SCRIPT>

<title>���i�Ǘ�</title>
</head>
<body bgcolor = "white">
  <table width="550" border="1" cellpadding="0" cellspacing="0" align="left">
    <tr>
    <td bgcolor="#999999">

<%	//�Z�b�V�����ɂČ����������擾
		int type_cd = jp.co.lastminute.maintenance.ticket.Property.product_type_cd;
		//int type_cd = 93; //Property.product_type_cd;
		HandlerCondition condition = new HandlerCondition();
		condition = condition.getRequest( request,  "" + type_cd + "" );
		///////////////////////
		condition.setLimittype(2);
		/////////////////////
		session.setAttribute( "HandlerCondition",  condition );

		//���X�g����
		TicketAllothandler handler = new TicketAllothandler();
		ServletContext servletContext = getServletContext();
		DataSource Datasouce  = (DataSource)servletContext.getAttribute( Action.DATA_SOURCE_KEY );
		handler.setDataSource( Datasouce );

		TicketAllot[] allots = handler.getList( condition );
		TicketAllot newallot = new TicketAllot();
		try{
			newallot.sku_id = Integer.parseInt( condition.sku_id );
		}catch(Exception ex){
			return;
		}
		request.setAttribute("allot", newallot);
%>
	<form action="/backroom/maintenance/ticket/allot/productInserterCtr.jsp" method="post">
	<table border=0 width="550" border="1" cellpadding="1" cellspacing="1">
	<tr>
		<td bgcolor="#FFFFFF">
<jsp:include page="form.jsp" />
		</td>
		<td bgcolor="#CCCCCC">
				<input type='submit' value='�ǉ�'/>
		</td>
	</table>
	</form>
<%
		if( allots != null ){	%>
		<tr>
		<td>
        <table width="100%" border="1" cellspacing="1" cellpadding="1">
          <tr bgcolor="#999999">
            <td colspan="9" align='center' class="b">�݌Ƀ��X�g</td>
          </tr>
          <tr bgcolor="#CCCCCC">
            <td  class="b" align="center" width="60">�C��</td>
            <td  class="b" align="center" width="160">������</td>
            <td  class="b" align="center" width="160">���i��</td>
            <td  class="b" align="center" width="60">�݌�</td>
            <td align="center" class="b" width="100">������/�����J�n����</td>
            <td align="center"  class="b" width="60">���</td>
          </tr>
<%
		String rowCnt = String.valueOf( allots.length );
		pageContext.setAttribute("rowCnt",rowCnt);
		Map row = null;
		String havealtStyleClass = "";
		for(int x = 0; x < allots.length; x++){
			TicketAllot allot = allots[x];
%>
				<form action="/backroom/maintenance/ticket/allot/edit.jsp" method="post">
          <tr bgcolor="#FFFFFF">
            <td align="center">
              <input type="hidden" name="allot_seq" value='<%= allot.allot_seq %>'>
              <font size='-1'><input type='submit' value='�X�V'></font>
            </td>
            <td align="left"><%= allot.product_name %></td>
            <td align="left"><%= allot.sku_name %></td>
            <td align="right"><%= allot.allotcounter %></td>
            <td align="left"><%= df.getDateTime4WWW( "" + allot.allotdate + "") %>:<%= allot.allottime %></td>
            <td align="center">
            <%= WebUtil.getStopOptionStr( "" + allot.stop_flg + "" ) %><br/>
            |<A HREF="/backroom/maintenance/ticket/allot/delete.jsp?id=<%= allot.allot_seq %>">�폜</A>|</td>
          </tr>
         </form>
<%
		}	//end of for %>
				</td></tr>
<%
	}
%>
 </table>
<!-- ========================== //�M�t�g���i���X�g============================== -->

<script language="JavaScript">
<!--
	//==========//
	function changeStatus(jan_cd, order){

	}
//-->
</script>
</body>
</html>