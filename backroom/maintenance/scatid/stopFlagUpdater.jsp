<%@ page contentType="text/html;charset=Shift_JIS" %>
<%@ page import="org.apache.struts.action.*,
								jp.co.yobrain.util.*,
								javax.naming.*,
								javax.sql.*,
								java.util.*,
								java.io.*,
								java.sql.*,
								jp.co.yobrain.util.DataFormat,
								jp.co.yobrain.util.ParseFormat,
								jp.co.lastminute.maintenance.*,
								jp.co.lastminute.maintenance.jdbc.*,
								jp.co.lastminute.maintenance.model.*,
								jp.co.lastminute.maintenance.util.WebUtil" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/app.tld" prefix="app" %>
<app:CheckMaintenaceLogon/>
<%
	ServletContext servletContext = getServletContext();
	DataSource Datasouce  = (DataSource)servletContext.getAttribute( Action.DATA_SOURCE_KEY );

	response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
	response.setHeader("Pragma","no-cache"); //HTTP 1.0
	response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

		//コンディションを取得する。
	Catid_small scatid = new Catid_small();
	scatid = scatid.getRequestStopFlg( request );

	boolean error = false;
	if( scatid.isError() ){
		dbAdapterCatid_small db = new dbAdapterCatid_small( Datasouce );
		error = db.removeSatid_small( scatid );
		db = null;
	}
	//catid を取得する。
	String catid = "" + scatid.getCatid() + "";
	if( !error ){
%><%=	jp.co.lastminute.maintenance.util.WebUtil.getAlert("変更 失敗しました。") %><%
	}
%>
<jsp:include page="index.jsp">
	<jsp:param name='catid' value='<%= catid %>' />
</jsp:include>
