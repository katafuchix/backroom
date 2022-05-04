package jp.co.lastminute.maintenance.Tool.Gift;

import java.io.*;
import java.util.*;
import jp.co.yobrain.util.dbDataAccesser;
import jp.co.yobrain.util.jdbc.*;
import jp.co.yobrain.util.DataFormat;

import jp.co.lastminute.maintenance.detail.*;
import jp.co.lastminute.maintenance.*;
import jp.co.lastminute.maintenance.util.*;
import jp.co.lastminute.ContextProperty;

import javax.sql.DataSource;

/**
 * @author user
 *
 * To change this generated comment edit the template variable "typecomment":
 * Window>Preferences>Java>Templates.
 * To enable and disable the creation of type comments go to
 * Window>Preferences>Java>Code Generation.
 */
public class GiftXml_Writer {
	private static int row_size_ = 100;
	private int size = 100;
	private int seq_no = 0;
	private DataSource dataSource = null;
	private JdbcAdapter db = null;
	private DataFormat df = null;
	private Vector temp = null;
	
	public static void main(String[] args) throws IOException{
		//データソース取得
		DataSourceMaker maker = new DataSourceMaker();
		int num = 0;
		maker.init();
		//
		boolean stop = true;
		//while(stop){
		GiftXml_Writer handler = new GiftXml_Writer( maker.getDatasource() );
		handler.setList();
		handler.StartMoving( );
		//
		if(handler.getTempSize() == 0 ){
			stop = false;
		}
		//終る
		handler.distroy();
		handler = null;
		//}
		maker.distroy();
	}
	/**
	 * サイズの取得
	 */
	public int getTempSize(){
		return temp.size();
	}
	/**
	 * データソースの初期化
	 */
	public GiftXml_Writer( DataSource dataSource ){
		this.dataSource = dataSource;
		db = new JdbcAdapter();
		temp = new Vector( );
	}
	/**
	 * 破棄
	 */
	public void distroy(){
		this.db = null;
		this.dataSource = null;
		this.temp = null;
	}
	/**
	 * ここがメイン
	 */
	public void StartMoving(){
		System.err.println("getTempSize(): " + getTempSize() );
		//for(int i=0; i<getTempSize(); i++){
		for(int i=0; i<row_size_; i++){		
			System.out.println(i);
			HandlerCondition condition = (HandlerCondition)temp.get( i );
			System.err.println( updateGift( condition ) );
			//( updateWebaltp() );
		}
	}
	/**
	 * リストをセレクトする
	 */
	public void setList(){
		try{
			if( db.init( this.dataSource ) ){
				String sql = "SELECT JAN_CD FROM CALLEGEPRODUCT_TBL";
				Vector rows = db.dbSelect( sql );
				dbDataAccesser acceser = new dbDataAccesser( rows );
				for(int i=0; i<rows.size(); i++ ){
					HandlerCondition condition = new HandlerCondition();
					condition.product_seq = acceser.getData( i, 0 );
					temp.add( condition );
					condition = null;
				}
			}
					
		}catch(Exception ex){	
			ex.printStackTrace();
		}
	}
	public boolean updateGift( HandlerCondition condition ){
		try{
			Gift detail = new Gift( this.dataSource  );
			dbDataAccesser acceess = detail.getDetail( condition );
			String xmlstr = detail.generateXml( acceess );
			XML2File xml2file = new XML2File();
			String contextname =
				ContextProperty.basepath
				 + ContextProperty._gift_product_Dir
				 + "/" + condition.product_seq + ".xml";
			xml2file.write( xmlstr , contextname);
			return true;
		}catch(Exception ex){	
			ex.printStackTrace();
		}
		return false;
	}
}
