<%@ taglib uri="/WEB-INF/app.tld" prefix="app" %>
<app:CheckMaintenaceLogon/>
<html>
<body>
<table border=0 width='210'>
	<tr>
		<td bgColor="#AAAAAA"><b><font color="#FFFFFF">Image Up</font></b></td>
	</tr>
<%
	String fileName = "";
	String pathName = "";
	if(( request.getParameter( "fileName" )!= null )&&( request.getParameter( "pathName" )!= null )){
		fileName = (String)request.getParameter( "fileName" );
		pathName = (String)request.getParameter( "pathName" );
		session.setAttribute( "fileName", fileName );
		session.setAttribute( "pathName", pathName );
	}
%>
	<tr>
		<td><img src='http://www.lastminute.co.jp/<%= pathName %>/<%= fileName %>'> </td>
	</tr>
</table>
<%
	if(( session.getAttribute( "fileName" ) != null )&&( session.getAttribute( "pathName" ) != null )){	%>
<form action="/backroom/maintenance/util/FileUploadServlet" method="post" enctype='multipart/form-data'>


	File:<input type=file name='files'><br/>
<%	}else{	%>
<form action="./file_up.jsp" method="post">
FileName:<input type=text name="fileName"><br/>
PathName:<input type=text name="pathName"><br/>
<%	}	%>
<hr width='210'/>
<input type="submit" value="Go">
</form>
</body>
</html>