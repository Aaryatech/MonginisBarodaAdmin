
package com.ats.adminpanel.model;


public class OrderCount {

    private Integer menuId;
    private String menuTitle;
    private Float total;
    private String toTime;
    private int settingType;
    
    private String menuSch;

    public Integer getMenuId() {
        return menuId;
    }

    public void setMenuId(Integer menuId) {
        this.menuId = menuId;
    }

    public String getMenuTitle() {
        return menuTitle;
    }

    public void setMenuTitle(String menuTitle) {
        this.menuTitle = menuTitle;
    }


	public String getToTime() {
		return toTime;
	}

	public void setToTime(String toTime) {
		this.toTime = toTime;
	}

	public int getSettingType() {
		return settingType;
	}

	public void setSettingType(int settingType) {
		this.settingType = settingType;
	}

	public String getMenuSch() {
		return menuSch;
	}

	public void setMenuSch(String menuSch) {
		this.menuSch = menuSch;
	}
	
	
	
	
	

	public Float getTotal() {
		return total;
	}

	public void setTotal(Float total) {
		this.total = total;
	}

	@Override
	public String toString() {
		return "OrderCount [menuId=" + menuId + ", menuTitle=" + menuTitle + ", total=" + total + ", toTime=" + toTime
				+ ", settingType=" + settingType + ", menuSch=" + menuSch + "]";
	}

	
	

    
    

}
