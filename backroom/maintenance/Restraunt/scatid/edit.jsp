<%@ page contentType="text/html; charset=Shift_JIS" %>
<%@ page import="org.apache.struts.action.*,
								jp.co.yobrain.util.*,
								javax.naming.*,
								javax.sql.*,
								java.util.*,
								java.io.*,
								java.sql.*,
								jp.co.yobrain.util.DataFormat,
								jp.co.lastminute.ContextProperty,
								jp.co.lastminute.maintenance.model.*,
								jp.co.lastminute.maintenance.jdbc.*,
								jp.co.lastminute.maintenance.*,
								jp.co.lastminute.maintenance.util.WebUtil,
								jp.co.lastminute.maintenance.Restraunt.*,
								jp.co.lastminute.maintenance.Restraunt.scatid.*" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c" %><%@ taglib uri="/WEB-INF/x.tld" prefix="xml" %><%@ taglib uri="/WEB-INF/fmt.tld" prefix="fmt" %>
<%	ParseFormat pf = null;	%>
<%
	response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
	response.setHeader("Pragma","no-cache"); //HTTP 1.0
	response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

	int type_cd = jp.co.lastminute.maintenance.Restraunt.Property.product_type_cd;
	Scatid condition = new Scatid();
	condition = condition.getRequest( request );

	ServletContext servletContext = getServletContext();
	DataSource datasouce = (DataSource)servletContext.getAttribute( Action.DATA_SOURCE_KEY );

	Scatidhandler scatidhandler = new Scatidhandler();
	scatidhandler.setDataSource( datasouce );
	String comment = "";
	///
	dbAdapterCatid_small db = new dbAdapterCatid_small( datasouce );
	HandlerCondition hcondition = new HandlerCondition();
	hcondition = hcondition.getRequestByScatid( request );
	hcondition.product_type = "" + type_cd + "";

	Catid_small[] list = db.getLIst( hcondition );
	String[] lists = new String[ list.length ];
	String[] values = new String[ list.length ];

	for(int i=0; i<list.length; i++){
		lists[i] = "" + list[i].s_catid + "";
		values[i] = list[i].catch_copy;
	}
	request.setAttribute("Rlists", lists);
	request.setAttribute("Rvalues", values);
%>

<%
	if( condition.dbflag.equals( "1" )){
		if( !scatidhandler.insertScatid( condition ) ){
			comment = "追加に失敗しました";
		}
	}
	if( condition.dbflag.equals( "2" )){
		if( !scatidhandler.deleteScatid( condition ) ){
			comment = "削除に失敗しました";
		}
	}
%>
<html
<head>
<title>メンテナンス</title>
</head>
<body BGCOLOR="#FFFFFF" TEXT="#000000" LEFTMARGIN="0" TOPMARGIN="0" MARGINWIDTH="0" MARGINHEIGHT="0">
<% if( comment.length() > 0 ){	%>
<table border='1' width='400' cellspaing='1'>
	<tr>
		<td><%= comment %></td>
	</tr>
</table>
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
<%= WebUtil.getComboByList( lists, values, hcondition.s_catid ) %>
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
<% 	}else{	%>
<table border='1' width='400' cellspaing='1'>
	<tr>
		<td>なんとか更新しちゃった。</td>
	</tr>
</table>
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
<%= WebUtil.getComboByList( lists, values, hcondition.s_catid ) %>
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
<jsp:include page="productListByScatid.jsp" flush="true" />
<%	}	%>
</body>
</html>
