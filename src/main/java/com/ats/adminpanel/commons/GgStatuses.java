package com.ats.adminpanel.commons;

public class GgStatuses {

	private int statusIdPk;
	private int statusValue;
	private String statusName;
	private String statusCode;
	private int delStatus;
	public int getStatusIdPk() {
		return statusIdPk;
	}
	public void setStatusIdPk(int statusIdPk) {
		this.statusIdPk = statusIdPk;
	}
	public int getStatusValue() {
		return statusValue;
	}
	public void setStatusValue(int statusValue) {
		this.statusValue = statusValue;
	}
	public String getStatusName() {
		return statusName;
	}
	public void setStatusName(String statusName) {
		this.statusName = statusName;
	}
	public String getStatusCode() {
		return statusCode;
	}
	public void setStatusCode(String statusCode) {
		this.statusCode = statusCode;
	}
	public int getDelStatus() {
		return delStatus;
	}
	public void setDelStatus(int delStatus) {
		this.delStatus = delStatus;
	}
	@Override
	public String toString() {
		return "GgStatuses [statusIdPk=" + statusIdPk + ", statusValue=" + statusValue + ", statusName=" + statusName
				+ ", statusCode=" + statusCode + ", delStatus=" + delStatus + "]";
	}
	
	
	
}
