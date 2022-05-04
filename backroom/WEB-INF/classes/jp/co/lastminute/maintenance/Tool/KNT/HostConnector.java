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
public class HostConnector {


	public String getDataFromHost(Properties paramProp)
		throws AllotCommandException{
		String dataString = "";
		try{
			String protocol = paramProp.getProperty("protocol");
			String host = paramProp.getProperty("host");
			int port=Integer.parseInt(paramProp.getProperty("port"));
			String fileName = paramProp.getProperty("file_name");

			URL dataURL = new URL(protocol, host, port, fileName);
			URLConnection connection = dataURL.openConnection();
			connection.setUseCaches(false);
			connection.setDoOutput(true);

			ByteArrayOutputStream byteStream =
				new ByteArrayOutputStream(512); // Grows if necessary

			// Stream that writes into buffer
			PrintWriter outt = new PrintWriter(byteStream, true);
			outt.flush(); // Flush since above used print, not println

			// POST requests are required to have Content-Length
			String lengthString =
				String.valueOf(byteStream.size());
			connection.setRequestProperty
				("Content-Length", lengthString);
			connection.setRequestProperty
				("Content-Type", "application/x-www-form-urlencoded");
			// Write POST data to real output stream
			byteStream.writeTo(connection.getOutputStream());

			BufferedReader in =
				new BufferedReader(new InputStreamReader
				(connection.getInputStream()));
			String line = null;
			String linefeed = "\n";
			while((line = in.readLine()) != null){
				dataString += line;
				//System.out.println(dataString);
			}
		}
		catch(IOException ioe){
			// Print debug info in Java Console
			throw new AllotCommandException("IOException: ",ioe);
		}
		return dataString;
	}//

}
