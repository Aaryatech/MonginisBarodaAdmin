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
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.ats.adminpanel.commons.Constants;
import com.ats.adminpanel.model.SpCakeResponse;
import com.ats.adminpanel.model.StockType;
import com.ats.adminpanel.model.rejectRemark;
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


		StockType[] stock = restTemplate.getForObject(Constants.url + "getAllStockType", StockType[].class);
				List<StockType> stock1 = new ArrayList<StockType>(Arrays.asList(stock));
		model.addObject("stock", stock1);
		model.addObject("st", new StockType());
		System.out.println("Show stock Type"+stock1);

		return model;
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
}
