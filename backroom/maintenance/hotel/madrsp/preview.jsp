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
	<input type='hidden' name='supnm1' value='<%= madrsp.jpnnam %>'/>
	<tr>
		<td <%= WebUtil.getErrorColor(madrsp.error_flg[3]) %>>ホテル名</td>
		<td colspan='3' bgcolor="#FFFFFF"><%= madrsp.jpnnam %></td>
	</tr>
	<input type='hidden' name='jpnnam' value='<%= madrsp.supnm1 %>'/>
	<tr>
		<td <%= WebUtil.getErrorColor(madrsp.error_flg[2]) %>>ホテル名（Eng）</td>
		<td colspan='3' bgcolor="#FFFFFF"><%= madrsp.supnm1 %></td>
	</tr>
	<input type='hidden' name='supad1' value='<%= madrsp.supad1 %>'/>
	<tr>
		<td <%= WebUtil.getErrorColor(madrsp.error_flg[4]) %>>郵便番号</td>
		<td colspan='3' bgcolor="#FFFFFF"><%= madrsp.supad1 %></td>
	</tr>
	<input type='hidden' name='supad2' value='<%= madrsp.supad2 %>'/>
	<tr>
		<td <%= WebUtil.getErrorColor(madrsp.error_flg[5]) %>>住所2</td>
		<td colspan='3' bgcolor="#FFFFFF"><%= madrsp.supad2 %></td>
	</tr>
	<input type='hidden' name='supad3' value='<%= madrsp.supad3 %>'/>
	<tr>
		<td <%= WebUtil.getErrorColor(madrsp.error_flg[6]) %>>住所3</td>
		<td colspan='3' bgcolor="#FFFFFF"><%= madrsp.supad3 %></td>
	</tr>
	<input type='hidden' name='promise' value='<%= madrsp.promise %>'/>
	<tr>
		<td <%= WebUtil.getErrorColor(madrsp.error_flg[7]) %>>リンクチェック</td>
		<td colspan='3' bgcolor="#FFFFFF"><%= madrsp.promise %></td>
	</tr>
	<input type='hidden' name='promiseuri' value='<%= madrsp.promiseuri %>'/>
	<tr>
		<td <%= WebUtil.getErrorColor(madrsp.error_flg[8]) %>>リンクURL</td>
		<td colspan='3' bgcolor="#FFFFFF"><%= madrsp.promiseuri %></td>
	</tr>
	<input type='hidden' name='suptel' value='<%= madrsp.suptel %>'/>
	<tr>
		<td <%= WebUtil.getErrorColor(madrsp.error_flg[9]) %>>電話番号</td>
		<td colspan='3' bgcolor="#FFFFFF"><%= madrsp.suptel %></td>
	</tr>
	<input type='hidden' name='supfax' value='<%= madrsp.supfax %>'/>
	<tr>
		<td <%= WebUtil.getErrorColor(madrsp.error_flg[10]) %>>FAX</td>
		<td colspan='3' bgcolor="#FFFFFF"><%= madrsp.supfax %></td>
	</tr>
	<input type='hidden' name='jpntxt' value='<%= madrsp.jpntxt %>'/>
	<tr>
		<td <%= WebUtil.getErrorColor(madrsp.error_flg[11]) %>>説明</td>
		<td colspan='3' bgcolor="#FFFFFF"><pre><%= madrsp.jpntxt %></pre></td>
	</tr>
</table>