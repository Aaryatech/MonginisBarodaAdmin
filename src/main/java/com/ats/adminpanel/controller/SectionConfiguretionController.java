package com.ats.adminpanel.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.ats.adminpanel.commons.Constants;
import com.ats.adminpanel.model.NewSectionWithType;
import com.ats.adminpanel.model.SectionType;
import com.ats.adminpanel.model.franchisee.Menu;

@Controller
@Scope("session")
public class SectionConfiguretionController {

	
	
	List<SectionType> sectionTypeList =new ArrayList<>();
	List<NewSectionWithType> sectionList=new ArrayList<>();
	
	
	
	@RequestMapping(value = "/showSectionConfig", method = RequestMethod.GET)
	public ModelAndView showSectionConfig(HttpServletRequest request, HttpServletResponse response) {
		System.err.println("In /showSectionConfig");
		ModelAndView model=new ModelAndView("sectionConfig");
		RestTemplate restTemplate=new RestTemplate();
		try {
			

			SectionType[] SectionTypearray = restTemplate.getForObject(Constants.url + "/getAllSectionTypeByDelStatus", SectionType[].class);
			sectionTypeList 	= new ArrayList<SectionType>(Arrays.asList(SectionTypearray));
			model.addObject("sectionTypeList", sectionTypeList);
		//	System.err.println("Sec Type List-->"+sectionTypeList);
			
			NewSectionWithType[] array = restTemplate.getForObject(Constants.url + "/getSectionListWithTypeNew", NewSectionWithType[].class);
			sectionList = new ArrayList<NewSectionWithType>(Arrays.asList(array));
			model.addObject("sectionList", sectionList);
		//	System.err.println("Sec With Type List-->"+sectionList);
			Menu[] allMenus = restTemplate.getForObject(Constants.url + "/getAllMenuList", Menu[].class);
			List<Menu> menuList = new ArrayList<Menu>(Arrays.asList(allMenus));
			model.addObject("menuList", menuList);
		} catch (Exception e) {
			// TODO: handle exception
		System.err.println("Excp In /showSectionConfig");
		e.printStackTrace();
		
		}
		return model;
	}
	
	
	@RequestMapping(value="/getSecByTypeAjax",method=RequestMethod.GET)
	public @ResponseBody List<NewSectionWithType>  getSecByTypeAjax(HttpServletRequest request){
		List<NewSectionWithType> secResp=new ArrayList<>();
		System.err.println("In /getSecByTypeAjax");
		try {
		String secTyStr=request.getParameter("secType");	
		secTyStr = secTyStr.substring(1, secTyStr.length() - 1);
		secTyStr = secTyStr.replaceAll("\"", "");
		String[] secTypes=secTyStr.split(",");
		for(int i=0;i<secTypes.length;i++) {
			for(NewSectionWithType sec :sectionList) {
				int secTypeId=Integer.parseInt(secTypes[i]);
				if(secTypeId==sec.getSectionType()) {
					secResp.add(sec);
				}
			}
		}
			
		//System.out.println("Ajax Resp-->"+secResp);	
		} catch (Exception e) {
			// TODO: handle exception
			System.err.println("Excep In /getSecByTypeAjax");
			e.printStackTrace();
		}
		return secResp;
	}
	
	
	@RequestMapping(value="/sectionConfigProcess",method=RequestMethod.POST)
	public String SectionConfigProcess(HttpServletRequest request) {
		System.err.println("In /sectionConfigProcess");
		RestTemplate restTemplate=new RestTemplate();
		List<NewSectionWithType> updatedList=new ArrayList<>();
		try {
			String[] secIds=request.getParameterValues("secIds");
			String[] menuIds=request.getParameterValues("menuIds");
			
			for(int i=0;i<secIds.length;i++) {
				for(NewSectionWithType sec :sectionList) {
					if(Integer.parseInt(secIds[i])==sec.getSectionId()) {
						//System.err.println("Sec-->"+sec.getSectionName()+"\t"+sec.getMenuIds());
						for(int j=0;j<menuIds.length;j++) {
							
							System.err.println(sec.getSectionName()+sec.getSectionId()+"\t"+sec.getMenuIds());
							System.err.println("Menu Id-->"+menuIds[j]);
							if(sec.getMenuIds().contains(menuIds[j])) {
								System.err.println("Alredy Exists");
							}else {
								System.err.println("New Menu"+menuIds[j]);
								System.err.println("Before Str==>"+sec.getMenuIds());
								
								
								String menuIdstr=sec.getMenuIds();
								menuIdstr=menuIdstr+","+menuIds[j];
								
								sec.setMenuIds(menuIdstr);
								updatedList.add(sec);
								System.err.println("After Add"+sec.getMenuIds());
							}
						}
							
							
						
					}	
				}
				
				
			}
			
			
			Integer resp = restTemplate.postForObject(Constants.url + "/updateAllSectionMenu",updatedList, Integer.class);
			
			System.err.println("Resp-->"+resp);
		
					
			
		} catch (Exception e) {
			// TODO: handle exception
			System.err.println("Excp In /sectionConfigProcess");
			e.printStackTrace();
			
		}
		return "redirect:/showSectionConfig";
	}
	
	
	
	
	
	
}
