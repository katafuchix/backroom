/*
 * Created on 2003/06/16
 *
 * To change the template for this generated file go to
 * Window>Preferences>Java>Code Generation>Code and Comments
 */
package jp.co.lastminute.maintenance.Tool.KNT;

import java.util.*;
import java.io.*;
import java.net.*;

/**
 * @author skondo
 *
 * To change the template for this generated type comment go to
 * Window>Preferences>Java>Code Generation>Code and Comments
 */
public class HttpsHostConnector {
	public String getDataFromHost(Properties paramProp)
		throws AllotCommandException{
		StringBuffer resultStringSB = new StringBuffer();
		try{
			String protocol = paramProp.getProperty("protocol");
			String host = paramProp.getProperty("host");
			int port=Integer.parseInt(paramProp.getProperty("port"));
			String fileName = paramProp.getProperty("file_name");
			
			System.getProperties().put("http.keepAlive", "true");
			String tomcatHost = protocol+"://"+host;
			String urlStr = tomcatHost + fileName;
			URL url = new URL(urlStr);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setDoOutput(false);
			con.setDoInput(true);
			con.setRequestMethod("GET");
			con.setRequestProperty("accept_language", "ja");
			con.setRequestProperty("user-agent", "Mozilla/4.0 (compatible; MSIE 5.01; Windows NT 5.0)");
			con.setRequestProperty("referer", "index.html");
			// Read the response
			BufferedReader in = new BufferedReader(
				new InputStreamReader(con.getInputStream(),"SJIS"));

			String line = null;
			while (true){
				line = in.readLine();
				if (line == null) break;
				resultStringSB.append(line);
				resultStringSB.append(AllotConstants.CRLF);

			}
			in.close();
			con.disconnect();
		}catch(IOException ioe){
			throw new AllotCommandException("IOException: ",ioe);
		}
		return makeDataFile(resultStringSB.toString(),paramProp);
	}//

	protected String makeDataFile(String dataStr,Properties pramProp){
		String directory = pramProp.getProperty("write_file_dir");
		File file = new File(directory);
		String fileName = DateUtil.dateFormat(new Date(),"yyyyMMddHHmm")+".dat";
		file.mkdirs();
		FileWriter fos = null;
		BufferedWriter dos = null;
		try{
			file = new File(directory+System.getProperty("file.separator")+fileName);
			fos = new FileWriter  (file);
			dos = new BufferedWriter (fos);

			dos.write(dataStr);

			dos.flush();
			dos.close();
			fos.close();
		}
		catch(IOException e){
			e.printStackTrace();
		}finally{
			try{
				if(fos != null) fos.close();
				if(dos != null) dos.close();
			}catch(IOException e){
			 }
		}//end of try
		return directory+System.getProperty("file.separator")+fileName;
	}
}
