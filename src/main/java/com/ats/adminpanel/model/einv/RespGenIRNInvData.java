package com.ats.adminpanel.model.einv;

import java.util.List;

public class RespGenIRNInvData {
	public long AckNo ;
    public String AckDt ;
    public String Version ;
    public String Irn ;
    public TranDetails TranDtls ;
    public DocSetails DocDtls ;
    public SellerDetails SellerDtls ;

    public BuyerDetails BuyerDtls ;
    public DispatchedDetails DispDtls ;
    public ShippedDetails ShipDtls ;
    public ValDetails ValDtls ;
    public PayDetails PayDtls ;
    public ExpDetails ExpDtls ;
    public RefDetails RefDtls ;
    public List<ItmList> ItemList ;
	public long getAckNo() {
		return AckNo;
	}
	public void setAckNo(long ackNo) {
		AckNo = ackNo;
	}
	public String getAckDt() {
		return AckDt;
	}
	public void setAckDt(String ackDt) {
		AckDt = ackDt;
	}
	public String getVersion() {
		return Version;
	}
	public void setVersion(String version) {
		Version = version;
	}
	public String getIrn() {
		return Irn;
	}
	public void setIrn(String irn) {
		Irn = irn;
	}
	public TranDetails getTranDtls() {
		return TranDtls;
	}
	public void setTranDtls(TranDetails tranDtls) {
		TranDtls = tranDtls;
	}
	public DocSetails getDocDtls() {
		return DocDtls;
	}
	public void setDocDtls(DocSetails docDtls) {
		DocDtls = docDtls;
	}
	public SellerDetails getSellerDtls() {
		return SellerDtls;
	}
	public void setSellerDtls(SellerDetails sellerDtls) {
		SellerDtls = sellerDtls;
	}
	public BuyerDetails getBuyerDtls() {
		return BuyerDtls;
	}
	public void setBuyerDtls(BuyerDetails buyerDtls) {
		BuyerDtls = buyerDtls;
	}
	public DispatchedDetails getDispDtls() {
		return DispDtls;
	}
	public void setDispDtls(DispatchedDetails dispDtls) {
		DispDtls = dispDtls;
	}
	public ShippedDetails getShipDtls() {
		return ShipDtls;
	}
	public void setShipDtls(ShippedDetails shipDtls) {
		ShipDtls = shipDtls;
	}
	public ValDetails getValDtls() {
		return ValDtls;
	}
	public void setValDtls(ValDetails valDtls) {
		ValDtls = valDtls;
	}
	public PayDetails getPayDtls() {
		return PayDtls;
	}
	public void setPayDtls(PayDetails payDtls) {
		PayDtls = payDtls;
	}
	public ExpDetails getExpDtls() {
		return ExpDtls;
	}
	public void setExpDtls(ExpDetails expDtls) {
		ExpDtls = expDtls;
	}
	public RefDetails getRefDtls() {
		return RefDtls;
	}
	public void setRefDtls(RefDetails refDtls) {
		RefDtls = refDtls;
	}
	public List<ItmList> getItemList() {
		return ItemList;
	}
	public void setItemList(List<ItmList> itemList) {
		ItemList = itemList;
	}
	@Override
	public String toString() {
		return "RespGenIRNInvData [AckNo=" + AckNo + ", AckDt=" + AckDt + ", Version=" + Version + ", Irn=" + Irn
				+ ", TranDtls=" + TranDtls + ", DocDtls=" + DocDtls + ", SellerDtls=" + SellerDtls + ", BuyerDtls="
				+ BuyerDtls + ", DispDtls=" + DispDtls + ", ShipDtls=" + ShipDtls + ", ValDtls=" + ValDtls
				+ ", PayDtls=" + PayDtls + ", ExpDtls=" + ExpDtls + ", RefDtls=" + RefDtls + ", ItemList=" + ItemList
				+ "]";
	}
    
}
