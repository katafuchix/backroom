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
public class HostData {
	private String supnbr;
	private String kind;
	private String allotNum;
	private String altdat;
	private int havealt;
	private String room_type;
	public String getSupnbr(){ return supnbr; }

	public void setSupnbr(String supnbr){ this.supnbr = supnbr; }

	public String getKind(){ return kind; }

	public void setKind(String kind){ this.kind = kind; }

	public String getAllotNum(){ return allotNum; }

	public void setAllotNum(String allotNum){ this.allotNum = allotNum; }

	public String toString(){
		return
			"supnbr : " +supnbr +"\r\n"+
			"kind : " +kind +"\r\n"+
			"havealt : " +havealt +"\r\n"+
			"allotNum : " +allotNum +"\r\n";
	}

	public String getAltdat(){ return altdat; }

	public void setAltdat(String altdat){ this.altdat = altdat; }

	public int getHavealt(){
		int allotNumInt =new Integer(getAllotNum()).intValue();
		if(allotNumInt>0){
			return 0;
		}
		return 1;
	}

	public String getRoom_type(){ return room_type; }

	public void setRoom_type(String room_type){ this.room_type = room_type; }
}
