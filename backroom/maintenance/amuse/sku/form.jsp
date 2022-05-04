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
								jp.co.lastminute.maintenance.amuse.model.*,
								jp.co.lastminute.maintenance.common.CommonDBOCache,
								jp.co.lastminute.maintenance.common.ProductTypeWrapper,
								jp.co.lastminute.maintenance.common.AgentWrapper" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%
	ParseFormat pf = null;
	DataFormat df = null;
	AmuseSku sku = (AmuseSku)request.getAttribute("sku");
	String[] numberfig = {"21","20","19","18","17","16","15",
												"14","13","12","11","10","9","8",
												"7","6","5","4","3","2","1","0"};
%>
				<table width="550" border="0" cellspacing="1" cellpadding="2">
					<input type='hidden' name='sku_id' value='<%= sku.sku_id %>' />
					<input type='hidden' name='product_seq' value='<%= sku.product_seq %>' />
					<input type='hidden' name='agt_cd' value='<%= sku.agt_cd %>' />
          <tr bgcolor="#999999">
						<td colspan="3" align='center' class="b">商品追加</td>
          </tr>
          <tr>
            <td  class="b" align="left" width="230" <%= WebUtil.getErrorColor( sku.error_flg[4] ) %>>商品名</td>
          	<td align="center" class="b" width="220" <%= WebUtil.getErrorColor( sku.error_flg[3] + sku.error_flg[6] + sku.error_flg[8] ) %> >
            販売開始日/終了日(YYYYMMDD)</td>
            <td  class="b" align="center" width="110" <%= WebUtil.getErrorColor( sku.error_flg[9] + sku.error_flg[11] ) %>>
            価格(税込み):
            </td>
            <td  class="b" align="center" width="110" <%= WebUtil.getErrorColor( sku.error_flg[9] + sku.error_flg[11] ) %>>
            価格M(税):
            </td>
            <td  class="b" align="center" width="110" <%= WebUtil.getErrorColor( sku.error_flg[9] + sku.error_flg[11] ) %>>
            価格C(税):
            </td>
            <td  class="b" align="center" width="110" <%= WebUtil.getErrorColor( sku.error_flg[9] + sku.error_flg[11] ) %>>
            送料(税):
            </td>
            <td  class="b" align="center" width="110" <%= WebUtil.getErrorColor( sku.error_flg[9] + sku.error_flg[11] ) %>>
            手配数(最小/最大):
            </td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td  class="b" align="left" width="230" >
            <input type='text' size='40' maxlength='40' name='sku_name' value='<%= sku.sku_name %>'  /></td>
            <td align="left" class="b" width="220" >
            <input type='text' size='10' maxlength='8' name='salesfrom' value='<%= pf.ZeroUP( ""+sku.salesfrom+"", 8 ) %>'  style='ime-mode:disabled;' />/
            <input type='text' size='10' maxlength='8' name='salesto' value='<%= pf.ZeroUP( ""+sku.salesto+"", 8 ) %>' style='ime-mode:disabled;' />
            </td>
            <td width='110'>
            <input type='text' size='6' maxlength='5' name='price' value='<%= sku.price %>' style='ime-mode:disabled;' /><br/>
						(<input type='text' size='6' maxlength='5' name='tax' value='<%= sku.tax %>' style='ime-mode:disabled;' />)
            </td>
            <td width='110'>
            <input type='text' size='6' maxlength='5' name='pricem' value='<%= sku.pricem %>' style='ime-mode:disabled;' /><br/>
						(<input type='text' size='6' maxlength='5' name='taxm' value='<%= sku.taxm %>' style='ime-mode:disabled;' />)
            </td>
            <td width='110'>
            <input type='text' size='6' maxlength='5' name='pricec' value='<%= sku.pricec %>' style='ime-mode:disabled;' /><br/>
						(<input type='text' size='6' maxlength='5' name='taxc' value='<%= sku.taxc %>' style='ime-mode:disabled;' />)
            </td>
            <td width='110'>
            <input type='text' size='6' maxlength='5' name='sending' value='<%= sku.sending %>' style='ime-mode:disabled;' /><br/>
						(<input type='text' size='6' maxlength='5' name='sending_tax' value='<%= sku.sending_tax %>' style='ime-mode:disabled;' />)
            </td>
            <td width='110'>
            <input type='text' size='6' maxlength='5' name='minorder' value='<%= sku.minorder %>' style='ime-mode:disabled;' />/<br/>
						<input type='text' size='6' maxlength='5' name='maxorder' value='<%= sku.maxorder %>' style='ime-mode:disabled;' />
            </td>
          </tr>
         </table>