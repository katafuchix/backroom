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
								jp.co.lastminute.Hotel.lmjcampaign.*,
								jp.co.lastminute.ContextProperty,
								jp.co.lastminute.maintenance.*,
								jp.co.lastminute.maintenance.campaign.*,
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
	Lmj_campaign tempscatid = new Lmj_campaign();
	tempscatid = tempscatid.getRequest( request );

	//�f�[�^�x�[�X�̍쐬
	Lmj_campaignhandler handler = new Lmj_campaignhandler();
	handler.setDataSource( Datasouce );
	boolean error = handler.updateLmj_campaign( tempscatid );
	if( error ){
		out.println(jp.co.lastminute.maintenance.util.WebUtil.getAlert("�ǉ����܂���"));
	}else{
		out.println(jp.co.lastminute.maintenance.util.WebUtil.getAlert("�ǉ��Ɏ��s���܂���"));
	}
%>
<jsp:include page="index.jsp"/>