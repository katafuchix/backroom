/*
 * Created on 2003/06/16
 *
 * To change the template for this generated file go to
 * Window>Preferences>Java>Code Generation>Code and Comments
 */
package jp.co.lastminute.maintenance.Tool.KNT;

/**
 * @author skondo
 *
 * To change the template for this generated type comment go to
 * Window>Preferences>Java>Code Generation>Code and Comments
 */
public class KNTUpdater{
	public static void main(String args[]){
		AllotCommander ac = new AllotCommander();
		try{
			ac.doCommand(AllotConstants.KNTCommander);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}