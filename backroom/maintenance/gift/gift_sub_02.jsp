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
								jp.co.lastminute.maintenance.gift.*,
								jp.co.lastminute.maintenance.common.CommonDBOCache,
								jp.co.lastminute.maintenance.common.AgentWrapper" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%
	response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
	response.setHeader("Pragma","no-cache"); //HTTP 1.0
	response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

	int type_cd = jp.co.lastminute.maintenance.gift.Property.product_type_cd;
	int page_type_cd = jp.co.lastminute.maintenance.Property.PURPOSE_;
	HandlerCondition condition = new HandlerCondition();
	condition = condition.getRequest( request,  "" + type_cd + "" );
	condition.setLimittype( 2 );

	session.setAttribute( "HandlerCondition",  condition );

	ServletContext servletContext = getServletContext();
	DataSource Datasouce = (DataSource)servletContext.getAttribute( Action.DATA_SOURCE_KEY );

	dbAdapterCatid_small db = new dbAdapterCatid_small( Datasouce );
	Catid_small[] catids = db.getLIst( condition );
	if( catids == null ){
		//さびしくなるので今後追加：
		return;
	}

  //カテゴリー

	String[] input = new String[ catids.length ];
	String[] values = new String[ catids.length ];
	for( int i=0; i<catids.length; i++ ){
		input[ i ] = "" + catids[ i ].s_catid + "";
		values[ i ] = catids[ i ].catch_copy;
	}

	Vector vc1;

	Gift pagelist = new Gift();
	pagelist.init( Datasouce );
	//
	int pagetype_cd = type_cd * 10 + page_type_cd;
	vc1 = pagelist.getMaintenanceView( pagetype_cd );

%>

<HTML>
<head>
<link REL="stylesheet" HREF="/backroom/maintenance/maintenance.css" TYPE="TEXT/CSS">
<meta HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=Shift_JIS">
</head>
<BODY>
<table border="0" cellspacing="0" cellpadding="0" bgcolor="#999999" width="650" align="CENTER">
  <tr>
    <td>
      <table border="0" cellspacing="1" cellpadding="2" width="100%">
        <tr align="center">
          <td colspan="5" bgcolor="#FFFFFF">ギフトトップ画面　カテゴリー別</td>
        </tr>
        <%
		int end = 11;
		for(int i=0; i<end; i++){
			Mentlist mentlist = (Mentlist)vc1.get( i );
			Categoryselect select = mentlist.getSelect();
			Catid_small small = mentlist.getSmall();
%>
        <form action="./categorySelectUpdater.jsp" method="POST" target="update">
          <input type="hidden" name="startdate"  size="9" maxlength="8"	value="<%= select.getStartdate() %>">
          <input type="hidden" name="enddate" size="9" maxlength="8" value="<%= select.getStopdate() %>">
          <input type="hidden" name="seqno" value="<%= select.getSeqno() %>">
          <input type="hidden" name="page_type" value="<%= pagetype_cd %>">
		    <tr>
        	<td rowspan="3" bgcolor="#FFFFFF" width="11%">No<%= i + 1%> <br>
              <input type=submit value="更新" onClick="return update(<%= i %>)" name="submit2">
          </td>
          <td width="14%" bgcolor="#FFFFFF" height="24">小カテゴリー</td>
          <td bgcolor="#FFFFFF" colspan="3" height="24">
            <select name="s_catid" onChange="javaScript:resetJan_cd(<%= i %>)">
            	<%= WebUtil.getComboByList( input, values, "" + select.getS_catid() + "" ) %>
            </select>
            <input type=button name=goodsSeelectBtn value="商品選択" onClick='ShowNewWindowsFiles("<%= i %>" );' >
          </td>
        </tr>
        <tr>
        	<td width="14%" bgcolor="#FFFFFF" height="31">チャッチコピー</td>
          <td bgcolor="#FFFFFF" colspan="3" height="31">
          <input type="text" name="description" class="textbox_white" size="40" value="<%= select.getDescription() %>" readonly>
          </td>
        </tr>
        <tr>
          <td width="14%" bgcolor="#FFFFFF">商品コード</td>
          <td bgcolor="#FFFFFF" width="13%" align="left">
          <input type="text" name="prod_id_1" size="16" maxlength="16" value="<%= select.getProd_id_1() %>" readonly class="textbox_white">
          </td>
          <td bgcolor="#FFFFFF" width="15%" align="left">商品名</td>
          <td valign=top bgcolor="#FFFFFF" width="55%">
          <input type="text" name="product_name" class="textbox_white" size="55" value="<%= mentlist.getProduct_name() %>">
        </td>
        </tr>
        <tr>
        	<td colspan="5" bgcolor="#cccccc" height=8> </td>
        </tr>
       </form>

<%	}	%>
        <form action="./constants_write.jsp" method="post" target="update">
          <tr align="center">
            <td colspan="5" bgcolor="#FFFFFF">
              <input type="hidden" name="index" value="<%= type_cd %>">
              <input type="hidden" name="page_type" value="<%= page_type_cd %>">
              <input type="submit" value="ページ更新" name="submit">
            </td>
          </tr>
        </form>
      </table>
    </td>
  </tr>
</table>

<script language="JavaScript">
<!--
function ShowNewWindowsFiles( postion ){
	var product_id = document.forms[postion].elements["prod_id_1"].value ;
	document.forms[postion].elements["prod_id_1"].value = "";
	var scatid = document.forms[postion].elements["s_catid"].options[ document.forms[postion].elements["s_catid"].selectedIndex ].value;
	var scatidname = document.forms[postion].elements["s_catid"].options[ document.forms[postion].elements["s_catid"].selectedIndex ].text;
	notice = "./selectproduct.jsp?s_catid="+scatid+"&index="+postion+"&jan_cd_org="+product_id+"&scatidname=" + scatidname;
	remoteWinss =window.open("","disc",'toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=0,width=800,height=400');
 	if (remoteWinss != null) {
    	remoteWinss.location = notice;
 	}
 	remoteWinss.focus();
}

function update(m){
	var jan_cd = document.forms[m].elements["prod_id_1"].value;
	var msg = "商品コードを選択してください";
	if(jan_cd.length == 0 )	{
		alert(msg);
		document.forms[m].elements["goodsSeelectBtn"].focus();
		return false;
	}	else{
		return true;
	}
}

function resetJan_cd(m)
{
	document.forms[m].elements["prod_id_1"].value= "";
	resetDescription(m);
}

function resetDescription(m){
	var descriptions = new Array(10000);
<%
	String s = null;
	for(int x=0; x<catids.length; x++){
		s = catids[x].description;
%>
		descriptions['<%= catids[x].s_catid %>'] = "<%=  s %>";
<%
	}
%>
	var selectedSctatid = document.forms[m].elements["s_catid"].options[document.forms[m].elements["s_catid"].selectedIndex].value;
	var newValue = descriptions[selectedSctatid];
	document.forms[m].description.value = newValue;
}
-->
</script>

</BODY>
</HTML>
