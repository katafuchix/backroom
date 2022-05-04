<%	if(session.getAttribute("SESSION.USER_INFO") == null){	%>
		<script language="JavaScript">
		<!--
			document.location ="<%= request.getContextPath() %>/maintenance/logon.jsp";
		//-->
		</script>
<%	return;	}	%>