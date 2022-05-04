<%@ page contentType="text/html; charset=Shift_JIS" %>
<%@ page import="org.apache.struts.action.*,
								jp.co.yobrain.util.*,
								javax.naming.*,
								javax.sql.*,
								java.util.*,
								java.io.*,
								java.sql.*,
								jp.co.yobrain.util.DataFormat,
								jp.co.lastminute.maintenance.*,
								jp.co.lastminute.maintenance.jdbc.*,
								jp.co.lastminute.maintenance.model.*,
								jp.co.lastminute.maintenance.pages.*,
								jp.co.lastminute.maintenance.util.WebUtil,
								jp.co.lastminute.maintenance.util.CharacterConverter,
								jp.co.lastminute.maintenance.ticket.*,
								jp.co.lastminute.maintenance.common.CommonDBOCache,
								jp.co.lastminute.maintenance.common.AgentWrapper" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%
	response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
	response.setHeader("Pragma","no-cache"); //HTTP 1.0
	response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

	jp.co.yobrain.util.ParseFormat pf = null;

	int type_cd = jp.co.lastminute.maintenance.ticket.Property.product_type_cd;
	//int type_cd = 93; //Property.product_type_cd;

	String scatid = CharacterConverter.toJISAutoDetect(request.getParameter( "s_catid" ));
	String index = CharacterConverter.toJISAutoDetect(request.getParameter( "index" ));
	String jan_cd_org = CharacterConverter.toJISAutoDetect(request.getParameter("jan_cd_org"));

	ServletContext servletContext = getServletContext();
	DataSource Datasouce = (DataSource)servletContext.getAttribute( Action.DATA_SOURCE_KEY );


	Entertainment list = new Entertainment( );
	list.init( Datasouce );
	WindowList[] windowlist = list.getWindowList( scatid ) ;

	if( windowlist == null ){
		//しばらくほっておく。あとでデコレーション
		return;
	}
%>

<html>
<HEAD>
<link REL="stylesheet" HREF="/backroom/maintenance/maintenance.css" TYPE="TEXT/CSS">
<meta HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=Shift_JIS">
<SCRIPT language="JavaScript" src="/backroom/maintenance/JavaScriptCommonLib.js"></SCRIPT>
<TITLE>商品選択</TITLE>

</HEAD>
<body>
<form name='ListForm'>
  <table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
    <tr>
    <td bgcolor="#999999">

        <table width="100%" border="0" cellspacing="1" cellpadding="2">
          <tr bgcolor="#FFFFFF">
            <td colspan="7" align='center' class="b"><input type='text' name='scarname' size='80' disabled='disabled' class='textbox_white' /></td>
          </tr>
          <tr bgcolor="#CCCCCC">
            <td width="60" class="b" align="center" height="40">コード</td>
            <td align="center" class="b" width="75" height="40">コード(Sup)</td>
            <td align="center" class="b" width="213" height="40">サプライヤー</td>
            <td align="center" width="424" class="b" height="40">商品名</td>
            <td align="center" width="74" class="b" height="40">価格</td>
            <td align="center" width="53" class="b" height="40">在庫</td>
            <td class="b" align="center" width="68" height="40">状態</td>
          </tr>
          <%

	String rowCnt = String.valueOf(windowlist.length);
	String havealtStyleClass = "";
	for(int x = 0; x < windowlist.length; x++){
		WindowList window = windowlist[x];
%>
          <tr bgcolor="#FFFFFF">
            <td width="60" align="right">
			<a href="JavaScript:setJanCDToParent('<%= window.jan_cd %>','<%= window.product_name %>')">
			<%= window.jan_cd %></a>
            </td>
            <td align="right" width="75" ><%= window.agt_product_cd %></td>
            <td align="right" width="213" ><%= window.first_name %></td>
            <td width="424"><%= window.product_name %></td>
            <td width="74" align="right"> <%= pf.ToPriceFormat( window.price )%></td>
            <td width="53" align="center"> <%= window.allotnum %></td>
            <td align="center" width="68"><span class="<%=  WebUtil.getWindowListHavaltColor( window.havealt ) %>">
              <%= window.havealt %></span> </td>
          </tr>
          <%
	}
%>
          <tr>
            <td colspan=7 align='center'>
              <input type='submit' name='CLOSE' value='CLOSE' onClick='JavaScript:setJanCDToParent("CANCEL","");'>
            </td>
          </tr>
        </table>
    </td>
  </tr>
</table>
</form>
<script language="JavaScript">
// <!--
    function setJanCDToParent(jan_cd,product_name){
			var jan_cd_org = '<%= jan_cd_org %>';
			if(jan_cd == "CANCEL"){
				window.opener.document.forms[<%= index %>].elements["prod_id_1"].value = jan_cd_org;
			}else{
				window.opener.document.forms[<%= index %>].elements["prod_id_1"].value = jan_cd;
				window.opener.document.forms[<%= index %>].elements["product_name"].value = product_name;
			}
			self.close();
			window.opener.focus();
    }
    function getScatname(){
			var scatid_name = window.opener.document.forms[<%= index %>].elements["s_catid"].options[ window.opener.document.forms[<%= index %>].elements["s_catid"].selectedIndex ].text;
			document.forms[0].elements['scarname'].value = scatid_name;
		}
		getScatname();
//-->
</script>
</body>
</html>
