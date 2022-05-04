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
								jp.co.lastminute.ContextProperty,
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
	DataSource Datasouce  = (DataSource)servletContext.getAttribute( ContextProperty.Lmjdatas_ );

	//コンディションを取得する。
	Catid_small tempscatid = null;
	Catid_small[] scatidlist = tempscatid.getRequestGetList( request );

	//データベースの作成

	boolean[] db_error = new boolean[ scatidlist.length ];
	for( int i=0; i<scatidlist.length; i++){
		Catid_small scatid = scatidlist[i];
		if( scatid.isError() ){
			dbAdapterHCatid_small db = new dbAdapterHCatid_small( Datasouce );
			db_error[i] = db.modifySatid_small( scatid );
			db = null;
		}else{
			db_error[i] = false;
		}
	}
	//catid を取得する。
	String catid = "";
	if( request.getParameter("catid") != null ){
		catid = request.getParameter("catid");
	}
%>
<jsp:include page="index.jsp">
	<jsp:param name='catid' value='<%= catid %>' />
</jsp:include>