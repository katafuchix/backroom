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
	if(session.getAttribute("agtWrapper") == null){
		agtWrapper = new AgentWrapper( null, Datasouce );
		agtWrapper.getAgentMaps( "" + type_cd + "" );
		session.setAttribute("agtWrapper", agtWrapper.getCache() );
	}else{
		cache  = (CommonDBOCache)session.getAttribute("agtWrapper");
		agtWrapper = new AgentWrapper( cache, Datasouce );
	}
	List agents = agtWrapper.getCombos( "" + type_cd + "" );

%>
        <table width="100%" border="0" cellspacing="1" cellpadding="2">
          <tr>
            <td colspan="4" align='center' class="b" bgcolor="#999999"> 商品詳細情報
            </td>
          </tr>
          <tr>
            <td align="center" class="b" colspan="2" bgcolor="#CCCCCC">エージェント名</td>
            <td align="center" class="b" colspan="2" bgcolor="#CCCCCC">商品サイズ</td>
          </tr>
          <tr>
            <td align="left" class="b" height="18" colspan="2" bgcolor="#FFFFFF">
            <input type="hidden" name="agt_cd" value='<%= ticketinfo.agt_cd %>' />
<%= agtWrapper.getAgt_name( ticketinfo.agt_cd ) %>
            </td>
            <td align="left" class="b" height="18" colspan="2" bgcolor="#FFFFFF">
            <input type="hidden" name="dayallotesize" value='<%= ticketinfo.dayallotesize %>' />
            <%= ticketinfo.dayallotesize %>
            </td>
          </tr>

          <tr>
            <td align="left" class="b" bgcolor="#CCCCCC" colspan='4'>商品名</td>
          </tr>
          <tr bgcolor="#FFFFFF">
						<td align="left" colspan="4" bgcolor="#FFFFFF">
							<%= ticketinfo.product_name %>
              <input type="hidden" name="product_name" value="<%= ticketinfo.product_name %>">
            </td>
          </tr>
          <tr>
            <td class="b" align="left" bgcolor="#CCCCCC" colspan="4">見出しテキスト</td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td class="b" align="left" colspan='4'>
            	<%= ticketinfo.product_sub_title %>
            	<input type='hidden' name='product_sub_title' value='<%= ticketinfo.product_sub_title %>' />
            </td>
          </tr>
          <tr>
            <td class="b" bgcolor="#CCCCCC" colspan='4'>キャッチコピー</td>
          </tr>
          <tr>
            <td class="b" bgcolor="#FFFFFF" colspan="4" valign='top'>
<pre><%= ticketinfo.catchcopy %></pre>
              <input type='hidden' name="catchcopy" value='<%= ticketinfo.catchcopy %>' />
              <br>
            </td>
          </tr>
          <tr>
            <td colspan='4' bgcolor="#CCCCCC">おすすめポイント</td>
          </tr>
          <tr>
            <td class="b" bgcolor="#FFFFFF" colspan="4" valign='top'>
<pre><%= ticketinfo.price_catch %></pre>
              <input type='hidden' name="price_catch" value='<%= ticketinfo.price_catch %>' />
              <br>
            </td>
          </tr>
          <tr>
            <td class="b" align="left" bgcolor="#CCCCCC" colspan="4">会場</td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td class="b" align="left" colspan="4">
            <%= ticketinfo.play_place %>
            	<input type='hidden' name='play_place' value='<%= ticketinfo.play_place %>' />
            </td>
          </tr>
          <tr>
            <td class="b" bgcolor="#CCCCCC" colspan="4">アクセスポイント</td>
          </tr>
          <tr>
            <td class="b" bgcolor="#FFFFFF" colspan="4" valign='top'>
<pre><%= ticketinfo.pointofaccess %></pre>
              <input type='hidden' name="pointofaccess" value='<%= ticketinfo.pointofaccess %>' />
            </td>
          </tr>
          <tr>
            <td class="b" align="left" bgcolor="#CCCCCC" colspan="4">会場ＵＲＬ</td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td class="b" align="left" colspan="4">
            <%= ticketinfo.accesspoint_url %>
            	<input type='hidden' name='accesspoint_url' value='<%= ticketinfo.accesspoint_url %>' />
            </td>
          </tr>
          <tr>
            <td class="b" align="left" bgcolor="#CCCCCC" colspan="4">主催</td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td class="b" align="left" colspan="4">
            <%= ticketinfo.produce %>
            	<input type='hidden' name='produce' value='<%= ticketinfo.produce %>' />
            </td>
          </tr>
          <tr>
          	<td class="b" colspan="4" <%= WebUtil.getErrorColor( ticketinfo.error_flg[13] ) %> >リンクＵＲＬ</td>
          </tr>
          <input type='hidden' name='linkedurl' value='<%= ticketinfo.linkedurl %>' />
          <tr>
            <td class="b" colspan="4" bgcolor="#FFFFFF">
              <%= ticketinfo.linkedurl %>
              <br>
            </td>
          </tr>
          <tr>
            <td class="b" colspan="4" bgcolor="#CCCCCC">備考</td>
          </tr>
          <tr>
            <td class="b" bgcolor="#FFFFFF" colspan="4" valign='top'>
<pre><%= ticketinfo.description %></pre>
              <input type='hidden' name="description" value='<%= ticketinfo.description %>' />
            </td>
          </tr>
          <tr>
            <td class="b" colspan="4" bgcolor="#CCCCCC">備考</td>
          </tr>
          <tr>
            <td class="b" bgcolor="#FFFFFF" colspan="4" valign='top'>
<pre><%= ticketinfo.attention %></pre>
              <input type='hidden' name="attention" value='<%= ticketinfo.attention %>' />
            </td>
          </tr>
        </table>