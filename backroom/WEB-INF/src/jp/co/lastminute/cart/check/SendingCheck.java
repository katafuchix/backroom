package jp.co.lastminute.cart.check;

import java.text.*;
import java.util.*;
import java.sql.*;
import javax.naming.*;
import javax.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import org.apache.struts.action.*;

import jp.co.yobrain.util.*;
import jp.co.yobrain.util.form.*;
import jp.co.yobrain.util.form.Check;

import jp.co.lastminute.cart.*;
import jp.co.lastminute.cart.model.*;
import jp.co.lastminute.cart.rpc.*;
/**
 * @author user
 *
 * To change this generated comment edit the template variable "typecomment":
 * Window>Preferences>Java>Templates.
 * To enable and disable the creation of type comments go to
 * Window>Preferences>Java>Code Generation.
 */
public class SendingCheck implements CheckInterface{

	public SendingCheck(){}
	
	public void init( ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response ){
		this.mapping = mapping;
		this.form = form;
		this.request = request;
        this.response = response;
	}
	synchronized public boolean CancellCheck(){
		return false;
	}
	
	/** Creates new ActivityCheck */
     public void init( ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response, Order orders, ServletContext servletContext ) {
        this.mapping = mapping;
        this.form = form;
        this.request = request;
        this.response = response;
        this.servletContext = servletContext;
        this.errors = new ActionErrors();
        this.orders = orders;
    }
    synchronized public boolean Check(){
    	return false;	
    }
    public ActionErrors getActionErrors(){
        return this.errors;
    }
    public Order getOrder(){
    	return this.orders;	
    }
    public ActionForm getForm(){
    	return this.form;
    }
	
    private ActionMapping mapping;
    private ActionForm form;
    private HttpServletRequest request;
    private HttpServletResponse response;
    private ActionErrors errors;
    private ServletContext servletContext;
    private Order orders;
}
