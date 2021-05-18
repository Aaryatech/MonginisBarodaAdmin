package com.ats.adminpanel.model.pushorderdata;

import java.util.List;

public class PushOrderList {
	
	List<GetOrderDataForPushOrder> getOrderDataForPushOrder;
	
	

	private int itemId;
	
	private String itemName;
	private int isAdded;
	private int totalQty;
	private int ordQty;
	private int itemGrp2;
	
	private String message;
	
	
	
	
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public int getItemGrp2() {
		return itemGrp2;
	}

	public void setItemGrp2(int itemGrp2) {
		this.itemGrp2 = itemGrp2;
	}

	public int getTotalQty() {
		return totalQty;
	}

	public void setTotalQty(int totalQty) {
		this.totalQty = totalQty;
	}

	public int getOrdQty() {
		return ordQty;
	}

	public void setOrdQty(int ordQty) {
		this.ordQty = ordQty;
	}

	public int getIsAdded() {
		return isAdded;
	}

	public void setIsAdded(int isAdded) {
		this.isAdded = isAdded;
	}

	public List<GetOrderDataForPushOrder> getGetOrderDataForPushOrder() {
		return getOrderDataForPushOrder;
	}

	public int getItemId() {
		return itemId;
	}

	public String getItemName() {
		return itemName;
	}

	public void setGetOrderDataForPushOrder(List<GetOrderDataForPushOrder> getOrderDataForPushOrder) {
		this.getOrderDataForPushOrder = getOrderDataForPushOrder;
	}

	public void setItemId(int itemId) {
		this.itemId = itemId;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	

	
	
	@Override
	public String toString() {
		return "PushOrderList [getOrderDataForPushOrder=" + getOrderDataForPushOrder + ", itemId=" + itemId
				+ ", itemName=" + itemName + ", isAdded=" + isAdded + "]";
	}
}
