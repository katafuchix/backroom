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
								jp.co.lastminute.maintenance.ticket.*,
								jp.co.lastminute.maintenance.ticket.model.*" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%
	ParseFormat pf = null;
	DataFormat df = null;
	TicketAllot allot = (TicketAllot)request.getAttribute("allot");
%>
				<table width="480" border="0" cellspacing="1" cellpadding="2">
					<input type='hidden' name='allot_seq' value='<%= allot.allot_seq %>' />
					<input type='hidden' name='sku_id' value='<%= allot.sku_id %>' />
					<tr bgcolor="#999999">
						<td colspan="9" align='center' class="b">公演日/公演開始時間・ステータス</td>
          </tr>

          <tr>
            <td  class="b" align="left" width="180" colspan='3' <%= WebUtil.getErrorColor( allot.error_flg[2] ) %>>在庫数量</td>
            <td align="center" class="b" width="300" colspan='2' <%= WebUtil.getErrorColor( allot.error_flg[3] + allot.error_flg[4]) %> >
            公演日/公演開始時間・ステータス
            </td>
          </tr>

          <tr bgcolor="#FFFFFF">
            <td  class="b" align="left" width="180" colspan='3'>
            <input type='text' size='3' maxlength='2' name='allotcounter' value='<%= allot.allotcounter %>' style='ime-mode:disabled;' /></td>
            <td align="left" class="b" width="300" colspan='2'>
            <input type='text' size='10' maxlength='8' name='allotdate' value='<%= pf.ZeroUP( ""+allot.allotdate+"", 8 ) %>'  style='ime-mode:disabled;' />/
            <input type='text' size='6' maxlength='4' name='allottime' value='<%= pf.ZeroUP( ""+allot.allottime+"", 4 ) %>' style='ime-mode:disabled;' />
             <select name="stop_flg">
<%= WebUtil.getStopOption( "" + allot.stop_flg + "" ) %>
             </select>
          </tr>
				</table>