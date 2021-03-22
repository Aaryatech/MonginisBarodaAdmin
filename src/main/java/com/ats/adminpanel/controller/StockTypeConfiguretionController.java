package com.ats.adminpanel.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.ats.adminpanel.commons.Constants;
import com.ats.adminpanel.model.StockType;
import com.ats.adminpanel.model.StockTypeConfigResponse;
import com.ats.adminpanel.model.item.CategoryListResponse;
import com.ats.adminpanel.model.item.MCategoryList;
import com.ats.adminpanel.model.item.SubCategory;

@Controller
@Scope("session")
public class StockTypeConfiguretionController {
	
	CategoryListResponse  categoryListResponse=new CategoryListResponse(); 
	public static List<MCategoryList> mCategoryList = null;
	List<StockType> StockTypeList =new ArrayList<>();
	
	
	@RequestMapping(value="/showStockTypeConfig",method=RequestMethod.GET)
	public ModelAndView showStockTypeConfig(HttpServletRequest request,HttpServletResponse response ){
		System.err.println("In /showStockTypeConfig");
		ModelAndView model=new ModelAndView("stocktypeConfig/showConfig");
		RestTemplate restTemplate=new RestTemplate();
		try {
			categoryListResponse = restTemplate.getForObject(Constants.url + "showAllCategory",
				CategoryListResponse.class);
		mCategoryList = new ArrayList<MCategoryList>();
		mCategoryList = categoryListResponse.getmCategoryList();
	
		model.addObject("catList", mCategoryList);
		
		StockType[] StypeArr=restTemplate.getForObject(Constants.url+"getAllStockType", StockType[].class);
			StockTypeList=new ArrayList<>(Arrays.asList(StypeArr));
		
		model.addObject("StockTypeList",StockTypeList);
		
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
		System.err.println("Exception Occuered In /showStockTypeConfig");
	}
		return model;
	}

	
	@RequestMapping(value="/getSelcTedSsubCat",method=RequestMethod.POST)
	public @ResponseBody  List<SubCategory>  getSelcTedSsubCat(HttpServletRequest request,HttpServletResponse response){
		System.err.println("In /getSelcTedSsubCat");
		List<SubCategory> res=new ArrayList<>();
		try {
			
			String selectedCat=request.getParameter("catIds");
			
			selectedCat = selectedCat.substring(1, selectedCat.length() - 1);
			selectedCat = selectedCat.replaceAll("\"", "");
			String[] catIds=selectedCat.split(",");
			for(MCategoryList cat : mCategoryList) {
				for(String s : catIds) {
					int id=Integer.parseInt(s);
					
					if(id==cat.getCatId()) {
						res.addAll(cat.getSubCategoryList());
					}
				}
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.err.println("Exception In getSelcTedSsubCat");
		}
		
		return res;
		
	}
	
	
	@RequestMapping(value = "/getAllsubCat", method = RequestMethod.POST)
	public @ResponseBody List<SubCategory> getAllsubCat(HttpServletRequest request, HttpServletResponse response) {
		System.err.println("In /getAllsubCat");
		List<SubCategory> res = new ArrayList<>();
		try {

			for (MCategoryList cat : mCategoryList) {

				res.addAll(cat.getSubCategoryList());

			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.err.println("Exception In getAllsubCat");
		}

		return res;

	}
	
	@RequestMapping(value="/getAllStockType",method=RequestMethod.POST)
	public @ResponseBody List<StockType> getAllStockType(HttpServletRequest request,HttpServletResponse response) {
		System.err.println("in /getAllStockType");
		return StockTypeList;
	}
	
	
	@RequestMapping(value="/getItemsForConfig",method=RequestMethod.POST)
	public @ResponseBody StockTypeConfigResponse getItemsForConfig(HttpServletRequest request,HttpServletResponse response) {
		System.err.println("in /getItemsForConfig");
		MultiValueMap<String, Object> map=new LinkedMultiValueMap<>();
		RestTemplate resttTemplate=new RestTemplate();
		StockTypeConfigResponse res=new StockTypeConfigResponse();
		try {
			
			//System.err.println(request.getParameter("field"));
			
			String subcatIds=request.getParameter("sCatId");
			String StypeIds=request.getParameter("sType");
			
			
			
			
			subcatIds = subcatIds.substring(1, subcatIds.length() - 1);
			subcatIds = subcatIds.replaceAll("\"", "");
			
			
			StypeIds = StypeIds.substring(1, StypeIds.length() - 1);
			StypeIds = StypeIds.replaceAll("\"", "");
			
			System.err.println("Subcats-->"+subcatIds);
			System.err.println("Stock Type-->"+StypeIds);
			map.add("subcatIds", subcatIds);
			map.add("sTypeIds", StypeIds);
			
			 res=resttTemplate.postForObject(Constants.url+"getStocktypeWithItems", map, StockTypeConfigResponse.class);
			System.err.println("Resp---->"+res.toString());
			
			
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.err.println("Exception Occuered In /getItemsForConfig");
		}
		
		return res;
	}
	
	
	
	
	
	
}
