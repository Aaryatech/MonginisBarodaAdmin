package com.ats.adminpanel.model;

import java.util.List;

public class SectionMasterNew {
	
	private int sectionId;  
	private String sectionName;  
	private int delStatus; 
	private String menuIds; 
	List<AllMenus> menuList;
	
	private int sectionType;
	
	private int menuType;
	
	private int isActive;

	public int getSectionId() {
		return sectionId;
	}

	public void setSectionId(int sectionId) {
		this.sectionId = sectionId;
	}

	public String getSectionName() {
		return sectionName;
	}

	public void setSectionName(String sectionName) {
		this.sectionName = sectionName;
	}

	public int getDelStatus() {
		return delStatus;
	}

	public void setDelStatus(int delStatus) {
		this.delStatus = delStatus;
	}

	public String getMenuIds() {
		return menuIds;
	}

	public void setMenuIds(String menuIds) {
		this.menuIds = menuIds;
	}

	public List<AllMenus> getMenuList() {
		return menuList;
	}

	public void setMenuList(List<AllMenus> menuList) {
		this.menuList = menuList;
	}

	public int getSectionType() {
		return sectionType;
	}

	public void setSectionType(int sectionType) {
		this.sectionType = sectionType;
	}

	public int getMenuType() {
		return menuType;
	}

	public void setMenuType(int menuType) {
		this.menuType = menuType;
	}

	public int getIsActive() {
		return isActive;
	}

	public void setIsActive(int isActive) {
		this.isActive = isActive;
	}

	@Override
	public String toString() {
		return "SectionMasterNew [sectionId=" + sectionId + ", sectionName=" + sectionName + ", delStatus=" + delStatus
				+ ", menuIds=" + menuIds + ", menuList=" + menuList + ", sectionType=" + sectionType + ", menuType="
				+ menuType + ", isActive=" + isActive + "]";
	}
	
	
	
	
	
	
	
	

}
