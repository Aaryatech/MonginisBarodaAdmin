package com.ats.adminpanel.model;


public class PaymentMode {

	private int modeId;
	private String modeName;
	private int delStatus;

	public int getModeId() {
		return modeId;
	}

	public void setModeId(int modeId) {
		this.modeId = modeId;
	}

	public String getModeName() {
		return modeName;
	}

	public void setModeName(String modeName) {
		this.modeName = modeName;
	}

	public int getDelStatus() {
		return delStatus;
	}

	public void setDelStatus(int delStatus) {
		this.delStatus = delStatus;
	}

	@Override
	public String toString() {
		return "PaymentMode [modeId=" + modeId + ", modeName=" + modeName + ", delStatus=" + delStatus + "]";
	}
	
	
	
	

}
