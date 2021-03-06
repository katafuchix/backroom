/*
 * Agent.java
 *
 * Created on 2002/06/19, 11:54
 */

package jp.co.lastminute.supply;

import java.io.*;

/**
 *
 * @author  skondo
 * @version 
 */
public class Agent implements Serializable{
    /**
     *
     *
     ///// agent_tbl
    AGT_CD                                    NOT NULL VARCHAR2(4)
    TEL_NO                                             VARCHAR2(20)
    FAX                                                VARCHAR2(20)
    E_MAIL                                    NOT NULL VARCHAR2(120)
    FIRST_NAME                                         VARCHAR2(30)
    LASTNAME                                           VARCHAR2(30)
    POSTAL_CD                                 NOT NULL VARCHAR2(8)
    STATE_CD                                           NUMBER(10)
    CITY_NAME                                          VARCHAR2(24)
    ADDRESS                                            VARCHAR2(80)
     ////agent_member_tbl
     MEMBER_CD                                 NOT NULL NUMBER(6)
     AGT_CD                                    NOT NULL VARCHAR2(4)
     TEL_NO                                             VARCHAR2(20)
     PASSWD                                             VARCHAR2(12)
     FAX                                                VARCHAR2(20)
     E_MAIL                                    NOT NULL VARCHAR2(120)
     FIRST_NAME                                         VARCHAR2(30)
     LASTNAME                                           VARCHAR2(30)
     POSTAL_CD                                 NOT NULL VARCHAR2(8)
     STATE_CD                                           NUMBER(10)
     CITY_NAME                                          VARCHAR2(24)
     ADDRESS                                            VARCHAR2(80)
     */
    /** Creates new Agent */
    
    public Agent() {
    }
    public String AGT_CD = "";
    public String TEL_NO = "";
    public String FAX    = "";
    public String E_MAIL = "";
    public String FIRST_NAME = "";
    public String LASTNAME = "";
    public String POSTAL_CD = "";
    public String STATE_NAME = "";
    public String CITY_NAME = "";
    public String ADDRESS = "";
    public String MAILCOMMENT = "";
    //////////////////////////////
    String lines = "------------------------------------------------------------\n";
    /** ?v???p?e?B AGT_CD ?????????\?b?h?B
     * @return ?v???p?e?B AGT_CD ???l?B
     */
    public String getAGT_CD() {
        return AGT_CD;
    }
    
    /** ?v???p?e?B AGT_CD ?????????\?b?h?B
     * @param AGT_CD ?v???p?e?B AGT_CD ???V?????l?B
     */
    public void setAGT_CD(String AGT_CD) {
        this.AGT_CD = AGT_CD;
    }
    
    /** ?v???p?e?B CITY_NAME ?????????\?b?h?B
     * @return ?v???p?e?B CITY_NAME ???l?B
     */
    public String getCITY_NAME() {
        return CITY_NAME;
    }
    
    /** ?v???p?e?B CITY_NAME ?????????\?b?h?B
     * @param CITY_NAME ?v???p?e?B CITY_NAME ???V?????l?B
     */
    public void setCITY_NAME(String CITY_NAME) {
        this.CITY_NAME = CITY_NAME;
    }
    
    /** ?v???p?e?B E_MAIL ?????????\?b?h?B
     * @return ?v???p?e?B E_MAIL ???l?B
     */
    public String getE_MAIL() {
        return E_MAIL;
    }
    
    /** ?v???p?e?B E_MAIL ?????????\?b?h?B
     * @param E_MAIL ?v???p?e?B E_MAIL ???V?????l?B
     */
    public void setE_MAIL(String E_MAIL) {
        this.E_MAIL = E_MAIL;
    }
    
    /** ?v???p?e?B FAX ?????????\?b?h?B
     * @return ?v???p?e?B FAX ???l?B
     */
    public String getFAX() {
        return FAX;
    }
    
    /** ?v???p?e?B FAX ?????????\?b?h?B
     * @param FAX ?v???p?e?B FAX ???V?????l?B
     */
    public void setFAX(String FAX) {
        this.FAX = FAX;
    }
    
    /** ?v???p?e?B FIRST_NAME ?????????\?b?h?B
     * @return ?v???p?e?B FIRST_NAME ???l?B
     */
    public String getFIRST_NAME() {
        return FIRST_NAME;
    }
    
    /** ?v???p?e?B FIRST_NAME ?????????\?b?h?B
     * @param FIRST_NAME ?v???p?e?B FIRST_NAME ???V?????l?B
     */
    public void setFIRST_NAME(String FIRST_NAME) {
        this.FIRST_NAME = FIRST_NAME;
    }
    
    /** ?v???p?e?B STATE_NAME ?????????\?b?h?B
     * @return ?v???p?e?B STATE_NAME ???l?B
     */
    public String getSTATE_NAME() {
        return STATE_NAME;
    }
    
    /** ?v???p?e?B STATE_NAME ?????????\?b?h?B
     * @param STATE_NAME ?v???p?e?B STATE_NAME ???V?????l?B
     */
    public void setSTATE_NAME(String STATE_NAME) {
        this.STATE_NAME = STATE_NAME;
    }
    
    /** ?v???p?e?B TEL_NO ?????????\?b?h?B
     * @return ?v???p?e?B TEL_NO ???l?B
     */
    public String getTEL_NO() {
        return TEL_NO;
    }
    
    /** ?v???p?e?B TEL_NO ?????????\?b?h?B
     * @param TEL_NO ?v???p?e?B TEL_NO ???V?????l?B
     */
    public void setTEL_NO(String TEL_NO) {
        this.TEL_NO = TEL_NO;
    }
    
    /** ?v???p?e?B LASTNAME ?????????\?b?h?B
     * @return ?v???p?e?B LASTNAME ???l?B
     */
    public String getLASTNAME() {
        return LASTNAME;
    }
    
    /** ?v???p?e?B LASTNAME ?????????\?b?h?B
     * @param LASTNAME ?v???p?e?B LASTNAME ???V?????l?B
     */
    public void setLASTNAME(String LASTNAME) {
        this.LASTNAME = LASTNAME;
    }
    
    /** ?v???p?e?B POSTAL_CD ?????????\?b?h?B
     * @return ?v???p?e?B POSTAL_CD ???l?B
     */
    public String getPOSTAL_CD() {
        return POSTAL_CD;
    }
    
    /** ?v???p?e?B POSTAL_CD ?????????\?b?h?B
     * @param POSTAL_CD ?v???p?e?B POSTAL_CD ???V?????l?B
     */
    public void setPOSTAL_CD(String POSTAL_CD) {
        this.POSTAL_CD = POSTAL_CD;
    }
    
    /** ?v???p?e?B ADDRESS ?????????\?b?h?B
     * @return ?v???p?e?B ADDRESS ???l?B
     */
    public String getADDRESS() {
        return ADDRESS;
    }
    
    /** ?v???p?e?B ADDRESS ?????????\?b?h?B
     * @param ADDRESS ?v???p?e?B ADDRESS ???V?????l?B
     */
    public void setADDRESS(String ADDRESS) {
        this.ADDRESS = ADDRESS;
    }
    public String getFooter(){
        String reStr = lines + "[??????]" + this.FIRST_NAME + "\n"
                    + "[???C??]" + this.LASTNAME + "\n"
                    + "[?????n]" + this.getShowPostal() + "\n"
                    + this.STATE_NAME + " " + this.CITY_NAME + " " + this.ADDRESS + "\n"
                    + "[?d?b????]" + this.TEL_NO + "/" + this.FAX + "\n"
                    + lines;
        return reStr;
    }
    public String getShowPostal(){
        if( this.POSTAL_CD.indexOf('-') == -1){
            return this.POSTAL_CD.substring(0, 3) + "-" + this.POSTAL_CD.substring( 3 ); 
        }
        return this.POSTAL_CD;
    }
    
    /** ?v???p?e?B MAILCOMMENT ?????????\?b?h?B
     * @return ?v???p?e?B MAILCOMMENT ???l?B
     */
    public String getMAILCOMMENT() {
        return MAILCOMMENT;
    }
    
    /** ?v???p?e?B MAILCOMMENT ?????????\?b?h?B
     * @param MAILCOMMENT ?v???p?e?B MAILCOMMENT ???V?????l?B
     */
    public void setMAILCOMMENT(String MAILCOMMENT) {
        this.MAILCOMMENT = MAILCOMMENT;
    }
    
}
