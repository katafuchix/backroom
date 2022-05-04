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

	Mhinfp mhinfp = (Mhinfp)request.getAttribute("mhinfp");
%>
<table border='0' witdh='500' cellpadding="1" cellspacing="1">
<input type='hidden' name='supnbr' value='<%= mhinfp.supnbr %>'/>
<input type='hidden' name='agt_cd' value='<%= mhinfp.agt_cd %>'/>
	<tr>
		<td bgcolor="#CCFFFF">rspnum</td>
		<td colspan='3' bgcolor="#FFFFFF"><textarea name='rspnum' cols='50' rows='8'><%= mhinfp.rspnum %></textarea>
		</td>
	</tr>
	<tr>
		<td bgcolor="#CCFFFF">rsfnum</td>
		<td colspan='3' bgcolor="#FFFFFF"><textarea name='rsfnum' cols='50' rows='8'><%= mhinfp.rsfnum %></textarea>
		</td>
	</tr>
	<tr>
		<td bgcolor="#CCFFFF">hemail</td>
		<td colspan='3' bgcolor="#FFFFFF"><textarea name='hemail' cols='50' rows='8'><%= mhinfp.hemail %></textarea>
		</td>
	</tr>
	<tr>
		<td bgcolor="#CCFFFF">webadd</td>
		<td colspan='3' bgcolor="#FFFFFF"><textarea name='webadd' cols='50' rows='8'><%= mhinfp.webadd %></textarea>
		</td>
	</tr>
	<tr>
		<td bgcolor="#CCFFFF">ofccat</td>
		<td colspan='3' bgcolor="#FFFFFF"><textarea name='ofccat' cols='50' rows='8'><%= mhinfp.ofccat %></textarea>
		</td>
	</tr>
	<tr>
		<td bgcolor="#CCFFFF">flrnum</td>
		<td colspan='3' bgcolor="#FFFFFF"><textarea name='flrnum' cols='50' rows='8'><%= mhinfp.flrnum %></textarea>
		</td>
	</tr>
	<tr>
		<td bgcolor="#CCFFFF">elevtr</td>
		<td colspan='3' bgcolor="#FFFFFF"><textarea name='elevtr' cols='50' rows='8'><%= mhinfp.elevtr %></textarea>
		</td>
	</tr>
	<tr>
		<td bgcolor="#CCFFFF">elecap</td>
		<td colspan='3' bgcolor="#FFFFFF"><textarea name='elecap' cols='50' rows='8'><%= mhinfp.elecap %></textarea>
		</td>
	</tr>
	<tr>
		<td bgcolor="#CCFFFF">lstrfb</td>
		<td colspan='3' bgcolor="#FFFFFF"><textarea name='lstrfb' cols='50' rows='8'><%= mhinfp.lstrfb %></textarea>
		</td>
	</tr>
	<tr>
		<td bgcolor="#CCFFFF">rnvstr</td>
		<td colspan='3' bgcolor="#FFFFFF"><textarea name='rnvstr' cols='50' rows='8'><%= mhinfp.rnvstr %></textarea>
		</td>
	</tr>
	<tr>
		<td bgcolor="#CCFFFF">rnvend</td>
		<td colspan='3' bgcolor="#FFFFFF"><textarea name='rnvend' cols='50' rows='8'><%= mhinfp.rnvend %></textarea>
		</td>
	</tr>
	<tr>
		<td bgcolor="#CCFFFF">rnvdtl</td>
		<td colspan='3' bgcolor="#FFFFFF"><textarea name='rnvdtl' cols='50' rows='8'><%= mhinfp.rnvdtl %></textarea>
		</td>
	</tr>
	<tr>
		<td bgcolor="#CCFFFF">traficxml</td>
		<td colspan='3' bgcolor="#FFFFFF"><textarea name='traficxml' cols='50' rows='8'><%= mhinfp.traficxml %></textarea>
		</td>
	</tr>
	<tr>
		<td bgcolor="#CCFFFF">grpchk</td>
		<td colspan='3' bgcolor="#FFFFFF"><textarea name='grpchk' cols='50' rows='8'><%= mhinfp.grpchk %></textarea>
		</td>
	</tr>
	<tr>
		<td bgcolor="#CCFFFF">laneng</td>
		<td colspan='3' bgcolor="#FFFFFF"><textarea name='laneng' cols='50' rows='8'><%= mhinfp.laneng %></textarea>
		</td>
	</tr>
	<tr>
		<td bgcolor="#CCFFFF">lanjap</td>
		<td colspan='3' bgcolor="#FFFFFF"><textarea name='lanjap' cols='50' rows='8'><%= mhinfp.lanjap %></textarea>
		</td>
	</tr>
	<tr>
		<td bgcolor="#CCFFFF">langxml</td>
		<td colspan='3' bgcolor="#FFFFFF"><textarea name='langxml' cols='50' rows='8'><%= mhinfp.langxml %></textarea>
		</td>
	</tr>
	<tr>
		<td bgcolor="#CCFFFF">phnr2r</td>
		<td colspan='3' bgcolor="#FFFFFF"><textarea name='phnr2r' cols='50' rows='8'><%= mhinfp.phnr2r %></textarea>
		</td>
	</tr>
	<tr>
		<td bgcolor="#CCFFFF">phonexml</td>
		<td colspan='3' bgcolor="#FFFFFF"><textarea name='phonexml' cols='50' rows='8'><%= mhinfp.phonexml %></textarea>
		</td>
	</tr>
	<tr>
		<td bgcolor="#CCFFFF">totrst</td>
		<td colspan='3' bgcolor="#FFFFFF"><textarea name='totrst' cols='50' rows='8'><%= mhinfp.totrst %></textarea>
		</td>
	</tr>
	<tr>
		<td bgcolor="#CCFFFF">totbar</td>
		<td colspan='3' bgcolor="#FFFFFF"><textarea name='totbar' cols='50' rows='8'><%= mhinfp.totbar %></textarea>
		</td>
	</tr>
	<tr>
		<td bgcolor="#CCFFFF">totcon</td>
		<td colspan='3' bgcolor="#FFFFFF"><textarea name='totcon' cols='50' rows='8'><%= mhinfp.totcon %></textarea>
		</td>
	</tr>
	<tr>
		<td bgcolor="#CCFFFF">imgfrn</td>
		<td colspan='3' bgcolor="#FFFFFF"><textarea name='imgfrn' cols='50' rows='8'><%= mhinfp.imgfrn %></textarea>
		</td>
	</tr>
	<tr>
		<td bgcolor="#CCFFFF">imglob</td>
		<td colspan='3' bgcolor="#FFFFFF"><textarea name='imglob' cols='50' rows='8'><%= mhinfp.imglob %></textarea>
		</td>
	</tr>
	<tr>
		<td bgcolor="#CCFFFF">imgrom</td>
		<td colspan='3' bgcolor="#FFFFFF"><textarea name='imgrom' cols='50' rows='8'><%= mhinfp.imgrom %></textarea>
		</td>
	</tr>
	<tr>
		<td bgcolor="#CCFFFF">XXX</td>
		<td colspan='3' bgcolor="#FFFFFF"><textarea name='checkinxml' cols='50' rows='8'><%= mhinfp.checkinxml %></textarea>
		</td>
	</tr>
	<tr>
		<td bgcolor="#CCFFFF">XXX</td>
		<td colspan='3' bgcolor="#FFFFFF"><textarea name='servicexml' cols='50' rows='8'><%= mhinfp.servicexml %></textarea>
		</td>
	</tr>
</table>