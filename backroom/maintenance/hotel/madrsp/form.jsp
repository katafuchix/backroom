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
								jp.co.lastminute.maintenance.common.*,
								jp.co.lastminute.maintenance.hotel.*,
								jp.co.lastminute.maintenance.hotel.model.*,
								jp.co.lastminute.maintenance.util.WebUtil" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/app.tld" prefix="app" %>
<app:CheckMaintenaceLogon/>
<%
	ServletContext servletContext = getServletContext();
	DataSource Datasouce  = (DataSource)servletContext.getAttribute( ContextProperty.Lmjdatas_ );

	int type_cd = jp.co.lastminute.maintenance.hotel.Property.product_type_cd;

	CommonDBOCache cache = null;
	AgentWrapper agtWrapper = null;
	if(session.getAttribute("agtWrapper") == null){
		agtWrapper = new AgentWrapper( null, Datasouce );
		agtWrapper.getAgentMaps( "" + type_cd + "" );
		session.setAttribute("agtWrapper", agtWrapper.getCache() );
	}else{
		cache  = (CommonDBOCache)session.getAttribute("agtWrapper");
		agtWrapper = new AgentWrapper( cache, Datasouce );
	}
	List agents = agtWrapper.getCombos( "" + type_cd + "" );
	Madrsp madrsp = (Madrsp)request.getAttribute("madrsp");
%>
<table border='0' witdh='500' cellpadding="1" cellspacing="1">
<input type='hidden' name='supnbr' value='<%= madrsp.supnbr %>'/>
<input type='hidden' name='agt_cd' value='<%= madrsp.agt_cd %>'/>
	<tr>
		<td bgcolor="#CCCCCC" align='center' colspan='4'>ホテル情報（住所）</td>
	</tr>
	<tr>
		<td bgcolor="#CCCCCC" width='150'>エージェントコード</td>
		<td bgcolor="#FFFFFF" width='150'><%= agtWrapper.getAgt_name( madrsp.agt_cd ) %></td>
		<td bgcolor="#FFFFFF" width='100'>
		<input type='button' value='特殊エリア' onClick="javascript:localareaSelect('<%= madrsp.supnbr %>', '<%= madrsp.agt_cd %>');"/></td>
		<td bgcolor="#FFFFFF" width='100'>
		<input type='button' value='カテゴリー' onClick="javascript:categorySelect('<%= madrsp.supnbr %>', '<%= madrsp.agt_cd %>');"/></td>
	</tr>
	<tr>
		<td <%= WebUtil.getErrorColor(madrsp.error_flg[3]) %>>ホテル名</td>
		<td colspan='3' bgcolor="#FFFFFF"><input type='text' name='supnm1' size='60' maxlength='30' value='<%= madrsp.jpnnam %>'/></td>
	</tr>
	<tr>
		<td <%= WebUtil.getErrorColor(madrsp.error_flg[2]) %>>ホテル名（Eng）</td>
		<td colspan='3' bgcolor="#FFFFFF"><input type='text' name='jpnnam' size='60' maxlength='30' value='<%= madrsp.supnm1 %>'/></td>
	</tr>
	<tr>
		<td <%= WebUtil.getErrorColor(madrsp.error_flg[4]) %>>郵便番号</td>
		<td colspan='3' bgcolor="#FFFFFF"><input type='text' name='supad1' size='8' maxlength='8' value='<%= madrsp.supad1 %>'/></td>
	</tr>
	<tr>
		<td <%= WebUtil.getErrorColor(madrsp.error_flg[5]) %>>住所2</td>
		<td colspan='3' bgcolor="#FFFFFF"><input type='text' name='supad2' size='60' maxlength='30' value='<%= madrsp.supad2 %>'/></td>
	</tr>
	<tr>
		<td <%= WebUtil.getErrorColor(madrsp.error_flg[6]) %>>住所3</td>
		<td colspan='3' bgcolor="#FFFFFF"><input type='text' name='supad3' size='60' maxlength='30' value='<%= madrsp.supad3 %>'/></td>
	</tr>
	<tr>
		<td <%= WebUtil.getErrorColor(madrsp.error_flg[7]) %>>リンクチェック</td>
		<td colspan='3' bgcolor="#FFFFFF"><input type='text' name='promise' value='<%= madrsp.promise %>'/></td>
	</tr>
	<tr>
		<td <%= WebUtil.getErrorColor(madrsp.error_flg[8]) %>>リンクURL</td>
		<td colspan='3' bgcolor="#FFFFFF"><input type='text' name='promiseuri' size='80' maxlength='120' value='<%= madrsp.promiseuri %>'/></td>
	</tr>
	<tr>
		<td <%= WebUtil.getErrorColor(madrsp.error_flg[9]) %>>電話番号</td>
		<td colspan='3' bgcolor="#FFFFFF"><input type='text' name='suptel' size='22' maxlength='21' value='<%= madrsp.suptel %>'/></td>
	</tr>
	<tr>
		<td <%= WebUtil.getErrorColor(madrsp.error_flg[10]) %>>FAX</td>
		<td colspan='3' bgcolor="#FFFFFF"><input type='text' name='supfax' size='22' maxlength='21'value='<%= madrsp.supfax %>'/></td>
	</tr>
	<tr>
		<td <%= WebUtil.getErrorColor(madrsp.error_flg[11]) %>>説明</td>
		<td colspan='3' bgcolor="#FFFFFF"><textarea name='jpntxt' cols='50' rows='8'><%= madrsp.jpntxt %></textarea></td>
	</tr>
</table>