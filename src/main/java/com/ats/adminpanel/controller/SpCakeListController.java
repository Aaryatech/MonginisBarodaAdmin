package com.ats.adminpanel.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

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
import com.ats.adminpanel.model.RegularSpCkOrdersResponse;
import com.ats.adminpanel.model.Route;
import com.ats.adminpanel.model.Section;
import com.ats.adminpanel.model.SpCakeOrdersBean;
import com.ats.adminpanel.model.SpCakeOrdersBeanResponse;
import com.ats.adminpanel.model.accessright.ModuleJson;
import com.ats.adminpanel.model.franchisee.AllFranchiseeList;
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
				
					model.addObject("allMenuList", allMenuList);
					
					MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
					map.add("sectionId", Constants.SPECIAL_ORDER_CAKE_LIST_SECTION_ID);
					Section[] sectionArr = restTemplate.postForObject(Constants.url + "getSections", map, Section[].class);
					section = new ArrayList<Section>(Arrays.asList(sectionArr));	
					model.addObject("section", section);
					
					System.out.println("franchiseeList" +franchiseeList);
					System.out.println("routeList" +routeList); 
					System.out.println("sectionArr" +sectionArr);
					System.out.println("frMenuList" +allMenuList);
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
				model = new ModelAndView("orders/ordmng");
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
					map.add("sectionId", Constants.SPECIAL_ORDER_CAKE_LIST_SECTION_ID);
					Section[] sectionArr = restTemplate.postForObject(Constants.url + "getSections", map, Section[].class);
					section = new ArrayList<Section>(Arrays.asList(sectionArr));	
					model.addObject("section", section);
					
					System.out.println("franchiseeList" +franchiseeList);
					System.out.println("routeList" +routeList); 
					System.out.println("sectionArr" +sectionArr);
					System.out.println("frMenuList" +allMenuList);
					model.addObject("url", Constants.SPCAKE_IMAGE_URL);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}

			return model;
		}

       //New 1
		@RequestMapping(value = "/regSpCakeListProcess", method = RequestMethod.GET)
		public @ResponseBody List<SpCakeOrdersBean> regSpCakeListProcess(HttpServletRequest request,
				HttpServletResponse response) {
			ModelAndView model = null;
			System.out.println("/inside regSpCakeListProcess  ");
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			RestTemplate restTemplate1 = new RestTemplate();
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
				SpCakeOrdersBeanResponse orderListResponse = restTemplate1
						.postForObject(Constants.url + "getRegSpCakeLists", map, SpCakeOrdersBeanResponse.class); // s
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
				orderListResponse = restTemplate1.postForObject(Constants.url + "getAllFrRegSpCakeList1", map,
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
						.postForObject(Constants.url + "getRegSpCakeLists", map, SpCakeOrdersBeanResponse.class); // s
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


}
