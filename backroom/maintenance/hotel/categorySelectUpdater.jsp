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
								jp.co.lastminute.maintenance.jdbc.*,
								jp.co.lastminute.maintenance.model.*,
								jp.co.lastminute.maintenance.pages.*,
								jp.co.lastminute.maintenance.util.WebUtil,
								jp.co.lastminute.maintenance.gift.*,
								jp.co.lastminute.maintenance.common.CommonDBOCache,
								jp.co.lastminute.maintenance.common.AgentWrapper" %>
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
	DataSource Datasouce = (DataSource)servletContext.getAttribute( ContextProperty.Lmjdatas_ );

	Categoryselect categoryselect = new Categoryselect();
	categoryselect.getRequest( request );

	boolean resultFlag = false;
	if( categoryselect.isError() ){
		dbAdapterCategorySelect db = new dbAdapterCategorySelect( Datasouce );
		if( db.modifyCategoryselect( categoryselect ) ){
			resultFlag = true;
		}
	}

	if( resultFlag ){
%><%=	jp.co.lastminute.maintenance.util.WebUtil.getAlert("変更しました") %><%
	}else{
%><%=	jp.co.lastminute.maintenance.util.WebUtil.getAlert("変更に失敗しました") %><%
	}
%>

