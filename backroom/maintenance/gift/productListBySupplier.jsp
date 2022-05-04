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
								jp.co.lastminute.maintenance.gift.model.*" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
String image_path = "img/gift";
//jp.co.lastminute.ContextProperty._gift_image_Dir;
%>
  <table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
    <tr>
    <td bgcolor="#999999">

        <table width="100%" border="0" cellspacing="1" cellpadding="2">
          <tr bgcolor="#999999">
            <td colspan="6" align='center' class="b">商品情報</td>
          </tr>
          <tr bgcolor="#CCCCCC">
            <td  class="b" align="center" width="6%"></td>
            <td  class="b" align="center" width="6%">JAN_CD</td>
            <td align="center" class="b" width="*">商品名</td>
            <td class="b" align="center" width="18%" >在庫</td>
            <td class="b" align="center" width="18%" >販売状況</td>
            <td class="b" align="center" width="10%" >画像アップ</td>
          </tr>

<%	//セッションにて検索条件を取得
		int type_cd = jp.co.lastminute.maintenance.gift.Property.product_type_cd;
		int Limittype = Integer.parseInt(request.getParameter("limittype"));
		//int Limittype = Integer.parseInt(request.getParameter("limittype"));


		HandlerCondition condition = new HandlerCondition();
		condition = condition.getRequest( request,  "" + type_cd + "" );

		condition.setLimittype(Limittype);
		condition.setSorttype(3);
		/////////////////////
		session.setAttribute( "HandlerCondition",  condition );

		/////リストの検索/////////

		ServletContext servletContext = getServletContext();
		DataSource Datasouce  = (DataSource)servletContext.getAttribute( Action.DATA_SOURCE_KEY );
		GiftInfohandler handler = new GiftInfohandler();
		handler.setDataSource( Datasouce );

		GiftInfo[] infos = handler.getList( condition );
		if( infos == null ){ 

			%><%= "Limittype" + Limittype %><%

			//さびしくなるので、追加するところ
			return;
		}

		String rowCnt = String.valueOf( infos.length );
		String classname = "Gift";
		pageContext.setAttribute("rowCnt",rowCnt);
		Map row = null;
		String havealtStyleClass = "";
		for(int x = 0; x < infos.length; x++){
			GiftInfo gift = infos[x];
%>
				<form action="/backroom/maintenance/gift/info/edit.jsp" method="post">
				<input type="hidden" name="product_seq" value='<%= gift.jan_cd %>'>
          <tr bgcolor="#FFFFFF">

						<input type='hidden' name='agt_cd' value='<%= gift.agt_cd %>'>
            <td><input type='submit' value='編集'></td>

            <td align="center">
							<font size='2'><A HREF="javascript:PopUpWriteGift( '<%= gift.jan_cd %>', '<%= classname %>' );"><%= gift.jan_cd %></a></font>
            </td>

            <td align="left">
							<!--<A HREF="javascript:PopUpWrite( '<%= gift.jan_cd %>', '<%= classname %>' );"><%= gift.product_name %></A><br/>-->
							<%= gift.first_name %><br/>
							<A HREF="http://www.lastminute.co.jp/lmj/Gift/detail.do?catid=93&product_id=<%= gift.jan_cd %>" target=_blank><%= gift.product_name %></A><br/>
							<!--|<A HREF="javascript:PopUpWrite( '<%= gift.jan_cd %>', '<%= classname %>' );">Preview & Contents Update|-->
            </td>

            <td align="center" bgcolor="#FFFFFF" >
              在庫;<input type='text' name='alottnum' value='<%= gift.allotnum %>' size='3' maxlength='3' style='ime-mode:disabled;'/>
              <input type='button' value='更新' onClick="javascrip:doChangeHaveAlt( '<%= gift.jan_cd %>', '<%= x + 1 %>' );" />
            </td>
            
            <td align="center" bgcolor="#FFFFFF" >
              状況;<select name="havealt">
								<%= WebUtil.getStopOption( "" + gift.havealt + "" ) %>
              </select>
              <input type='button' value='更新' onClick="javascrip:doChangeHaveAlt( '<%= gift.jan_cd %>', '<%= x + 1 %>' );" />
            </td>

						<td  align="right" width="120"><font size='1'>
            <!--|<a href="javascript:PopImageMaintenace('<%= gift.jan_cd%>-1.gif', '<%= image_path %>');">38x38</a>-->
            |<a href="javascript:PopImageMaintenace('<%= gift.jan_cd%>-2.gif', '<%= image_path %>');">70x38</a>|<br/>
            |<a href="javascript:PopImageMaintenace('<%= gift.jan_cd%>-3.gif', '<%= image_path %>');">130x75</a>
            |<a href="javascript:PopImageMaintenace('<%= gift.jan_cd%>-4.gif', '<%= image_path %>');">250x150</a>|
            </font></td>


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
		var alottnum;
		var agt_cd;

		alottnum = document.forms[ postion ].elements['alottnum'].value;
		statas = document.forms[ postion ].elements['havealt'].value;
		agt_cd = document.forms[ postion ].elements['agt_cd'].value;
		document.forms[ postion ].action = "/backroom/maintenance/gift/info/havealtChanger.jsp";
		document.forms[ postion ].submit();
	}//
	//==========//
	function changeStatus(jan_cd, order){

	}
//-->
</script>