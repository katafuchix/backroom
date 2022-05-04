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
		//ondition.setLimittype(2);
		/////////////////////
		session.setAttribute( "HandlerCondition",  condition );

		//リスト検索
		AmuseSkuhandler handler = new AmuseSkuhandler();
		ServletContext servletContext = getServletContext();
		DataSource Datasouce  = (DataSource)servletContext.getAttribute( Action.DATA_SOURCE_KEY );
		handler.setDataSource( Datasouce );

		AmuseSku[] skus = handler.getList( condition );
		AmuseSku newsku = new AmuseSku();
		try{
			newsku.product_seq = Integer.parseInt( condition.product_seq );
		}catch(Exception ex){
			return;
		}
		newsku.agt_cd = condition.agt_cd;
		request.setAttribute("sku", newsku);
%>
	<form action="/backroom/maintenance/amuse/sku/productInserterCtr.jsp" method="post">
<jsp:include page="form.jsp" />
				<input type='submit' value='追加'/>
	</form>
<%
		if( skus != null ){	%>
        <table width="100%" border="0" cellspacing="1" cellpadding="2">
          <tr bgcolor="#999999">
            <td colspan="9" align='center' class="b">商品リスト</td>
          </tr>
          <tr bgcolor="#CCCCCC">
            <td  class="b" align="center" width="80">修正</td>
            <td  class="b" align="center" width="180">商品名</td>
            <td align="center" class="b" width="140">販売開始/販売終了</td>
            <td align="center"  class="b" width="80">価格</td>
          </tr>
<%
		String rowCnt = String.valueOf( skus.length );
		pageContext.setAttribute("rowCnt",rowCnt);
		Map row = null;
		String havealtStyleClass = "";
		for(int x = 0; x < skus.length; x++){
			AmuseSku sku = skus[x];
%>
				<form action="/backroom/maintenance/amuse/sku/edit.jsp" method="post">
          <tr bgcolor="#FFFFFF">
            <td align="center" width="80">
              <input type="hidden" name="sku_id" value='<%= sku.sku_id %>'>
              <font size='-1'><input type='submit' value='更新'></font>
            </td>
            <td align="left" width="180"><%= sku.sku_name %><br/>
            |<A HREF="/backroom/maintenance/amuse/allot/list.jsp?sku_id=<%= sku.sku_id %>">ALLOT</A>|
            </td>

            <td align="center" width="140" ><%= sku.salesfrom %>/<%= sku.salesto %><br/>
            |<A HREF="/backroom/maintenance/amuse/sku/delete.jsp?id=<%= sku.sku_id %>">データ完全削除</A>|</td>

            <td align="right" width="80"><%= sku.price %></td>
          </tr>
         </form>
<%
		}	//end of for
	}
%>
        </table>
    </td>
  </tr>
</table>
<!-- ========================== //ギフト商品リスト============================== -->

<script language="JavaScript">
<!--
	//==========//
	function changeStatus(jan_cd, order){

	}
//-->
</script>