package com.ats.adminpanel.model;



public class GetitemStockConfig {
	
	
	private int frStockId;
	
	
	private Integer itemId;
	

	private int type;
	
	private int minQty;
	
	private int maxQty;
	
	
	
	private int reorderQty;



	public int getFrStockId() {
		return frStockId;
	}



	public void setFrStockId(int frStockId) {
		this.frStockId = frStockId;
	}



	public Integer getItemId() {
		return itemId;
	}



	public void setItemId(Integer itemId) {
		this.itemId = itemId;
	}



	public int getType() {
		return type;
	}



	public void setType(int type) {
		this.type = type;
	}



	public int getMinQty() {
		return minQty;
	}



	public void setMinQty(int minQty) {
		this.minQty = minQty;
	}



	public int getMaxQty() {
		return maxQty;
	}



	public void setMaxQty(int maxQty) {
		this.maxQty = maxQty;
	}



	public int getReorderQty() {
		return reorderQty;
	}



	public void setReorderQty(int reorderQty) {
		this.reorderQty = reorderQty;
	}



	@Override
	public String toString() {
		return "GetitemStockConfig [frStockId=" + frStockId + ", itemId=" + itemId + ", type=" + type + ", minQty="
				+ minQty + ", maxQty=" + maxQty + ", reorderQty=" + reorderQty + "]";
	}

	
	
	
	
	
}
