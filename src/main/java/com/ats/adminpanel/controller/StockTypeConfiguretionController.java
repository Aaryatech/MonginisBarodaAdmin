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
import com.ats.adminpanel.model.GetitemStockConfig;
import com.ats.adminpanel.model.StockType;
import com.ats.adminpanel.model.StockTypeConfigResponse;
import com.ats.adminpanel.model.item.CategoryListResponse;
import com.ats.adminpanel.model.item.Item;
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
	
	StockTypeConfigResponse res=new StockTypeConfigResponse();
	int flag=0;
	@RequestMapping(value="/getItemsForConfig",method=RequestMethod.POST)
	public @ResponseBody StockTypeConfigResponse getItemsForConfig(HttpServletRequest request,HttpServletResponse response) {
		System.err.println("in /getItemsForConfig");
		MultiValueMap<String, Object> map=new LinkedMultiValueMap<>();
		RestTemplate resttTemplate=new RestTemplate();
	
		try {
			
			System.err.println(request.getParameter("field"));
			flag=Integer.parseInt(request.getParameter("field"));
			
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
	
	
	@RequestMapping(value="/updateStockType",method=RequestMethod.POST)
	public String updateStockType(HttpServletRequest request,HttpServletResponse response ) {
		System.err.println("In /updateStockType");
		List<GetitemStockConfig> configList=new ArrayList<>();
		try {
			System.err.println("res--->"+res.toString());
			for(Item item : res.getItemlist()) {
				
				String selItemId = request.getParameter("selc"+item.getId());
				if(selItemId!=null) {
					for(int i=0;i<res.getStockTypelist().size();i++) {
						GetitemStockConfig StockConfig=new GetitemStockConfig();
						System.err.println(request.getParameter("type"+item.getId()+res.getStockTypelist().get(i).getId()));
						for(GetitemStockConfig itemSt : res.getItemStockList()) {
							if(item.getId()==itemSt.getItemId() &&  res.getStockTypelist().get(i).getId()==itemSt.getType() && flag==1) {
								System.err.println("In If");
								StockConfig=itemSt;
								StockConfig.setMinQty(Integer.parseInt(request.getParameter("type"+item.getId()+res.getStockTypelist().get(i).getId())));
								configList.add(StockConfig);
								
							}
							if(item.getId()==itemSt.getItemId() &&  res.getStockTypelist().get(i).getId()==itemSt.getType() && flag==2) {
								StockConfig=itemSt;
								StockConfig.setMaxQty(Integer.parseInt(request.getParameter("type"+item.getId()+res.getStockTypelist().get(i).getId())));
								configList.add(StockConfig);
							}
							if(item.getId()==itemSt.getItemId() &&  res.getStockTypelist().get(i).getId()==itemSt.getType() && flag==3) {
								StockConfig=itemSt;
								StockConfig.setReorderQty(Integer.parseInt(request.getParameter("type"+item.getId()+res.getStockTypelist().get(i).getId())));
								configList.add(StockConfig);
							}/*else {
								System.err.println("In else");
								//If New Entry
								if(flag==1) {
									StockConfig.setMinQty(Integer.parseInt(request.getParameter("type"+item.getId()+res.getStockTypelist().get(i).getId())));
									StockConfig.setType(res.getStockTypelist().get(i).getId());
									//StockConfig.setItemId(item.getId());
									configList.add(StockConfig);
									break;
								}
								if(flag==2) {
									StockConfig.setMaxQty(Integer.parseInt(request.getParameter("type"+item.getId()+res.getStockTypelist().get(i).getId())));
									StockConfig.setType(res.getStockTypelist().get(i).getId());
									//StockConfig.setItemId(item.getId());
									configList.add(StockConfig);
									break;
								}
								if(flag==3) {
									StockConfig.setReorderQty(Integer.parseInt(request.getParameter("type"+item.getId()+res.getStockTypelist().get(i).getId())));
									StockConfig.setType(res.getStockTypelist().get(i).getId());
									//StockConfig.setItemId(item.getId());
									configList.add(StockConfig);
									break;
								}
							}*/
						}
						
						
						
						
						
					}
				}
				
			}
			
			System.err.println("ConfigList--->"+configList.toString());
			
			
		} catch (Exception e) {
			// TODO: handle exception
			System.err.println("Exception In /updateStockType");
			e.printStackTrace();
		}
		
		
		return "redirect:/showStockTypeConfig";
	}
	
	
	@RequestMapping(value="/getItemListAfterUpdate",method=RequestMethod.POST)
	public @ResponseBody StockTypeConfigResponse getItemListAfterUpdate() {
		System.err.println("in /getItemListAfterUpdate");
		return res;
	}
	
	
	@RequestMapping(value="/updateValueAjax",method=RequestMethod.POST)
	public @ResponseBody int updateValueAjax(HttpServletRequest request,HttpServletResponse response) {
		System.err.println("in /updateValueAjax");
		int flag=0;
		try {
			int itemId=Integer.parseInt(request.getParameter("itemId"));
			int typeId=Integer.parseInt(request.getParameter("typeId"));
			int qtyFlag=Integer.parseInt(request.getParameter("field"));
			int qty=Integer.parseInt(request.getParameter("val1"));
			for(GetitemStockConfig configueredSt : res.getItemStockList()) {
				if(configueredSt.getItemId()==itemId  && configueredSt.getType()==typeId) {
					if(qtyFlag==1 && qty>0 ) {
						
						configueredSt.setMinQty(qty);
					}
					if(qtyFlag==2  && qty>0 ) {
						configueredSt.setMaxQty(qty);
					}
					if(qtyFlag==3 && qty>0 ) {
						configueredSt.setReorderQty(qty);
					}
					flag=1;
					break;
				}
			
			}
			if(flag==0) {
				GetitemStockConfig config=new GetitemStockConfig();
				config.setItemId(itemId);
				config.setType(typeId);
				if(qtyFlag==1 && qty>0 ) {
					config.setMinQty(qty);
				}
				if(qtyFlag==2  && qty>0 ) {
					config.setMaxQty(qty);
				}
				if(qtyFlag==3 && qty>0 ) {
					config.setReorderQty(qty);
				}
				
				res.getItemStockList().add(config);
				
			}
			
			
			System.err.println("Updated Confiuretion-->"+res.getItemStockList().toString());
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.err.println("Exception In /updateValueAjax");
		}
		
		return flag;
	}
	
	
	@RequestMapping(value="/submitConfig",method=RequestMethod.POST)
	public @ResponseBody int submitConfig() {
		System.err.println("in /submitConfig");
		RestTemplate restTemplate=new RestTemplate();
		MultiValueMap<String, Object> map=new LinkedMultiValueMap<>();
		
		int flag=0;
		try {
			//map.add("Configlist", res.getItemStockList());
			GetitemStockConfig[] resArr=restTemplate.postForObject(Constants.url+"submitConfigApi",res.getItemStockList(), GetitemStockConfig[].class);
			System.err.println("update Responce-->"+ resArr.toString());
			if(resArr.length>0) {
				flag=1;
			}
	
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.err.println("Exception In /submitConfig");
		}
		
		return flag;
	}
	
	
	
	
	
	
}
