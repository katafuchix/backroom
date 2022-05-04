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
								jp.co.lastminute.maintenance.*,
								jp.co.lastminute.maintenance.util.WebUtil,
								jp.co.lastminute.maintenance.amuse.*,
								jp.co.lastminute.maintenance.amuse.model.*" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%
	ParseFormat pf = null;
	DataFormat df = null;
	AmuseAllot allot = (AmuseAllot)request.getAttribute("allot");
%>
				<table width="100%" border="0" cellspacing="1" cellpadding="2">
					<input type='hidden' name='allot_seq' value='<%= allot.allot_seq %>' />
					<input type='hidden' name='sku_id' value='<%= allot.sku_id %>' />
					<tr bgcolor="#999999">
						<td colspan="9" align='center' class="b">在庫追加</td>
          </tr>
          <tr>
            <td  class="b" align="left" width="180" colspan='3' <%= WebUtil.getErrorColor( allot.error_flg[2] ) %>>在庫数量</td>
            <td align="center" class="b" width="300" colspan='2' <%= WebUtil.getErrorColor( allot.error_flg[3] + allot.error_flg[4]) %> >
            公演日/公演開始時間・ステータス
            </td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td  class="b" align="left" width="180" colspan='3'>
            <%= allot.allotcounter %>
            <input type='hidden' name='allotcounter' value='<%= allot.allotcounter %>' /></td>
            <td align="left" class="b" width="300" colspan='2'>
            <%= df.getDateTime4WWW( "" + allot.allotdate + "" ) %> / <%= allot.allottime %>
            <input type='hidden' name='allotdate' value='<%= allot.allotdate %>' />
            <input type='hidden' name='allottime' value='<%= allot.allottime %>' />
            [<%= WebUtil.getStopOptionStr( "" + allot.stop_flg + "" ) %>]
<input type='hidden' name='stop_flg' value='<%= allot.stop_flg %>' />
          </tr>
				</table>