/*
 * Created on 2003/06/16
 *
 * To change the template for this generated file go to
 * Window>Preferences>Java>Code Generation>Code and Comments
 */
package jp.co.lastminute.maintenance.Tool.KNT;

import java.sql.*;
import java.util.*;
import java.io.*;

import javax.sql.DataSource;
import org.w3c.dom.*;
import org.xml.sax.*;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import jp.co.yobrain.util.jdbc.DataSourceMaker;


import jp.co.lastminute.maintenance.Tool.KNT.AllotCommander;
import jp.co.lastminute.maintenance.Tool.KNT.AllotCommandException;
import jp.co.lastminute.maintenance.Tool.KNT.DateUtil;

/**
 * @author skondo
 *
 * To change the template for this generated type comment go to
 * Window>Preferences>Java>Code Generation>Code and Comments
 */
public class KNTCommander extends AllotCommander{
	private Document dom;
	private String resultXML;

	public Object doCommand() throws AllotCommandException{
		doWork();
		return null;
	}

	private void doWork() throws AllotCommandException{
//		Properties conf  = getConf();
		Properties paramProp = new Properties();

		paramProp.setProperty("protocol","http");
		paramProp.setProperty("host","shop.knt.co.jp");
		paramProp.setProperty("port","80");
		paramProp.setProperty("file_name","/asp-bin/lmj/3121.asp");
		this.setResultXML( new HostConnector().getDataFromHost(paramProp));
		setDom();
		doUpdate();
	}

	public void setDom() throws AllotCommandException {
		//Make Reader with xmlString which is new xml String
		StringReader sr = new StringReader(this.getResultXML());
		//make InputSource with StringReader of xml String
		InputSource is = new InputSource(sr);

		DocumentBuilderFactory factory =
		DocumentBuilderFactory.newInstance();
		DocumentBuilder builder = null;
		Document doc = null;
		try{
			builder = factory.newDocumentBuilder();
			this.dom = builder.parse( is );
			Node root = dom.getDocumentElement();
		} catch (SAXException sxe) {
		   // Error generated during parsing)
		   Exception  x = sxe;
		   if (sxe.getException() != null)
			   x = sxe.getException();
		   x.printStackTrace();
		   throw new AllotCommandException("Exception is occured during making XMLDOM",sxe);

		} catch (ParserConfigurationException pce) {
			// Parser with specified options can't be built
			pce.printStackTrace();
			throw new AllotCommandException("Exception is occured during making XMLDOM",pce);

		} catch (IOException ioe) {
		   // I/O error
		   ioe.printStackTrace();
		   throw new AllotCommandException("Exception is occured during making XMLDOM",ioe);
		}

	}

	protected void doUpdate() throws AllotCommandException{
		java.util.List dataList = makeDataList();
		PreparedStatement stmt = null;
		Connection conn = null;
    System.out.println("arrays = " + dataList.size());
		try{
			DataSourceMaker maker = new DataSourceMaker();
			maker.init();
			DataSource dss = maker.getDatasource();
			conn = dss.getConnection();
			stmt = conn.prepareStatement(getUpdateSQL());
			if(conn != null){
				conn.setAutoCommit(false);
				int respectedRowCnt = 0;

				HostData hostData = null;
				for(int i = 0; i < dataList.size(); i++){
					hostData = (HostData)dataList.get(i);
					stmt.setInt(1,hostData.getHavealt());
					stmt.setString(2,hostData.getSupnbr());
					stmt.setInt(3,Integer.parseInt(hostData.getAltdat()));
					stmt.setString(4,hostData.getRoom_type());

					if( stmt.executeUpdate() == Statement.EXECUTE_FAILED ){
						conn.rollback();
					}else{
						conn.commit();
					}
				}
				conn.close();
			}
		}catch(SQLException e){
			try{
				if(conn != null){
					conn.close();
				}
			}catch(SQLException ee){
				ee.printStackTrace();
			}throw new AllotCommandException("SQLException is occured ", e);
		}finally{
			try{
				if(stmt != null ) stmt.close();
				if(conn != null){
					conn.close();
				}
			}catch(java.sql.SQLException e){
				e.printStackTrace();
			}
		}

	}

	protected String getUpdateSQL(){
		StringBuffer sb = new StringBuffer();
		sb.append("UPDATE WEBALTP ");
		sb.append(" SET havealt  = ? ");
		sb.append(" , LAST_DAY  = 2 ");
		sb.append(" ,UP_DATE = sysdate ");
    sb.append(" WHERE agt_cd = \'KNT\'");
    sb.append(" AND supnbr = ?");
		sb.append(" AND altdat = ? ");
		sb.append(" AND room_type = ?");
		return sb.toString();
	}


	protected List makeDataList(){
		List dataList = new ArrayList();
		Node dataElementNode = getNode("NNNN|DATA");
		NodeList nodelist = dataElementNode.getChildNodes();
		Node childNode = null;
		Node dataNode = null;
		HostData hostDataTemp = null;
		HostData hostData = null;
		int doNotUpdateCnt = 0;

		String allotNumParam = null;
		int type = 0;
		for (int i=0;i<nodelist.getLength();i++ ){

			childNode = nodelist.item(i);
			type =childNode.getNodeType();
			if(childNode.getNodeName().equals("TTTT")){
				dataNode = getChildNode(dataElementNode,"TTTT",i);
				if(dataNode != null){
					hostDataTemp = new HostData();
					hostDataTemp.setSupnbr(dataNode.getChildNodes().item(0).getNodeValue());
				}
				continue;
			}

			if(childNode.getNodeName().equals("CCCC")){
				dataNode = getChildNode(dataElementNode,"CCCC",i);
				if(dataNode != null){
					hostDataTemp.setKind(dataNode.getChildNodes().item(0).getNodeValue());
				}
				continue;
			}

			if(childNode.getNodeName().equals("PPPP")){
				dataNode = getChildNode(dataElementNode,"PPPP",i);
				if(dataNode != null){
					hostDataTemp.setRoom_type(dataNode.getChildNodes().item(0).getNodeValue());
				}
				continue;
			}

			if(childNode.getNodeName().equals("ZZZZ")){
				dataNode = getChildNode(dataElementNode,"ZZZZ",i);
				if(dataNode != null){
					allotNumParam = dataNode.getChildNodes().item(0).getNodeValue();
					for(int x =0 ; x < 6; x++)	{
						if(allotNumParam.substring(x,x+1).toUpperCase().equals("X")){
							doNotUpdateCnt++;

							hostData = new HostData();
							hostData.setSupnbr(hostDataTemp.getSupnbr());
							hostData.setKind(hostDataTemp.getKind());
							hostData.setAltdat(
								DateUtil.dateFormat(
								DateUtil.calculate(Calendar.DATE,x),"yyyyMMdd")
								);
							dataList.add(hostData);
							hostData.setRoom_type(hostDataTemp.getRoom_type());
							hostData.setAllotNum("0");
						}else{
							hostData = new HostData();
							hostData.setSupnbr(hostDataTemp.getSupnbr());
							hostData.setKind(hostDataTemp.getKind());
							hostData.setAltdat(
								DateUtil.dateFormat(
								DateUtil.calculate(Calendar.DATE,x),"yyyyMMdd")
								);
							dataList.add(hostData);
							hostData.setRoom_type(hostDataTemp.getRoom_type());
							hostData.setAllotNum(allotNumParam.substring(x,x+1));

							//DEBUGER.debug(hostData);
						}
					}
					continue;
				}
			}

		}
		//RESULTER.info("アップデート除外件数 : "+doNotUpdateCnt);
		return dataList;
	}

	protected Node getNode(String elementName){
		StringTokenizer elTokener = new StringTokenizer(elementName, "|");
		Node returnedNode = null;
		String elName = "";
		while(elTokener.hasMoreElements()){
			if(returnedNode == null)
				returnedNode = this.dom.getDocumentElement();
			elName =elTokener.nextToken();
			returnedNode =  getChildNode(returnedNode,elName);
		}//end of while
		return returnedNode;
	}
	/**
	 * <blockquote><pre>
	 * <root>
	 * 		<abc>結果</abc>
	 * </root>
	 * </blockquote>
	 * abcの値を読み取るためにroot|abcのように
	 * ｜でelementを区別する。
	 *
	 * @param elementName to get value（｜でelelmentを区別する。）　
	 * @return value of elementName
	 */
	public String getElementValue(String elementName){
		String value = null;
		StringTokenizer elTokener = new StringTokenizer(elementName, "|");
		Node returnedNode = null;
		String elName = "";
		while(elTokener.hasMoreElements())	{
			if(returnedNode == null)
				returnedNode = this.dom.getDocumentElement();
			elName =elTokener.nextToken();
			returnedNode =  getChildNode(returnedNode,elName);
		}//end of while
		value =returnedNode.getChildNodes().item(0).getNodeValue();
		return value;
	}

	protected Node getChildNode(Node node, String elementName){
		return getChildNode(node,elementName,0);
	}

	protected Node getChildNode(Node node, String elementName, int startIndex){
		if (node == null){
			return null;
		}
		NodeList nodelist = node.getChildNodes();
		for (int i=startIndex ;i<nodelist.getLength();i++ ){
			if(nodelist.item(i).getNodeName().equals(elementName))
				return nodelist.item(i);
		}
		return null;
	}


	public Document getDom(){ return dom; }
	public String getResultXML(){ return resultXML; }
	public void setResultXML(String resultXML){ this.resultXML = resultXML; }

	/* Result XML example
	<?xml version="1.0" encoding="Shift-JIS"?>
	<NNNN>
		<HEAD>
			<SSSS>200207291130</SSSS>
			<KKKK>20020729</KKKK>
		</HEAD>
		<DATA>
			<TTTT>0030015</TTTT>
			<CCCC>2918</CCCC>
			<PPPP>A</PPPP>
			<MMMM>00</MMMM>
			<ZZZZ>001010</ZZZZ>
		</DATA>
		<FFFF>
			<DDDD>00488</DDDD>
		</FFFF>
	</NNNN>
	*/
}
