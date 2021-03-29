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
import com.ats.adminpanel.model.rejectRemark;
import com.ats.adminpanel.model.modules.ErrorMessage;

@Controller
@Scope("session")
public class RejectRemarkController {
	
	@RequestMapping(value = "/showRejectRemark", method = RequestMethod.GET)
	public ModelAndView showRejectRemark(HttpServletRequest request, HttpServletResponse response) {
        System.err.println("Reject Remark");
        rejectRemark rm=new rejectRemark();
        RestTemplate restTemplate = new RestTemplate();
		ModelAndView model = new ModelAndView("RejectRemark");

		try {

			
			    rejectRemark[] array = restTemplate.getForObject(Constants.url + "/getAllRejectRemark",
						rejectRemark[].class);
				List<rejectRemark> stationList = new ArrayList<rejectRemark>(Arrays.asList(array));
				model.addObject("stationList", stationList);
				model.addObject("rm", rm);
				System.out.println(stationList);
				
			
		} catch (Exception e) {
			System.out.println("Exce in showRegCakeSpOrderReport " + e.getMessage());
			e.printStackTrace();
		}

		return model;
	}
	

	
	@RequestMapping(value = "/RejectRemark", method = RequestMethod.POST)
	public String RejectRemark(HttpServletRequest request, HttpServletResponse response) {
	System.err.println("Reject Remark");
     // List<PosConfigItem> list = new ArrayList<PosConfigItem>();
      
	rejectRemark rm=new rejectRemark();
		ModelAndView mav = new ModelAndView("RejectRemark");
		try {
       System.out.println("df");
			RestTemplate restTemplate = new RestTemplate();
		
			
			//	int catId = Integer.parseInt(request.getParameter("cat_id"));
			int rejectId = Integer.parseInt(request.getParameter("reject_id"));
			String rejectRemark = request.getParameter("reject_remark");
	        String rejectDesc = request.getParameter("reject_desc");
	        
	        rm.setRejectId(rejectId);
	        rm.setRejectRemark(rejectRemark);
	        rm.setRejectDesc(rejectDesc);
	        rm.setExInt1(0);
	        rm.setExInt2(0);
	        rm.setDelStatus(0);
	        rm.setExVar1("NA");
	        rm.setExVar2("NA");
	        
	       
      
            
            
	        rejectRemark info = restTemplate.postForObject(Constants.url + "postAllRejectRemark", rm, rejectRemark.class);
			
			
	} catch (Exception e) {
			System.out.println("Reject REmark Request Page Exception:  " + e.getMessage());
			e.printStackTrace();
		}
  		return "redirect:/showRejectRemark";
      }

	
	@RequestMapping(value ="/deleteRemark/{idList}", method = RequestMethod.GET)
	public String deleteItem(@PathVariable int  idList) {
		System.err.println(" In /deleteRemark");
		// String id=request.getParameter("id");
		try {
			ModelAndView mav = new ModelAndView("RejectRemark");
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
			ErrorMessage errorResponse = rest.postForObject("" + Constants.url + "deleteRemark", map, ErrorMessage.class);
			System.out.println(errorResponse.toString());


			if (errorResponse.getError()) {

				return "redirect:/showRejectRemark";
			} else {
				return "redirect:/showRejectRemark";

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/showRejectRemark";
	}

	
	   @RequestMapping(value ="/updateRemark/{rejectId}", method = RequestMethod.GET)
	    public ModelAndView updateRemark(@PathVariable int rejectId) {
		ModelAndView mav = new ModelAndView("RejectRemark");
         rejectRemark rm=new rejectRemark();
		RestTemplate restTemplate = new RestTemplate();
	
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("rejectId", rejectId);
		System.out.println("rejectId" + rejectId);
	    rm = restTemplate.postForObject("" + Constants.url + "getAllRejectRemarkById", map, rejectRemark.class);
		System.out.println("array1" + rm);
		mav.addObject("rm", rm);
//		   rejectRemark[] array = restTemplate.getForObject(Constants.url + "/getAllRejectRemark",
//						rejectRemark[].class);
//				List<rejectRemark> stationList = new ArrayList<rejectRemark>(Arrays.asList(array));
//				model.addObject("stationList", stationList);
//				System.out.println(stationList);
					
		return mav;

	}

}
