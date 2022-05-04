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

	Mhtlcp mhtlcp = (Mhtlcp)request.getAttribute("mhtlcp");
%>
<table border='0' witdh='500' cellpadding="1" cellspacing="1">
<input type='hidden' name='supnbr' value='<%= mhtlcp.supnbr %>'/>
<input type='hidden' name='agt_cd' value='<%= mhtlcp.agt_cd %>'/>
	<tr>
		<td BGCOLOR="#CCFFFF">htltyp</td>
		<td colspan='3' bgcolor="#FFFFFF"><textarea name='htltyp' cols='50' rows='8'><%= mhtlcp.htltyp %></textarea>
		</td>
	</tr>
	<tr>
		<td BGCOLOR="#CCFFFF">htlcat</td>
		<td colspan='3' bgcolor="#FFFFFF"><textarea name='htlcat' cols='50' rows='8'><%= mhtlcp.htlcat %></textarea>
		</td>
	</tr>
	<tr>
		<td BGCOLOR="#CCFFFF">hrlloc</td>
		<td colspan='3' bgcolor="#FFFFFF"><textarea name='hrlloc' cols='50' rows='8'><%= mhtlcp.hrlloc %></textarea>
		</td>
	</tr>
	<tr>
		<td BGCOLOR="#CCFFFF">aptcde</td>
		<td colspan='3' bgcolor="#FFFFFF"><textarea name='aptcde' cols='50' rows='8'><%= mhtlcp.aptcde %></textarea>
		</td>
	</tr>
	<tr>
		<td BGCOLOR="#CCFFFF">aptdst</td>
		<td colspan='3' bgcolor="#FFFFFF"><textarea name='aptdst' cols='50' rows='8'><%= mhtlcp.aptdst %></textarea>
		</td>
	</tr>
	<tr>
		<td BGCOLOR="#CCFFFF">htlrst</td>
		<td colspan='3' bgcolor="#FFFFFF"><textarea name='htlrst' cols='50' rows='8'><%= mhtlcp.htlrst %></textarea>
		</td>
	</tr>
	<tr>
		<td BGCOLOR="#CCFFFF">htlbth</td>
		<td colspan='3' bgcolor="#FFFFFF"><textarea name='htlbth' cols='50' rows='8'><%= mhtlcp.htlbth %></textarea>
		</td>
	</tr>
	<tr>
		<td BGCOLOR="#CCFFFF">htlair</td>
		<td colspan='3' bgcolor="#FFFFFF"><textarea name='htlair' cols='50' rows='8'><%= mhtlcp.htlair %></textarea>
		</td>
	</tr>
	<tr>
		<td BGCOLOR="#CCFFFF">htlcfr</td>
		<td colspan='3' bgcolor="#FFFFFF"><textarea name='htlcfr' cols='50' rows='8'><%= mhtlcp.htlcfr %></textarea>
		</td>
	</tr>
	<tr>
		<td BGCOLOR="#CCFFFF">cfrmax</td>
		<td colspan='3' bgcolor="#FFFFFF"><textarea name='cfrmax' cols='50' rows='8'><%= mhtlcp.cfrmax %></textarea>
		</td>
	</tr>
	<tr>
		<td BGCOLOR="#CCFFFF">htlbqt</td>
		<td colspan='3' bgcolor="#FFFFFF"><textarea name='htlbqt' cols='50' rows='8'><%= mhtlcp.htlbqt %></textarea>
		</td>
	</tr>
	<tr>
		<td BGCOLOR="#CCFFFF">bqtmax</td>
		<td colspan='3' bgcolor="#FFFFFF"><textarea name='bqtmax' cols='50' rows='8'><%= mhtlcp.bqtmax %></textarea>
		</td>
	</tr>
	<tr>
		<td BGCOLOR="#CCFFFF">htlpkg</td>
		<td colspan='3' bgcolor="#FFFFFF"><textarea name='htlpkg' cols='50' rows='8'><%= mhtlcp.htlpkg %></textarea>
		</td>
	</tr>
	<tr>
		<td BGCOLOR="#CCFFFF">arectr</td>
		<td colspan='3' bgcolor="#FFFFFF"><textarea name='arectr' cols='50' rows='8'><%= mhtlcp.arectr %></textarea>
		</td>
	</tr>
	<tr>
		<td BGCOLOR="#CCFFFF">arecty</td>
		<td colspan='3' bgcolor="#FFFFFF"><textarea name='arecty' cols='50' rows='8'><%= mhtlcp.arecty %></textarea>
		</td>
	</tr>
	<tr>
		<td BGCOLOR="#CCFFFF">aredis</td>
		<td colspan='3' bgcolor="#FFFFFF"><textarea name='aredis' cols='50' rows='8'><%= mhtlcp.aredis %></textarea>
		</td>
	</tr>
	<tr>
		<td BGCOLOR="#CCFFFF">htlest</td>
		<td colspan='3' bgcolor="#FFFFFF"><textarea name='htlest' cols='50' rows='8'><%= mhtlcp.htlest %></textarea>
		</td>
	</tr>
	<tr>
		<td BGCOLOR="#CCFFFF">htlrnv</td>
		<td colspan='3' bgcolor="#FFFFFF"><textarea name='htlrnv' cols='50' rows='8'><%= mhtlcp.htlrnv %></textarea>
		</td>
	</tr>
	<tr>
		<td BGCOLOR="#CCFFFF">htlrms</td>
		<td colspan='3' bgcolor="#FFFFFF"><textarea name='htlrms' cols='50' rows='8'><%= mhtlcp.htlrms %></textarea>
		</td>
	</tr>
	<tr>
		<td BGCOLOR="#CCFFFF">sutrms</td>
		<td colspan='3' bgcolor="#FFFFFF"><textarea name='sutrms' cols='50' rows='8'><%= mhtlcp.sutrms %></textarea>
		</td>
	</tr>
	<tr>
		<td BGCOLOR="#CCFFFF">twnrms</td>
		<td colspan='3' bgcolor="#FFFFFF"><textarea name='twnrms' cols='50' rows='8'><%= mhtlcp.twnrms %></textarea>
		</td>
	</tr>
	<tr>
		<td BGCOLOR="#CCFFFF">dblrms</td>
		<td colspan='3' bgcolor="#FFFFFF"><textarea name='dblrms' cols='50' rows='8'><%= mhtlcp.dblrms %></textarea>
		</td>
	</tr>
	<tr>
		<td BGCOLOR="#CCFFFF">sglrms</td>
		<td colspan='3' bgcolor="#FFFFFF"><textarea name='sglrms' cols='50' rows='8'><%= mhtlcp.sglrms %></textarea>
		</td>
	</tr>
	<tr>
		<td BGCOLOR="#CCFFFF">card1</td>
		<td colspan='3' bgcolor="#FFFFFF"><textarea name='card1' cols='50' rows='8'><%= mhtlcp.card1 %></textarea>
		</td>
	</tr>
	<tr>
		<td BGCOLOR="#CCFFFF">card2</td>
		<td colspan='3' bgcolor="#FFFFFF"><textarea name='card2' cols='50' rows='8'><%= mhtlcp.card2 %></textarea>
		</td>
	</tr>
	<tr>
		<td BGCOLOR="#CCFFFF">card3</td>
		<td colspan='3' bgcolor="#FFFFFF"><textarea name='card3' cols='50' rows='8'><%= mhtlcp.card3 %></textarea>
		</td>
	</tr>
	<tr>
		<td BGCOLOR="#CCFFFF">card4</td>
		<td colspan='3' bgcolor="#FFFFFF"><textarea name='card4' cols='50' rows='8'><%= mhtlcp.card4 %></textarea>
		</td>
	</tr>
	<tr>
		<td BGCOLOR="#CCFFFF">card5</td>
		<td colspan='3' bgcolor="#FFFFFF"><textarea name='card5' cols='50' rows='8'><%= mhtlcp.card5 %></textarea>
		</td>
	</tr>
	<tr>
		<td BGCOLOR="#CCFFFF">card6</td>
		<td colspan='3' bgcolor="#FFFFFF"><textarea name='card6' cols='50' rows='8'><%= mhtlcp.card6 %></textarea>
		</td>
	</tr>
	<tr>
		<td BGCOLOR="#CCFFFF">cardnm</td>
		<td colspan='3' bgcolor="#FFFFFF"><textarea name='cardnm' cols='50' rows='8'><%= mhtlcp.cardnm %></textarea>
		</td>
	</tr>
	<tr>
		<td BGCOLOR="#CCFFFF">nerstn</td>
		<td colspan='3' bgcolor="#FFFFFF"><textarea name='nerstn' cols='50' rows='8'><%= mhtlcp.nerstn %></textarea>
		</td>
	</tr>
	<tr>
		<td BGCOLOR="#CCFFFF">acspnt</td>
		<td colspan='3' bgcolor="#FFFFFF"><textarea name='acspnt' cols='50' rows='8'><%= mhtlcp.acspnt %></textarea>
		</td>
	</tr>
	<tr>
		<td BGCOLOR="#CCFFFF">farcty</td>
		<td colspan='3' bgcolor="#FFFFFF"><textarea name='farcty' cols='50' rows='8'><%= mhtlcp.farcty %></textarea>
		</td>
	</tr>
</table>