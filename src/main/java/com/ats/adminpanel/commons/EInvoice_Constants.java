package com.ats.adminpanel.commons;


public class EInvoice_Constants {

//	public static  final String  ASP_ID="1629701119";//madhvi
//	public static  final String  ASP_PWD="pdMulani@123";
	
	public static  final String  ASP_ID="1657201921";//pune
	public static  final String  ASP_PWD="lutffoods123@";
	
	
	public static  final String  GSTIN="34AACCC1596Q002";
	//public static  final String  GSTIN="27ABOFM3012D1ZK";
	
	public static  final String  USER_NAME="TaxProEnvPON";
	public static  final String  EINV_PWD="abc34*";
	public static String AUTH_TOKEN=null;
	public static int QR_CD_SIZE=250;
	
	public static String E_INV_AUTH_TOKEN_URL = "https://gstsandbox.charteredinfo.com/eivital/dec/v"
		+"1.03/auth?aspid="+ASP_ID+"&password="+ASP_PWD+"&Gstin="+GSTIN+"&user_name="+USER_NAME+"&eInvPwd="+EINV_PWD;				
	
	
//	public static String E_INV_AUTH_TOKEN_URL = "https://einvoice1.gst.gov.in/eivital/dec/v"
//			+"1.03/auth?aspid="+ASP_ID+"&password="+ASP_PWD+"&Gstin="+GSTIN+"&user_name="+USER_NAME+"&eInvPwd="+EINV_PWD;				
//		
//	
	/*
	 * public static String GEN_IRN_URL =
	 * "https://gstsandbox.charteredinfo.com/eicore/dec/v1.03/Invoice?" +
	 * "aspid="+ASP_ID+"&password="+ASP_PWD+"&Gstin="+GSTIN+"&AuthToken="+AUTH_TOKEN
	 * +"&user_name="+USER_NAME+ "&QrCodeSize="+QR_CD_SIZE;
	 */
	
	public static String GEN_IRN_URL = "https://gstsandbox.charteredinfo.com/eicore/dec/v1.03/Invoice?"
			+ "aspid="+ASP_ID+"&password="+ASP_PWD+"&Gstin="+GSTIN+"&user_name="+USER_NAME+
			"&QrCodeSize="+QR_CD_SIZE+"&AuthToken=";
		
//	public static String GEN_IRN_URL = "https://einvoice1.gst.gov.in/eicore/dec/v1.03/Invoice?"
//			+ "aspid="+ASP_ID+"&password="+ASP_PWD+"&Gstin="+GSTIN+"&user_name="+USER_NAME+
//			"&QrCodeSize="+QR_CD_SIZE+"&AuthToken=";
	
}
