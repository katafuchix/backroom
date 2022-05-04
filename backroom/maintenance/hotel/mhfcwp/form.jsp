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

	Mhfcwp mhfcwp = (Mhfcwp)request.getAttribute("mhfcwp");
%>
<table border='0' witdh='500' cellpadding="1" cellspacing="1">
<input type='hidden' name='supnbr' value='<%= mhfcwp.supnbr %>'/>
<input type='hidden' name='agt_cd' value='<%= mhfcwp.agt_cd %>'/>
	<tr>
		<td bgcolor="#CCCCCC">ê‡ñæ</td>
		<td colspan='3' bgcolor="#FFFFFF"><textarea name='buildxml' cols='50' rows='8'><%= mhfcwp.buildxml %></textarea></td>
	</tr>
</table>