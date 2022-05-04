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
								jp.co.lastminute.maintenance.ticket.*,
								jp.co.lastminute.maintenance.ticket.model.*,
								jp.co.lastminute.maintenance.common.CommonDBOCache,
								jp.co.lastminute.maintenance.common.ProductTypeWrapper,
								jp.co.lastminute.maintenance.common.AgentWrapper" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%
	int type_cd = jp.co.lastminute.maintenance.ticket.Property.product_type_cd;
	//int type_cd = 93; //Property.product_type_cd;

	ServletContext servletContext = getServletContext();
	DataSource Datasouce  = (DataSource)servletContext.getAttribute( Action.DATA_SOURCE_KEY );

	TicketInfo ticketinfo = (TicketInfo)request.getAttribute("ticketinfo");

	CommonDBOCache cache = null;
	AgentWrapper agtWrapper = null;
	List agents = null;
	if(session.getAttribute("agtWrapper") == null){
		agtWrapper = new AgentWrapper( null, Datasouce );
		//agtWrapper.getAgentMaps( "" + type_cd + "" );
		agents = agtWrapper.getCombos( "" + type_cd + "" );
		session.setAttribute("agtWrapper", agtWrapper.getCache() );
	}else{
		cache  = (CommonDBOCache)session.getAttribute("agtWrapper");
		agtWrapper = new AgentWrapper( cache, Datasouce );
		agents = agtWrapper.getCombos( "" + type_cd + "" );
	}
	//List agents = agtWrapper.getCombos( "" + type_cd + "" );

	ProductTypeWrapper productTypeWrapper = null;
	if(session.getAttribute("productTypeWrapper") == null){
		productTypeWrapper = new ProductTypeWrapper( null, Datasouce );
		productTypeWrapper.getTypeMaps( "" + type_cd + "" );
		session.setAttribute("productTypeWrapper", productTypeWrapper.getCache() );
	}else{
		cache  = (CommonDBOCache)session.getAttribute("productTypeWrapper");
		productTypeWrapper = new ProductTypeWrapper( cache, Datasouce );
	}
	List productType = productTypeWrapper.getCombos( "" + type_cd + "" );
%>
        <table width="100%" border="0" cellspacing="1" cellpadding="2">
          <tr>
            <td colspan="3" align='center' class="b" bgcolor="#999999"> 商品詳細情報 </td>
            <td colspan="1" align='center' class="b" bgcolor="#999999">
            <input type="button" value="小カテゴリー" onClick="javascript:PopUpScatMaintenace('<%= ticketinfo.product_seq %>', '<%= type_cd %>');"> </td>
          </tr>
          <tr>
          	<td align="left" class="b" colspan="1" <%= WebUtil.getErrorColor( ticketinfo.error_flg[21] ) %>>表示</td>
            <td width="120" class="b" align="left" <%= WebUtil.getErrorColor( ticketinfo.error_flg[1] ) %>>商品コード</td>
            <td align="left" class="b" colspan="2" bgcolor="#CCCCCC">エージェント名</td>
          </tr>
          <tr>
          	<td class="b" align="left" bgcolor="#FFFFFF">
              <select name="stop_flg">
<%= WebUtil.getStopOption( "" + ticketinfo.stop_flg + "" ) %>
              </select>
            </td>
            <td align="left" bgcolor="#FFFFFF">
              <input type="text" name="jan_cd" class="textbox" size='15' maxlength='15' value='<%= ticketinfo.jan_cd %>' style="ime-mode:disabled;" />
            </td>
            <td align="left" class="b" height="18" colspan="2" bgcolor="#FFFFFF">
            <select name="agt_cd">
<%= WebUtil.getComboByList( agents, ticketinfo.agt_cd ) %>
              </select>
            </td>
          </tr>


          <tr>
          	<td align="left" class="b" <%= WebUtil.getErrorColor( ticketinfo.error_flg[3] ) %> colspan='1'>チケット種別</td>
            <td align="left" class="b" <%= WebUtil.getErrorColor( ticketinfo.error_flg[6] ) %> colspan='3'>商品名</td>
          </tr>
          <tr bgcolor="#FFFFFF">
          	<td align="left" class="b" colspan='1'>
            <select name="ticket_type">
<%= WebUtil.getComboByList( productType, "" + ticketinfo.ticket_type + "" ) %>
              </select>
            </td>
						<td align="left" colspan="3" bgcolor="#FFFFFF">
              <input type="text" name="product_name" class="textbox" size="50" maxlength='48' value="<%= ticketinfo.product_name %>">
            </td>
          </tr>
          <tr>
            <td class="b" align="left" <%= WebUtil.getErrorColor( ticketinfo.error_flg[23] ) %> colspan="4">大イベント名</td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td class="b" align="left" colspan="4">
            	<input type='text' size='48' maxlength='48' name='event_names' value='<%= ticketinfo.event_names %>' />
            </td>
          </tr>
          <tr>
            <td class="b" align="left" <%= WebUtil.getErrorColor( ticketinfo.error_flg[7] ) %> colspan="4">見出しテキスト</td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td class="b" align="left" colspan='4'>
            	<input type='text' size='80' maxlength='90' name='product_sub_title' value='<%= ticketinfo.product_sub_title %>' />
            </td>
          </tr>
          <tr>
            <td class="b" <%= WebUtil.getErrorColor( ticketinfo.error_flg[8] ) %> colspan='4'>キャッチコピー(6行程度まで)</td>
          </tr>
          <tr>
            <td class="b" bgcolor="#FFFFFF" colspan="4">
              <textarea name="catchcopy" wrap='hard' rows="3" cols="42" wrap="virtual" class="textarea"><%= ticketinfo.catchcopy %></textarea>
              <br>
            </td>
          </tr>
          <tr>
            <td colspan='4' <%= WebUtil.getErrorColor( ticketinfo.error_flg[9] ) %>>おすすめポイント</td>
          </tr>
          <tr>
            <td class="b" bgcolor="#FFFFFF" colspan="4">
              <input type=text name="price_catch" size='70' maxlength='70' value='<%= ticketinfo.price_catch %>'>
              <br>
            </td>

          </tr>
          <tr>
            <td class="b" align="left" <%= WebUtil.getErrorColor( ticketinfo.error_flg[13] ) %> colspan="4">会場</td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td class="b" align="left" colspan="4">
            	<input type='text' size='70' maxlength='70' name='play_place' value='<%= ticketinfo.play_place %>' />
            </td>
          </tr>
          <tr>
          	<td class="b" <%= WebUtil.getErrorColor( ticketinfo.error_flg[14] ) %> colspan="4">アクセスポイント(3行程度まで)</td>
          </tr>
          <tr>
            <td class="b" bgcolor="#FFFFFF" colspan="4">
              <textarea name="pointofaccess" wrap='hard'　rows="3" cols="42" wrap="virtual" class="textarea"><%= ticketinfo.pointofaccess %></textarea>
            </td>
          </tr>
          <tr>
            <td class="b" align="left" <%= WebUtil.getErrorColor( ticketinfo.error_flg[15] ) %> colspan="4">会場ＵＲＬ</td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td class="b" align="left" colspan="4">
            	<input type='text' size='90' maxlength='120' name='accesspoint_url' value='<%= ticketinfo.accesspoint_url %>' style='ime-mode:disabled;' />
            </td>
          </tr>
          <tr>
            <td class="b" align="left" <%= WebUtil.getErrorColor( ticketinfo.error_flg[11] ) %> colspan="4">出演者</td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td class="b" align="left" colspan="4">
            	<input type='text' size='48' maxlength='48' name='actors' value='<%= ticketinfo.actors %>' />
            </td>
          </tr>
          <tr>
            <td class="b" align="left" <%= WebUtil.getErrorColor( ticketinfo.error_flg[12] ) %> colspan="4">主催</td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td class="b" align="left" colspan="4">
            	<input type='text'  size='48' maxlength='48' name='produce' value='<%= ticketinfo.produce %>' />
            </td>
          </tr>

          <tr>
          	<td class="b" colspan="4" <%= WebUtil.getErrorColor( ticketinfo.error_flg[16] ) %> >備考(8行程度まで)</td>
          </tr>
          <tr>
            <td class="b" colspan="4" bgcolor="#FFFFFF">
              <textarea name="description" rows="6" wrap='hard' cols="62" class="textarea"><%= ticketinfo.description %></textarea>
              <br>
            </td>
          </tr>
          <tr>
            <td class="b" align="left" <%= WebUtil.getErrorColor( ticketinfo.error_flg[22] ) %> colspan="4">連絡先・リンク先ＵＲＬ</td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td class="b" align="left" colspan="4">
            	<input type='text' size='90' maxlength='98' name='linkedurl' value='<%= ticketinfo.linkedurl %>' style='ime-mode:disabled;' />
            </td>
<input type='hidden' size='90' maxlength='98' name='image_01_url' value='<%= ticketinfo.image_01_url %>' style='ime-mode:disabled;' />
<input type='hidden' size='90' maxlength='98' name='image_01_url_1' value='<%= ticketinfo.image_01_url_1 %>' style='ime-mode:disabled;' />
<input type='hidden' size='90' maxlength='98' name='image_01_url_2' value='<%= ticketinfo.image_01_url_2 %>' style='ime-mode:disabled;' />
<input type='hidden' size='90' maxlength='98' name='image_01_url_3' value='<%= ticketinfo.image_01_url_3 %>' style='ime-mode:disabled;' />
          </tr>
          <tr>
            <td class="b" align="left" <%= WebUtil.getErrorColor( ticketinfo.error_flg[10] ) %> colspan="4">リンクコメント</td>
          </tr>
 					<tr>
 						<td class="b" align="left" colspan="4">
          	<input type='text' name='opening' size='30' maxlength='30' value='<%= ticketinfo.opening %>' />
          	</td>
          </tr>
        </table>