<%@ page contentType="text/html;charset=Shift_JIS" %>
<%@ page language="java" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<html:html locale="true">
<head>
<title>Lastminute メンテナンスログインページ</title>
<meta HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=Shift_JIS">
<link REL="stylesheet" HREF="/basic.css" TYPE="TEXT/CSS">
</head>
<body BGCOLOR="#FFFFFF" TEXT="#000000" LEFTMARGIN="0" TOPMARGIN="0" MARGINWIDTH="0" MARGINHEIGHT="0">
<!-- レイアウト -->
<!-- ログイン -->
	<table BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="755" ALIGN="CENTER">
	<tr>
	<td WIDTH="67"><img SRC="/img/header_icon_lg.gif" WIDTH="67" HEIGHT="65" ALT=""></td>
	<td WIDTH="688"><img SRC="/img/header_txt_lg_01.gif" WIDTH="65" HEIGHT="19" ALT="ログイン" LOWSRC="/img/header_txt_lg_01.gif"><br>
	<img SRC="/img/blk.gif" WIDTH="688" HEIGHT="1" ALT=""><br>
	<img SRC="/img/header_txt_lg_05.gif" WIDTH="40" HEIGHT="13" ALT="" LOWSRC="/img/header_txt_lg_05.gif"></td>
	</tr>
	<tr><td COLSPAN="2">
	</td></tr>
	</table>
<!-- /ログイン -->
	<img SRC="/img/shim.gif" WIDTH="10" HEIGHT="5" ALT=""><br>
	<table WIDTH="620" BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#666666" ALIGN="CENTER">
	<tr>
	<td>
		<table WIDTH="100%" BORDER="0" CELLSPACING="1" CELLPADDING="0">
		<tr>
		<td BGCOLOR="#F3F0EA" ALIGN="CENTER">
		<br>
			<table BORDER="0" CELLSPACING="1" CELLPADDING="0" WIDTH="550">
			<tr>
			<td WIDTH="9"><img SRC="/img/point_brn.gif" WIDTH="7" HEIGHT="7" ALT=""></td>
			<td CLASS="txt14redb" WIDTH="538">ログイン</td>
			</tr>
			<tr BGCOLOR="#AE0000">
			<td HEIGHT="2" COLSPAN="2"><img SRC="/img/shim.gif" WIDTH="1" HEIGHT="1" ALT=""></td>
			</tr>
			</table>
			<br>
			<table WIDTH="550" BORDER="0" CELLSPACING="0" CELLPADDING="2">
			<tr>
			</tr>
			</table>
			<br>

<!-- ID・PW -->
			<html:form action="/maintenance/logon" focus="user_id">
			<table BORDER="0" CELLSPACING="0" CELLPADDING="2" ALIGN="CENTER">
			<tr>
			<td CLASS="txt12b" ALIGN="RIGHT">ID：</td>
			<td>
			<html:text property="user_id" size="16" maxlength="16" value="yakiniku" /><html:errors property="member_cd" />
			</td>
			</tr>
			<tr>
			<td CLASS="txt12b" ALIGN="RIGHT">パスワード：</td>
			<td>
			<html:password property="password" size="16" maxlength="16" value=""
                    redisplay="false"/>
			</td>
			</tr>
			<tr>
			<td COLSPAN="2" ALIGN="center"><br>

			<input TYPE="image" SRC="/img/btt_login.gif" WIDTH="80" HEIGHT="23" ALT="ログイン">
			</td>
			</tr>
			</table>
			</html:form>
            <!-- /ID・PW -->
            <br>
		</td>
		</tr>
		</table>
	</td>
	</tr>
	</table>
<!-- /レイアウト -->
</body>
</html:html>
