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
								jp.co.lastminute.maintenance.Restraunt.*,
								jp.co.lastminute.maintenance.model.*,
								jp.co.lastminute.maintenance.jdbc.*" %>
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
	int type_cd = jp.co.lastminute.maintenance.Restraunt.Property.product_type_cd;
	ServletContext servletContext = getServletContext();
	DataSource Datasouce  = (DataSource)servletContext.getAttribute( Action.DATA_SOURCE_KEY );
	dbAdapterCatid_small db = new dbAdapterCatid_small( Datasouce );

	HandlerCondition condition = new HandlerCondition();
	condition = condition.getRequestByScatid( request );
	condition.product_type = "" + type_cd + "";

	Catid_small[] list = db.getLIst( condition );
	String[] lists = new String[ list.length ];
	String[] values = new String[ list.length ];
	request.setAttribute("Rlists", lists);
	request.setAttribute("Rvalues", values);

	for(int i=0; i<list.length; i++){
		lists[i] = "" + list[i].s_catid + "";
		values[i] = list[i].catch_copy;
	}
%>
<html>
<head>
<link rel="stylesheet" href="/backroom/maintenance/maintenance.css" type="text/css">
<META http-equiv="Content-Type" content="text/html; charset=Shift_JIS">
<SCRIPT language="JavaScript" src="/backroom/maintenance/ScatidMaintenance.js"></SCRIPT>
<SCRIPT language="JavaScript" src="/backroom/maintenance/JavaScriptCommonLib.js"></SCRIPT>
<SCRIPT language="JavaScript" src="/backroom/maintenance/ImageMaintenance.js"></SCRIPT>
<title>レストラン商品管理</title>
</head>
<body bgcolor = "white">
<!-- ========================== 商品追加 ============================== -->
<form name='MainForm' method='post' action="/backroom/maintenance/Restraunt/scatid/index.jsp">
  <table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
  	<input type='hidden' name='catid' value='<%= type_cd %>'>
    <tr>
    <td bgcolor="#999999">
        <table width="100%" border="0" cellspacing="1" cellpadding="2">
          <tr bgcolor="#999999">
            <td colspan="2" align='center' class="b">レストラン商品検索</td>
          </tr>
          <tr bgcolor="#CCCCCC">
            <td align="center" class="b" colspan="2">小カテゴリー</td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td align="center" >
              <select name = "s_catid">
<%= WebUtil.getComboByList( lists, values, condition.s_catid ) %>
<option value='0'>その他</option>
              </select>
            </td>
            <td align="center">
              <input type="submit" value = "商品検索" name="btnAdd"/>
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
<jsp:include page="productListByScatid.jsp" flush="true" />
<!-- ========================== ギフト商品リスト============================== -->
</body>
</html>