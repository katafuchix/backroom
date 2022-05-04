/*
 * Created on 2003/06/16
 *
 * To change the template for this generated file go to
 * Window>Preferences>Java>Code Generation>Code and Comments
 */
package jp.co.lastminute.maintenance.Tool.KNT;

//import java.sql.*;
import java.util.*;
import java.io.*;

//import javax.servlet.*;
//import javax.servlet.jsp.PageContext;
//import javax.servlet.ServletContext;

import javax.sql.DataSource;
import jp.co.yobrain.util.jdbc.DataSourceMaker;
import jp.co.lastminute.maintenance.Tool.KNT.AllotCommandException;


public  class AllotCommander {

    protected DataSource dataSource = null;
    protected Object condition;
    private Properties conf;

    public DataSource getDataSource(){ return dataSource; }

    public void setDataSource(DataSource dataSource){ this.dataSource = dataSource; }

    public AllotCommander()
    {
    }

    public void init() throws AllotCommandException{
//        initConf();
        initDataSource();

    }

    public void initConf() throws AllotCommandException{
		DataSourceMaker dsm = new DataSourceMaker();
		dsm.init();
		try{
            //DEBUGER.debug(AllotConstants.CONF_FILE_NAME);
        	InputStream confIS =this.getClass().getResourceAsStream(AllotConstants.CONF_FILE_NAME);
			Properties prop = new Properties();
            prop.load(confIS);
            setConf(prop);
            //DEBUGER.info(this.conf);
		}catch(IOException e){
            String msg = "Can not load "+AllotConstants.CONF_FILE_NAME
                + "Confirm the file is located at /WEB-INF/classes/"+
                "jp/co/lastminute/maintenance/hotel/allot";
            //ERROR.error(msg);
		}

    }

	public void initDataSource()  throws AllotCommandException{
		DataSourceMaker dsm = new DataSourceMaker();
		dsm.init();
        this.dataSource = dsm.getDatasource();
		if(this.dataSource == null)
		{
            String msg = "Can not initialize DataSource";
            //ERROR.error(msg);
            throw new AllotCommandException(msg);
		}
    }

	public Object doCommand(String commanderName)
        throws AllotCommandException
    {
        return doCommand(commanderName,null);
    }
	public Object doCommand(String commanderName,Object condition)
        throws AllotCommandException{
		//DEBUGER.debug("Do Command : "+commanderName);
        try{
            this.init();
            Class _clazz = Class.forName(commanderName);
            AllotCommander _commander =
                (AllotCommander)_clazz.newInstance();
            _commander.setConf(getConf());
            _commander.setDataSource(this.dataSource);
            _commander.setCondition(condition);
            return _commander.doCommand();

        }catch(java.lang.IllegalAccessException jli){
            String msg = "InstantiationException is occured :"+ commanderName;
            //ERROR.error(msg);
            throw new AllotCommandException(msg,jli);
        }
        catch(java.lang.InstantiationException jli2)
        {
             String msg = "InstantiationException is occured :"+ commanderName;
            //ERROR.error(msg);
            throw new AllotCommandException(msg,jli2);
        }
        catch(ClassNotFoundException cnfe)
        {
             String msg = "InstantiationException is occured :"+ commanderName;
            //ERROR.error(msg);
            throw new AllotCommandException(msg,cnfe);
        }
    }

    public Object doCommand() throws AllotCommandException{ return null;}
    public Object getCondition(){ return condition; }

    public void setCondition(Object condition){ this.condition = condition; }

    public static void main(String[] args){

        try{
			AllotCommander ac = new AllotCommander();
        }catch(Exception e){
			e.printStackTrace();
        }
    }

    public Properties getConf(){ return conf; }

    public void setConf(Properties conf){ this.conf = conf; }
}

