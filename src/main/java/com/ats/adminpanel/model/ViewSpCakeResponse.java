package com.ats.adminpanel.model;

public class ViewSpCakeResponse {
	private String message;
	private boolean error;
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public boolean isError() {
		return error;
	}
	public void setError(boolean error) {
		this.error = error;
	}
	@Override
	public String toString() {
		return "ViewSpCakeResponse [message=" + message + ", error=" + error + "]";
	}
	
	

}
