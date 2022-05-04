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
								jp.co.lastminute.maintenance.Restraunt.*,
								jp.co.lastminute.maintenance.Restraunt.model.*" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%
	response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
	response.setHeader("Pragma","no-cache"); //HTTP 1.0
	response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
	String image_path = jp.co.lastminute.ContextProperty._gift_image_Dir;

	String[] lists = (String[])request.getAttribute("Rlists");
	String[] values = (String[])request.getAttribute("Rvalues");

%>
  <table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
    <tr>
    <td bgcolor="#999999">

        <table width="100%" border="0" cellspacing="1" cellpadding="2">
          <tr bgcolor="#999999">
            <td colspan="9" align='center' class="b">商品情報</td>
          </tr>
          <tr bgcolor="#CCCCCC">
            <td  class="b" align="center" width="80">修正</td>
            <td  class="b" align="center" width="120">カテゴリー</td>
            <td  class="b" align="center" width="317">商品名</td>
            <td align="center" class="b" width="132">料理種別</td>
          </tr>
<%	//セッションにて検索条件を取得
		int type_cd = jp.co.lastminute.maintenance.Restraunt.Property.product_type_cd;
		HandlerCondition condition = new HandlerCondition();
		condition = condition.getRequestByScatid( request );
		///////////////////////
		condition.setLimittype(2);
		/////////////////////

		/////リストの検索/////////

		ServletContext servletContext = getServletContext();
		DataSource Datasouce  = (DataSource)servletContext.getAttribute( Action.DATA_SOURCE_KEY );
		RestrauntInfohandler handler = new RestrauntInfohandler();
		handler.setDataSource( Datasouce );

		RestrauntInfo[] infos = handler.getList( condition );
		if( infos == null ){
			//さびしくなるので、追加するところ
			return;
		}

		String rowCnt = String.valueOf( infos.length );
		String classname = "Restraunt";
		pageContext.setAttribute("rowCnt",rowCnt);
		String havealtStyleClass = "";
		for(int x = 0; x < infos.length; x++){
			RestrauntInfo restraunt = infos[x];
			if( restraunt.seqno.equals("0") ){
%>
				<form action="./edit.jsp" method="post">
				<input type="hidden" name="dbflag" value='1'>
				<input type="hidden" name="jan_cd" value='<%= restraunt.restaurant %>'>
				<input type="hidden" name="title" value='<%= restraunt.restaurantname %>'>
          <tr bgcolor="#FFFFFF">
            <td align="center" width="80">
            	<input type='submit' value='追加'>
            </td>
            <td>
              <select name = "s_catid">
<%= WebUtil.getComboByList( lists, values, condition.s_catid ) %>
              </select>
            </td>
            <td align="left" width="317"><%= restraunt.restaurantname %></td>
            <td><%= restraunt.cookingname %></td>
          </tr>
         </form>
<%		}else{	%>
				<form action="./edit.jsp" method="post">
				<input type="hidden" name="seqno" value='<%= restraunt.seqno %>'>
				<input type="hidden" name="dbflag" value='2'>
          <tr bgcolor="#FFFFFF">
            <td align="center" colspan='2'>
            	<input type='submit' value='削除'>
            </td>
            <td>

            </td>
            <td align="left" width="317"><%= restraunt.restaurantname %></td>
            <td><%= restraunt.cookingname %></td>
          </tr>
         </form>
<%	}	%>
<%
	}//end of for
%>
			<tr>
			<logic:equal name="rowCnt" value="0">
			<td colspan=8 align='center' bgcolor="#FFFFFF">
              検索結果がありません。
            </td>
			</logic:equal>
          </tr>
        </table>
    </td>
  </tr>
</table>
<!-- ========================== //レストラン商品リスト============================== -->

<script language="JavaScript">
<!--
	function doChangeHaveAlt( seq, postion ){
		var statas ;
		statas = document.forms[ postion ].elements['havealt'].value;
		document.forms[ postion ].action = "/backroom/maintenance/gift/info/havealtChanger.jsp";
		document.forms[ postion ].submit();
	}//
	//==========//
	function changeStatus(jan_cd, order){

	}
//-->
</script>