package com.ats.adminpanel.model.einv;

public class ItmList {

	//public String PrdNm ;
    /// <summary>
    ///Required Parameter - "Serial No. of Item"
    /// </summary>
    public String SlNo ;
    /// <summary>
    /// "Product Description"
    /// </summary>
    public String PrdDesc ;
    /// <summary>
    ///Required Parameter - "Specify whether the supply is service or not. Specify Y-for Service"
    /// </summary>
    public String IsServc ;
    /// <summary>
    ///Required Parameter - "HSN Code"
    /// </summary>
    public String HsnCd ;
    public BatchDetails BchDtls ;
    
   private double TotAmt;
   private double UnitPrice,TotItemVal,GstRt,AssAmt;
   
   
    
    
	public double getTotAmt() {
	return TotAmt;
}
public void setTotAmt(double totAmt) {
	TotAmt = totAmt;
}
public double getUnitPrice() {
	return UnitPrice;
}
public void setUnitPrice(double unitPrice) {
	UnitPrice = unitPrice;
}
public double getTotItemVal() {
	return TotItemVal;
}
public void setTotItemVal(double totItemVal) {
	TotItemVal = totItemVal;
}
public double getGstRt() {
	return GstRt;
}
public void setGstRt(double gstRt) {
	GstRt = gstRt;
}
public double getAssAmt() {
	return AssAmt;
}
public void setAssAmt(double assAmt) {
	AssAmt = assAmt;
}
	public String getSlNo() {
		return SlNo;
	}
	public void setSlNo(String slNo) {
		SlNo = slNo;
	}
	public String getPrdDesc() {
		return PrdDesc;
	}
	public void setPrdDesc(String prdDesc) {
		PrdDesc = prdDesc;
	}
	public String getIsServc() {
		return IsServc;
	}
	public void setIsServc(String isServc) {
		IsServc = isServc;
	}
	public String getHsnCd() {
		return HsnCd;
	}
	public void setHsnCd(String hsnCd) {
		HsnCd = hsnCd;
	}
	public BatchDetails getBchDtls() {
		return BchDtls;
	}
	public void setBchDtls(BatchDetails bchDtls) {
		BchDtls = bchDtls;
	}
	
	private double Qty;
	String Unit;
	
	
	
	
	public double getQty() {
		return Qty;
	}
	public void setQty(double qty) {
		Qty = qty;
	}
	public String getUnit() {
		return Unit;
	}
	public void setUnit(String unit) {
		Unit = unit;
	}
	@Override
	public String toString() {
		return "ItmList [SlNo=" + SlNo + ", PrdDesc=" + PrdDesc + ", IsServc=" + IsServc + ", HsnCd=" + HsnCd
				+ ", BchDtls=" + BchDtls + ", TotAmt=" + TotAmt + ", UnitPrice=" + UnitPrice + ", TotItemVal="
				+ TotItemVal + ", GstRt=" + GstRt + ", AssAmt=" + AssAmt + ", Qty=" + Qty + ", Unit=" + Unit + "]";
	}
	
}
