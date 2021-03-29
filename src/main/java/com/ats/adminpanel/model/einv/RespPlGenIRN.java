package com.ats.adminpanel.model.einv;

import java.util.List;

//Response class for Einv Gen Response
public class RespPlGenIRN {
	
	public String AckNo  ;
    public String AckDt ;
    public String Irn;
    public String SignedInvoice ;
    public String SignedQRCode ;
    public String Status;
    public String EwbNo;
    public String EwbDt;
    public String EwbValidTill;
    public RespGenIRNInvData ExtractedSignedInvoiceData;
    public RespGenIRNInvData Data; //Main Response..
    
    public List<RespErrDetailsPl> ErrorDetails ;
    
    
    public List<RespErrDetailsPl> getErrorDetails() {
		return ErrorDetails;
	}
	public void setErrorDetails(List<RespErrDetailsPl> errorDetails) {
		ErrorDetails = errorDetails;
	}
	public RespGenIRNQrCodeData ExtractedSignedQrCode;
    public String QrCodeImage;
    public String JwtIssuer;
	public String getAckNo() {
		return AckNo;
	}
	public void setAckNo(String ackNo) {
		AckNo = ackNo;
	}
	public String getAckDt() {
		return AckDt;
	}
	public void setAckDt(String ackDt) {
		AckDt = ackDt;
	}
	public String getIrn() {
		return Irn;
	}
	public void setIrn(String irn) {
		Irn = irn;
	}
	public String getSignedInvoice() {
		return SignedInvoice;
	}
	public void setSignedInvoice(String signedInvoice) {
		SignedInvoice = signedInvoice;
	}
	public String getSignedQRCode() {
		return SignedQRCode;
	}
	public void setSignedQRCode(String signedQRCode) {
		SignedQRCode = signedQRCode;
	}
	public String getStatus() {
		return Status;
	}
	public void setStatus(String status) {
		Status = status;
	}
	public String getEwbNo() {
		return EwbNo;
	}
	public void setEwbNo(String ewbNo) {
		EwbNo = ewbNo;
	}
	public String getEwbDt() {
		return EwbDt;
	}
	public void setEwbDt(String ewbDt) {
		EwbDt = ewbDt;
	}
	public String getEwbValidTill() {
		return EwbValidTill;
	}
	public void setEwbValidTill(String ewbValidTill) {
		EwbValidTill = ewbValidTill;
	}
	public RespGenIRNInvData getExtractedSignedInvoiceData() {
		return ExtractedSignedInvoiceData;
	}
	public void setExtractedSignedInvoiceData(RespGenIRNInvData extractedSignedInvoiceData) {
		ExtractedSignedInvoiceData = extractedSignedInvoiceData;
	}
	public RespGenIRNQrCodeData getExtractedSignedQrCode() {
		return ExtractedSignedQrCode;
	}
	public void setExtractedSignedQrCode(RespGenIRNQrCodeData extractedSignedQrCode) {
		ExtractedSignedQrCode = extractedSignedQrCode;
	}
	public String getQrCodeImage() {
		return QrCodeImage;
	}
	public void setQrCodeImage(String qrCodeImage) {
		QrCodeImage = qrCodeImage;
	}
	public String getJwtIssuer() {
		return JwtIssuer;
	}
	public void setJwtIssuer(String jwtIssuer) {
		JwtIssuer = jwtIssuer;
	}
	@Override
	public String toString() {
		return "RespPlGenIRN [AckNo=" + AckNo + ", AckDt=" + AckDt + ", Irn=" + Irn + ", SignedInvoice=" + SignedInvoice
				+ ", SignedQRCode=" + SignedQRCode + ", Status=" + Status + ", EwbNo=" + EwbNo + ", EwbDt=" + EwbDt
				+ ", EwbValidTill=" + EwbValidTill + ", ExtractedSignedInvoiceData=" + ExtractedSignedInvoiceData
				+ ", Data=" + Data + ", ErrorDetails=" + ErrorDetails + ", ExtractedSignedQrCode="
				+ ExtractedSignedQrCode + ", QrCodeImage=" + QrCodeImage + ", JwtIssuer=" + JwtIssuer + ", InfoDtls="
				+ InfoDtls + "]";
	}
	public RespGenIRNInvData getData() {
		return Data;
	}
	public void setData(RespGenIRNInvData data) {
		Data = data;
	}
	
	  public List<RespInfoDtlsPl> InfoDtls;


	public List<RespInfoDtlsPl> getInfoDtls() {
		return InfoDtls;
	}
	public void setInfoDtls(List<RespInfoDtlsPl> infoDtls) {
		InfoDtls = infoDtls;
	}
	  
	  
	  
    
    
}
