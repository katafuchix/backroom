package jp.co.lastminute.maintenance.hotel.allot;

import java.util.*;
import java.io.*;

public class NtaAllotUpdate
{
  private NtaAllotInvoker invoker;
  private NtaAllotDbm dbm;
  private HttpFiler filer;
  private String ntaCSVgetUrl = "";
  private String ntaCSVcommitUrl = "";
  private String readFileName = "";
  private boolean onlineFlag = true;
  private static String agentName = "";
  private static String agentFile = "";
  private static final String NTASETTING = "jp.co.lastminute.maintenance.hotel.allot.resources.ntasetting";

	public NtaAllotUpdate(){}
  public static void main(String[] args)
  {
    if(args.length > 0) agentName = args[0];
    if(args.length > 1) agentFile = args[1];
    NtaAllotUpdate ntains = new NtaAllotUpdate();
    ntains.init();
    ntains.execute();
    ntains.fin();
  }
  // ��������
  private void init(){
    invoker = new NtaAllotInvoker();
    dbm = new NtaAllotDbm();
    filer = new HttpFiler();

    dbm.init();
    invoker.init(dbm);
    try {
      ResourceBundle res = ResourceBundle.getBundle(NTASETTING, Locale.getDefault());
      readFileName = res.getString("FILENAME");
      ntaCSVgetUrl = res.getString("CVSGETURL");
      ntaCSVcommitUrl = res.getString("CVSCOMMITURL");
      // �j�m�s�̏ꍇ�̓��[�J���t�@�C�����璼�ڃ��[�h
      if(agentName.equals("KNT") || agentName.equals("knt")){
        readFileName = res.getString("KNT_FILENAME");
        onlineFlag = false;
      }
      // �I�t���C���t�@�C�����[�h
      if(agentName.equals("OFFLINE")){
        readFileName = agentFile;
        onlineFlag = false;
      }
      // �I�����C���_�E�����[�h
      if(onlineFlag == true){
        filer.setOutFilename(readFileName);
        filer.action(ntaCSVgetUrl);
      }
    } catch(Exception e){
      logs(e, "Exit 1");
      System.exit(1);
    }
  }
  //�@�又��
  private void execute(){
    try {
      invoker.createPrductList();
      invoker.updateWebAltp(readFileName);
      invoker.updateProductAltp();
    } catch(Exception e){
      logs(e, "Exit 2");
      System.exit(2);
    }
  }
  //�@�㏈��
  private void fin(){
    dbm.release();
    dbm = null;
    invoker.release();
    invoker = null;
    // �g�����U�N�V�����I���ʒm
    if(onlineFlag == true){
      filer.setOutFilename("recive.dat");
      try {
        filer.action(ntaCSVcommitUrl);
      } catch(Exception e){
        logs(e);
      }
    }
  }
  // logs
  public static void logs(Exception ex){
    logs(ex, null);
  }
  public static void logs(String msg){
    logs(null, msg);
  }
  public static void logs(Exception ex, String msg){
    try {
      PrintWriter fw = new PrintWriter(new FileWriter("nta.log", true));
      fw.write(new Date().toString() + "\n");
      if(ex != null) ex.printStackTrace(fw);
      if(msg != null) fw.write(msg + "\n");
      fw.close();
    } catch(Exception e){}
  }
}