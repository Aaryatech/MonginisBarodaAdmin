package com.ats.adminpanel.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.StringJoiner;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.ats.adminpanel.commons.AccessControll;
import com.ats.adminpanel.commons.Constants;
import com.ats.adminpanel.model.AllRoutesListResponse;
import com.ats.adminpanel.model.ExportToExcel;
import com.ats.adminpanel.model.GetOrder;
import com.ats.adminpanel.model.Info;
import com.ats.adminpanel.model.RegSpCakeReportResponse;
import com.ats.adminpanel.model.RegularSpCkOrdersResponse;
import com.ats.adminpanel.model.Route;
import com.ats.adminpanel.model.Section;
import com.ats.adminpanel.model.SpCakeOrdersBean;
import com.ats.adminpanel.model.SpCakeOrdersBeanResponse;
import com.ats.adminpanel.model.accessright.ModuleJson;
import com.ats.adminpanel.model.franchisee.AllFranchiseeList;
import com.ats.adminpanel.model.franchisee.AllMenuResponse;
import com.ats.adminpanel.model.franchisee.FrNameIdByRouteId;
import com.ats.adminpanel.model.franchisee.FrNameIdByRouteIdResponse;
import com.ats.adminpanel.model.franchisee.FranchiseeList;
import com.ats.adminpanel.model.franchisee.Menu;

@Controller
@Scope("session")
public class SpCakeListController {

	public List<FranchiseeList> franchiseeList = new ArrayList<FranchiseeList>();
	public List<FranchiseeList> tempFrList = new ArrayList<FranchiseeList>();
	public List<FranchiseeList> selectedFrList = new ArrayList<FranchiseeList>();
	public List<SpCakeOrdersBean> spCakeOrderList = new ArrayList<SpCakeOrdersBean>();
	List<GetOrder> orderList = null;
	public List<Menu> menuList;String message="";
	SpCakeOrdersBeanResponse orderListResponse;
	RegularSpCkOrdersResponse regOrderListResponse;
	List<Section> section = new ArrayList<Section>();

	List<Section> sectionforMenu = new ArrayList<Section>();
	// special cake orders
		List<Menu> allMenuList=null;
		@RequestMapping(value = "/showSpCakeList")
		public ModelAndView spCakeList(HttpServletRequest request, HttpServletResponse response) {
			
			ModelAndView model = null;
			HttpSession session = request.getSession();

			List<ModuleJson> newModuleList = (List<ModuleJson>) session.getAttribute("newModuleList");
			Info view = AccessControll.checkAccess("spCakeOrders", "spCakeOrders", "1", "0", "0", "0", newModuleList);

			if (view.getError() == true) {

				model = new ModelAndView("accessDenied");

			} else {
				model = new ModelAndView("orders/spCakeLst");
				Constants.mainAct = 4;
				Constants.subAct = 28;
				try {
					RestTemplate restTemplate = new RestTemplate();
					AllFranchiseeList allFranchiseeList = restTemplate.getForObject(Constants.url + "getAllFranchisee",
							AllFranchiseeList.class);

					// franchiseeList= new ArrayList<FranchiseeList>();
					franchiseeList = allFranchiseeList.getFranchiseeList();
					AllRoutesListResponse allRouteListResponse = restTemplate.getForObject(Constants.url + "showRouteList",
							AllRoutesListResponse.class);

					List<Route> routeList = new ArrayList<Route>();

					routeList = allRouteListResponse.getRoute();
					model.addObject("routeList", routeList);

					model.addObject("todayDate", new SimpleDateFormat("dd-MM-yyyy").format(new Date()));
					model.addObject("franchiseeList", franchiseeList);
					
//					Menu[] menuArray = restTemplate.getForObject(Constants.url + "getAllMenuList", Menu[].class);
//					allMenuList =new ArrayList<>(Arrays.asList(menuArray));
				
					//model.addObject("allMenuList", allMenuList);
					
					MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
					map.add("sectionId", Constants.SPECIAL_ORDER_CAKE_LIST_SECTION_ID);
					Section[] sectionArr = restTemplate.postForObject(Constants.url + "getSections", map, Section[].class);
					section = new ArrayList<Section>(Arrays.asList(sectionArr));	
					model.addObject("section", section);
					
					System.out.println("franchiseeList" +franchiseeList);
					System.out.println("routeList" +routeList); 
					System.out.println("sectionArr" +sectionArr);
				//	System.out.println("frMenuList" +allMenuList);
					model.addObject("url", Constants.SPCAKE_IMAGE_URL);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}

			return model;
		}
		
		@RequestMapping(value = "/spCakeListProcess", method = RequestMethod.GET)
		public @ResponseBody List<SpCakeOrdersBean> spCakeListProcess(HttpServletRequest request,
				HttpServletResponse response) {
			ModelAndView model = null;
			System.out.println("/inside search sp cake order process  ");
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			RestTemplate restTemplate1 = new RestTemplate();
			spCakeOrderList = new ArrayList<SpCakeOrdersBean>();
			/* try { */
			model = new ModelAndView("orders/spcakeorders");
			model.addObject("franchiseeList", franchiseeList);

			String frIdString = request.getParameter("fr_id_list");
			String fromDate = request.getParameter("fromDate");
			String toDate = request.getParameter("toDate");
			int routeId = Integer.parseInt(request.getParameter("route_id"));
			String spMenuId = request.getParameter("spMenuId");
			List<String> franchIds = new ArrayList();

			if (frIdString != null) {
				frIdString = frIdString.substring(1, frIdString.length() - 1);
				frIdString = frIdString.replaceAll("\"", "");
				System.out.println("frIds  New =" + frIdString);

				franchIds = Arrays.asList(frIdString);
			}
			System.out.println("fr Id ArrayList " + franchIds.toString());
			if (routeId != 0) {

				MultiValueMap<String, Object> mvm = new LinkedMultiValueMap<String, Object>();

				RestTemplate restTemplate = new RestTemplate();

				mvm.add("routeId", routeId);

				FrNameIdByRouteIdResponse frNameId = restTemplate.postForObject(Constants.url + "getFrNameIdByRouteId", mvm,
						FrNameIdByRouteIdResponse.class);

				List<FrNameIdByRouteId> frNameIdByRouteIdList = frNameId.getFrNameIdByRouteIds();

				System.out.println("route wise franchisee " + frNameIdByRouteIdList.toString());

				StringBuilder sbForRouteFrId = new StringBuilder();
				for (int i = 0; i < frNameIdByRouteIdList.size(); i++) {

					sbForRouteFrId = sbForRouteFrId.append(frNameIdByRouteIdList.get(i).getFrId().toString() + ",");

				}

				String strFrIdRouteWise = sbForRouteFrId.toString();
				frIdString = strFrIdRouteWise.substring(0, strFrIdRouteWise.length() - 1);
				System.out.println("fr Id Route WISE = " + frIdString);
				map = new LinkedMultiValueMap<String, Object>();
				
				
				//Akhilesh 2021-03-22
				spMenuId = spMenuId.substring(1, spMenuId.length() - 1);
				spMenuId = spMenuId.replaceAll("\"", "");
				
				String[] mIds=spMenuId.split(",");
				List<Integer> menuIdsInt=new ArrayList<>();
				for(String s : mIds) {
					menuIdsInt.add(Integer.parseInt(s));
					
				  	  
				}
				
				System.err.println("MenusIds---->"+spMenuId);
				
				
				map.add("frId", frIdString);
				map.add("fromDate", fromDate);
				map.add("toDate", toDate);
	            map.add("spMenuId", spMenuId);
				SpCakeOrdersBeanResponse orderListResponse = restTemplate1
						.postForObject(Constants.url + "getSpCakeLists", map, SpCakeOrdersBeanResponse.class); // s
																													// added

				spCakeOrderList = orderListResponse.getSpCakeOrdersBean();
				model.addObject("spCakeOrderList", spCakeOrderList);

			} else

			if (franchIds.contains("0")) {
				System.out.println("all fr selected");
				
				
				spMenuId = spMenuId.substring(1, spMenuId.length() - 1);
				spMenuId = spMenuId.replaceAll("\"", "");

				map.add("fromDate", fromDate);
				map.add("toDate", toDate);
				map.add("spMenuId", spMenuId);
				orderListResponse = restTemplate1.postForObject(Constants.url + "getAllFrSpCakeList1", map,
						SpCakeOrdersBeanResponse.class);

				spCakeOrderList = orderListResponse.getSpCakeOrdersBean();

				System.out.println("order list is" + spCakeOrderList.toString());
				System.out.println("order list count is" + spCakeOrderList.size());

				model.addObject("spCakeOrderList", spCakeOrderList);

			} // end of if

			else {

				System.out.println("few fr selected" + frIdString.toString());
				
				

				//Akhilesh 2021-03-22
				spMenuId = spMenuId.substring(1, spMenuId.length() - 1);
				spMenuId = spMenuId.replaceAll("\"", "");
				
				String[] mIds=spMenuId.split(",");
				List<Integer> menuIdsInt=new ArrayList<>();
				for(String s : mIds) {
					menuIdsInt.add(Integer.parseInt(s));
					
					
				}
				

				map.add("frId", frIdString);
				map.add("fromDate", fromDate);
				map.add("toDate", toDate);
				map.add("spMenuId",spMenuId );
				SpCakeOrdersBeanResponse orderListResponse = restTemplate1
						.postForObject(Constants.url + "getSpCakeLists", map, SpCakeOrdersBeanResponse.class); // s
																													// added

				spCakeOrderList = orderListResponse.getSpCakeOrdersBean();
				System.out.println("order list is" + spCakeOrderList.toString());
				System.out.println("order list count is" + spCakeOrderList.size());
				model.addObject("spCakeOrderList", spCakeOrderList);

			} // end of else

			/*
			 * } catch (Exception e) { System.out.println("exception in order display" +
			 * e.getMessage()); }
			 */

			List<ExportToExcel> exportToExcelList = new ArrayList<ExportToExcel>();

			ExportToExcel expoExcel = new ExportToExcel();
			List<String> rowData = new ArrayList<String>();
			rowData.add("Sr. No");
			rowData.add("Order No");
			rowData.add("Slip No");
			rowData.add("Franchisee Name");
			rowData.add("Sp Code");
			rowData.add("Sp Name");
			rowData.add("Weight");
			rowData.add("Sp Flavour");
			rowData.add("Event");
			rowData.add("Price");
			rowData.add("Sp Total Add Rate");

			expoExcel.setRowData(rowData);
			exportToExcelList.add(expoExcel);
			for (int i = 0; i < spCakeOrderList.size(); i++) {
				expoExcel = new ExportToExcel();
				rowData = new ArrayList<String>();
				rowData.add((i+1)+"");
				rowData.add("" + spCakeOrderList.get(i).getSpOrderNo());
				rowData.add("" + spCakeOrderList.get(i).getSlipNo());

				rowData.add(spCakeOrderList.get(i).getFrName());
	     		rowData.add(spCakeOrderList.get(i).getSpCode());

				rowData.add(spCakeOrderList.get(i).getSpName());
				rowData.add(""+spCakeOrderList.get(i).getSpSelectedWeight());
				rowData.add(spCakeOrderList.get(i).getSpfName());

				rowData.add(spCakeOrderList.get(i).getSpEvents());
				rowData.add("" + spCakeOrderList.get(i).getSpPrice());
				rowData.add("" + spCakeOrderList.get(i).getSpTotalAddRate());

				expoExcel.setRowData(rowData);
				exportToExcelList.add(expoExcel);
				System.out.println("List" + spCakeOrderList.get(i).toString());
			}

			HttpSession session = request.getSession();
			session.setAttribute("exportExcelList", exportToExcelList);
			session.setAttribute("excelName", "SpCakeOrders");
			return spCakeOrderList;
		}

		//New
		@RequestMapping(value = "/showList")
		public ModelAndView showList(HttpServletRequest request, HttpServletResponse response) {
			
			ModelAndView model = null;
			HttpSession session = request.getSession();

			List<ModuleJson> newModuleList = (List<ModuleJson>) session.getAttribute("newModuleList");
			Info view = AccessControll.checkAccess("spCakeOrders", "spCakeOrders", "1", "0", "0", "0", newModuleList);

			if (view.getError() == true) {

				model = new ModelAndView("accessDenied");

			} else {
				model = new ModelAndView("orders/regSpCkListRep");
				Constants.mainAct = 4;
				Constants.subAct = 28;
				try {
					RestTemplate restTemplate = new RestTemplate();
					AllFranchiseeList allFranchiseeList = restTemplate.getForObject(Constants.url + "getAllFranchisee",
							AllFranchiseeList.class);

					// franchiseeList= new ArrayList<FranchiseeList>();
					franchiseeList = allFranchiseeList.getFranchiseeList();
					AllRoutesListResponse allRouteListResponse = restTemplate.getForObject(Constants.url + "showRouteList",
							AllRoutesListResponse.class);

					List<Route> routeList = new ArrayList<Route>();

					routeList = allRouteListResponse.getRoute();
					model.addObject("routeList", routeList);

					model.addObject("todayDate", new SimpleDateFormat("dd-MM-yyyy").format(new Date()));
					model.addObject("franchiseeList", franchiseeList);
					
//					Menu[] menuArray = restTemplate.getForObject(Constants.url + "getAllMenuList", Menu[].class);
//					allMenuList =new ArrayList<>(Arrays.asList(menuArray));
//				
//					model.addObject("allMenuList", allMenuList);
					
					MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
					map.add("sectionId", Constants.REG_SPECIAL_ORDER_CAKE_LIST_REP_SECTION_TYPE);
					Section[] sectionArr = restTemplate.postForObject(Constants.url + "getSections", map, Section[].class);
					section = new ArrayList<Section>(Arrays.asList(sectionArr));
					sectionforMenu =section;
					model.addObject("section", section);
					
					System.out.println("routeList" +routeList); 
					System.out.println("sectionArr" +sectionArr);
					
					model.addObject("url", Constants.SPCAKE_IMAGE_URL);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}

			return model;
		}

		public List<Section> getSection(){
			return section;
		}
       //New 1
		@RequestMapping(value = "/regSpCakeListProcess", method = RequestMethod.GET)
		public @ResponseBody List<RegSpCakeReportResponse> regSpCakeListProcess(HttpServletRequest request,
				HttpServletResponse response) {
			ModelAndView model = null;
			System.out.println("/inside regSpCakeListProcess  ");
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			RestTemplate restTemplate1 = new RestTemplate();
//				List<RegSpCakeReportResponse> RegSpCakeReportResponse1 =  new  ArrayList<RegSpCakeReportResponse>();
				
				RegSpCakeReportResponse[]	RegSpCakeReportResponse1;
//			RegSpCakeReportResponse RegSpCakeReportResponse1=new RegSpCakeReportResponse();
			spCakeOrderList = new ArrayList<SpCakeOrdersBean>();
			/* try { */
			model = new ModelAndView("orders/ordmng");
			model.addObject("franchiseeList", franchiseeList);

			String frIdString = request.getParameter("fr_id_list");
			String fromDate = request.getParameter("fromDate");
			String toDate = request.getParameter("toDate");
			int routeId = Integer.parseInt(request.getParameter("route_id"));
			String spMenuId = request.getParameter("spMenuId");
			List<String> franchIds = new ArrayList();

			if (frIdString != null) {
				frIdString = frIdString.substring(1, frIdString.length() - 1);
				frIdString = frIdString.replaceAll("\"", "");
				System.out.println("frIds  New =" + frIdString);

				franchIds = Arrays.asList(frIdString);
			}
			System.out.println("fr Id ArrayList " + franchIds.toString());
			if (routeId != 0) {

				MultiValueMap<String, Object> mvm = new LinkedMultiValueMap<String, Object>();

				RestTemplate restTemplate = new RestTemplate();

				mvm.add("routeId", routeId);

				FrNameIdByRouteIdResponse frNameId = restTemplate.postForObject(Constants.url + "getFrNameIdByRouteId", mvm,
						FrNameIdByRouteIdResponse.class);

				List<FrNameIdByRouteId> frNameIdByRouteIdList = frNameId.getFrNameIdByRouteIds();

				System.out.println("route wise franchisee " + frNameIdByRouteIdList.toString());

				StringBuilder sbForRouteFrId = new StringBuilder();
				for (int i = 0; i < frNameIdByRouteIdList.size(); i++) {

					sbForRouteFrId = sbForRouteFrId.append(frNameIdByRouteIdList.get(i).getFrId().toString() + ",");

				}

				String strFrIdRouteWise = sbForRouteFrId.toString();
				frIdString = strFrIdRouteWise.substring(0, strFrIdRouteWise.length() - 1);
				System.out.println("fr Id Route WISE = " + frIdString);
				map = new LinkedMultiValueMap<String, Object>();
				
				
				//Akhilesh 2021-03-22
				spMenuId = spMenuId.substring(1, spMenuId.length() - 1);
				spMenuId = spMenuId.replaceAll("\"", "");
				
				String[] mIds=spMenuId.split(",");
				List<Integer> menuIdsInt=new ArrayList<>();
				for(String s : mIds) {
					menuIdsInt.add(Integer.parseInt(s));
					
				  	  
				}
				
				System.err.println("MenusIds---->"+spMenuId);
				
				System.out.println("frIdString 7777777777777777777777777 is"+frIdString);
				map.add("frId", frIdString);
				map.add("fromDate", fromDate);
				map.add("toDate", toDate);
	            map.add("spMenuId", spMenuId);
	        	System.out.println("all fr selected frIdString vvvvvvv frId"+frIdString);
	        	 RegSpCakeReportResponse1 = restTemplate1
						.postForObject(Constants.url + "getRegSpCakeLists", map, RegSpCakeReportResponse[].class); // s
																													// added

					System.out.println("order getRegSpCakeLists is rt" + RegSpCakeReportResponse1);
				//spCakeOrderList = orderListResponse.getSpCakeOrdersBean();
				model.addObject("RegSpCakeReportResponse1", RegSpCakeReportResponse1);

			} else

			if (franchIds.contains("0")) {
				System.out.println("all fr selected");
				
				
				spMenuId = spMenuId.substring(1, spMenuId.length() - 1);
				spMenuId = spMenuId.replaceAll("\"", "");

				map.add("fromDate", fromDate);
				map.add("toDate", toDate);
				map.add("spMenuId", spMenuId);
				
				 RegSpCakeReportResponse1 = restTemplate1.postForObject(Constants.url + "getAllFrRegSpCakeList1", map,
						RegSpCakeReportResponse[].class);
				 System.out.println("This is Api" );
					System.out.println("Api getAllFrRegSpCakeList1 is" + RegSpCakeReportResponse1);
				//spCakeOrderList = orderListResponse.getSpCakeOrdersBean();

				System.out.println("order list is" + spCakeOrderList.toString());
				System.out.println("order list count is" + spCakeOrderList.size());

				model.addObject("RegSpCakeReportResponse1", RegSpCakeReportResponse1);

			} // end of if

			else {

				System.out.println("few fr selected" + frIdString.toString());
				
				

				//Akhilesh 2021-03-22
				spMenuId = spMenuId.substring(1, spMenuId.length() - 1);
				spMenuId = spMenuId.replaceAll("\"", "");
				
				String[] mIds=spMenuId.split(",");
				List<Integer> menuIdsInt=new ArrayList<>();
				for(String s : mIds) {
					menuIdsInt.add(Integer.parseInt(s));
					
					
				}
				

				map.add("frId", frIdString);
				map.add("fromDate", fromDate);
				map.add("toDate", toDate);
				map.add("spMenuId",spMenuId );
				System.out.println("order list fromDateqqqqq" + fromDate);
				System.out.println("order list spMenuId" + spMenuId);
				System.out.println("order list toDate" + toDate);
				System.out.println("order list frIdString" + frIdString);
				
				
				
					RegSpCakeReportResponse1= restTemplate1
						.postForObject(Constants.url + "getRegSpCakeLists", map,RegSpCakeReportResponse[].class); // s
				List<RegSpCakeReportResponse> resp =new ArrayList<RegSpCakeReportResponse>(Arrays.asList(RegSpCakeReportResponse1));	
				// added
				System.out.println("order getRegSpCakeLists RegSpCakeReportResponse1 fr" + resp);
				//spCakeOrderList = orderListResponse.getSpCakeOrdersBean();
				System.out.println("order list is" + allMenuList);
				System.out.println("order list count is" + spCakeOrderList.size());
				model.addObject("RegSpCakeReportResponse1", resp);
				
				List<ExportToExcel> exportToExcelList = new ArrayList<ExportToExcel>();

				ExportToExcel expoExcel = new ExportToExcel();
				List<String> rowData = new ArrayList<String>();
				rowData.add("Sr. No");
				rowData.add("Franchisee Name");
				rowData.add("Product Name");
				rowData.add("Qty");
				rowData.add("Customer Name");
				rowData.add("Mobile Name");

				expoExcel.setRowData(rowData);
				exportToExcelList.add(expoExcel);
				for (int i = 0; i < resp.size(); i++) {
					expoExcel = new ExportToExcel(); 
					rowData = new ArrayList<String>();
					rowData.add((i+1)+"");
					rowData.add("" + resp.get(i).getFrName());
					rowData.add("" + resp.get(i).getItemName());

					rowData.add(resp.get(i).getQty());
		     		rowData.add(resp.get(i).getRspCustMobileNo());

					rowData.add(resp.get(i).getRspCustName());
					
					expoExcel.setRowData(rowData);
					exportToExcelList.add(expoExcel);
					
				}
				HttpSession session = request.getSession();
				session.setAttribute("exportExcelList", exportToExcelList);
				session.setAttribute("excelName", "SpCakeOrders");

			} // end of else

			/*
			 * } catch (Exception e) { System.out.println("exception in order display" +
			 * e.getMessage()); }
			 */

	

			
			

			System.out.println("orderListResponse"+RegSpCakeReportResponse1);
			List<RegSpCakeReportResponse> resp =new ArrayList<RegSpCakeReportResponse>(Arrays.asList(RegSpCakeReportResponse1));
			return resp;
		}

		@RequestMapping(value = "/updateRegSpCKByIdAjax", method = RequestMethod.GET)
		public @ResponseBody RegSpCakeReportResponse getRegSpCKByIdAjax(HttpServletRequest request, HttpServletResponse response) {

			RegSpCakeReportResponse RegSpCakeReportResponse1=new RegSpCakeReportResponse();
			RestTemplate restTemplate = new RestTemplate();
			int stateId = Integer.parseInt(request.getParameter("rspId"));
			int qty = Integer.parseInt(request.getParameter("qty"));
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
			map.add("rspId", stateId);
			map.add("qty", qty);
			RegSpCakeReportResponse1= restTemplate
					.postForObject(Constants.url + "updateRegSpCkReport", map, RegSpCakeReportResponse.class);
			
			return RegSpCakeReportResponse1;
		}
		
		@RequestMapping(value = "/RegSpOrderMenusSectionAjax", method = RequestMethod.GET)
		public @ResponseBody List<Menu> getRegSpOrderMenusSectionAjax(HttpServletRequest request, HttpServletResponse response) {			
			try {
				
				RestTemplate restTemplate = new RestTemplate();	
				MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();			
				int sectionId = Integer.parseInt(request.getParameter("sectionId"));
				System.out.println(" sectionId in menu api" +sectionId);			

					StringJoiner sj = new StringJoiner(",");

					for (int i = 0; i < section.size(); i++) {
						System.out.println(" section in for loop api" +section);

						System.out.println(" sectionId in for loop api" +section.get(i).getSectionId());
						if (section.get(i).getSectionId() == sectionId) {
							sj.add(section.get(i).getMenuIds());
						}
					}
					System.out.println("value of sj" +sj);
					map = new LinkedMultiValueMap<String, Object>();
					map.add("menuIds", sj.toString());
					System.out.println(" sectionId menu api 2" +sj.toString());
				AllMenuResponse menuResponse = restTemplate.postForObject(Constants.url + "getMenuListByMenuIds", map,
						AllMenuResponse.class);	
				System.out.println(" menuResponse" +menuResponse);
				List<Menu> menus = menuResponse.getMenuConfigurationPage();
				System.out.println(" menus" +menus);
				
				menuList = new ArrayList<Menu>();
				for(Menu menu : menus) {
					if(menu.getMainCatId()==2) {					
						menuList.add(menu);
					}
				}
				
			}catch (Exception e) {
				System.out.println("Exception in getSpOrderMenusSectionAjax" + e.getMessage());
				e.printStackTrace();
			}
			return menuList;
		}	

		
		@RequestMapping(value = "/deleteRegSpByIdAjax", method = RequestMethod.GET)
		public @ResponseBody Info deleteStateByIdAjax(HttpServletRequest request, HttpServletResponse response) {
			Info info = new Info();
			try {
				
				RestTemplate restTemplate = new RestTemplate();
				int rspId =  Integer.parseInt(request.getParameter("rspId"));
				
				MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
				map.add("rspId", rspId);
				info = restTemplate
						.postForObject(Constants.url + "deleteRegSpCkReport", map, Info.class);			
				
			}catch (Exception e) {
				System.out.println("Excep in /deleteRegSpCkReport : "+e.getMessage());
				e.printStackTrace();
			}
			return info;
			
		}
		
		@RequestMapping(value = "/getSpOrderListMenusSectionAjax", method = RequestMethod.GET)
		public @ResponseBody List<Menu> getAllCatAjax(HttpServletRequest request, HttpServletResponse response) {			
			try {
				
				RestTemplate restTemplate = new RestTemplate();	
				MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();			
				int sectionId = Integer.parseInt(request.getParameter("sectionId"));
						
					StringJoiner sj = new StringJoiner(",");

					for (int i = 0; i < section.size(); i++) {
						if (section.get(i).getSectionId() == sectionId) {
							sj.add(section.get(i).getMenuIds());
						}
					}
					 
					map = new LinkedMultiValueMap<String, Object>();
					map.add("menuIds", sj.toString());
					
				AllMenuResponse menuResponse = restTemplate.postForObject(Constants.url + "getMenuListByMenuIds", map,
						AllMenuResponse.class);	
				System.out.println(" menuResponse" +menuResponse);
				List<Menu> menus = menuResponse.getMenuConfigurationPage();
				System.out.println(" menus" +menus);
				
				menuList = new ArrayList<Menu>();
				for(Menu menu : menus) {
					if(menu.getMainCatId()==5) {					
						menuList.add(menu);
					}
				}
				
			}catch (Exception e) {
				System.out.println("Exception in getSpOrderMenusSectionAjax" + e.getMessage());
				e.printStackTrace();
			}
			return menuList;
		}	
}
