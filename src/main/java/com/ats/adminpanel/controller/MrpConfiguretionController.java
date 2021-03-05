package com.ats.adminpanel.controller;


import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.ats.adminpanel.commons.AccessControll;
import com.ats.adminpanel.commons.Constants;
import com.ats.adminpanel.model.Info;

import com.ats.adminpanel.model.accessright.ModuleJson;
import com.ats.adminpanel.model.item.CategoryListResponse;
import com.ats.adminpanel.model.item.Item;
import com.ats.adminpanel.model.item.MCategoryList;

@Controller
@Scope("session")
public class MrpConfiguretionController {
	
	public	CategoryListResponse categoryListResponse;
	
	
	@RequestMapping(value = "/showMrpConfig", method = RequestMethod.GET)
	public ModelAndView showMrpConfig(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = null;
		HttpSession session = request.getSession();

		List<ModuleJson> newModuleList = (List<ModuleJson>) session.getAttribute("newModuleList");
		Info view = AccessControll.checkAccess("showAddNewFranchisee", "showAddNewFranchisee", "1", "0", "0", "0",
				newModuleList);

		if (false)//view.getError() == true
			{

			model = new ModelAndView("accessDenied");

		} else {
			model = new ModelAndView("mrpConfig");
			System.out.println("Mrp Config disp");
			
		
			RestTemplate restTemplate = new RestTemplate();
			try {

				categoryListResponse = restTemplate.getForObject(Constants.url + "showAllCategory",
						CategoryListResponse.class);
				List<MCategoryList>  	mCategoryList = categoryListResponse.getmCategoryList();
				model.addObject("mCategoryList", mCategoryList);
				
				
			} catch (Exception e) {
				System.out.println("Error in Shape list display" + e.getMessage());
				e.printStackTrace();
			}
		}
		return model;
	}
		
	List<Item> itemList=new ArrayList<>();
	@RequestMapping(value="/getItemsByCatId" ,method=RequestMethod.POST)
	public @ResponseBody List<Item> getItemsByCatId(HttpServletRequest request,HttpServletResponse response){
		
		MultiValueMap<String, Object> map=new LinkedMultiValueMap<>();
		RestTemplate restTemplate=new RestTemplate();
		try {
			//System.err.println("cat Id-->"+request.getParameter("catId"));
			int catId=Integer.parseInt(request.getParameter("catId"));
			map.add("itemGrp1", catId);
			Item[] item = restTemplate.postForObject(Constants.url + "getItemsByCatId", map, Item[].class);
			itemList = new ArrayList<Item>(Arrays.asList(item));
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.err.println("Exception In /getItemsByCatId");
		}
		return itemList;
	}
	
	@RequestMapping(value="/updateMrp" ,method=RequestMethod.POST)
	public @ResponseBody int updateMrp(HttpServletRequest request,HttpServletResponse response){
		System.err.println("  In /updateMrp");
		try {
			//System.err.println("Selecte Item Ids"+request.getParameter("selectedItemsId"));
			String ids=request.getParameter("selectedItemsId");
			String[] itemIds=ids.split(",");
			for(Item itemObj : itemList) {
				for(int i=0;i<itemIds.length;i++) {
					int Temp=Integer.parseInt(itemIds[i]);
					if(itemObj.getId()==Temp) {
					
						System.err.println(request.getParameter("mrp1"+itemIds[i]));
						System.err.println(request.getParameter("mrp2"+itemIds[i]));
						System.err.println(request.getParameter("mrp3"+itemIds[i]));
					}
				}
				
				
			}
			
			
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.err.println("Exception In /updateMrp");
		}
		
	return 0;	
	}
	
	

}
