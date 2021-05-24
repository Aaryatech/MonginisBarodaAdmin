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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.ats.adminpanel.commons.Constants;
import com.ats.adminpanel.model.AllFrIdName;
import com.ats.adminpanel.model.AllFrIdNameList;
import com.ats.adminpanel.model.AllRoutesListResponse;
import com.ats.adminpanel.model.Info;
import com.ats.adminpanel.model.Route;
import com.ats.adminpanel.model.SpCakeResponse;
import com.ats.adminpanel.model.StockType;
import com.ats.adminpanel.model.rejectRemark;
import com.ats.adminpanel.model.franchisee.FranchiseeAndMenuList;
import com.ats.adminpanel.model.franchisee.FranchiseeList;
import com.ats.adminpanel.model.logistics.VehicalMaster;
import com.ats.adminpanel.model.modules.ErrorMessage;
import com.ats.adminpanel.model.setting.NewSetting;
import com.ats.adminpanel.model.spprod.CakeType;
import com.ats.adminpanel.model.stock.PostFrItemStockDetail;

@Controller
@Scope("session")
public class StockTypeController {

	
	@RequestMapping(value = "/showStockType", method = RequestMethod.GET)
	public ModelAndView showStockType(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("stock/StockType");
		//List<StockType> stock=new ArrayList<StockType>();
		//List<StockType> stock1=new ArrayList<StockType>();

		RestTemplate restTemplate = new RestTemplate();
		
		List<Integer> inUse = restTemplate.getForObject(Constants.url + "/getInUseStockType",
				List.class);
		
		
		model.addObject("inUseStockList", inUse);


		StockType[] stock = restTemplate.getForObject(Constants.url + "getAllStockType", StockType[].class);
				List<StockType> stock1 = new ArrayList<StockType>(Arrays.asList(stock));
		model.addObject("stock", stock1);
		model.addObject("st", new StockType());
		System.out.println("Show stock Type"+stock1);

		return model;
	} 
	 
	@RequestMapping(value="/getFrByStockTypeId",method=RequestMethod.GET)
	public @ResponseBody List<AllFrIdName> getFrByStockTypeId(HttpServletRequest request) {
		System.err.println("in /getFrByStockTypeId");
		
		AllFrIdNameList frListResp=new AllFrIdNameList();
		RestTemplate restTemplate=new RestTemplate();
		MultiValueMap<String, Object> map=new LinkedMultiValueMap<>();
		try {
			Integer stckId=Integer.parseInt(request.getParameter("stckId"));
			map.add("stckId", stckId);
			System.err.println("Map--> Stck Id-->"+map.toString());
			frListResp =restTemplate.postForObject(Constants.url+"getAllFrIdNameByStckTypeId", map, AllFrIdNameList.class);
		} catch (Exception e) {
			// TODO: handle exception
			System.err.println("Exception in /getFrByVehId");
			e.printStackTrace();
		}
		return frListResp.getFrIdNamesList();
	}
	
	
	
	@RequestMapping(value="/delMultiStock",method=RequestMethod.GET)
	public @ResponseBody Info delMultiStock(HttpServletRequest request){
		System.err.println("In /delMultiStock");
		Info info=new Info();
		RestTemplate restTemplate=new RestTemplate();
		MultiValueMap<String, Object> map=new LinkedMultiValueMap<>();
		try {
			String stckIds=request.getParameter("stckIds");
			stckIds = stckIds.substring(1, stckIds.length() - 1);
			stckIds = stckIds.replaceAll("\"", "");
			System.err.println("Sel stckIds-->"+stckIds);
			map.add("stckIds", stckIds);
			info=restTemplate.postForObject(Constants.url+"deleteMultiStockType", map, Info.class);
			
		} catch (Exception e) {
			// TODO: handle exception
			System.err.println("Excep In /delMultiFr");
		}
		return info;
	}
	
  
  
  	@RequestMapping(value = "/saveStockType", method = RequestMethod.POST)
	public String saveStockType(HttpServletRequest request, HttpServletResponse response) {
System.err.println("in /saveStockType");
	//	ModelAndView model = new ModelAndView("stock/StockType");
       
        StockType stock=new StockType();

		RestTemplate restTemplate = new RestTemplate();

        	MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
        try {
        	String stockName = request.getParameter("stock_type_name");
        	String stockDesc = request.getParameter("stock_type_desc");
        	int hid = Integer.parseInt(request.getParameter("id"));
        	int stockType = Integer.parseInt(request.getParameter("stock_type"));
        	
        	map.add("stockName",stockName);
        	map.add("stockDesc",stockDesc);
        	map.add("stockType",stockType);
        	stock.setStockTypeName(stockName);
        	stock.setStockTypeDesc(stockDesc);
        	stock.setType(stockType);
        	stock.setId(hid);
        	stock.setExInt1(0);
        	stock.setExInt2(0);
        	stock.setExVar1("NA");
        	stock.setExVar2("NA");
        	stock.setDelStatus(0);
        
        	System.out.println("map"+map);

		 stock = restTemplate.postForObject(Constants.url + "postStockType",stock, StockType.class);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.err.println("Exception In /saveStockType");
		}

			return "redirect:/showStockType";
	} 	 
	
	 @RequestMapping(value ="/updateStockType/{id}", method = RequestMethod.GET)
	    public ModelAndView updateStockType(@PathVariable int id) {
		ModelAndView mav = new ModelAndView("stock/StockType");
         StockType st=new StockType();
		RestTemplate restTemplate = new RestTemplate();
	
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("id", id);
		System.out.println("update id admin" + id);
	    st = restTemplate.postForObject("" + Constants.url + "getAllStockTypeById", map, StockType.class);
		System.out.println("admin upadate id " + st);
		mav.addObject("st", st);

					
		return mav;

	}
	 
	 @RequestMapping(value ="/deleteStockType/{idList}", method = RequestMethod.GET)
	public String deleteStockType(@PathVariable int  idList) {
		System.err.println(" In /deleteStockType");
		// String id=request.getParameter("id");
		try {
			ModelAndView mav = new ModelAndView("stock/StockType");
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			RestTemplate rest = new RestTemplate();

			/*
			 * String strItemIds = new String(); for (int i = 0; i < idList.length; i++) {
			 * strItemIds = strItemIds + "," + idList[i]; }
			 */
			/*
			 * strItemIds = strItemIds.substring(1); 
			 *  map.add("id", strItemIds);
			 */

			map.add("rejectId", idList);
			ErrorMessage errorResponse = rest.postForObject("" + Constants.url + "deleteStockType", map, ErrorMessage.class);
			System.out.println(errorResponse.toString());


			if (errorResponse.getError()) {
				return "redirect:/showStockType";

			} else {
				return "redirect:/showStockType";

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/showStockType";
	}
	 
	 FranchiseeAndMenuList franchiseeAndMenuList;
	 
	 @RequestMapping(value = "/showStocktypeConfigure")
		public ModelAndView showStocktypeConfigure(HttpServletRequest request, HttpServletResponse response) {
			ModelAndView model=new ModelAndView("franchisee/stockTypeMap");
			RestTemplate restTemplate = new RestTemplate();
			VehicalMaster[] allvehArr = restTemplate.getForObject(Constants.url +"getAllVehicalListByDelStaus", VehicalMaster[].class);
			 List<VehicalMaster> allvehicleList=new ArrayList<>(Arrays.asList(allvehArr));
			franchiseeAndMenuList = restTemplate.getForObject(Constants.url + "getFranchiseeAndMenu",
					FranchiseeAndMenuList.class);
			AllRoutesListResponse allRoutesListResponse = restTemplate.getForObject(Constants.url + "showRouteList",
					AllRoutesListResponse.class);

			List<Route> routeList = new ArrayList<Route>();
			routeList = allRoutesListResponse.getRoute();
			
			StockType[] stock = restTemplate.getForObject(Constants.url + "getAllStockType", StockType[].class);
			List<StockType> stock1 = new ArrayList<StockType>(Arrays.asList(stock));
			
			StockType[] stockWFrname = restTemplate.getForObject(Constants.url + "getAllStockTypeWithFr", StockType[].class);
			List<StockType> stockWithFr = new ArrayList<StockType>(Arrays.asList(stockWFrname));
			/*franchiseeAndMenuList = restTemplate.getForObject(Constants.url + "getFranchiseeAndMenu",
					FranchiseeAndMenuList.class);*/
			model.addObject("allFranchiseeAndMenuList",franchiseeAndMenuList );
			model.addObject("routeList", routeList);
			
			model.addObject("stockType", stock1);
			
			model.addObject("stockWithFr", stockWithFr);
			
			model.addObject("AllvehicleList", allvehicleList);
			return model;
			
		}
	 
	 @RequestMapping(value="/StockTypeMultiMapFranProcess",method=RequestMethod.POST)
	 public String StockTypeMultiMapFranProcess(HttpServletRequest request) {
		 System.err.println("In /StockTypeMultiMapFranProcess");
		 RestTemplate restTemplate=new RestTemplate();
			Info info=new Info();
			MultiValueMap<String, Object> map=new LinkedMultiValueMap<>();
		//	List<Integer> frIds=new ArrayList<>();
			StringBuilder frIds = new StringBuilder();
		 try {
			 
			 
			 
			 
			//String[] frIds=request.getParameterValues("fr_id");
			Integer stckId=Integer.parseInt(request.getParameter("stId"));
			
			 
			 
			 
			 String[] frIdArr=request.getParameterValues("fr_id");
				for(int i=0;i<frIdArr.length;i++){
					frIds = frIds.append(frIdArr[i] + ",");
				}
				
				String FrIdStr = frIds.toString();

				FrIdStr = FrIdStr.substring(0, FrIdStr.length() - 1);
			
				System.err.println("frids==="+frIds);
				System.err.println("Stock Type Id =="+stckId);
				map.add("frIds", FrIdStr);
				map.add("stId", stckId);
				info =restTemplate.postForObject(Constants.url+"addStockTypeToMultiFrs", map, Info.class);
			 
		} catch (RestClientException e) {
			// TODO: handle exception
			System.err.println("Exception In /StockTypeMultiMapFranProcess");
			e.printStackTrace();
		}
		 return "redirect:/showStocktypeConfigure";
	 }
	 
	 @RequestMapping(value = "/setAllMenuSelectedfrStock", method = RequestMethod.GET)
		public @ResponseBody List<FranchiseeList> setAllFrIdSelected() {
			System.err.println("inside ajax call for fr all selected");

			return franchiseeAndMenuList.getAllFranchisee();
		}
	 
	 
	 
	 
	 
	 
}
