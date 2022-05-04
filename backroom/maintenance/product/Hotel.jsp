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
<%@ taglib uri="/WEB-INF/c.tld" prefix="c" %>
<%@ taglib uri="/WEB-INF/x.tld" prefix="xml" %>
<%@ taglib uri="/WEB-INF/fmt.tld" prefix="fmt" %>

<%	ParseFormat pf = null;	%>
<%

	response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
	response.setHeader("Pragma","no-cache"); //HTTP 1.0
	response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

	String xmlstring = (String)request.getAttribute("xmlstring");

	System.err.println(xmlstring);

%>
<c:set var="xmlstr" ><%= xmlstring %></c:set>
<xml:parse var="pageamount" xml="${xmlstr}"></xml:parse>

<hr/>

		<table BORDER="0" CELLSPACING="0" CELLPADDING="0" width="500">
			<tr>
			<td valign='top' BGCOLOR="#F3F0EA">
<img src='<%= ContextProperty._gift_image_Dir %><xml:out select='$pageamount//jan_cd'/>_1.gif' width='200' height='200'>
			<br/>
			価格：<xml:out select='$pageamount//price'/><br/>
			税金：<xml:out select='$pageamount//tax'/><br/>
			配送料：<xml:out select='$pageamount//sending'/><br/>
			配送料税：<xml:out select='$pageamount//sending_tax'/><br/>
			</td>
			<td valign='top' BGCOLOR="#999999" width="300">
<!-- チケット詳細 -->
				<table BORDER="0" CELLSPACING="1" CELLPADDING="3" >
					<tr>
            <td BGCOLOR="#FFFFFF" WIDTH="300" colspan="2"><xml:out select='$pageamount//product_sub_title'/><br/>
            <xml:out select='$pageamount//product_name'/><hr/>
            <br/><pre><xml:out select='$pageamount//catchcopy'/></pre> <br/>
            <pre><xml:out select='$pageamount//price_catch'/></pre>
            </td>
          </tr>
          <tr>
           <td BGCOLOR="#EEEEEE" CLASS="b" VALIGN="TOP" WIDTH="100">使用方法</td>
           <td BGCOLOR="#FFFFFF" WIDTH="200"><pre><xml:out select='$pageamount//opening'/></pre></td>
          </tr>
          <tr>
           <td BGCOLOR="#EEEEEE" CLASS="b" VALIGN="TOP" WIDTH="100">製品仕様</td>
           <td BGCOLOR="#FFFFFF" WIDTH="200"><pre><xml:out select='$pageamount//specword'/></pre></td>

          <tr>
           	<td BGCOLOR="#EEEEEE" CLASS="b" VALIGN="TOP">宣伝文句</td>
            <td BGCOLOR="#FFFFFF"><xml:out select='$pageamount//c_coment'/></pre></td>
          </tr>
          <tr>
           	<td BGCOLOR="#EEEEEE" CLASS="b" VALIGN="TOP"></td>
            <td BGCOLOR="#FFFFFF"><xml:out select='$pageamount//body'/></pre></td>
          </tr>
          <tr>
           <td BGCOLOR="#EEEEEE" CLASS="b" VALIGN="TOP">注意事項</td>
           <td BGCOLOR="#FFFFFF"><pre><xml:out select='$pageamount//moreinfo'/></pre></td>
          </tr>
        </table>
<!-- /チケット詳細 -->
			</td>
		</tr>
	</table>
