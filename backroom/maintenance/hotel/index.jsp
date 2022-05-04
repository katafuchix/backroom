<%@ page contentType="text/html; charset=shift_jis"%>
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
								jp.co.lastminute.maintenance.hotel.*,
								jp.co.lastminute.maintenance.hotel.model.*,
								jp.co.lastminute.maintenance.common.*,
								jp.co.lastminute.maintenance.common.CommonDBOCache,
								jp.co.lastminute.maintenance.util.WebUtil" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/app.tld" prefix="app" %>
<app:CheckMaintenaceLogon/>
<%
	int type_cd = jp.co.lastminute.maintenance.hotel.Property.product_type_cd;

	ServletContext servletContext = getServletContext();
	DataSource Datasouce  = (DataSource)servletContext.getAttribute( ContextProperty.Lmjdatas_ );
	String[] lists = jp.co.lastminute.maintenance.Property.lists;
	String[] values = jp.co.lastminute.maintenance.Property.values;

	CommonDBOCache cache = null;
	AgentWrapper agtWrapper = null;
	if(session.getAttribute("agtWrapper") == null){
		agtWrapper = new AgentWrapper( null, Datasouce );
		//agtWrapper.getAgentMaps( "" + type_cd + "" );
		session.setAttribute("agtWrapper", agtWrapper.getCache() );
	}else{
		cache  = (CommonDBOCache)session.getAttribute("agtWrapper");
		agtWrapper = new AgentWrapper( cache, Datasouce );
		//agtWrapper = (AgentWrapper)session.getAttribute("agtWrapper");
	}
	List agents = agtWrapper.getCombos( "" + type_cd + "" );

	cache = null;
	HtlcatWrapper catWrapper = null;
	if(session.getAttribute("catWrapper") == null){
		catWrapper = new HtlcatWrapper( null, Datasouce );
		//catWrapper.getHtlcatMaps( "" + type_cd + "" );
		session.setAttribute("catWrapper", catWrapper.getCache() );
	}else{
		cache  = (CommonDBOCache)session.getAttribute("catWrapper");
		catWrapper = new HtlcatWrapper( cache, Datasouce );
		//catWrapper = (HtlcatWrapper)session.getAttribute("catWrapper");
	}
	List category = catWrapper.getCombos( "" + type_cd + "" );

	cache = null;
	StateWrapper stateWrapper = null;
	if(session.getAttribute("stateWrapper") == null){
		stateWrapper = new StateWrapper( null, Datasouce );
		stateWrapper.getStateMaps( "" + type_cd + "" );
		session.setAttribute("stateWrapper", stateWrapper.getCache() );
	}else{
		cache  = (CommonDBOCache)session.getAttribute("stateWrapper");
		stateWrapper = new StateWrapper( cache, Datasouce );
		//stateWrapper = (StateWrapper)session.getAttribute("stateWrapper");
	}
	List state = stateWrapper.getCombos( "" + type_cd + "" );

	HandlerCondition condition = new HandlerCondition();
%>
<html>
<head>
<script language='javascript'>
	function localareaSelect(){
		var cal = "/backroom/maintenance/hotel/localarea/setUp.jsp";
	  remoteWins = window.open("","localarea",'toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=0,width=550,height=200,left=0,top=0,alwaysRaised=1')
	  if (remoteWins != null) {
	   	remoteWins.location = cal;
	  }
	  remoteWins.focus();
	}
	function postalSelect(){
		var state_cd = document.forms[0].elements['state_cd'].value;
		var cal = "/backroom/maintenance/hotel/postalcode/setUp.jsp?state_cd=" + state_cd;
	  remoteWins = window.open("","localarea",'toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=0,width=550,height=200,left=0,top=0,alwaysRaised=1')
	  if (remoteWins != null) {
	   	remoteWins.location = cal;
	  }
	  remoteWins.focus();
	}
</script>
</head>
<body>
<table border='0' witdh='500' cellpadding="0" cellspacing="0">
	<tr>
		<td bgcolor="#999999">
<table width="100%" border="0" cellspacing="1" cellpadding="2">
	<tr>
		<td bgcolor="#AAAAAA" align='right'>タイプ</td>
		<td bgcolor="#AAAAAA" align='center' colspan='2'>検索項目</td>
		<td bgcolor="#AAAAAA" align='center'>アクション</td>
	</tr>
<form action='./search.jsp' metghod='post'>
	<tr>
		<td bgcolor="#FFFFFF" colspan='2'>サプライヤー:
		<select name = "agt_cd">
<%= WebUtil.getComboByList( agents, "" ) %>
    </select></td>
    <td bgcolor="#FFFFFF" colspan='2'>カテゴリー:
		<select name = "htlcat">
<%= WebUtil.getComboByList( category, "" ) %>
		</select></td>
	</tr>
	<tr>
		<td bgcolor="#CCCCCC">From 特殊エリア</td>
    <td bgcolor="#FFFFFF" colspan='2'>エリアコード:<input type='text' name='local_area_code'/></td>
		<td bgcolor="#FFFFFF"><input type='button' value='Open' onClick="javascript:localareaSelect();"/></td>
	</tr>
	<tr>
		<td bgcolor="#CCCCCC">From 地区</td>
		<td bgcolor="#FFFFFF">都道府県:<select name = "state_cd">
<%= WebUtil.getComboByList( state, "" ) %>
		</select></td>
    <td bgcolor="#FFFFFF">シティコード:<input type='text' name='city_cd'/></td>
    <td bgcolor="#FFFFFF"><input type='button' value='Open' onClick="javascript:postalSelect();"/></td>
	</tr>
	<tr>
		<td bgcolor="#CCCCCC">From ファシリティID</td>
		<td bgcolor="#FFFFFF" colspan='3'>ファシリティコード<input type='text' name='supnbr' style="ime-mode:disabled;" /></td>
	</tr>
	<tr>
		<td bgcolor="#FFFFFF" align='center' colspan='4'><input type='submit' value='Search'/></td>
	</tr>
</form>
</table>
<h3>ＨＴＴＰ施設追加</h3>
<table width="100%" border="0" cellspacing="1" cellpadding="2">
	<form action='./newHotel.jsp' metghod='post'>
	<tr>
		<td bgcolor="#FFFFFF" colspan='1'>サプライヤー</td>
		<td bgcolor="#FFFFFF" colspan='1'>
		<select name = "agt_cd">
<%= WebUtil.getComboByList( agents, "" ) %>
    </select></td>
    <td bgcolor="#FFFFFF">サファシリティコード</td><td bgcolor="#FFFFFF">
    <input type='text' name='supnbr' value='' style="ime-mode:disabled;" size='12' maxlength='12'/>
    </td>
	</tr>
	<tr>
		<td bgcolor="#FFFFFF" colspan='1'>ポスタルコード:</td>
    <td bgcolor="#FFFFFF" colspan='3'>
    <input type='text' name='postal_cd' value='' style="ime-mode:disabled;" size='8' maxlength='7'/>
    </td>
	</tr>
	<tr>
		<td bgcolor="#FFFFFF">コネクションＵＲＬ</td><td colspan='3' bgcolor="#FFFFFF">
		<select name='url'>
		<option>http://192.168.10.3/backroom/maintenance/targetdata</option>
		<option>http:/??????/backroom/maintenance/targetdata</option>
		</select>
		</td>
	</tr>
	<tr>
		<td bgcolor="#FFFFFF" align='left' colspan='4'>
		ex)http://192.168.10.3/backroom/maintenance/targetdata?supnbr=12345&agt_cd=NTA
    </td>
	</tr>
	<tr>
		<td bgcolor="#FFFFFF" align='right' colspan='4'><input type='submit' value='Add'/></td>
	</tr>
	</form>
</table>
		</td>
	</tr>
</table>
</body>
</html>