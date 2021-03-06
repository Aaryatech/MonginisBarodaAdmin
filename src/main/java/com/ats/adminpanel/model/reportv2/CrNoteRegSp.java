package com.ats.adminpanel.model.reportv2;


import com.fasterxml.jackson.annotation.JsonFormat;

public class CrNoteRegSp {
	
	private int crndId;
	
	
	public int getCrndId() {
		return crndId;
	}

	public void setCrndId(int crndId) {
		this.crndId = crndId;
	}

	private String hsnCode;
	
	private int crnId;
	private String crnDate;
	private String invoiceNo;
	private String billDate;
	private String frName;
	private String frCode;
	private String frGstNo;
	private float crnQty;
	private float crnTaxable;
	
	
	private float cgstPer;
	private float sgstPer;
	private float igstPer;
	
	private float cgstAmt;
	private float sgstAmt;
	private float igstAmt;
	
	private float crnAmt;

	public String getHsnCode() {
		return hsnCode;
	}

	public void setHsnCode(String hsnCode) {
		this.hsnCode = hsnCode;
	}

	public int getCrnId() {
		return crnId;
	}

	public void setCrnId(int crnId) {
		this.crnId = crnId;
	}
	public String getCrnDate() {
		return crnDate;
	}

	public void setCrnDate(String crnDate) {
		this.crnDate = crnDate;
	}

	public String getInvoiceNo() {
		return invoiceNo;
	}

	public void setInvoiceNo(String invoiceNo) {
		this.invoiceNo = invoiceNo;
	}
	public String getBillDate() {
		return billDate;
	}

	public void setBillDate(String billDate) {
		this.billDate = billDate;
	}

	public String getFrName() {
		return frName;
	}

	public void setFrName(String frName) {
		this.frName = frName;
	}

	public String getFrCode() {
		return frCode;
	}

	public void setFrCode(String frCode) {
		this.frCode = frCode;
	}

	public String getFrGstNo() {
		return frGstNo;
	}

	public void setFrGstNo(String frGstNo) {
		this.frGstNo = frGstNo;
	}

	public float getCrnQty() {
		return crnQty;
	}

	public void setCrnQty(float crnQty) {
		this.crnQty = crnQty;
	}

	public float getCrnTaxable() {
		return crnTaxable;
	}

	public void setCrnTaxable(float crnTaxable) {
		this.crnTaxable = crnTaxable;
	}

	public float getCgstPer() {
		return cgstPer;
	}

	public void setCgstPer(float cgstPer) {
		this.cgstPer = cgstPer;
	}

	public float getSgstPer() {
		return sgstPer;
	}

	public void setSgstPer(float sgstPer) {
		this.sgstPer = sgstPer;
	}

	public float getIgstPer() {
		return igstPer;
	}

	public void setIgstPer(float igstPer) {
		this.igstPer = igstPer;
	}

	public float getCgstAmt() {
		return cgstAmt;
	}

	public void setCgstAmt(float cgstAmt) {
		this.cgstAmt = cgstAmt;
	}

	public float getSgstAmt() {
		return sgstAmt;
	}

	public void setSgstAmt(float sgstAmt) {
		this.sgstAmt = sgstAmt;
	}

	public float getIgstAmt() {
		return igstAmt;
	}

	public void setIgstAmt(float igstAmt) {
		this.igstAmt = igstAmt;
	}

	public float getCrnAmt() {
		return crnAmt;
	}

	public void setCrnAmt(float crnAmt) {
		this.crnAmt = crnAmt;
	}

	@Override
	public String toString() {
		return "CrNoteRegSp [crndId=" + crndId + ", hsnCode=" + hsnCode + ", crnId=" + crnId + ", crnDate=" + crnDate
				+ ", invoiceNo=" + invoiceNo + ", billDate=" + billDate + ", frName=" + frName + ", frCode=" + frCode
				+ ", frGstNo=" + frGstNo + ", crnQty=" + crnQty + ", crnTaxable=" + crnTaxable + ", cgstPer=" + cgstPer
				+ ", sgstPer=" + sgstPer + ", igstPer=" + igstPer + ", cgstAmt=" + cgstAmt + ", sgstAmt=" + sgstAmt
				+ ", igstAmt=" + igstAmt + ", crnAmt=" + crnAmt + "]";
	}

}
