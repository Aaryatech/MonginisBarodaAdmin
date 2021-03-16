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
	@RequestMapping(value="/getItemsAjaxByCatId" ,method=RequestMethod.POST)
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
	
	@RequestMapping(value="/updateItemMrps" ,method=RequestMethod.POST)
	public String updateMrp(HttpServletRequest request,HttpServletResponse response){
		System.err.println("  In /updateItemMrps");
		try {			
	
			MultiValueMap<String, Object> map=new LinkedMultiValueMap<>();
			RestTemplate restTemplate=new RestTemplate();
			
			
			for (int i = 0; i < itemList.size(); i++) {
				int itemId = itemList.get(i).getId();
				
				String selItemId = request.getParameter("selc"+itemId);
				if(selItemId!=null) {
					String mrp1 = request.getParameter("mrp1"+itemId);
					String mrp2 = request.getParameter("mrp2"+itemId);
					String mrp3 = request.getParameter("mrp3"+itemId);
					//System.out.println("Item-----------"+selItemId+" "+mrp1+" / "+mrp2+" / "+mrp3);
					map=new LinkedMultiValueMap<>();
					map.add("itemId", selItemId);
					map.add("mrp1", mrp1);
					map.add("mrp2", mrp2);
					map.add("mrp3", mrp3);
					
					Info info = restTemplate.postForObject(Constants.url + "/itemMrpUpdt", map, Info.class);
				}
				
			}
			
		} catch (Exception e) {
			System.err.println("Exception In /updateMrp : "+e.getMessage());
			e.printStackTrace();			
		}
		
	return "redirect:/showMrpConfig";	
	}
	
	

}
