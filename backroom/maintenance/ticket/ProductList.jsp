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
	String image_path = jp.co.lastminute.ContextProperty._ticket_image_Dir;
%>
  <table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
    <tr>
    <td bgcolor="#999999">

        <table width="100%" border="0" cellspacing="1" cellpadding="2">
          <tr bgcolor="#999999">
            <td colspan="9" align='center' class="b">商品情報</td>
          </tr>
          <tr bgcolor="#CCCCCC">
            <td  class="b" align="center" width="50">修正</td>
            <td  class="b" align="center" width="317">商品名</td>
            <td align="center" class="b" width="252">サプライヤー名</td>
            <td align="center"  class="b" width="76">商品コード</td>
            <td align="center"  class="b" width="76">イメージ</td>
            <td class="b" align="center" width="62" >販売状態</td>
          </tr>
<%	//セッションにて検索条件を取得
		int type_cd = jp.co.lastminute.maintenance.ticket.Property.product_type_cd;
		//int type_cd = 93; //Property.product_type_cd;
		HandlerCondition condition = new HandlerCondition();
		condition = condition.getRequest( request,  "" + type_cd + "" );
		///////////////////////
		condition.setLimittype(2);
		/////////////////////
		session.setAttribute( "HandlerCondition",  condition );

		/////リストの検索/////////

		ServletContext servletContext = getServletContext();
		DataSource Datasouce  = (DataSource)servletContext.getAttribute( Action.DATA_SOURCE_KEY );
		TicketInfohandler handler = new TicketInfohandler();
		handler.setDataSource( Datasouce );

		TicketInfo[] infos = handler.getList( condition );
		if( infos == null ){
			//さびしくなるので、追加するところ
			return;
		}

		String rowCnt = String.valueOf( infos.length );
		String classname = "Ticket";
		pageContext.setAttribute("rowCnt",rowCnt);
		Map row = null;
		String havealtStyleClass = "";
		for(int x = 0; x < infos.length; x++){
			TicketInfo ticket = infos[x];
%>
				<form action="/backroom/maintenance/ticket/info/edit.jsp" method="post">
          <tr bgcolor="#FFFFFF">
            <td align="center" width="80">
              <input type="hidden" name="product_seq" value='<%= ticket.product_seq %>'>
              <font size='-1'><input type='submit' value='更新'></font>
            </td>
            <td align="left" width="200"><%= ticket.product_name %><br/>
            |<A HREF="/backroom/maintenance/ticket/sku/list.jsp?product_seq=<%= ticket.product_seq %>&agt_cd=<%= ticket.agt_cd %>">SKU</A>|
						|<A HREF="javascript:PopUpWrite( '<%= ticket.product_seq %>', '<%= classname %>' );">Preview & Contents Update</A>|
            </td>
            <td align="left" width="100" ><%= ticket.first_name %><br/>
            |<A HREF="/backroom/maintenance/ticket/info/delete.jsp?id=<%= ticket.product_seq %>">データ完全削除</A>|</td>
            <td  align="right" width="80"><%= ticket.product_seq %></td>
            <td align="right" width="80"><font size='1'>
            |<a href="javascript:PopImageMaintenace('<%= ticket.product_seq %>-1.gif', '<%= image_path %>');">38x38</a>
            |<a href="javascript:PopImageMaintenace('<%= ticket.product_seq %>-2.gif', '<%= image_path %>');">70x38</a>|<br/>
            |<a href="javascript:PopImageMaintenace('<%= ticket.product_seq %>-3.gif', '<%= image_path %>');">130x75</a>
            |<a href="javascript:PopImageMaintenace('<%= ticket.product_seq %>-4.gif', '<%= image_path %>');">250x150</a>|
            </font></td>
            <td align="center" width="120" bgcolor="#FFFFFF" >
              <select name="stop_flg">
<%= WebUtil.getStopOption( "" + ticket.stop_flg + "" ) %>
              </select>
              <input type='button' value='*' onClick="javascrip:doChangeHaveAlt( '<%= ticket.product_seq %>', '<%= x+1 %>' );" />
            </td>
          </tr>
         </form>
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
<!-- ========================== //ギフト商品リスト============================== -->

<script language="JavaScript">
<!--
	function doChangeHaveAlt( seq, postion ){
		var statas ;
		statas = document.forms[ postion ].elements['stop_flg'].value;
		document.forms[ postion ].action = "/backroom/maintenance/ticket/info/havealtChanger.jsp";
		document.forms[ postion ].submit();
	}//
	//==========//
	function changeStatus(jan_cd, order){

	}
//-->
</script>