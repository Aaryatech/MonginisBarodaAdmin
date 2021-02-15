package com.ats.adminpanel.commons;

public class Constants {

	public static final String url = "http://107.180.72.86:8080/barodaApi/";
	// public static final String url="http://localhost:8098/";

	// public static final String url="http://localhost:8097/";

	/*
	 * public static final String fileUploadPath =
	 * "/opt/cpanel/ea-tomcat85/webapps/uploads/baroda/"; public static final String
	 * fileShowPath = "http://107.180.72.86:8080/uploads/baroda/";
	 */

	public static final String fileUploadPath = "/home/lenovo/Documents/baroda/";
	public static final String fileShowPath = "http://localhost:8080/uploads/baroda/";

	public static final String SPCAKE_IMAGE_URL = fileShowPath + "MSPCAKE/";
	public static final String FR_IMAGE_URL = fileShowPath + "FR/";

	public static final String MESSAGE_IMAGE_URL = fileShowPath + "MSG/";

	public static final String ITEM_IMAGE_URL = fileShowPath + "ITEM/";

	public static final String RAW_MAT_IMG_URL = fileShowPath + "RAWMAT/";

	public static final String GATE_ENTRY_IMG_URL = fileShowPath + "GATEENTRY/";

	public static final String GVN_IMAGE_URL = fileShowPath + "GVN/";

	// navigation view

	public static int mainAct = 0;
	public static int subAct = 0;

	public static int FR_IMAGE_TYPE = 1;
	public static int ITEM_IMAGE_TYPE = 2;
	public static int MESSAGE_IMAGE_TYPE = 3;

	public static int SPCAKE_IMAGE_TYPE = 4;

	public static int CUST_CHIOICE_IMAGE_TYPE = 5;

	public static int RAW_MAT_IMAGE_TYPE = 6;

	public static int GATE_ENTRY_IMAGE_TYPE = 7;
	public static String storeUrl = "";

	// public static final String ReportURL = "http://localhost:8985/adminpanel/";
	// public static final String ReportURL =
	// "http://107.180.72.86:8080/barodaAdmin/";// change

	public static final String SETTING_KEY = "PB";

	public static final int DIS_BY_ACC = 7;

	public static final int AP_BY_ACC = 6;

	public static final int DIS_BY_STORE = 5;

	public static final int AP_BY_STORE = 4;

	public static final int AP_BY_GATE = 2;

	public static final int DIS_BY_GATE = 3;
	// public static final String REPORT_SAVE = "/home/lenovo/docs/Report.pdf";

	public static final String REPORT_SAVE = fileShowPath + "Report.pdf";

	public static final String SP_CAKE_FOLDER = fileShowPath + "SPCAKE/";

	public static final String CUST_CHOICE_PHOTO_CAKE_FOLDER = fileShowPath + "CUSTCHOICEPHOTOCAKE/";
	public static final int LOGIS_BILL_PDF_TYPE = 8;
	public static final String LOGIS_BILL_URL = fileShowPath + "MSPCAKE/";

	public static Object FACTORYNAME = "DEVOUR FOODS LLP";
	public static Object FACTORYADDRESS = "Village-Fatehpur,Dist-Patna\n" + "Email: bihar.monginis@gmail.com";

	public static final String FACTORYGSTIN = "-";
	public static final String CITY = "";
	public static final String STATE = "";
	public static final String CODE = "SF";

	public static final String BILL_REPORT_PATH = fileUploadPath + "Bill.pdf";
	public static final String CRN_REPORT_PATH = fileUploadPath + "crn.pdf";
	public static final String FINISHEDGOOD_REPORT_PATH = fileUploadPath + "fsr.pdf";
	public static final String PO_PDF_PATH = fileUploadPath + "po.pdf";
	public static final String SALES_REPORT_PATH = fileUploadPath + "report.pdf";
	// public static final String SALES_REPORT_PATH =
	// "/home/lenovo/docs/Report.pdf";
	public static final String INWARD_PATH = fileUploadPath + "Inward.pdf";
	public static final String LOG_PDF_PATH = fileUploadPath + "logdf.pdf";
	public static final String DISPATCH_PATH = fileUploadPath + "dispatch.pdf";

	public static final int MENU_IMAGE_TYPE = 0;
	public static final String MENU_IMAGE_URL = null;
	public static final String SPHSN = "19059010";

}
