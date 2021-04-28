package com.ats.adminpanel.model.grngvn;

public class AprQtyGG {
	private int billDetailNo;
	
	private int allAprQty;
	
	private int billQty;

	public int getBillDetailNo() {
		return billDetailNo;
	}

	public void setBillDetailNo(int billDetailNo) {
		this.billDetailNo = billDetailNo;
	}

	public int getAllAprQty() {
		return allAprQty;
	}

	public void setAllAprQty(int allAprQty) {
		this.allAprQty = allAprQty;
	}

	public int getBillQty() {
		return billQty;
	}

	public void setBillQty(int billQty) {
		this.billQty = billQty;
	}

	@Override
	public String toString() {
		return "AprQtyGG [billDetailNo=" + billDetailNo + ", allAprQty=" + allAprQty + ", billQty=" + billQty + "]";
	}
	
	
	
}
