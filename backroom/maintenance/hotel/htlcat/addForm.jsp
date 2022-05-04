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
								jp.co.lastminute.maintenance.hotel.htlcat.*,
								jp.co.lastminute.maintenance.common.*,
								jp.co.lastminute.maintenance.util.WebUtil" %>
<%
	int type_cd = jp.co.lastminute.maintenance.hotel.Property.product_type_cd;
	ServletContext servletContext = getServletContext();
	DataSource Datasouce  = (DataSource)servletContext.getAttribute( ContextProperty.Lmjdatas_ );

	HtlcatSupNbr htlcatsupnbr = (HtlcatSupNbr)request.getAttribute("htlcatsupnbr");

	CommonDBOCache cache = null;
	HtlcatWrapper catWrapper = null;
	if(session.getAttribute("catWrapper") == null){
		catWrapper = new HtlcatWrapper( null, Datasouce );
		catWrapper.getHtlcatMaps( "" + type_cd + "" );
		session.setAttribute("catWrapper", catWrapper.getCache() );
	}else{
		cache  = (CommonDBOCache)session.getAttribute("catWrapper");
		catWrapper = new HtlcatWrapper( cache, Datasouce );
	}
	List category = catWrapper.getCombos( "" + type_cd + "" );
%>
<table border='0' witdh='500' cellpadding="0" cellspacing="0">
	<tr>
		<td bgcolor="#999999">
<table width='500' border="0" cellspacing="1" cellpadding="2">
<form action='./insertUp.jsp' metghod='get'>
	<input type='hidden' name='supnbr' value='<%= htlcatsupnbr.supnbr %>'/>
	<input type='hidden' name='agt_cd' value='<%= htlcatsupnbr.agt_cd %>'/>
	<tr>
		<td><select name = "htlcat">
<%= WebUtil.getComboByList( category, "" ) %>
		</select></td>
		<td align="center">
			<input type='submit' value='add'/>
		</td>
	</tr>
</table>
		</td>
	</tr>
</form>
</table>