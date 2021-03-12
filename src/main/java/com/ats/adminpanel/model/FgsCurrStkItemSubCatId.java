package com.ats.adminpanel.model;

import java.util.List;

public class FgsCurrStkItemSubCatId {

	List<FgsOrderToProduction> fgsItemList;
	List<Integer> subCatIdList;
	List<GetConsultationOrder> fgsOrderList;
	
	public List<FgsOrderToProduction> getFgsItemList() {
		return fgsItemList;
	}
	public void setFgsItemList(List<FgsOrderToProduction> fgsItemList) {
		this.fgsItemList = fgsItemList;
	}
	public List<Integer> getSubCatIdList() {
		return subCatIdList;
	}
	public void setSubCatIdList(List<Integer> subCatIdList) {
		this.subCatIdList = subCatIdList;
	}
	public List<GetConsultationOrder> getFgsOrderList() {
		return fgsOrderList;
	}
	public void setFgsOrderList(List<GetConsultationOrder> fgsOrderList) {
		this.fgsOrderList = fgsOrderList;
	}
	@Override
	public String toString() {
		return "FgsCurrStkItemSubCatId [fgsItemList=" + fgsItemList + ", subCatIdList=" + subCatIdList
				+ ", fgsOrderList=" + fgsOrderList + "]";
	}	
}
