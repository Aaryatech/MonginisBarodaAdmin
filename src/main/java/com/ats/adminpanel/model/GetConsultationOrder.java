package com.ats.adminpanel.model;

public class GetConsultationOrder {
	

	private int itemId;;
	private int orderQty;

	public int getOrderQty() {
		return orderQty;
	}

	public void setOrderQty(int orderQty) {
		this.orderQty = orderQty;
	}

	public int getItemId() {
		return itemId;
	}

	public void setItemId(int itemId) {
		this.itemId = itemId;
	}

	@Override
	public String toString() {
		return "GetConsultationOrder [itemId=" + itemId + ", orderQty=" + orderQty + "]";
	}

}
