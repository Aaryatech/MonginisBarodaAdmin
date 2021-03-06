package com.ats.adminpanel.model.production;



import java.util.List;

public class UpdateOrderStatus {

	
	List<String> orderItemId;
	List<Integer> regOrderItemId;
	String prodDate;
	String menuIdList;
	List<String> menuIdListInteger;
	
	
	public List<String> getMenuIdListInteger() {
		return menuIdListInteger;
	}
	public void setMenuIdListInteger(List<String> menuIdListInteger) {
		this.menuIdListInteger = menuIdListInteger;
	}
	public String getMenuIdList() {
		return menuIdList;
	}
	public void setMenuIdList(String menuIdList) {
		this.menuIdList = menuIdList;
	}
	public List<String> getOrderItemId() {
		return orderItemId;
	}
	public void setOrderItemId(List<String> orderItemId) {
		this.orderItemId = orderItemId;
	}
	public List<Integer> getRegOrderItemId() {
		return regOrderItemId;
	}
	public void setRegOrderItemId(List<Integer> regOrderItemId) {
		this.regOrderItemId = regOrderItemId;
	}
	public String getProdDate() {
		return prodDate;
	}
	public void setProdDate(String prodDate) {
		this.prodDate = prodDate;
	}
	@Override
	public String toString() {
		return "UpdateOrderStatus [orderItemId=" + orderItemId + ", regOrderItemId=" + regOrderItemId + ", prodDate="
				+ prodDate + ", menuIdList=" + menuIdList + ", menuIdListInteger=" + menuIdListInteger + "]";
	}
	 
	
}
