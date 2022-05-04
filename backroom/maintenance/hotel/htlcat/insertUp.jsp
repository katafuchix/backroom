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
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/app.tld" prefix="app" %>
<app:CheckMaintenaceLogon/>
<%
	response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
	response.setHeader("Pragma","no-cache"); //HTTP 1.0
	response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

	ServletContext servletContext = getServletContext();
	DataSource Datasouce  = (DataSource)servletContext.getAttribute( ContextProperty.Lmjdatas_ );

	String[] lists = jp.co.lastminute.maintenance.Property.lists;
	String[] values = jp.co.lastminute.maintenance.Property.values;

	HtlcatSupNbrhandler handler = new HtlcatSupNbrhandler();
	handler.setDataSource( Datasouce );

	HtlcatSupNbr temp = new HtlcatSupNbr();
	temp = temp.getNewReq( request );
	boolean resultFlag = handler.addHtlcatSubNbr( temp );

	HtlcatSupNbr htlcatsupnbr = new HtlcatSupNbr();
	htlcatsupnbr = htlcatsupnbr.getRequest( request );

	request.setAttribute("htlcatsupnbr", htlcatsupnbr);

%>
<html>
<head>
<%	if( resultFlag ){	%>
<%=	jp.co.lastminute.maintenance.util.WebUtil.getAlert("�ǉ����܂���") %><%	}else{	%>
<%=	jp.co.lastminute.maintenance.util.WebUtil.getAlert("�ǉ��Ɏ��s���܂���") %><%	}	%>
</head>
<body>
<jsp:include page="addForm.jsp" />
<%
	HtlcatSupNbr[] htlcatsupnbrs = handler.getList( htlcatsupnbr );
	if( htlcatsupnbrs != null ){
		request.setAttribute("htlcatsupnbrs", htlcatsupnbrs);
%>
<jsp:include page="HtlcatSupNbrList.jsp"/>
<%	}else{	%>
<h4>�J�e�S���[�͐ݒ肳��Ă��܂���B</h4>
<%	}	%>
</body>
</html>