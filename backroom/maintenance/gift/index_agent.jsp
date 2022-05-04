<%@ page contentType="text/html; charset=Shift_JIS" %>
<%@ page import="org.apache.struts.action.*,
								jp.co.yobrain.util.*,
								javax.naming.*,
								javax.sql.*,
								java.util.*,
								java.io.*,
								java.sql.*,
								jp.co.yobrain.util.DataFormat,
								jp.co.lastminute.maintenance.*,
								jp.co.lastminute.maintenance.util.WebUtil,
								jp.co.lastminute.maintenance.gift.*,
								jp.co.lastminute.maintenance.common.CommonDBOCache,
								jp.co.lastminute.maintenance.common.AgentWrapper" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%
	DataFormat df = null;
	int type_cd = jp.co.lastminute.maintenance.gift.Property.product_type_cd;
	ServletContext servletContext = getServletContext();
	DataSource Datasouce  = (DataSource)servletContext.getAttribute( Action.DATA_SOURCE_KEY );
	CommonDBOCache cache = null;
	AgentWrapper agtWrapper = null;
	
	if(session.getAttribute("agtWrapper") == null){
		agtWrapper = new AgentWrapper( null, Datasouce );
		agtWrapper.getAgentMaps( "" + type_cd + "" );
		session.setAttribute("agtWrapper", agtWrapper.getCache() );
	}else{
		cache  = (CommonDBOCache)session.getAttribute("agtWrapper");
		agtWrapper = new AgentWrapper( cache, Datasouce );
	}

	List agents = agtWrapper.getCombos( "" + type_cd + "" );

	String agt_cd = request.getParameter("agt_cd");
	if(agt_cd == null){
		agt_cd="";
	}

	int Limittype = 9;
	if (request.getParameter("limittype")!=null) {
		Limittype = Integer.parseInt(request.getParameter("limittype"));
	}
%>

<html>
<head>
<link rel="stylesheet" href="/backroom/maintenance/maintenance.css" type="text/css">
<META http-equiv="Content-Type" content="text/html; charset=Shift_JIS">
<SCRIPT language="JavaScript" src="/backroom/maintenance/ScatidMaintenance.js"></SCRIPT>
<SCRIPT language="JavaScript" src="/backroom/maintenance/JavaScriptCommonLib.js"></SCRIPT>
<SCRIPT language="JavaScript" src="/backroom/maintenance/ImageMaintenance.js"></SCRIPT>
<title>�M�t�g���i�Ǘ�</title>
</head>
<body bgcolor = "white">
<!-- ========================== ���i�ǉ� ============================== -->

<form name='MainForm' method='post' action="/backroom/maintenance/gift/index_agent.jsp">
  <table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
    <tr>
    <td bgcolor="#999999">
        <table width="100%" border="0" cellspacing="1" cellpadding="2">
          <tr bgcolor="#999999">
            <td colspan="2" align='center' class="b">�M�t�g���i����</td>
          </tr>
          <tr bgcolor="#CCCCCC">
            <td align="center" class="b" colspan="2">�T�v���C���[</td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td align="center" >
              <select name = "agt_cd">
								<%= WebUtil.getComboByList( agents, agt_cd ) %>
              </select>
              <select name = "limittype">
								<% if(Limittype==0) { %>
									<option value="0" selected>�\��</option>
									<option value="1">��\��</option>
									<option value="2">���ׂ�</option>
								<% } %>
								<% if(Limittype==1) { %>
									<option value="0">�\��</option>
									<option value="1" selected>��\��</option>
									<option value="2">���ׂ�</option>
								<% } %>
								<% if(Limittype==2) { %>
									<option value="0">�\��</option>
									<option value="1">��\��</option>
									<option value="2" selected>���ׂ�</option>
								<% } %>
								<% if(Limittype==9) { %>
									<option value="0" selected>�\��</option>
									<option value="1">��\��</option>
									<option value="2">���ׂ�</option>
								<% } %>
              </select>
            </td>
            <td align="center">
              <input type="submit" value = "���i����" name="btnAdd"/>
            </td>
          </tr>
        </table>

      </td>
    </tr>
  </table>
  </form>

<!-- ========================== //���i�ǉ� ============================== -->
<script language="JavaScript">
<!--
function goInsert(){
		var pn =document.MainForm.product_name.value;
		if( pn.length > 30){
			alert("���i���͑S�p30�����ȓ��ɂ��Ă��������B");
			return false;
		}
		if (!js_CheckNecessary("MainForm","product_name",true,"���i���͕K�{���ڂł��B")){
					return false;
		}else{	return true;		}
	}
//-->
</script>
<!-- ========================== ���i���X�g============================== -->
<br>

<jsp:include page="productListBySupplier.jsp" flush="true" />
<!-- ========================== �M�t�g���i���X�g============================== -->
</body>
</html>