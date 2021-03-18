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
import com.ats.adminpanel.model.Info;
import com.ats.adminpanel.model.SpCakeResponse;
import com.ats.adminpanel.model.SpecialCake;
import com.ats.adminpanel.model.rejectRemark;
import com.ats.adminpanel.model.setting.NewSetting;

@Controller
@Scope("session")
public class SettingSpCakeConfigController {

	@RequestMapping(value = "/showSettingSpCake", method = RequestMethod.GET)
	public ModelAndView showRejectRemark(HttpServletRequest request, HttpServletResponse response) {
        System.err.println("showSettingSpCake");
       // rejectRemark rm=new rejectRemark();
        RestTemplate restTemplate = new RestTemplate();
		ModelAndView model = new ModelAndView("SettingSpCakeConfig");
		List<SpecialCake> specialCakeList = new ArrayList<SpecialCake>();

		try {

			SpCakeResponse spCakeResponse = restTemplate.getForObject(Constants.url + "showSpecialCakeList",
			SpCakeResponse.class);
			specialCakeList = spCakeResponse.getSpecialCake();
			System.out.println("specialCakeList"+specialCakeList);
			model.addObject("specialCakeList", specialCakeList);
//			    rejectRemark[] array = restTemplate.getForObject(Constants.url + "/getAllRejectRemark",
//						rejectRemark[].class);
//				List<rejectRemark> stationList = new ArrayList<rejectRemark>(Arrays.asList(array));
//				model.addObject("stationList", stationList);
//				System.out.println(stationList);
				
			
		} catch (Exception e) {
			System.out.println("Exce in SettingSpCake " + e.getMessage());
			e.printStackTrace();
		}

		return model;
	}
	
	
	@RequestMapping(value = "/updateSpCake", method = RequestMethod.POST)
	public ModelAndView updateSpCake(HttpServletRequest request, HttpServletResponse response) {
	System.err.println("Reject spcake");
    NewSetting set=new NewSetting();
    NewSetting set1=new NewSetting();
		ModelAndView mav = new ModelAndView("SettingSpCakeConfig");
		try {
       
			RestTemplate restTemplate = new RestTemplate();
		
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			
			String[] itemIds = request.getParameterValues("selectFr");
			System.out.println("df form"+itemIds);
			StringBuilder sb = new StringBuilder();

			for (int i = 0; i < itemIds.length; i++) {
				sb = sb.append(itemIds[i] + ",");
			}
			String items = sb.toString();
			items = items.substring(0, items.length() - 1);
			//set.setExVarchar2(items);
			map.add("itemId", items);
			System.out.println("df output"+items);
			
			 set1 = restTemplate.postForObject(Constants.url + "postUpdateSpCake", map, NewSetting.class);
		    }

	
			catch (Exception e) {
				e.printStackTrace();
			}
		return mav;
			
			
	} 
}
