package com.ats.adminpanel.model;

public class SubCategoryRes {

	    private int subCatId;
	    private String subCatName;
	    private int catId;
	    private int delStatus;
	    private String prefix;
		private int seqNo;
		
		public int getSubCatId() {
			return subCatId;
		}
		public void setSubCatId(int subCatId) {
			this.subCatId = subCatId;
		}
		public String getSubCatName() {
			return subCatName;
		}
		public void setSubCatName(String subCatName) {
			this.subCatName = subCatName;
		}
		public int getCatId() {
			return catId;
		}
		public void setCatId(int catId) {
			this.catId = catId;
		}
		public int getDelStatus() {
			return delStatus;
		}
		public void setDelStatus(int delStatus) {
			this.delStatus = delStatus;
		}
		public String getPrefix() {
			return prefix;
		}
		public void setPrefix(String prefix) {
			this.prefix = prefix;
		}
		public int getSeqNo() {
			return seqNo;
		}
		public void setSeqNo(int seqNo) {
			this.seqNo = seqNo;
		}
		@Override
		public String toString() {
			return "SubCategoryRes [subCatId=" + subCatId + ", subCatName=" + subCatName + ", catId=" + catId
					+ ", delStatus=" + delStatus + ", prefix=" + prefix + ", seqNo=" + seqNo + "]";
		}
	   
}
