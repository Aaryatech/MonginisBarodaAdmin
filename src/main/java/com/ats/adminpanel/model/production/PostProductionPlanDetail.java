package com.ats.adminpanel.model.production;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class PostProductionPlanDetail {

	private int productionDetailId;

	private int productionHeaderId;

	private int planQty;

	private int orderQty;

	private int openingQty;

	private int rejectedQty;

	private int productionQty;

	private int itemId;

	private String productionBatch;

	private String productionDate;

	private int int4;
	private int int5; // neha

	private float curClosingQty;// new Field Added Sachin

	private float curOpeQty;// new fiedl

	public int getInt5() {
		return int5;
	}

	public void setInt5(int int5) {
		this.int5 = int5;
	}

	public int getInt4() {
		return int4;
	}

	public void setInt4(int int4) {
		this.int4 = int4;
	}

	public String getProductionBatch() {
		return productionBatch;
	}

	public void setProductionBatch(String productionBatch) {
		this.productionBatch = productionBatch;
	}

	@JsonFormat(locale = "hi", timezone = "Asia/Kolkata", pattern = "dd-MM-yyyy")
	public String getProductionDate() {
		return productionDate;
	}

	public void setProductionDate(String productionDate) {
		this.productionDate = productionDate;
	}

	public int getOrderQty() {
		return orderQty;
	}

	public void setOrderQty(int orderQty) {
		this.orderQty = orderQty;
	}

	public int getOpeningQty() {
		return openingQty;
	}

	public void setOpeningQty(int openingQty) {
		this.openingQty = openingQty;
	}

	public int getRejectedQty() {
		return rejectedQty;
	}

	public void setRejectedQty(int rejectedQty) {
		this.rejectedQty = rejectedQty;
	}

	public int getProductionQty() {
		return productionQty;
	}

	public void setProductionQty(int productionQty) {
		this.productionQty = productionQty;
	}

	public int getProductionDetailId() {
		return productionDetailId;
	}

	public void setProductionDetailId(int productionDetailId) {
		this.productionDetailId = productionDetailId;
	}

	public int getProductionHeaderId() {
		return productionHeaderId;
	}

	public void setProductionHeaderId(int productionHeaderId) {
		this.productionHeaderId = productionHeaderId;
	}

	public int getPlanQty() {
		return planQty;
	}

	public void setPlanQty(int planQty) {
		this.planQty = planQty;
	}

	public int getItemId() {
		return itemId;
	}

	public void setItemId(int itemId) {
		this.itemId = itemId;
	}

	public float getCurClosingQty() {
		return curClosingQty;
	}

	public void setCurClosingQty(float curClosingQty) {
		this.curClosingQty = curClosingQty;
	}

	public float getCurOpeQty() {
		return curOpeQty;
	}

	public void setCurOpeQty(float curOpeQty) {
		this.curOpeQty = curOpeQty;
	}

	@Override
	public String toString() {
		return "PostProductionPlanDetail [productionDetailId=" + productionDetailId + ", productionHeaderId="
				+ productionHeaderId + ", planQty=" + planQty + ", orderQty=" + orderQty + ", openingQty=" + openingQty
				+ ", rejectedQty=" + rejectedQty + ", productionQty=" + productionQty + ", itemId=" + itemId
				+ ", productionBatch=" + productionBatch + ", productionDate=" + productionDate + ", int4=" + int4
				+ ", int5=" + int5 + ", curClosingQty=" + curClosingQty + ", curOpeQty=" + curOpeQty + "]";
	}

}
