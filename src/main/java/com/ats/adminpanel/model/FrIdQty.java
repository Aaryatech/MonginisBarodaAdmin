package com.ats.adminpanel.model;

public class FrIdQty {

int uid;	
int frId;
int qty;

public int getUid() {
	return uid;
}
public void setUid(int uid) {
	this.uid = uid;
}
public int getFrId() {
	return frId;
}
public void setFrId(int frId) {
	this.frId = frId;
}
public int getQty() {
	return qty;
}
public void setQty(int qty) {
	this.qty = qty;
}

@Override
public String toString() {
	return "FrIdQty [uid=" + uid + ", frId=" + frId + ", qty=" + qty + "]";
}


}
