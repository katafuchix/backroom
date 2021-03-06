package jp.co.yobrain.util.form.conf;

import java.io.*;
import jp.co.yobrain.util.form.*;

/**
* dbิpNX
*
*/

public class FormCheckTelphone implements FormCheck{

	/**
	* ๘ศตRXgN^
	*/
	public FormCheckTelphone(){
	}

	/**
	* Spl๐ผplษฯทyัฎฉป่
	* @return	CheckError CheckErrorIuWFNg
	* @param	valu	`FbNท้ถ๑
	*/
	synchronized public CheckError convertCheck(String valu, CheckError checkError){
		StringBuffer sb = new StringBuffer( valu );
		StringBuffer msb = new StringBuffer();
		
		char c;
		int counter2 = 0;
		for( int i = 0; i < sb.length() ; i++ ) {
			c = sb.charAt( i );
                        
                        if( c == 0xfffd){
                            checkError.setError(8);
                            checkError.setRstr(valu);
                            return checkError;
			}
                        
			//Sp=>ผpฯท
			if( 0xff10 <= c && c <= 0xff19 ) {
				msb.append(NUMBER.charAt( c - 0xff0d));
				counter2++;
			//ผp
			} else if(0x0030 <= c && c <= 0x0039){
				msb.append(c);
				counter2++;
			//Sp\๐ผp-
			}else if( 0x2010 == c){
				msb.append((char)0x002d);
				counter2++;
			//Sp\๐ผp-
			}else if( 0x2015 == c){
				msb.append((char)0x002d);
				counter2++;
			//Sp\๐ผp-
			}else if( 0x2212 == c){
				msb.append((char)0x002d);
				counter2++;
			//Sp[๐ผp]
			}else if( 0x30fc == c){
				msb.append((char)0x002d);
				counter2++;
			//ผp]
			}else if( 0x002d == c){
				msb.append((char)0x002d);
				counter2++;
			//G[ถ
			} else {
				int num;
				switch (c) {
					case 0x002e:			//Sp D
						num = 1;
						break;
					case 0x002c:			//Sp C
						num = 2;
						break;
					default :				//ปฬผG[ถ
						num = 3;
				}
				checkError.setError(num);
				checkError.setRstr(valu);
				return checkError;
			}
		}
		if(counter2 < 1){
			checkError.setError(3);
			checkError.setRstr(valu);
			return checkError;
		}
		checkError.setRstr(msb.toString());
		return checkError;
	}
}