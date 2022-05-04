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

	//�R���f�B�V�������擾����B
	Catid_small scatid = new Catid_small();
	scatid = scatid.getRequest( request );

	//�f�[�^�x�[�X�̍쐬
	boolean error = false;
	if( scatid.isError() ){
		dbAdapterHCatid_small db = new dbAdapterHCatid_small( Datasouce );
		error = db.addSatid_small( scatid );
		db = null;
	}

	if( error ){
		out.println(jp.co.lastminute.maintenance.util.WebUtil.getAlert("�ǉ����܂���"));
	}else{
		out.println(jp.co.lastminute.maintenance.util.WebUtil.getAlert("�ǉ��Ɏ��s���܂���"));
	}
	//catid ���擾����B
	String catid = "" + scatid.getCatid() + "";
%>
<jsp:include page="index.jsp">
	<jsp:param name='catid' value='<%= catid %>' />
</jsp:include>