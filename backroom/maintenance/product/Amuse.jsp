<%@ page contentType="text/html; charset=Shift_JIS" %>
<%@ page import="org.apache.struts.action.*,
								jp.co.yobrain.util.*,
								javax.naming.*,
								javax.sql.*,
								java.util.*,
								jp.co.lastminute.ContextProperty,
								java.io.*" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c" %><%@ taglib uri="/WEB-INF/x.tld" prefix="xml" %><%@ taglib uri="/WEB-INF/fmt.tld" prefix="fmt" %>
<%	ParseFormat pf = null;	%>
<%
	response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
	response.setHeader("Pragma","no-cache"); //HTTP 1.0
	response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

	String xmlstring = (String)request.getAttribute("xmlstring");
%>
<c:set var="xmlstr" ><%= xmlstring %></c:set><xml:parse var="pageamount" xml="${xmlstr}"></xml:parse>
<hr/>

		<table BORDER="0" CELLSPACING="0" CELLPADDING="0" width="500">
			<tr>
			<td valign='top' BGCOLOR="#F3F0EA">
<img src='/<%= ContextProperty._Amuse_image_Dir %><xml:out select='$pageamount//product_seq'/>-4.gif' width='200' height='200'>
			</td>
			<td valign='top' BGCOLOR="#999999" width="300">
<!-- チケット詳細 -->
				<table BORDER="0" CELLSPACING="1" CELLPADDING="3" >
					<tr>
            <td BGCOLOR="#FFFFFF" WIDTH="300" colspan="2"><xml:out select='$pageamount//product_sub_title'/><br/>
            <xml:out select='$pageamount//product_name'/><hr/>
            <br/><xml:out select='$pageamount//actors'/> / <xml:out select='$pageamount//produce'/>
            </td>
          </tr>
          <tr>
           <td BGCOLOR="#EEEEEE" CLASS="b" VALIGN="TOP">会場</td>
           <td BGCOLOR="#FFFFFF"><xml:out select='$pageamount//play_place'/>
                                <xml:out select='$pageamount//pointofaccess'/></td>
          </tr>
          <tr>
           	<td BGCOLOR="#EEEEEE" CLASS="b" VALIGN="TOP">席種・料金</td>
            <td BGCOLOR="#FFFFFF"><xml:out select='$pageamount//price_catch'/>
          </tr>
          <tr>
            <td BGCOLOR="#EEEEEE" CLASS="b" VALIGN="TOP" colspan="2">備考</td>
          </tr>
          </tr>
            <td BGCOLOR="#FFFFFF" valign="top" colspan="2">
            <pre><xml:out select='$pageamount//description'/></pre>
            </td>
          </tr>
        </table>
<!-- /チケット詳細 -->
			</td>
		</tr>
	</table>
