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
								jp.co.lastminute.maintenance.*,
								jp.co.lastminute.maintenance.jdbc.*,
								jp.co.lastminute.maintenance.model.*,
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

	String image_path = jp.co.lastminute.ContextProperty._SCATID_image_Dir;

	ServletContext servletContext = getServletContext();
	DataSource Datasouce  = (DataSource)servletContext.getAttribute( Action.DATA_SOURCE_KEY );
	String[] lists = jp.co.lastminute.maintenance.Property.lists;
	String[] values = jp.co.lastminute.maintenance.Property.values;

	HandlerCondition condition = new HandlerCondition();
	condition = condition.getRequestByType( request );

	//データベースの作成
	dbAdapterCatid_small db = new dbAdapterCatid_small( Datasouce );
	Catid_small[] scatids = db.getLIst( condition );
%>
<HTML>
<HEAD>
<link REL="stylesheet" HREF="/backroom/maintenance/maintenance.css" TYPE="TEXT/CSS">
<meta HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=Shift_JIS">
<SCRIPT language="JavaScript" src="/backroom/maintenance/JavaScriptCommonLib.js"></SCRIPT>
<SCRIPT language="JavaScript" src="/backroom/maintenance/ImageMaintenance.js"></SCRIPT>
<TITLE>小カテゴリーメンテナンスのリスト</TITLE>
</HEAD>
<body>
<!-- ========================== カテゴリーリストボックス ============================== -->


  <table width="650" border="0" cellpadding="0" cellspacing="0" align="center">
    <tr>
    	<td bgcolor="#999999" valign='top'>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
<form name='MainForm' method='post' action="./index.jsp">
          <tr bgcolor="#999999">
            <td align='left' class="b" colspan="2">小カテゴリー情報更新</td>
          </tr>
          <tr bgcolor="#CCCCCC">
            <td class="b" align="left" colspan="2">基本商品
              <select name = "catid">
<%= WebUtil.getComboByList( lists, values, condition.product_type ) %>
              </select>
              <input type="submit" name="Submit" value="選択">
            </td>
          </tr>
</form>
        </table>
      </td>
      <td bgcolor="#999999" valign='top' rowspan='2'>
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
<form name='MainForm' method='post' action="./setUp2.jsp">
					<tr bgcolor="#999999">
						<td class="b" align="right">
						<input type="submit" name="Submit" value="更新">
						</td>
					</tr>
</form>
			</table>
      </td>
    </tr>
  </table>


<!-- ========================== //カテゴリーリストボックス ============================== -->
<!-- ========================== ギフト商品リスト============================== -->
<br>
<form name='ListForm' method='post' action='catchCopyUpdater.jsp' onsubmit='return doEditProduct();'>
<input type="hidden" name='catid' value='<%= condition.product_type %>'>
  <table width="650" border="0" cellpadding="0" cellspacing="0" align="center">
    <tr>
    <td bgcolor="#999999">
        <table width="100%" border="0" cellspacing="1" cellpadding="2">
          <tr bgcolor="#CCCCCC">
            <td width="56" class="b" align="center" width='89'>コード</td>
            <td align="left" class="b" colspan="2" >小カテゴリー</td>
            <td class="b" align="center" width="44" >修正</td>
          </tr>
<%
	String rowCnt = "" + scatids.length + "";
	pageContext.setAttribute("rowCnt",rowCnt);
	for(int x = 0; x < scatids.length; x++){
		Catid_small scat = scatids[x];
%>
<%	if(( x % 10 == 0 && x != scatids.length) ){	%><tr>
	<td colspan=7 align='right'>
	<input type='submit' name='作業' value='カテゴリー名・コピー更新'>
		</td></tr>
<%	}	%>
          <tr bgcolor="#FFFFFF">
            <td width="56" align="right" rowspan="2"> <%= scat.s_catid %><br/>
            <a href="javascript:PopImageMaintenace('<%= scat.s_catid %>-1.gif', '<%= image_path %>');">IMAGE</a><br/>
            <a href='./stopFlagUpdater.jsp?catid=<%= scat.catid %>&s_catid=<%= scat.s_catid %>&stop_flg=1'>削除</a>
            </td>
            <td align="left" width='89'>カテゴリー名</td>
            <td align="left" width="290"  >
              <input type="text" name="catch_copy" class="textbox" value='<%= scat.catch_copy %>' size="50" maxlength="50">
            </td>
            <td align="center" rowspan="2" width="44" >
              <input type="checkBox" name="chtarget" value='<%= x %>'>
              <input type="hidden" name="s_catid" value='<%= scat.s_catid %>'>
              <input type="hidden" name="stop_flg" value='<%= scat.stop_flg %>'>
            </td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td align="left" width='89'>キャッチコピー</td>
            <td align="left" width="310"  >
              <input type="text" name="description" class="textbox" value='<%= scat.description.trim() %>' size="60" maxlength="60">
            </td>
          </tr>
<%	}	%>

        </table>
    </td>
  </tr>
</table>
</form>
<script language="JavaScript">
<!--
	function doEditProduct(){
		var valid = false
		for(var i=0; i < document.ListForm.chtarget.length; i++){
			if(document.ListForm.chtarget[i].checked){
				valid = true;
			}
		}

		if(!valid){
			alert("一つ選択してください。");
		}
		return valid;

	}//
//-->
</script>

<!-- ========================== ギフト商品リスト============================== -->
</body>
</html>

