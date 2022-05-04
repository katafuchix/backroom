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
%>
<form name='MainForm' method='post' action="./maintenance_update.jsp">
  <table width="500" border="0" cellpadding="0" cellspacing="0" align="center">
    <tr>
    <td bgcolor="#999999">
        <table width="100%" border="0" cellspacing="1" cellpadding="2">
          <tr bgcolor="#999999">
            <td align='left' class="b" colspan="1">小カテゴリー</td>
          </tr>
          <tr bgcolor="#CCCCCC">
            <td class="b" align="left" colspan="2">小カテゴリー
              <%= scatidlist.type_name %>
            </td>
            <td>
            優先度：<%= scatidlist.priority %>
            </td>
          </tr>
          <tr bgcolor="#CCCCCC">
            <td class="b" align='text' colspan="2">商品タイトル
              <%= scatidlist.title %>
            </td>
            <td><input type="submit" value="追加"></td>
          </tr>
          <input type='hidden' name='jan_cd' value='<%= scatidlist.jan_cd %>'/>
          <input type='hidden' name='s_catid' value='<%= scatidlist.s_catid %>'/>
          <input type='hidden' name='catid' value='<%= scatidlist.catid %>'/>
          <input type='hidden' name='type_name' value='<%= scatidlist.type_name %>'/>
          <input type='hidden' name='priority' value='<%= scatidlist.priority %>' />
          <input type='hidden' name='title' value='<%= scatidlist.title %>' />
        </table>
      </td>
    </tr>
  </table>
  </form>
