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
								jp.co.lastminute.maintenance.ticket.model.*,
								jp.co.lastminute.maintenance.common.CommonDBOCache,
								jp.co.lastminute.maintenance.common.ProductTypeWrapper,
								jp.co.lastminute.maintenance.common.AgentWrapper" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%
	ParseFormat pf = null;
	DataFormat df = null;
	TicketSku sku = (TicketSku)request.getAttribute("sku");
	String[] numberfig = {"21","20","19","18","17","16","15",
												"14","13","12","11","10","9","8",
												"7","6","5","4","3","2","1","0"};
%>
				<table width="550" border="0" cellspacing="1" cellpadding="2">
					<input type='hidden' name='sku_id' value='<%= sku.sku_id %>' />
					<input type='hidden' name='product_seq' value='<%= sku.product_seq %>' />
					<input type='hidden' name='agt_cd' value='<%= sku.agt_cd %>' />
					<input type='hidden' name='viewstart' value='<%= sku.viewstart %>'  />
          <input type='hidden' name='sheatandso' value='<%= sku.sheatandso %>'  />
          <input type='hidden' name='optionalcomment' value='<%= sku.optionalcomment %>' />
          <input type='hidden' name='tax' value='<%= sku.tax %>' />
          <input type='hidden' name='sending_tax' value='<%= sku.sending_tax %>' />
          <input type='hidden' name='sending_calc_unit' value='<%= sku.sending_calc_unit %>' />
					<tr bgcolor="#999999">
						<td colspan="3" align='center' class="b">商品追加</td>
          </tr>
          <tr>
            <td  class="b" align="left" width="230" <%= WebUtil.getErrorColor( sku.error_flg[4] ) %>>商品名</td>
          	<td align="center" class="b" width="220" <%= WebUtil.getErrorColor( sku.error_flg[3] + sku.error_flg[6] + sku.error_flg[8] ) %> >
            販売開始日/終了日(YYYYMMDD)</td>
            <td  class="b" align="center" width="110" <%= WebUtil.getErrorColor( sku.error_flg[9] + sku.error_flg[11] ) %>>価格(税込み):<br/>送料(税込み)
            </td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td  class="b" align="left" width="230" >
            <input type='text' size='40' maxlength='40' name='sku_name' value='<%= sku.sku_name %>'  /></td>
            <td align="left" class="b" width="220" >
            <input type='text' size='10' maxlength='8' name='salesfrom' value='<%= pf.ZeroUP( ""+sku.salesfrom+"", 8 ) %>'  style='ime-mode:disabled;' />/
            <input type='text' size='10' maxlength='8' name='salesto' value='<%= pf.ZeroUP( ""+sku.salesto+"", 8 ) %>' style='ime-mode:disabled;' />
            </td>
            <td width='90'>
            <input type='text' size='6' maxlength='5' name='price' value='<%= sku.price %>' style='ime-mode:disabled;' />
            <br/>
            <input type='text' size='6' maxlength='5' name='sending' value='<%= sku.sending %>' style='ime-mode:disabled;' />
            </td>
          </tr>
         </table>