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
								jp.co.lastminute.maintenance.util.WebUtil,
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
%>
<%
	DataFormat df = null;
	int type_cd = jp.co.lastminute.maintenance.ticket.Property.product_type_cd;
	//int type_cd = 93; //Property.product_type_cd;
	ServletContext servletContext = getServletContext();
	DataSource Datasouce  = (DataSource)servletContext.getAttribute( Action.DATA_SOURCE_KEY );
	CommonDBOCache cache = null;
	AgentWrapper agtWrapper = null;
	List agents = null;
	if(session.getAttribute("agtWrapper") == null){
		agtWrapper = new AgentWrapper( null, Datasouce );
		//agtWrapper.getAgentMaps( "" + type_cd + "" );
		agents = agtWrapper.getCombos( "" + type_cd + "" );
		session.setAttribute("agtWrapper", agtWrapper.getCache() );
	}else{
		cache  = (CommonDBOCache)session.getAttribute("agtWrapper");
		agtWrapper = new AgentWrapper( cache, Datasouce );
		agents = agtWrapper.getCombos( "" + type_cd + "" );
	}
%>
<html>
<head>
<link rel="stylesheet" href="/backroom/maintenance/maintenance.css" type="text/css">
<META http-equiv="Content-Type" content="text/html; charset=Shift_JIS">
<SCRIPT language="JavaScript" src="/backroom/maintenance/ScatidMaintenance.js"></SCRIPT>
<SCRIPT language="JavaScript" src="/backroom/maintenance/JavaScriptCommonLib.js"></SCRIPT>
<SCRIPT language="JavaScript" src="/backroom/maintenance/ImageMaintenance.js"></SCRIPT>
<title>ギフト商品管理</title>
</head>
<body bgcolor = "white">
<!-- ========================== 商品追加 ============================== -->
<form name='MainForm' method='post' action="/backroom/maintenance/ticket/info/insertForm.jsp">
  <table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
    <tr>
    <td bgcolor="#999999">
        <table width="100%" border="0" cellspacing="1" cellpadding="2">
          <tr bgcolor="#999999">
            <td colspan="4" align='center' class="b">ギフト商品追加</td>
          </tr>
          <tr bgcolor="#CCCCCC">
            <td align="center" class="b">サプライヤー</td>
            <td align="center" class="b">商品名 (全角30文字以内)</td>
            <td class="b" align="center">追加 </td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td align="center" >
              <select name = "agt_cd">
<%= WebUtil.getComboByList( agents, "" ) %>
              </select>
            </td>
            <td align="center">
              <input size=40 name = "product_name" maxlength=60 class="textbox">
            </td>
            <td align="center">
              <input type="submit" value = "商品追加" name="btnAdd" onClick="return goInsert();">
            </td>
          </tr>
        </table>

      </td>
    </tr>
  </table>
  </form>

<!-- ========================== //商品追加 ============================== -->
<script language="JavaScript">
<!--
function goInsert(){
		var pn =document.MainForm.product_name.value;
		if( pn.length > 30){
			alert("商品名は全角30文字以内にしてください。");
			return false;
		}
		if (!js_CheckNecessary("MainForm","product_name",true,"商品名は必須項目です。")){
					return false;
		}else{	return true;		}
	}
//-->
</script>
<!-- ========================== 商品リスト============================== -->
<br>

<jsp:include page="ProductList.jsp" flush="true" />
<!-- ========================== ギフト商品リスト============================== -->
</body>
</html>