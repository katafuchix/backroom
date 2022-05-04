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
								jp.co.lastminute.maintenance.scatid.*,
								jp.co.lastminute.maintenance.util.WebUtil" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/app.tld" prefix="app" %>
<app:CheckMaintenaceLogon/>
<%
	ScatidList scatidlist = (ScatidList)request.getAttribute("scatidlist");
	String[] lists = (String[])request.getAttribute("lists");
	String[] values = (String[])request.getAttribute("values");
%>
<form name='MainForm' method='post' action="./maintenance_preview.jsp" onSubmit="submitForm();">
  <table width="500" border="0" cellpadding="0" cellspacing="0" align="center">
    <tr>
    <td bgcolor="#999999">
        <table width="100%" border="0" cellspacing="1" cellpadding="2">
          <tr bgcolor="#999999">
            <td align='left' class="b" colspan="1">小カテゴリー</td>
          </tr>
          <tr bgcolor="#CCCCCC">
            <td class="b" align="left" colspan="2">小カテゴリー
              <select name = "s_catid" onChange="changetype_name();">
<%= WebUtil.getComboByList( lists, values, "" ) %>
              </select>
            </td>
            <td>
            優先度：<input type='text' name='priority' size='3' maxlength='3' value='<%= scatidlist.priority %>' style="ime-mode:disabled;"/>
            </td>
          </tr>
          <tr bgcolor="#CCCCCC">
            <td class="b" align='text' colspan="2">商品タイトル
              <input type='text' name='title_name' size='40' maxlength='30' value='<%= scatidlist.title %>' disabled="disabled" />
            </td>
            <td><input type="submit" value="追加"></td>
          </tr>
          <input type='hidden' name='jan_cd' value='<%= scatidlist.jan_cd %>'/>
          <input type='hidden' name='catid' value='<%= scatidlist.catid %>'/>
          <input type='hidden' name='type_name' value=''/>
          <input type='hidden' name='title' value=''/>
        </table>
      </td>
    </tr>
  </table>
  </form>
<SCRIPT language="JavaScript">
<!--
	function changetype_name(){
		document.forms['MainForm'].elements['type_name'].value =
		document.forms['MainForm'].elements["s_catid"].options[ document.forms['MainForm'].elements["s_catid"].selectedIndex ].text;
	}
	function submitForm(){
		setTitle();
		document.forms['MainForm'].elements['type_name'].value =
		document.forms['MainForm'].elements["s_catid"].options[ document.forms['MainForm'].elements["s_catid"].selectedIndex ].text;
	}
	function setTitle(){
		var product_name = window.opener.document.forms[0].elements['product_name'].value;
		document.forms['MainForm'].elements['title'].value = product_name;
		document.forms['MainForm'].elements['title_name'].value = product_name;
	}
	setTitle();
//-->
</SCRIPT>
