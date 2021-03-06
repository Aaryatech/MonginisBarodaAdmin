
package com.ats.adminpanel.model.item;

import java.util.List;


public class MCategoryList {

	  private Integer catId;
	    private String catName;
	    private Integer isSameDay;
	    private Integer delStatus;
		private String itemImage;
		private int seqNo;
	    private List<SubCategory> subCategoryList = null;

	    
	    public int getSeqNo() {
			return seqNo;
		}

		public void setSeqNo(int seqNo) {
			this.seqNo = seqNo;
		}

		public Integer getCatId() {
	        return catId;
	    }

	    public void setCatId(Integer catId) {
	        this.catId = catId;
	    }

	    public String getCatName() {
	        return catName;
	    }

	    public void setCatName(String catName) {
	        this.catName = catName;
	    }

	    public Integer getIsSameDay() {
	        return isSameDay;
	    }

	    public void setIsSameDay(Integer isSameDay) {
	        this.isSameDay = isSameDay;
	    }

	    public Integer getDelStatus() {
	        return delStatus;
	    }

	    public void setDelStatus(Integer delStatus) {
	        this.delStatus = delStatus;
	    }

		public List<SubCategory> getSubCategoryList() {
			return subCategoryList;
		}

		public void setSubCategoryList(List<SubCategory> subCategoryList) {
			this.subCategoryList = subCategoryList;
		}

		public String getItemImage() {
			return itemImage;
		}

		public void setItemImage(String itemImage) {
			this.itemImage = itemImage;
		}

		@Override
		public String toString() {
			return "MCategoryList [catId=" + catId + ", catName=" + catName + ", isSameDay=" + isSameDay + ", delStatus="
					+ delStatus + ", itemImage=" + itemImage + ", seqNo=" + seqNo + ", subCategoryList=" + subCategoryList
					+ "]";
		}
  
}
