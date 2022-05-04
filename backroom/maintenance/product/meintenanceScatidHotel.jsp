<%@ page contentType="text/html; charset=Shift_JIS" %>
<%@ page import="org.apache.struts.action.*,
								jp.co.yobrain.util.*,
								javax.naming.*,
								javax.sql.*,
								java.util.*,
								java.io.*,
								java.sql.*,
								jp.co.yobrain.util.DataFormat,
								jp.co.lastminute.ContextProperty,
								jp.co.lastminute.maintenance.*,
								jp.co.lastminute.maintenance.hotel.*,
								jp.co.lastminute.maintenance.hotel.scatid.*" %>
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

	Scatid condition = new Scatid();
	condition = condition.getRequest( request );

	ServletContext servletContext = getServletContext();
	//DataSource datasouce = (DataSource)servletContext.getAttribute( Action.DATA_SOURCE_KEY );
	DataSource datasouce  = (DataSource)servletContext.getAttribute( ContextProperty.Lmjdatas_ );


	Scatidhandler scatidhandler = new Scatidhandler();
	scatidhandler.setDataSource( datasouce );
	String comment = "";
%>

<%
	if( condition.dbflag.equals( "1" )){
		if( !scatidhandler.insertScatid( condition ) ){
			comment = "追加に失敗しました";
		}
	}
	if( condition.dbflag.equals( "2" )){
		if( !scatidhandler.deleteScatid( condition ) ){
			comment = "削除に失敗しました";
		}
	}
	Scatid[] scatids = scatidhandler.getList( condition );
	if( scatids == null ){
		comment += "システムエラーです。";
	}
%>
<html
<head>
<title>メンテナンス</title>
</head>
<body BGCOLOR="#FFFFFF" TEXT="#000000" LEFTMARGIN="0" TOPMARGIN="0" MARGINWIDTH="0" MARGINHEIGHT="0">
<% if( comment.length() > 0 ){	%>
<table border='1' width='400' cellspaing='1'>
	<tr>
		<td><%= comment %></td>
	</tr>
</table>
<% 	}	%>
<% if( scatids != null ){	%>
<table border='1' width='480' cellspaing='1'>
	<tr>
		<td bgcolor="#aaaaaa">Action</td>
		<td bgcolor="#aaaaaa">ScatID</td>
		<td bgcolor="#aaaaaa">CacthCopy</td>
		<td bgcolor="#aaaaaa">Title</td>
	</tr>

	<%	for(int i=0; i<scatids.length; i++){
		Scatid cat = scatids[ i ];
	%>

	<form action="./meintenanceScatidHotel.jsp" method="post">
	<input type="hidden" name="seqno" value="<%= cat.seqno	%>"/>
	<input type="hidden" name="agt_cd" value="<%= condition.agt_cd	%>"/>
	<input type="hidden" name="supnbr" value="<%= condition.supnbr	%>"/>
	<input type="hidden" name="scatid" value="<%= cat.scatid	%>"/>

<% if( cat.seqno.equals("-1")){	%>
	<tr bgcolor="#ffffff">
		<td>
		<input type="hidden" name="dbflag" value="1"/>
		<input type="hidden" name="product_seq_no" value="<%= cat.product_seq_no	%>"/>
		<input type="hidden" name="priority" value="999"/>
		<input type="submit" value="追加"/>
		</td>
		<td><font size="2"><%= cat.scatid	%></font></td>
		<td><font size="2"><%= cat.catch_copy	%></font></td>
		<td>&nbsp</td>
	</tr>
<%	}else{	%>
	<tr bgcolor="#aaaaaa">
		<td>
		<input type="hidden" name="dbflag" value="2"/>
		<input type="hidden" name="seqno" value="<%= cat.seqno	%>"/>
		<input type="submit" value="削除"/>
		</td>
		<td><font size="2"><%= cat.scatid	%></font></td>
		<td><font size="2"><%= cat.catch_copy	%></font></td>
		<td><font size="2"><%= cat.title	%></font></td>
	</tr>
<%	}	%>
	</form>
	<%	}	%>
	</tr>
</table>
<% 	}	%>
</body>
</html>
