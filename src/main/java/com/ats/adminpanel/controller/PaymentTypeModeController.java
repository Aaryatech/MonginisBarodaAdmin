package com.ats.adminpanel.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.ats.adminpanel.commons.Constants;
import com.ats.adminpanel.model.Info;
import com.ats.adminpanel.model.PaymentMode;
import com.ats.adminpanel.model.PaymentType;
import com.ats.adminpanel.model.ShowPaymentType;

@Controller
public class PaymentTypeModeController {
	
	@RequestMapping(value = "/addPaymentMode", method = RequestMethod.GET)
	public String PaymentMode(HttpServletRequest request, HttpServletResponse response, Model model) {

		PaymentMode pay = new PaymentMode();
		model.addAttribute("pay", pay);
		return "paymodetype/PaymentMode";
	}
	
		    
    	@RequestMapping(value = "/getPaymentModeAjaxList", method = RequestMethod.GET)
		public @ResponseBody List<PaymentMode> getPaymentModeAjaxList(HttpServletRequest request, HttpServletResponse response) {
			List<PaymentMode> contryList = new ArrayList<PaymentMode>();
			RestTemplate restTemplate = new RestTemplate();
			try {
				PaymentMode[] contryArr = restTemplate.getForObject(Constants.url + "getAllPaymentMode", PaymentMode[].class);
				contryList = new ArrayList<PaymentMode>(Arrays.asList(contryArr));
				System.out.println("PaymentMode: "+contryList);
			}catch (Exception e) {
				System.out.println("Excep in /getAllPaymentMode : "+e.getMessage());
				e.printStackTrace();
			}
			
			return contryList;
			
		}
    	
    	 	@RequestMapping(value = "/deletePaymentModeByIdAjax", method = RequestMethod.GET)
		public @ResponseBody Info deletePaymentModeByIdAjax(HttpServletRequest request, HttpServletResponse response) {
			Info info = new Info();
			RestTemplate restTemplate = new RestTemplate();
			try {
				int modeId =  Integer.parseInt(request.getParameter("modeId"));
				MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
				map.add("modeId", modeId);
				info =restTemplate.postForObject(Constants.url + "deletePaymentMode", map, Info.class);			
			
			}catch (Exception e) {
				System.out.println("Excep in /deletePaymentModeById : "+e.getMessage());
				e.printStackTrace();
			}
			return info;
			
		}
		
    	 	
		   	  @RequestMapping(value = "/getPaymentModeByIdAjax", method = RequestMethod.GET)
		public @ResponseBody PaymentMode getPaymentModeByIdAjax(HttpServletRequest request, HttpServletResponse response) {
		   		RestTemplate restTemplate = new RestTemplate();
		   		PaymentMode country = new PaymentMode();
			try {
				int modeId =  Integer.parseInt(request.getParameter("modeId"));
				MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
				map.add("modeId", modeId);
				country = restTemplate.postForObject(Constants.url + "getAllPaymentModeById", map, PaymentMode.class);
			
			
			}catch (Exception e) {
				System.out.println("Excep in /getPaymentModeById : "+e.getMessage());
				e.printStackTrace();
			}
			return country;		
		}
		   	  
		   	
		  
        @RequestMapping(value = "/newPaymentMode", method = RequestMethod.POST)
		public @ResponseBody PaymentMode newPaymentMode(HttpServletRequest request, HttpServletResponse response) {
			PaymentMode save = new PaymentMode();
			RestTemplate restTemplate = new RestTemplate();

			try {
				//HttpSession session = request.getSession();
				int modeId = Integer.parseInt(request.getParameter("modeId"));
				PaymentMode rule = new PaymentMode();
				System.out.println("submit modeId : "+modeId);
				rule.setModeId(modeId);
				rule.setModeName(request.getParameter("modeName"));			
				rule.setDelStatus(0);

				save = restTemplate.postForObject(Constants.url + "postAllPaymentMode", rule, PaymentMode.class);
			}catch (Exception e) {
				System.out.println("Excep in /savePaymentMode : "+e.getMessage());
				e.printStackTrace();
				
			}		
			
			return save;
		}
         
        
        	@RequestMapping(value = "/addPaymentType", method = RequestMethod.GET)
	    public String PaymentType(HttpServletRequest request, HttpServletResponse response, Model model) {
        		 
        		RestTemplate restTemplate = new RestTemplate();
        		PaymentMode[] contryArr = restTemplate.getForObject(Constants.url + "getAllPaymentMode", PaymentMode[].class);
        		List<PaymentMode> contryList = new ArrayList<PaymentMode>(Arrays.asList(contryArr));
				System.out.println("contryList: "+contryList);
				model.addAttribute("contryList1", contryList);
        		PaymentType pay = new PaymentType();
        		model.addAttribute("pay", pay);
		return "paymodetype/PaymentType";
	}
  	   
        	@RequestMapping(value = "/showPaymentType", method = RequestMethod.GET)
		public @ResponseBody List<ShowPaymentType> showPaymentType(HttpServletRequest request, HttpServletResponse response) {

    			RestTemplate restTemplate = new RestTemplate();
        		ShowPaymentType[] contryArr = restTemplate.getForObject(Constants.url + "showPaymentType", ShowPaymentType[].class);
			List<ShowPaymentType> termList = new ArrayList<ShowPaymentType>(Arrays.asList(contryArr));
			
			return termList;
		}
		
		
		
		     @RequestMapping(value = "/newPaymentType", method = RequestMethod.POST)
		public @ResponseBody PaymentType newPaymentType(HttpServletRequest request, HttpServletResponse response) {
			PaymentType save = new PaymentType();
			RestTemplate restTemplate = new RestTemplate();

			try {
				//HttpSession session = request.getSession();
				int paymentTypeId = Integer.parseInt(request.getParameter("paymentTypeId"));
				int modeId = Integer.parseInt(request.getParameter("modeId"));
				PaymentType rule = new PaymentType();
				System.out.println("submit modeId : "+paymentTypeId);
				rule.setPaymentTypeId(paymentTypeId);
				rule.setTypeName(request.getParameter("typeName"));			
				rule.setDelStatus(0);
				rule.setPaymentModeId(modeId);
				save = restTemplate.postForObject(Constants.url + "postAllPaymentType", rule, PaymentType.class);
			}catch (Exception e) {
				System.out.println("Excep in /savePaymentType : "+e.getMessage());
				e.printStackTrace();
				
			}		

			System.out.println("Excep in /savePaymentType save : "+save);
			return save;
		}
        
		
		
		 		
       	  @RequestMapping(value = "/getPaymentTypeByIdAjax", method = RequestMethod.GET)
  		public @ResponseBody PaymentType getPaymentTypeByIdAjax(HttpServletRequest request, HttpServletResponse response) {
  		   		RestTemplate restTemplate = new RestTemplate();
  		   	PaymentType country = new PaymentType();
  			try {
  				int paymentTypeId =  Integer.parseInt(request.getParameter("paymentTypeId"));
  				MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
  				map.add("typeId", paymentTypeId);
  				country = restTemplate.postForObject(Constants.url + "getAllPaymentTypeById", map, PaymentType.class);
  				System.out.println("submit modeId : "+paymentTypeId);
  				System.out.println("submit country : "+country);
  			}catch (Exception e) {
  				System.out.println("Excep in /getPaymentTypeById : "+e.getMessage());
  				e.printStackTrace();
  			}
  			return country;		
  		}
			
			
			
			@RequestMapping(value = "/deletePaymentTypeByIdAjax", method = RequestMethod.GET)
			public @ResponseBody Info deletePaymentTypeByIdAjax(HttpServletRequest request, HttpServletResponse response) {
				Info info = new Info();

				RestTemplate restTemplate = new RestTemplate();
				try {
					int paymentTypeId =  Integer.parseInt(request.getParameter("paymentTypeId"));
					
					MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
					map.add("typeId", paymentTypeId);
					info =restTemplate.postForObject(Constants.url + "deletePaymentType", map, Info.class);			
				
				}catch (Exception e) {
					System.out.println("Excep in /deletePaymentTypeByIdAjax : "+e.getMessage());
					e.printStackTrace();
				}
				return info;
				
			}		
}
