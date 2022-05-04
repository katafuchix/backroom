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
								jp.co.lastminute.maintenance.amuse.*,
								jp.co.lastminute.maintenance.amuse.model.*" %>
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

<title>商品管理</title>
</head>
<body bgcolor = "white">
  <table width="550" border="0" cellpadding="0" cellspacing="0" align="left">
    <tr>
    <td bgcolor="#999999">

<%	//セッションにて検索条件を取得
		int type_cd = jp.co.lastminute.maintenance.amuse.Property.product_type_cd;
		HandlerCondition condition = new HandlerCondition();
		condition = condition.getRequest( request,  "" + type_cd + "" );
		///////////////////////
		condition.setLimittype(2);
		/////////////////////
		session.setAttribute( "HandlerCondition",  condition );

		//リスト検索
		AmuseAllothandler handler = new AmuseAllothandler();
		ServletContext servletContext = getServletContext();
		DataSource Datasouce  = (DataSource)servletContext.getAttribute( Action.DATA_SOURCE_KEY );
		handler.setDataSource( Datasouce );

		AmuseAllot[] allots = handler.getList( condition );
		AmuseAllot newallot = new AmuseAllot();
		if( allots != null ){	%>
		<tr>
		<td>
        <table width="100%" border="0" cellspacing="1" cellpadding="2">
          <tr bgcolor="#999999">
            <td colspan="9" align='center' class="b">在庫リスト</td>
          </tr>
          <tr bgcolor="#CCCCCC">
            <td  class="b" align="center" width="60">修正</td>
            <td  class="b" align="center" width="160">商品名</td>
            <td  class="b" align="center" width="160">SKU名</td>
            <td  class="b" align="center" width="60">在庫</td>
            <td align="center" class="b" width="100">販売日:販売時間</td>
            <td align="center"  class="b" width="60">状態</td>
          </tr>
<%
		String rowCnt = String.valueOf( allots.length );
		pageContext.setAttribute("rowCnt",rowCnt);
		Map row = null;
		String havealtStyleClass = "";
		for(int x = 0; x < allots.length; x++){
			AmuseAllot allot = allots[x];
%>
				<form action="/backroom/maintenance/amuse/allot/edit.jsp" method="post">
          <tr bgcolor="#FFFFFF">
            <td align="center">
              <input type="hidden" name="allot_seq" value='<%= allot.allot_seq %>'>
              <font size='-1'><input type='submit' value='更新'></font>
            </td>
            <td align="left"><%= allot.product_name %></td>
            <td align="left"><%= allot.sku_name %></td>
            <td align="right"><%= allot.allotcounter %></td>
            <td align="left"><%= df.getDateTime4WWW( "" + allot.allotdate + "") %>:<%= allot.allottime %></td>
            <td align="center">
            <%= WebUtil.getStopOptionStr( "" + allot.stop_flg + "" ) %><br/>
            |<A HREF="/backroom/maintenance/amuse/allot/delete.jsp?id=<%= allot.allot_seq %>">削除</A>|</td>
          </tr>
         </form>
<%
		}	//end of for %>
				</td></tr>
<%
	}else{
%>
	<h3>在庫なし</h3></td></tr>

<%	}	%>
 </table>
<!-- ========================== //ギフト商品リスト============================== -->

<script language="JavaScript">
<!--
	//==========//
	function changeStatus(jan_cd, order){

	}
//-->
</script>
</body>
</html>