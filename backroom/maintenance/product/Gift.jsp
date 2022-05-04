<%@ page contentType="text/html; charset=Shift_JIS" %>
<%@ page import="org.apache.struts.action.*,
								jp.co.yobrain.util.*,
								javax.naming.*,
								javax.sql.*,
								java.util.*,
								jp.co.lastminute.ContextProperty,
								java.io.*" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c" %>
<%@ taglib uri="/WEB-INF/x.tld" prefix="xml" %>
<%@ taglib uri="/WEB-INF/fmt.tld" prefix="fmt" %>

<%	ParseFormat pf = null;	%>

<%
	response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
	response.setHeader("Pragma","no-cache"); //HTTP 1.0
	response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

	String xmlstring = (String)request.getAttribute("xmlstring");

%>
					<c:set var="xmlstr" ><%= xmlstring %></c:set><xml:parse var="pageamount" xml="${xmlstr}"></xml:parse>

					<!-- 商品 -->
					<table WIDTH="598" BORDER="0" CELLSPACING="0" CELLPADDING="0" bgcolor="#FFFFFF">

						<tr>
							<td COLSPAN="5" BGCOLOR="#666666"><img ALT="" HEIGHT="1" WIDTH="1" SRC="/img/shim.gif"></td>
						</tr>

						<tr>
							<td WIDTH="1" BGCOLOR="#666666"><img ALT="" HEIGHT="1" WIDTH="1" SRC="/img/shim.gif"></td>
							<td WIDTH="8" BGCOLOR="#F3F0EA"><img ALT="" HEIGHT="1" WIDTH="8" SRC="/img/shim.gif"></td>
							<td ALIGN="CENTER" WIDTH="580" BGCOLOR="#F3F0EA">
								<table CELLPADDING="3" CELLSPACING="0" border="0" WIDTH="580">
									<tr>
										<td COLSPAN="2" VALIGN="TOP" align='left'><br>
										<span CLASS='txt12orgb'><xml:out select='$pageamount//product_sub_title'/></span><br/>
										<span CLASS="super14"><xml:out select='$pageamount//product_name'/></span>　
						        <span CLASS='txt12brnb'><xml:out select='$pageamount//price_catch'/></span><br/><br/>
										<xml:out select='$pageamount//catchcopy' escapeXml="false"/>
						        </td>
					       	</tr>
						      <tr>
										<td colspan=' 2'VALIGN="TOP" align='right'>
										<span CLASS="txt14b"><xml:out select='$pageamount//pricestr'/> 円　</span>
										<span CLASS="txt12b">(税 <xml:out select='$pageamount//taxstr'/> 円)</span></td>
									</tr>
								</table>

								<table width="580" cellpadding="0" cellspacing="1" border="0" BGCOLOR="#F3F0EA">
									<tr>
										<td>
											<table border="0" width='580' cellspacing="0" cellpadding="0">
												<tr>
													<td colspan="3" align="right">
															配送希望日:<b><xml:out select='$pageamount//sending_date' /></b>日より　<b><xml:out select='$pageamount//sending_days' /></b>日間
															配送希望時間:<b><xml:out select='$pageamount//sending_timestr' /></b>
													</td>
													<td align="right"> 																										
															数量:
															計:
													</td>
													<td rowspan="2" align="right" valign="middle">
														<input type="image" src="/img/btt_buy.gif" width="74" height="23" border="0" alt="カートへ">
													</td>
												</tr>
												<tr>
													<td colspan="4" align="right">
														<xml:if select="$pageamount//etc_flg[not(.='')] ">
															<xml:out select='$pageamount//textvalue' escapeXml="false"/>:<input type='text' size=20>
														</xml:if>
													</td>
												</form>
											</tr>
										</td>
									</tr>
								</table>

								<br>
								<table WIDTH="580" BGCOLOR="#999999" CELLPADDING="0" CELLSPACING="0" BORDER="0">
									<tr>
										<td BGCOLOR="#EEEEEE" CLASS="b" VALIGN="TOP">
											<!--<A href="javascript:showPopupOuter('www.lastminute.co.jp/img/gift/<xml:out select='$pageamount//jan_cd'/>-4.gif');" alt="<xml:out select='$pageamount//product_name'/>">-->
											<img src='http://www.lastminute.co.jp/img/gift/<xml:out select='$pageamount//jan_cd'/>-4.gif' width="200" hight="200" border="0"><br>
											<!--</a>-->
										</td>
										<td BGCOLOR="#EEEEEE" CLASS="b" VALIGN="TOP">
											<td WIDTH="1" BGCOLOR="#EEEEEE"><img ALT="" HEIGHT="1" WIDTH="5" SRC="/img/shim.gif"></td>
										</td>
										<td>
											<table WIDTH="375" BGCOLOR="#999999" CELLPADDING="3" CELLSPACING="1" BORDER="0">

							          <xml:if select="$pageamount//body[not(.='')] ">
												<tr>
													<td BGCOLOR="#FFFFFF" VALIGN="TOP"><span CLASS="b" >ご案内</span><br><br>
												  <xml:out select='$pageamount//body' escapeXml="false"/>

													<xml:if select="$pageamount//linkedurl[not(.='')] ">
												  <br/><br/>
													<A href="javascript:showPopupOuter('<xml:out select="$pageamount//linkedurl"/>');">
														<xml:out select="$pageamount//linkedurlvalue"/>
													</A>
													</xml:if>

													</td>
												</tr>
												</xml:if>

							          <xml:if select="$pageamount//specword[not(.='')] ">
												<tr>
													<td BGCOLOR="#FFFFFF" VALIGN="TOP"><span CLASS="b" >製品仕様</span><br><br>
												  <xml:out select='$pageamount//specword' escapeXml="false"/></td>
												</tr>
												</xml:if>
												
												<xml:if select="$pageamount//moreinfo[not(.='')] ">
												<tr>
													<td BGCOLOR="#FFFFFF" VALIGN="TOP">
														<span CLASS="b" >ご注意事項</span><br><br>
												  	<xml:out select='$pageamount//moreinfo' escapeXml="false"/>
													</td>
												</tr>
												</xml:if>

												<xml:if select="$pageamount//c_coment[not(.='')] ">
												<tr>
													<td BGCOLOR="#FFFFFF" VALIGN="TOP">
														<!--<span CLASS="b" >サプライヤー情報</span><br><br>-->
												  	<xml:out select='$pageamount//c_coment' escapeXml="false"/>
													</td>
												</tr>
												</xml:if>

												<!--
												<xml:if select="$pageamount//linkedurl[not(.='')] ">
												<tr>
													<td BGCOLOR="#FFFFFF" VALIGN="TOP">
														<span CLASS="b" >リンク先</span><br>
												  	<A href="javascript:showPopupOuter('<xml:out select="$pageamount//linkedurl"/>');">
															<xml:out select="$pageamount//linkedurlvalue"/>
														</A>
													</td>
								       	</tr>
												</xml:if>
												-->
												<!--
												<xml:if select="$pageamount//opening[not(.='')] ">
												<tr>
													<td BGCOLOR="#FFFFFF" VALIGN="TOP">
														<span CLASS="b" >情報掲載期間</span><br><br>
														<xml:out select='$pageamount//opening'/>
													</td>
												</tr>
												</xml:if>
												-->
											</table>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
					<!-- /商品説明 -->
</center>

</body>
</html>
