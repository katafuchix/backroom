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
public class AllotCommandException extends Exception{
		protected Throwable cause = null;
		protected String errorCode;

		public AllotCommandException(){
			super();
		}

		/**
		* This Constructor calls constuctor whose <code>Exception</code> Constuctor.
		* Constructs an <code>CommandException</code> with the specified detail message.
		* @param msg detail message which cause exception.
		*/
		public AllotCommandException(String msg){
			super(msg);
		}


		/**
		* <pre>
		* This Constructor calls constuctor whose <code>Exception</code> Constuctor
		* and set value of private field cause with <code>Throwable</code> instance
		* cause.
		* Constructs an <code>CommandException</code> with the specified detail message.
		* @param msg detail message which cause exception.
		* @param cause instance of <code>Throwable</code> which made exception.
		*/
		public AllotCommandException(String msg, Throwable cause){
			super(msg);
			this.cause = cause;
		}

	   /**
		 * Returns the value of this <tt>Throwable</tt> object
		 * @return  <code>Throwable</code> value of cause which made exception.
		 */
		public Throwable getCause(){
			return cause;
		}

	   /**
	   * PrintStackTrace
	   */
		public void printStackTrace(){
			super.printStackTrace();
			if(cause != null){
				System.err.println("Cause by: ");
				cause.printStackTrace();
			}
		}

		public String getErrorCode(){ return errorCode; }

		public void setErrorCode(String errorCode){ this.errorCode = errorCode; }

}
