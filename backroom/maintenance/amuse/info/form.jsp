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
								jp.co.lastminute.maintenance.amuse.model.*,
								jp.co.lastminute.maintenance.common.CommonDBOCache,
								jp.co.lastminute.maintenance.common.ProductTypeWrapper,
								jp.co.lastminute.maintenance.common.AgentWrapper" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%
	int type_cd = jp.co.lastminute.maintenance.amuse.Property.product_type_cd;

	ServletContext servletContext = getServletContext();
	DataSource Datasouce  = (DataSource)servletContext.getAttribute( Action.DATA_SOURCE_KEY );

	AmuseInfo ticketinfo = (AmuseInfo)request.getAttribute("ticketinfo");

	CommonDBOCache cache = null;
	AgentWrapper agtWrapper = null;
	List agents = null;
	if(session.getAttribute("agtWrapper") == null){
		agtWrapper = new AgentWrapper( null, Datasouce );
		agents = agtWrapper.getCombos( "" + type_cd + "" );
		session.setAttribute("agtWrapper", agtWrapper.getCache() );
	}else{
		cache  = (CommonDBOCache)session.getAttribute("agtWrapper");
		agtWrapper = new AgentWrapper( cache, Datasouce );
		agents = agtWrapper.getCombos( "" + type_cd + "" );
	}
%>
        <table width="100%" border="0" cellspacing="1" cellpadding="2">
          <tr>
            <td colspan="4" align='center' class="b" bgcolor="#999999"> 商品詳細情報 </td>
          </tr>
          <tr>
          	<td align="left" class="b" colspan="2" bgcolor='#CCCCCC'>エージェント名</td>
          	<td align="left" class="b" colspan="2" <%= WebUtil.getErrorColor( ticketinfo.error_flg[12] ) %>>商品サイズ</td>
          </tr>
          <tr>
            <td align="left" class="b" height="18" colspan="2" bgcolor="#FFFFFF">
            <select name="agt_cd">
<%= WebUtil.getComboByList( agents, ticketinfo.agt_cd ) %>
              </select>
            </td>
            <td align="left" class="b" height="18" colspan="2" bgcolor="#FFFFFF">
            <input type="text" name="dayallotesize" class="textbox" size="3" maxlength='2' value="<%= ticketinfo.dayallotesize %>" style='ime-mode:disabled;'>
            </td>
          </tr>
          <tr>
            <td align="left" class="b" <%= WebUtil.getErrorColor( ticketinfo.error_flg[3] ) %> colspan='4'>商品名</td>
          </tr>
          <tr bgcolor="#FFFFFF">
						<td align="left" colspan="4" bgcolor="#FFFFFF">
              <input type="text" name="product_name" class="textbox" size="50" maxlength='48' value="<%= ticketinfo.product_name %>">
            </td>
          </tr>
          <tr>
            <td class="b" align="left" colspan="4"></td>
          </tr>
          <tr>
            <td class="b" align="left" <%= WebUtil.getErrorColor( ticketinfo.error_flg[4] ) %> colspan="4">見出しテキスト</td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td class="b" align="left" colspan='4'>
            	<input type='text' size='80' maxlength='90' name='product_sub_title' value='<%= ticketinfo.product_sub_title %>' />
            </td>
          </tr>
          <tr>
            <td class="b" <%= WebUtil.getErrorColor( ticketinfo.error_flg[5] ) %> colspan='4'>キャッチコピー(6行程度まで)</td>
          </tr>
          <tr>
            <td class="b" bgcolor="#FFFFFF" colspan="4">
              <textarea name="catchcopy" wrap='hard' rows="3" cols="42" wrap="virtual" class="textarea"><%= ticketinfo.catchcopy %></textarea>
              <br>
            </td>
          </tr>
          <tr>
            <td colspan='4' <%= WebUtil.getErrorColor( ticketinfo.error_flg[6] ) %>>おすすめポイント</td>
          </tr>
          <tr>
            <td class="b" bgcolor="#FFFFFF" colspan="4">
              <input type=text name="price_catch" size='70' maxlength='70' value='<%= ticketinfo.price_catch %>'>
              <br>
            </td>

          </tr>
          <tr>
            <td class="b" align="left" <%= WebUtil.getErrorColor( ticketinfo.error_flg[8] ) %> colspan="4">会場</td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td class="b" align="left" colspan="4">
            	<input type='text' size='70' maxlength='70' name='play_place' value='<%= ticketinfo.play_place %>' />
            </td>
          </tr>
          <tr>
          	<td class="b" <%= WebUtil.getErrorColor( ticketinfo.error_flg[9] ) %> colspan="4">アクセスポイント(3行程度まで)</td>
          </tr>
          <tr>
            <td class="b" bgcolor="#FFFFFF" colspan="4">
              <textarea name="pointofaccess" wrap='hard'　rows="3" cols="42" wrap="virtual" class="textarea"><%= ticketinfo.pointofaccess %></textarea>
            </td>
          </tr>
          <tr>
            <td class="b" align="left" <%= WebUtil.getErrorColor( ticketinfo.error_flg[10] ) %> colspan="4">会場ＵＲＬ</td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td class="b" align="left" colspan="4">
            	<input type='text' size='90' maxlength='120' name='accesspoint_url' value='<%= ticketinfo.accesspoint_url %>' style='ime-mode:disabled;' />
            </td>
          </tr>
          <tr>
            <td class="b" align="left" <%= WebUtil.getErrorColor( ticketinfo.error_flg[7] ) %> colspan="4">主催</td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td class="b" align="left" colspan="4">
            	<input type='text'  size='48' maxlength='48' name='produce' value='<%= ticketinfo.produce %>' />
            </td>
          </tr>
					<tr>
          	<td class="b" colspan="4" <%= WebUtil.getErrorColor( ticketinfo.error_flg[13] ) %> >リンクＵＲＬ</td>
          </tr>
          <tr>
            <td class="b" colspan="4" bgcolor="#FFFFFF">
              <input type='text'  size='80' maxlength='100' name='linkedurl' value='<%= ticketinfo.linkedurl %>' />
              <br>
            </td>
          </tr>
          <tr>
          	<td class="b" colspan="4" <%= WebUtil.getErrorColor( ticketinfo.error_flg[11] ) %> >備考(8行程度まで)</td>
          </tr>
          <tr>
            <td class="b" colspan="4" bgcolor="#FFFFFF">
              <textarea name="description" rows="6" wrap='hard' cols="62" class="textarea"><%= ticketinfo.description %></textarea>
              <br>
            </td>
          </tr>
                 <tr>
          	<td class="b" colspan="4" <%= WebUtil.getErrorColor( ticketinfo.error_flg[14] ) %> >注意(3行程度まで)</td>
          </tr>
          <tr>
            <td class="b" colspan="4" bgcolor="#FFFFFF">
              <textarea name="attention" rows="6" wrap='hard' cols="68" class="textarea"><%= ticketinfo.attention %></textarea>
              <br>
            </td>
          </tr>
        </table>