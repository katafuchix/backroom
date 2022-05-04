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

	int type_cd = jp.co.lastminute.maintenance.hotel.Property.product_type_cd;

	ServletContext servletContext = getServletContext();
	DataSource Datasouce  = (DataSource)servletContext.getAttribute( ContextProperty.Lmjdatas_ );

	newHotelhandler handler = new newHotelhandler( Datasouce );
	handler = handler.setCondition( request );
	boolean flag = handler.isError();
%>
<html>
<body>
<%
	if( flag ){
		session.setAttribute("newHotelhandler", handler );
%>
<h3>ＨＴＴＰ施設追加失敗</h3>
<table width="100%" border="0" cellspacing="1" cellpadding="2">
	<form action='./newHotelComplete.jsp' metghod='post'>
	<tr>
		<td bgcolor="#FFFFFF">都道府県</td>
		<td bgcolor="#FFFFFF">都道府県</td>
		<td bgcolor="#FFFFFF">市町村</td>
		<td bgcolor="#FFFFFF">市町村</td>
	</tr>
	<tr>
		<td bgcolor="#FFFFFF">ファシリティコード</td>
		<td bgcolor="#FFFFFF">ファシリティコード</td>
		<td bgcolor="#FFFFFF">エージェントコード</td>
		<td bgcolor="#FFFFFF">ファシリティコード</td>
	</tr>
	<tr>
		<td bgcolor="#FFFFFF" colspan='4'><input type='submit' value='ＧＯ'/></td>
	</tr>
	</form>
</table>
<%	}else{	%>
<h3>ＨＴＴＰ施設追加失敗</h3>
<table width="100%" border="0" cellspacing="1" cellpadding="2">
	<form action='./newHotel.jsp' metghod='post'>
	<tr>
		<td colspan='1' <%= WebUtil.getErrorColor(handler.error_flg[1]) %>>サプライヤー</td>
		<td bgcolor="#FFFFFF" colspan='1'>
		<select name = "agt_cd">
<%= WebUtil.getComboByList( agents, "" ) %>
    </select></td>
    <td <%= WebUtil.getErrorColor(handler.error_flg[0]) %> >サファシリティコード</td><td bgcolor="#FFFFFF">
    <input type='text' name='supnbr' value='' style="ime-mode:disabled;" size='12' maxlength='12'/>
    </td>
	</tr>
	<tr>
		<td colspan='1' <%= WebUtil.getErrorColor(handler.error_flg[2]) %>>ポスタルコード:</td>
    <td bgcolor="#FFFFFF" colspan='3'>
    <input type='text' name='postal_cd' value='' style="ime-mode:disabled;" size='8' maxlength='7'/>
    </td>
	</tr>
	<tr>
		<td <%= WebUtil.getErrorColor(handler.error_flg[3]) %>>コネクションＵＲＬ</td><td colspan='3' bgcolor="#FFFFFF">
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
<% if( handler.getErr_comm().length() > 0 ){	%>
	<tr>
		<td bgcolor="#FFFFFF" align='left' colspan='4'>
		<%=	 handler.getErr_comm() %>
    </td>
	</tr>
<%	}	%>
	<tr>
		<td bgcolor="#FFFFFF" align='right' colspan='4'><input type='submit' value='Add'/></td>
	</tr>
	</form>
</table>
		</td>
	</tr>
</table>

<% 	}	%>
</body>
</html>