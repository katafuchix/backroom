<%@ page contentType="text/html; charset=shift_jis"%>
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
								jp.co.lastminute.maintenance.amuse.*,
								jp.co.lastminute.maintenance.amuse.model.*" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%
	response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
	response.setHeader("Pragma","no-cache"); //HTTP 1.0
	response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
	String image_path = jp.co.lastminute.ContextProperty._Amuse_image_Dir;
%>
  <table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
    <tr>
    <td bgcolor="#999999">

        <table width="100%" border="0" cellspacing="1" cellpadding="2">
          <tr bgcolor="#999999">
            <td colspan="9" align='center' class="b">���i���</td>
          </tr>
          <tr bgcolor="#CCCCCC">
            <td  class="b" align="center" width="50">�C��</td>
            <td  class="b" align="center" >���i��</td>
            <td align="center"  class="b" width="76">���i�R�[�h</td>
            <td align="center"  class="b" width="76">�C���[�W</td>
          </tr>
<%	//�Z�b�V�����ɂČ����������擾
		int type_cd = jp.co.lastminute.maintenance.amuse.Property.product_type_cd;
		HandlerCondition condition = new HandlerCondition();
		condition = condition.getRequest( request,  "" + type_cd + "" );
		///////////////////////
		condition.setLimittype(2);
		/////////////////////
		session.setAttribute( "HandlerCondition",  condition );

		/////���X�g�̌���/////////

		ServletContext servletContext = getServletContext();
		DataSource Datasouce  = (DataSource)servletContext.getAttribute( Action.DATA_SOURCE_KEY );
		AmuseInfohandler handler = new AmuseInfohandler();
		handler.setDataSource( Datasouce );

		AmuseInfo[] infos = handler.getList( condition );
		if( infos == null ){
			//���т����Ȃ�̂ŁA�ǉ�����Ƃ���
			return;
		}
		String rowCnt = String.valueOf( infos.length );
		String classname = "Amuse";
		pageContext.setAttribute("rowCnt",rowCnt);
		Map row = null;
		String havealtStyleClass = "";
		for(int x = 0; x < infos.length; x++){
			AmuseInfo amuse = infos[x];
%>
				<form action="/backroom/maintenance/amuse/info/edit.jsp" method="post">
          <tr bgcolor="#FFFFFF">
            <td align="center" width="80">
              <input type="hidden" name="product_seq" value='<%= amuse.product_seq %>'>
              <font size='-1'><input type='submit' value='�X�V'></font>
            </td>
            <td align="left"><%= amuse.product_name %><br/>
            |<A HREF="/backroom/maintenance/amuse/sku/list.jsp?product_seq=<%= amuse.product_seq %>&agt_cd=<%= amuse.agt_cd %>">SKU</A>|
						|<A HREF="javascript:PopUpWrite( '<%= amuse.product_seq %>', '<%= classname %>' );">Preview & Contents Update</A>|
            </td>
            <!--
            <td align="left" width="100" >|<A HREF="/backroom/maintenance/amuse/info/delete.jsp?id=<%= amuse.product_seq %>">�f�[�^���S�폜</A>|</td>
            -->
            <td  align="right" width="80"><%= amuse.product_seq %></td>
            <td align="right" width="80"><font size='1'>
            |<a href="javascript:PopImageMaintenace('<%= amuse.product_seq %>-1.gif', '<%= image_path %>');">38x38</a>
            |<a href="javascript:PopImageMaintenace('<%= amuse.product_seq %>-2.gif', '<%= image_path %>');">70x38</a>|<br/>
            |<a href="javascript:PopImageMaintenace('<%= amuse.product_seq %>-3.gif', '<%= image_path %>');">130x75</a>
            |<a href="javascript:PopImageMaintenace('<%= amuse.product_seq %>-4.gif', '<%= image_path %>');">250x150</a>|
            </font></td>
          </tr>
         </form>
<%
	}//end of for
%>
			<tr>
			<logic:equal name="rowCnt" value="0">
			<td colspan=8 align='center' bgcolor="#FFFFFF">
              �������ʂ�����܂���B
            </td>
			</logic:equal>
          </tr>
        </table>
    </td>
  </tr>
</table>
<!-- ========================== //�M�t�g���i���X�g============================== -->

<script language="JavaScript">
<!--
	function doChangeHaveAlt( seq, postion ){
		var statas ;
		statas = document.forms[ postion ].elements['stop_flg'].value;
		document.forms[ postion ].action = "/backroom/maintenance/amuse/info/havealtChanger.jsp";
		document.forms[ postion ].submit();
	}//
	//==========//
	function changeStatus(jan_cd, order){

	}
//-->
</script>