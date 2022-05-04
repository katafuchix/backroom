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
	TicketSku sku = (TicketSku)request.getAttribute("sku");
%>
				<table width="550" border="0" cellspacing="1" cellpadding="2">
					<input type='hidden' name='sku_id' value='<%= sku.sku_id %>' />
					<input type='hidden' name='product_seq' value='<%= sku.product_seq %>' />
					<input type='hidden' name='agt_cd' value='<%= sku.agt_cd %>' />
					<input type='hidden' name='sku_name' value='<%= sku.sku_name %>'  />
					<input type='hidden' name='viewstart' value='<%= sku.viewstart %>' />
					<input type='hidden' name='sheatandso' value='<%= sku.sheatandso %>'  />
					<input type='hidden' name='optionalcomment' value='<%= sku.optionalcomment %>' />
					<input type='hidden' name='price' value='<%= sku.price %>' />
					<input type='hidden' name='tax' value='<%= sku.tax %>' />
					<input type='hidden' name='salesfrom' value='<%= sku.salesfrom %>' />
          <input type='hidden' name='salesto' value='<%= sku.salesto %>' />
          <input type='hidden' name='sending' value='<%= sku.sending %>' />
          <input type='hidden' name='sending_tax' value='<%= sku.sending_tax %>' />
          <input type='hidden' name='sending_calc_unit' value='<%= sku.sending_calc_unit %>' />
					<tr bgcolor="#999999">
						<td colspan="3" align='center' class="b">商品追加</td>
          </tr>
          <tr bgcolor="#CCCCCC">
            <td  class="b" align="left" width="230" colspan='1'>商品名</td>
            <td align="center" class="b" width="220" colspan='1'>販売開始日/販売終了日</td>
            <td  class="b" align="center" width="110">価格(税/送料込み)</td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td  class="b" align="left" width="230">
            <%= sku.sku_name %>
            </td>
            <td align="left" class="b" width="220">
            <%= df.getDateTime4WWW( pf.ZeroUP(sku.salesfrom, 8) ) %>/
            <%= df.getDateTime4WWW( pf.ZeroUP(sku.salesto, 8) ) %>
            </td>
            <td  class="b" align="left" width="110">
          	<%= pf.ToPriceFormat( sku.price ) %>
          	<br/>
          	<%= pf.ToPriceFormat( sku.sending ) %>
          	</td>
          </tr>
				</table>