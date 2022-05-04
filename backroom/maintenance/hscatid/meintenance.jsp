<%@ page contentType="text/html;charset=Shift_JIS" %>
<%@ page import="org.apache.struts.action.*,
								jp.co.yobrain.util.*,
								javax.naming.*,
								javax.sql.*,
								java.util.*,
								java.io.*,
								java.sql.*,
								jp.co.yobrain.util.DataFormat,
								jp.co.yobrain.util.ParseFormat,
								jp.co.lastminute.ContextProperty,
								jp.co.lastminute.maintenance.*,
								jp.co.lastminute.maintenance.jdbc.*,
								jp.co.lastminute.maintenance.model.*,
								jp.co.lastminute.maintenance.scatid.*,
								jp.co.lastminute.maintenance.util.WebUtil" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/app.tld" prefix="app" %>
<app:CheckMaintenaceLogon/>
<%
	response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
	response.setHeader("Pragma","no-cache"); //HTTP 1.0
	response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

	ServletContext servletContext = getServletContext();
	DataSource Datasouce  = (DataSource)servletContext.getAttribute( ContextProperty.Lmjdatas_ );

	HandlerCondition condition = new HandlerCondition();
	condition = condition.getRequestByJancd( request );

	//データベースの作成
	dbAdapterHCatid_small db = new dbAdapterHCatid_small( Datasouce );
	Catid_small[] scatids = db.getLIst( condition );

	if( scatids == null ){
		//あとで実装
		return;
	}
	String[] lists = new String[ scatids.length ];
	String[] values = new String[ scatids.length ];
	for(int i=0; i<scatids.length; i++){
		lists[i] = "" + scatids[i].s_catid + "";
		values[i] = scatids[i].catch_copy;
	}
	condition = condition.getRequestByJancd( request );
%>
<HTML>
<HEAD>
<link REL="stylesheet" HREF="/backroom/maintenance/maintenance.css" TYPE="TEXT/CSS">
<meta HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=Shift_JIS">
<SCRIPT language="JavaScript" src="/backroom/maintenance/JavaScriptCommonLib.js">
</SCRIPT>
<TITLE>小カテゴリーメンテナンスのリスト</TITLE>
</HEAD>
<body>
<!-- ========================== カテゴリーリストボックス ============================== -->
<%
	ScatidList scatidlist = new ScatidList();
	scatidlist.jan_cd = condition.jan_cd ;
	scatidlist.catid = Integer.parseInt( condition.product_type );

	request.setAttribute("scatidlist", scatidlist);
	request.setAttribute("lists", lists);
	request.setAttribute("values", values);
%>
<jsp:include page="form.jsp" />
<!-- ========================== //カテゴリーリストボックス ============================== -->
<%
	Catid_small[] scatidlists = db.getLIstByJanCd( condition );
	if( scatidlists != null ){
%>
<br>
<form name='ListForm' method='post' action='catchCopyUpdater.jsp' onsubmit='return doEditProduct();'>
<input type="hidden" name='catid' value='<%= condition.product_type %>'>
  <table width="500" border="0" cellpadding="0" cellspacing="0" align="center">
    <tr>
    <td bgcolor="#999999">
        <table width="100%" border="0" cellspacing="1" cellpadding="2">
          <tr bgcolor="#999999">
            <td colspan="4" align='center' class="b">小カテゴリーリスト</td>
          </tr>
          <tr bgcolor="#CCCCCC">
            <td width="56" class="b" align="center" width='89'>アクト</td>
            <td align="left" class="b" colspan="2" >小カテゴリー</td>
          </tr>
<%
	for(int x = 0; x < scatidlists.length; x++){
		Catid_small scat = scatidlists[x];
%>
          <tr bgcolor="#FFFFFF">
            <td width="56" align="right" rowspan="1">
            <a href='./stopUpdater.jsp?s_catid=<%= scat.s_catid %>&catid=<%= scat.product_type_cd %>&jan_cd=<%= condition.getJan_cd() %>'>削除</a>
            </td>
            <td align="left" width='89'>キャッチコピー</td>
            <td align="left" width="310"  >
            <%= scat.catch_copy %>
            </td>
          </tr>
<%	}	%>

        </table>
    </td>
  </tr>
</table>
</form>
<%	}	%>
<!-- ========================== ギフト商品リスト============================== -->
</body>
</html>

