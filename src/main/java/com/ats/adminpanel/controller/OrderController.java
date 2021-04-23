package com.ats.adminpanel.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.StringJoiner;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.ats.adminpanel.commons.AccessControll;
import com.ats.adminpanel.commons.Constants;
import com.ats.adminpanel.model.AllMenus;
import com.ats.adminpanel.model.AllRoutesListResponse;
import com.ats.adminpanel.model.ChangeOrderRecord;
import com.ats.adminpanel.model.ConfigureFrBean;
import com.ats.adminpanel.model.ConfigureFrListResponse;
import com.ats.adminpanel.model.ExportToExcel;
import com.ats.adminpanel.model.FrMenu;
import com.ats.adminpanel.model.GetOrder;
import com.ats.adminpanel.model.GetOrderListResponse;
import com.ats.adminpanel.model.GetRegSpCakeOrders;
import com.ats.adminpanel.model.GetSpCakeOrders;
import com.ats.adminpanel.model.GetSpCkOrder;
import com.ats.adminpanel.model.Info;
import com.ats.adminpanel.model.Orders;
import com.ats.adminpanel.model.RegularSpCkOrder;
import com.ats.adminpanel.model.RegularSpCkOrdersResponse;
import com.ats.adminpanel.model.Route;
import com.ats.adminpanel.model.Section;
import com.ats.adminpanel.model.SpCakeOrderUpdate;
import com.ats.adminpanel.model.SpCakeOrders;
import com.ats.adminpanel.model.SpCakeOrdersBean;
import com.ats.adminpanel.model.SpCakeOrdersBeanResponse;
import com.ats.adminpanel.model.SplitOrderData;
import com.ats.adminpanel.model.SrWithIds;
import com.ats.adminpanel.model.accessright.ModuleJson;
import com.ats.adminpanel.model.franchisee.AllFranchiseeList;
import com.ats.adminpanel.model.franchisee.AllMenuResponse;
import com.ats.adminpanel.model.franchisee.FrNameIdByRouteId;
import com.ats.adminpanel.model.franchisee.FrNameIdByRouteIdResponse;
import com.ats.adminpanel.model.franchisee.FranchiseeList;
import com.ats.adminpanel.model.franchisee.Menu;
import com.ats.adminpanel.model.login.UserResponse;


@Controller
@Scope("session")
public class OrderController {
	public List<FranchiseeList> franchiseeList = new ArrayList<FranchiseeList>();
	public List<FranchiseeList> tempFrList = new ArrayList<FranchiseeList>();
	public List<FranchiseeList> selectedFrList = new ArrayList<FranchiseeList>();
	public List<SpCakeOrdersBean> spCakeOrderList = new ArrayList<SpCakeOrdersBean>();
	List<GetOrder> orderList = null;
	public List<Menu> menuList;String message="";
	SpCakeOrdersBeanResponse orderListResponse;
	RegularSpCkOrdersResponse regOrderListResponse;
	List<Section> section = new ArrayList<Section>();
	@RequestMapping(value = "/showOrders")
	public ModelAndView searchOrder(HttpServletRequest request, HttpServletResponse response) {

		// ModelAndView model=new ModelAndView("orders/orders");
		ModelAndView model = null;
		HttpSession session = request.getSession();

		List<ModuleJson> newModuleList = (List<ModuleJson>) session.getAttribute("newModuleList");
		Info view = AccessControll.checkAccess("showOrders", "showOrders", "1", "0", "0", "0", newModuleList);

		if (view.getError() == true) {

			model = new ModelAndView("accessDenied");

		} else {
			model = new ModelAndView("orders/orders");
			Constants.mainAct = 4;
			Constants.subAct = 27;

			try {
				RestTemplate restTemplate = new RestTemplate();
				AllFranchiseeList allFranchiseeList = restTemplate.getForObject(Constants.url + "getAllFranchisee",
						AllFranchiseeList.class);

				// franchiseeList= new ArrayList<FranchiseeList>();
				franchiseeList = allFranchiseeList.getFranchiseeList();

				model.addObject("franchiseeList", franchiseeList);
				model.addObject("allOtherFrList", tempFrList);
				model.addObject("selectedFrList", selectedFrList);
				model.addObject("date", new SimpleDateFormat("dd-MM-yyyy").format(new Date()));
				RestTemplate restTemplate1 = new RestTemplate();
				MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();		
			
				map.add("sectionId", Constants.REG_ORDER_LIST);
				Section[] sectionArr = restTemplate.postForObject(Constants.url + "getSections", map, Section[].class);
				section = new ArrayList<Section>(Arrays.asList(sectionArr));				
				
				StringJoiner sj = new StringJoiner(",");
				
				for (int i = 0; i < section.size(); i++) {					
					sj.add(section.get(i).getMenuIds());
				}				
				map = new LinkedMultiValueMap<String, Object>();
				map.add("menuIds", sj.toString());

				AllMenuResponse allMenuResponse = restTemplate1.postForObject(Constants.url + "getMenuListByMenuIds", map,
						AllMenuResponse.class);

				menuList = new ArrayList<Menu>();
				menuList = allMenuResponse.getMenuConfigurationPage();

				System.out.println("MENU LIST= " + menuList.toString());
				model.addObject("menuList", menuList);
				model.addObject("section", section);

				AllRoutesListResponse allRouteListResponse = restTemplate.getForObject(Constants.url + "showRouteList",
						AllRoutesListResponse.class);

				List<Route> routeList = new ArrayList<Route>();

				routeList = allRouteListResponse.getRoute();
				model.addObject("routeList", routeList);

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return model;

	}
	
	@RequestMapping(value = "/getOrderListSectionMenusAjax", method = RequestMethod.GET)
	public @ResponseBody List<Menu> getOrderListMenusSectionAjax(HttpServletRequest request, HttpServletResponse response) {
			
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
			
				System.out.println("MAP---------------"+map);
			AllMenuResponse menuResponse = restTemplate.postForObject(Constants.url + "getMenuListByMenuIds", map,
					AllMenuResponse.class);	
			menuList = menuResponse.getMenuConfigurationPage();
		}catch (Exception e) {
			System.out.println("Exception in getSectionWiseMenusAjax" + e.getMessage());
			e.printStackTrace();
		}
		return menuList;
	}	
	
	
	
	int orderStatus=0;
	@RequestMapping(value = "/splitOrders")
	public ModelAndView splitOrders(HttpServletRequest request, HttpServletResponse response) {

		// ModelAndView model=new ModelAndView("orders/orders");
		ModelAndView model = null;
		/*HttpSession session = request.getSession();

		List<ModuleJson> newModuleList = (List<ModuleJson>) session.getAttribute("newModuleList");
		Info view = AccessControll.checkAccess("splitOrders", "splitOrders", "1", "0", "0", "0", newModuleList);

		if (view.getError() == true) {

			model = new ModelAndView("orders/splitOrders");

		} else {*/
			model = new ModelAndView("orders/splitOrders");
			//Constants.mainAct = 4;
			//Constants.subAct = 27;

			try {
				RestTemplate restTemplate = new RestTemplate();
				AllFranchiseeList allFranchiseeList = restTemplate.getForObject(Constants.url + "getAllFranchisee",
						AllFranchiseeList.class);

				// franchiseeList= new ArrayList<FranchiseeList>();
				franchiseeList = allFranchiseeList.getFranchiseeList();

				model.addObject("franchiseeList", franchiseeList);
				model.addObject("allOtherFrList", tempFrList);
				model.addObject("selectedFrList", selectedFrList);
				model.addObject("date", new SimpleDateFormat("dd-MM-yyyy").format(new Date()));
				RestTemplate restTemplate1 = new RestTemplate();

				AllMenuResponse allMenuResponse = restTemplate1.getForObject(Constants.url + "getAllMenu",
						AllMenuResponse.class);

				menuList = new ArrayList<Menu>();
				menuList = allMenuResponse.getMenuConfigurationPage();

				System.out.println("MENU LIST= " + menuList.toString());
				model.addObject("menuList", menuList);
				System.out.println("menu list is" + menuList.toString());

				AllRoutesListResponse allRouteListResponse = restTemplate.getForObject(Constants.url + "showRouteList",
						AllRoutesListResponse.class);

				List<Route> routeList = new ArrayList<Route>();

				routeList = allRouteListResponse.getRoute();
				model.addObject("routeList", routeList);
				model.addObject("message", message);
			} catch (Exception e) {
				e.printStackTrace();
			}
		//}
		return model;
	}
	@RequestMapping(value = "/getMenusListByCatId", method = RequestMethod.GET)
	public @ResponseBody List<Menu> getMenusListByCatId(HttpServletRequest request, HttpServletResponse response) {

		List<Menu> menusList=null;
		try
		{
			int menuId = Integer.parseInt(request.getParameter("menuId"));
			menusList=new ArrayList<Menu>();
			int catId=0;
			for(int i=0;i<menuList.size();i++)
			{
				if(menuList.get(i).getMenuId()==menuId)
				{
					catId=menuList.get(i).getMainCatId();
					break;
				}
			}
			for(int i=0;i<menuList.size();i++)
			{
				if(menuList.get(i).getMainCatId()==catId)
				{
					menusList.add(menuList.get(i));
				}
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return menusList;
	}

	@RequestMapping(value = "/searchOrdersProcess", method = RequestMethod.GET) // getOrderListForAllFr new web service
	public @ResponseBody List<GetOrder> searchOrderProcess(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("orders/orders");

		System.out.println("/inside search order process  ");
		// model.addObject("franchiseeList", franchiseeList);
		try {
			
			model.addObject("menuList", menuList);

			String menuId = request.getParameter("item_id_list");
			String frIdString = request.getParameter("fr_id_list");
			String date = request.getParameter("date");
			int routeId = 0;// Integer.parseInt(request.getParameter("route_id"));

			menuId = menuId.substring(1, menuId.length() - 1);
			menuId = menuId.replaceAll("\"", "");
			System.out.println("menu Ids New =" + menuId);

			frIdString = frIdString.substring(1, frIdString.length() - 1);
			frIdString = frIdString.replaceAll("\"", "");
			System.out.println("frIds  New =" + frIdString);

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			orderList = new ArrayList<GetOrder>();

			List<String> franchIds = new ArrayList();
			franchIds = Arrays.asList(frIdString);
			RestTemplate restTemplateObj = new RestTemplate();
			System.out.println("fr Id ArrayList " + franchIds.toString());
			
			MultiValueMap<String, Object> MenuMap = new LinkedMultiValueMap<String, Object>();
			MenuMap.add("menuId", Integer.parseInt(menuId));
			
		/*	ConfigureFrBeanTemp   selectedMenu = restTemplateObj.postForObject(Constants.url + "getFrConfigByMenuId",
					MenuMap,ConfigureFrBeanTemp.class);
			model.addObject("selectedMenu", selectedMenu);
			System.err.println("Selected Menu-->"+selectedMenu);*/

			if (routeId != 0) {

				MultiValueMap<String, Object> mvm = new LinkedMultiValueMap<String, Object>();

				RestTemplate restTemplate = new RestTemplate();

				mvm.add("routeId", routeId);

				FrNameIdByRouteIdResponse frNameId = restTemplate.postForObject(Constants.url + "getFrNameIdByRouteId",
						mvm, FrNameIdByRouteIdResponse.class);

				List<FrNameIdByRouteId> frNameIdByRouteIdList = frNameId.getFrNameIdByRouteIds();

				System.out.println("route wise franchisee " + frNameIdByRouteIdList.toString());

				StringBuilder sbForRouteFrId = new StringBuilder();
				for (int i = 0; i < frNameIdByRouteIdList.size(); i++) {

					sbForRouteFrId = sbForRouteFrId.append(frNameIdByRouteIdList.get(i).getFrId().toString() + ",");

				}

				String strFrIdRouteWise = sbForRouteFrId.toString();
				frIdString = strFrIdRouteWise.substring(0, strFrIdRouteWise.length() - 1);
				System.out.println("fr Id Route WISE = " + frIdString);

			} else if (franchIds.contains("0")) {

				System.out.println("all fr selected");
				System.out.println("Date" + date);
				map.add("date", date);
				map.add("menuId", menuId);

				RestTemplate restTemplate1 = new RestTemplate();

				GetOrderListResponse orderListResponse = restTemplate1
						.postForObject(Constants.url + "getOrderListForAllFr", map, GetOrderListResponse.class);

				orderList = orderListResponse.getGetOder();

				System.out.println("order list is " + orderList.toString());
				System.out.println("order list count is" + orderList.size());

				model.addObject("orderList", orderList);

				model.addObject("franchIds", franchIds);
				model.addObject("allOtherFrList", tempFrList);
				model.addObject("selectedFrList", selectedFrList);
				model.addObject("franchiseeList", franchiseeList);

				System.out.println("Fr selected all " + franchIds.toString());

			} // end of if

			if (!franchIds.contains("0") || routeId != 0) {

				System.out.println("few Fr selected: FrId  ArrayList " + franchIds.toString());

				System.out.println("few fra selected");

				map.add("frId", frIdString);
				map.add("menuId", menuId);
				map.add("date", date);

				RestTemplate restTemplate1 = new RestTemplate();

				GetOrderListResponse orderListResponse = restTemplate1.postForObject(Constants.url + "getOrderList",
						map, GetOrderListResponse.class);

				orderList = orderListResponse.getGetOder();

				System.out.println("order list is " + orderList.toString());
				System.out.println("order list count is" + orderList.size());
				model.addObject("orderList", orderList);
				model.addObject("franchiseeList", franchiseeList);

			} // end of else

			List<ExportToExcel> exportToExcelList = new ArrayList<ExportToExcel>();

			ExportToExcel expoExcel = new ExportToExcel();
			List<String> rowData = new ArrayList<String>();

			rowData.add("Franchisee Name");
			rowData.add("Type");
			rowData.add("Item Id");
			rowData.add("Item Name");
			rowData.add("Quantity");

			expoExcel.setRowData(rowData);
			exportToExcelList.add(expoExcel);
			for (int i = 0; i < orderList.size(); i++) {
				expoExcel = new ExportToExcel();
				rowData = new ArrayList<String>();

				rowData.add(orderList.get(i).getFrName());

				rowData.add(orderList.get(i).getCatName());
				rowData.add("" + orderList.get(i).getId());
				rowData.add(orderList.get(i).getItemName());
				rowData.add("" + orderList.get(i).getOrderQty());

				expoExcel.setRowData(rowData);
				exportToExcelList.add(expoExcel);
				System.out.println("List" + orderList.get(i).toString());
			}

			HttpSession session = request.getSession();
			session.setAttribute("exportExcelList", exportToExcelList);
			session.setAttribute("excelName", "Orders");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return orderList;
	}
	@RequestMapping(value = "/searchOrdersProcessByItem", method = RequestMethod.GET) // getOrderListForAllFr new web service
	public @ResponseBody List<GetOrder> searchOrdersProcessByItem(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("orders/orders");

	    // System.out.println("/inside search order process  ");
		// model.addObject("franchiseeList", franchiseeList);
		try {
			model.addObject("menuList", menuList);
			String itemId = request.getParameter("itemId");
			String menuId = request.getParameter("item_id_list");
			String frIdString = request.getParameter("fr_id_list");
			String date = request.getParameter("date");
			int routeId = 0;// Integer.parseInt(request.getParameter("route_id"));

			menuId = menuId.substring(1, menuId.length() - 1);
			menuId = menuId.replaceAll("\"", "");
			System.out.println("menu Ids New =" + menuId);

			frIdString = frIdString.substring(1, frIdString.length() - 1);
			frIdString = frIdString.replaceAll("\"", "");
			System.out.println("frIds  New =" + frIdString);

			itemId = itemId.substring(1, itemId.length() - 1);
			itemId = itemId.replaceAll("\"", "");
			System.out.println("Item Ids =" + itemId);
			
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			orderList = new ArrayList<GetOrder>();

			List<String> franchIds = new ArrayList();
			franchIds = Arrays.asList(frIdString);

			System.out.println("fr Id ArrayList " + franchIds.toString());

			if (routeId != 0) {

				MultiValueMap<String, Object> mvm = new LinkedMultiValueMap<String, Object>();

				RestTemplate restTemplate = new RestTemplate();

				mvm.add("routeId", routeId);

				FrNameIdByRouteIdResponse frNameId = restTemplate.postForObject(Constants.url + "getFrNameIdByRouteId",
						mvm, FrNameIdByRouteIdResponse.class);

				List<FrNameIdByRouteId> frNameIdByRouteIdList = frNameId.getFrNameIdByRouteIds();

				System.out.println("route wise franchisee " + frNameIdByRouteIdList.toString());

				StringBuilder sbForRouteFrId = new StringBuilder();
				for (int i = 0; i < frNameIdByRouteIdList.size(); i++) {

					sbForRouteFrId = sbForRouteFrId.append(frNameIdByRouteIdList.get(i).getFrId().toString() + ",");

				}

				String strFrIdRouteWise = sbForRouteFrId.toString();
				frIdString = strFrIdRouteWise.substring(0, strFrIdRouteWise.length() - 1);
				System.out.println("fr Id Route WISE = " + frIdString);

			} else if (franchIds.contains("0")) {

				System.out.println("all fr selected");
				System.out.println("Date" + date);
				map.add("date", date);
				map.add("menuId", menuId);
				map.add("itemId", itemId);
				RestTemplate restTemplate1 = new RestTemplate();

				GetOrderListResponse orderListResponse = restTemplate1
						.postForObject(Constants.url + "getOrderListForAllFrAndItem", map, GetOrderListResponse.class);

				orderList = orderListResponse.getGetOder();

				System.out.println("order list is " + orderList.toString());
				System.out.println("order list count is" + orderList.size());

				model.addObject("orderList", orderList);

				model.addObject("franchIds", franchIds);
				model.addObject("allOtherFrList", tempFrList);
				model.addObject("selectedFrList", selectedFrList);
				model.addObject("franchiseeList", franchiseeList);

				System.out.println("Fr selected all " + franchIds.toString());

			} // end of if

			if (!franchIds.contains("0") || routeId != 0) {

				System.out.println("few Fr selected: FrId  ArrayList " + franchIds.toString());

				System.out.println("few fra selected");

				map.add("frId", frIdString);
				map.add("menuId", menuId);
				map.add("date", date);
				map.add("itemId", itemId);
				RestTemplate restTemplate1 = new RestTemplate();

				GetOrderListResponse orderListResponse = restTemplate1.postForObject(Constants.url + "getOrderListByItem",
						map, GetOrderListResponse.class);

				orderList = orderListResponse.getGetOder();

				System.out.println("order list is " + orderList.toString());
				System.out.println("order list count is" + orderList.size());
				model.addObject("orderList", orderList);
				model.addObject("franchiseeList", franchiseeList);

			} // end of else

			List<ExportToExcel> exportToExcelList = new ArrayList<ExportToExcel>();

			ExportToExcel expoExcel = new ExportToExcel();
			List<String> rowData = new ArrayList<String>();

			rowData.add("Franchisee Name");
			rowData.add("Type");
			rowData.add("Item Id");
			rowData.add("Item Name");
			rowData.add("Quantity");

			expoExcel.setRowData(rowData);
			exportToExcelList.add(expoExcel);
			for (int i = 0; i < orderList.size(); i++) {
				expoExcel = new ExportToExcel();
				rowData = new ArrayList<String>();

				rowData.add(orderList.get(i).getFrName());

				rowData.add(orderList.get(i).getCatName());
				rowData.add("" + orderList.get(i).getId());
				rowData.add(orderList.get(i).getItemName());
				rowData.add("" + orderList.get(i).getOrderQty());

				expoExcel.setRowData(rowData);
				exportToExcelList.add(expoExcel);
				System.out.println("List" + orderList.get(i).toString());
			}

			HttpSession session = request.getSession();
			session.setAttribute("exportExcelList", exportToExcelList);
			session.setAttribute("excelName", "Orders");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return orderList;
	}
	@RequestMapping(value = "/saveSplitOrders", method = RequestMethod.POST)
	public String saveSplitOrders(HttpServletRequest request, HttpServletResponse response) throws ParseException {
		ModelAndView model = new ModelAndView("orders/splitOrders");
		RestTemplate restTemplate = new RestTemplate();
	  try {
		  int splitMenuId = Integer.parseInt(request.getParameter("splitMenuId"));
		  String prodDate=request.getParameter("split_production_date");
		  String delDate=request.getParameter("split_delivery_date");
			SimpleDateFormat sdf1 = new SimpleDateFormat("dd-MM-yyyy");
		  java.util.Date udate = sdf1.parse(prodDate);
			java.util.Date udeldate = sdf1.parse(delDate);
			java.sql.Date sqlPDate = new java.sql.Date(udate.getTime());
			java.sql.Date deliveryDate = new java.sql.Date(udeldate.getTime());
			System.err.println("deliveryDate" + deliveryDate + "sqlCurrDate" + sqlPDate);
		  LinkedHashMap<Integer,Integer> updateLhm=new LinkedHashMap<Integer,Integer>();
		  List<SplitOrderData> orderJson=new ArrayList<>();
		  for(int i=0;i<orderList.size();i++)
		  {
			 int splitQty=Integer.parseInt(request.getParameter("splitQty"+orderList.get(i).getOrderId()+""+orderList.get(i).getId()));
			 int updatedQty=Integer.parseInt(request.getParameter("updatedQty"+orderList.get(i).getOrderId()));
			if(splitQty>0) {
			 updateLhm.put(orderList.get(i).getOrderId(), updatedQty);
			 SplitOrderData splitOrderData=new SplitOrderData();
			 splitOrderData.setOrderId(orderList.get(i).getOrderId());
			 splitOrderData.setMenuId(splitMenuId);
			 splitOrderData.setOrderQty(splitQty);
			 splitOrderData.setDeliveryDate(deliveryDate);
			 splitOrderData.setProductionDate(sqlPDate);
			 orderJson.add(splitOrderData);
			}
			 
		  }
		  List<Orders> orderListSaveResponse = restTemplate.postForObject(Constants.url + "placeSplitedOrder", orderJson,
					List.class);
		  
		  List<Orders> orderListUpdateResponse = restTemplate.postForObject(Constants.url + "updateSplitedOrder", updateLhm,
					List.class);
		if(orderListSaveResponse.size()>0 || orderListUpdateResponse.size()>0)
		{
			orderStatus=2;
			message="Orders Splitted Successfully.";
		}else
		{
			orderStatus=1;
			message="Orders Not Splitted!!";
		}
	  
	  }catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/splitOrders";
	}
	// special cake orders
	List<Menu> allMenuList=null;
	@RequestMapping(value = "/spCakeOrders")
	public ModelAndView searchSpCakeOrder(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = null;
		HttpSession session = request.getSession();

		List<ModuleJson> newModuleList = (List<ModuleJson>) session.getAttribute("newModuleList");
		Info view = AccessControll.checkAccess("spCakeOrders", "spCakeOrders", "1", "0", "0", "0", newModuleList);

		if (view.getError() == true) {

			model = new ModelAndView("accessDenied");

		} else {
			model = new ModelAndView("orders/spcakeorders");
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
				
//				Menu[] menuArray = restTemplate.getForObject(Constants.url + "getAllMenuList", Menu[].class);
//				allMenuList =new ArrayList<>(Arrays.asList(menuArray));
//				model.addObject("frMenuList", allMenuList);
				
				MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
				map.add("sectionId", Constants.SPECIAL_ORDER_CAKE_LIST_SECTION_ID);
				Section[] sectionArr = restTemplate.postForObject(Constants.url + "getSections", map, Section[].class);
				section = new ArrayList<Section>(Arrays.asList(sectionArr));	
				model.addObject("section", section);
				
				model.addObject("url", Constants.SPCAKE_IMAGE_URL);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return model;
	}
	@RequestMapping(value = "/getSpOrderMenusSectionAjax", method = RequestMethod.GET)
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
			List<Menu> menus = menuResponse.getMenuConfigurationPage();
			
			
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
	
	
	
	
	

	@RequestMapping(value = "/regularSpCakeOrderProcess")
	public ModelAndView regularSpCakeOrderProcess(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = null;
		HttpSession session = request.getSession();

		List<ModuleJson> newModuleList = (List<ModuleJson>) session.getAttribute("newModuleList");
		Info view = AccessControll.checkAccess("regularSpCakeOrderProcess", "regularSpCakeOrderProcess", "1", "0", "0",
				"0", newModuleList);

		if (view.getError() == true) {

			model = new ModelAndView("accessDenied");

		} else {
			model = new ModelAndView("orders/regularsporders");
			Constants.mainAct = 4;
			Constants.subAct = 29;
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

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return model;

	}
	
	
	@RequestMapping(value="/getAllMenusForjsp",method=RequestMethod.GET)
	public @ResponseBody List<Menu>  getAllMenus(HttpServletRequest request,HttpServletResponse response){
		System.err.println("in /getAllMenus");

		List<Menu> resp = new ArrayList<>();
		for(Menu menu : allMenuList) {
			if(menu.getMainCatId()==5) {
				resp.add(menu);
			}
		}
		//System.err.println("----->"+resp.toString());
		
	
		return resp;
	}
	
	

	@RequestMapping(value = "/spCakeOrderProcess", method = RequestMethod.GET)
	public @ResponseBody List<SpCakeOrdersBean> spCakeOrderProcess(HttpServletRequest request,
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
		String prodDate = request.getParameter("prod_date");
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
			map.add("prodDate", prodDate);
            map.add("spMenuId", spMenuId);
			SpCakeOrdersBeanResponse orderListResponse = restTemplate1
					.postForObject(Constants.url + "getSpCakeOrderLists", map, SpCakeOrdersBeanResponse.class); // s
																												// added

			spCakeOrderList = orderListResponse.getSpCakeOrdersBean();
			model.addObject("spCakeOrderList", spCakeOrderList);

		} else

		if (franchIds.contains("0")) {
			System.out.println("all fr selected");
			
			
			spMenuId = spMenuId.substring(1, spMenuId.length() - 1);
			spMenuId = spMenuId.replaceAll("\"", "");

			map.add("prodDate", prodDate);
			map.add("spMenuId", spMenuId);
			orderListResponse = restTemplate1.postForObject(Constants.url + "getAllFrSpCakeOrderList", map,
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
			map.add("prodDate", prodDate);
			map.add("spMenuId",spMenuId );
			SpCakeOrdersBeanResponse orderListResponse = restTemplate1
					.postForObject(Constants.url + "getSpCakeOrderLists", map, SpCakeOrdersBeanResponse.class); // s
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

	boolean isDelete = false;
	public String[] frIds = null;
	public String prodDate = null;
	public int routeId = 0;

	@RequestMapping(value = "/regularSpCkOrderProcess", method = RequestMethod.POST)
	public ModelAndView regularSpCkOrderProcess(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = null;
		System.out.println("/inside search sp cake order process  ");

		model = new ModelAndView("orders/regularsporders");
		model.addObject("isDelete", 0);

		try {
			frIds = request.getParameterValues("fr_id[]");
			System.out.println("frIds:" + frIds);
			routeId = Integer.parseInt(request.getParameter("selectRoute"));
			System.out.println("routeId:" + routeId);
			prodDate = request.getParameter("prod_date");
			System.out.println("prodDate:" + prodDate);
			String strFrId = "";

			List<String> frIdList = new ArrayList<>();
			if (frIds != null) {
				frIdList = (List) Arrays.asList(frIds);

				StringBuilder sb = new StringBuilder();

				if (frIds.length > 0) {
					for (int i = 0; i < frIds.length; i++) {
						System.out.println("fr Ids List " + frIds[i]);

						sb = sb.append(frIds[i] + ",");
					}

					strFrId = sb.toString();
					strFrId = strFrId.substring(0, strFrId.length() - 1);
				}
			}
			System.out.println("frid array is=" + strFrId);
			RestTemplate restTemplate = new RestTemplate();

			List<FranchiseeList> selectedFrList = new ArrayList<>();
			List<FranchiseeList> remFrList = new ArrayList<FranchiseeList>();
			try {
				AllFranchiseeList allFranchiseeList = restTemplate.getForObject(Constants.url + "getAllFranchisee",
						AllFranchiseeList.class);

				franchiseeList = allFranchiseeList.getFranchiseeList();
				remFrList = franchiseeList;

				for (int i = 0; i < frIdList.size(); i++) {
					for (int j = 0; j < franchiseeList.size(); j++) {
						if (Integer.parseInt(frIdList.get(i)) == franchiseeList.get(j).getFrId()) {
							selectedFrList.add(franchiseeList.get(j));
							remFrList.remove(j);
						}
					}
				}
			} catch (NullPointerException e) {
				System.out.println("Null Pointer Exc in Reg Sp Order");
			} catch (Exception e) {
				System.out.println(" Exc in Reg Sp Order:order Controller" + e.getMessage());

			}
			AllRoutesListResponse allRouteListResponse = restTemplate.getForObject(Constants.url + "showRouteList",
					AllRoutesListResponse.class);

			List<Route> routeList = new ArrayList<Route>();

			routeList = allRouteListResponse.getRoute();
			model.addObject("routeList", routeList);
			model.addObject("routeId", routeId);
			model.addObject("todayDate", prodDate);
			model.addObject("frIdList", selectedFrList);
			model.addObject("franchiseeList", remFrList);

			if (routeId != 0) {

				MultiValueMap<String, Object> mvm = new LinkedMultiValueMap<String, Object>();

				mvm.add("routeId", routeId);

				FrNameIdByRouteIdResponse frNameId = restTemplate.postForObject(Constants.url + "getFrNameIdByRouteId",
						mvm, FrNameIdByRouteIdResponse.class);

				List<FrNameIdByRouteId> frNameIdByRouteIdList = frNameId.getFrNameIdByRouteIds();

				System.out.println("route wise franchisee " + frNameIdByRouteIdList.toString());

				StringBuilder sbForRouteFrId = new StringBuilder();
				for (int i = 0; i < frNameIdByRouteIdList.size(); i++) {

					sbForRouteFrId = sbForRouteFrId.append(frNameIdByRouteIdList.get(i).getFrId().toString() + ",");

				}

				String strFrIdRouteWise = sbForRouteFrId.toString();
				strFrId = strFrIdRouteWise.substring(0, strFrIdRouteWise.length() - 1);
				System.out.println("fr Id Route WISE = " + strFrId);

				MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();//

				map.add("frId", strFrId);
				map.add("prodDate", prodDate);

				RestTemplate restTemp = new RestTemplate();

				regOrderListResponse = restTemp.postForObject(Constants.url + "getRegSpCkOrderList", map,
						RegularSpCkOrdersResponse.class);

				List<RegularSpCkOrder> regularSpCkOrderList = new ArrayList<RegularSpCkOrder>();
				regularSpCkOrderList = regOrderListResponse.getRegularSpCkOrdersList();

				System.out.println("order list count is" + regularSpCkOrderList.size());
				model.addObject("regularSpCkOrderList", regularSpCkOrderList);
			} else if (frIds[0].toString().equals("0")) {
				System.out.println("all fr selected");
				model.addObject("frIdList", franchiseeList);

				MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

				map.add("prodDate", prodDate);

				RestTemplate restTemplate1 = new RestTemplate();

				regOrderListResponse = restTemplate1.postForObject(Constants.url + "getAllFrRegSpCakeOrders", map,
						RegularSpCkOrdersResponse.class);

				List<RegularSpCkOrder> regularSpCkOrderList = new ArrayList<RegularSpCkOrder>();
				regularSpCkOrderList = regOrderListResponse.getRegularSpCkOrdersList();

				System.out.println("order list count is" + regularSpCkOrderList.toString());
				model.addObject("regularSpCkOrderList", regularSpCkOrderList);

			} // end of if
			else {

				System.out.println("few fr selected");

				MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();//

				map.add("frId", strFrId);
				map.add("prodDate", prodDate);

				RestTemplate restTemp = new RestTemplate();

				regOrderListResponse = restTemp.postForObject(Constants.url + "getRegSpCkOrderList", map,
						RegularSpCkOrdersResponse.class);

				List<RegularSpCkOrder> regularSpCkOrderList = new ArrayList<RegularSpCkOrder>();
				regularSpCkOrderList = regOrderListResponse.getRegularSpCkOrdersList();

				System.out.println("order list count is" + regularSpCkOrderList.size());
				model.addObject("regularSpCkOrderList", regularSpCkOrderList);

			} // end of else

		} catch (Exception e) {
			System.out.println("exception in order display" + e.getMessage());
		}

		List<ExportToExcel> exportToExcelList = new ArrayList<ExportToExcel>();

		ExportToExcel expoExcel = new ExportToExcel();
		List<String> rowData = new ArrayList<String>();

		rowData.add("Franchisee Name");

		rowData.add("Item Id");
		rowData.add("Item Name");

		rowData.add("Mrp");
		rowData.add("Rate");

		rowData.add("Quantity");

		rowData.add("Sub Total");

		expoExcel.setRowData(rowData);
		exportToExcelList.add(expoExcel);
		for (int i = 0; i < regOrderListResponse.getRegularSpCkOrdersList().size(); i++) {
			expoExcel = new ExportToExcel();
			rowData = new ArrayList<String>();

			rowData.add(regOrderListResponse.getRegularSpCkOrdersList().get(i).getFrName());

			rowData.add("" + regOrderListResponse.getRegularSpCkOrdersList().get(i).getId());

			rowData.add(regOrderListResponse.getRegularSpCkOrdersList().get(i).getItemName());

			rowData.add("" + regOrderListResponse.getRegularSpCkOrdersList().get(i).getMrp());
			rowData.add("" + regOrderListResponse.getRegularSpCkOrdersList().get(i).getRate());
			rowData.add("" + regOrderListResponse.getRegularSpCkOrdersList().get(i).getQty());
			rowData.add("" + regOrderListResponse.getRegularSpCkOrdersList().get(i).getRspSubTotal());

			expoExcel.setRowData(rowData);
			exportToExcelList.add(expoExcel);

		}

		HttpSession session = request.getSession();
		session.setAttribute("exportExcelList", exportToExcelList);
		session.setAttribute("excelName", "RegSpCakeOrders");

		return model;
	}

	// ganesh 24-10-2017

	@RequestMapping(value = "/updateBillStatusForSp", method = RequestMethod.GET)
	public @ResponseBody Info updateBillStatusForSp(HttpServletRequest request, HttpServletResponse response) {
		Info info = null;
		try {
			//int spOrderNo = Integer.parseInt(request.getParameter("spOrderNo"));
			String[] spOrderNo = request.getParameterValues("spOrderNo");
			StringBuilder sb = new StringBuilder();

			for (int i = 0; i < spOrderNo.length; i++) {
				sb = sb.append(spOrderNo[i] + ",");

			}
			String orderNo = sb.toString();
			orderNo = orderNo.substring(0, orderNo.length() - 1);
			
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("spOrderNo", orderNo);
			map.add("billStatus", 1);
			RestTemplate restTemp = new RestTemplate();
			info = restTemp.postForObject(Constants.url + "updateBillStatusToProduction", map, Info.class);

		} catch (Exception e) {
			System.out.println("Exception In update status of Order" + e.getMessage());
		}
		return info;
	}

	@RequestMapping(value = "/callDeleteOrder", method = RequestMethod.GET)
	public @ResponseBody List<GetOrder> deleteOrder(HttpServletRequest request, HttpServletResponse response) {

		try {
			System.out.println("/inside delete order process  ");
			int orderId = Integer.parseInt(request.getParameter("order_id"));
			HttpSession session = request.getSession();
			UserResponse userResponse = (UserResponse) session.getAttribute("UserDetail");

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("orderId", orderId);
			RestTemplate restTemp = new RestTemplate();
			
			if (!orderList.isEmpty()) {
				for (int i = 0; i < orderList.size(); i++) {
					if (orderList.get(i).getOrderId().equals(orderId)) {
						
						System.err.println("orderList.get(i).getDeliveryDate()" +orderList.get(i).getDeliveryDate());

						
						DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
						Calendar cal = Calendar.getInstance();
						String curDateTime = dateFormat.format(cal.getTime());
						Date date = new Date();
						String modifiedDate = new SimpleDateFormat("dd-MM-yyyy").format(date);
						System.err.println("modifiedDate delete function " + modifiedDate);
						ChangeOrderRecord reqBody = new ChangeOrderRecord();
						reqBody.setDeliveryDate(orderList.get(i).getDeliveryDate());
						reqBody.setChangeDate(modifiedDate);
						reqBody.setChangeId(0);
						reqBody.setChangeName("Deleted");
						reqBody.setChangeQty(orderList.get(i).getOrderQty());
						reqBody.setChangeType(0);
						reqBody.setDateTime(curDateTime);
						reqBody.setExVar1("na");
						reqBody.setFrId(0);
						reqBody.setFrName(orderList.get(i).getFrName());
						reqBody.setItemId(0);
						reqBody.setItemName(orderList.get(i).getItemName());
						reqBody.setOrderId(orderList.get(i).getOrderId());
						reqBody.setOrigQty(orderList.get(i).getOrderQty());

						reqBody.setUserId(userResponse.getUser().getId());
						reqBody.setUserName(userResponse.getUser().getUsername());

						ChangeOrderRecord orderChangeRes = restTemp.postForObject(
								Constants.url + "saveChangeOrderRecord", reqBody, ChangeOrderRecord.class);

						break;

					}
				}
			}

			Integer isDeleted = restTemp.postForObject(Constants.url + "DeleteOrder", map, Integer.class);

			if (isDeleted != 0) {
				if (!orderList.isEmpty()) {
					for (int i = 0; i < orderList.size(); i++) {
						if (orderList.get(i).getOrderId() == orderId) {
							orderList.remove(i);
						}
					}
				}
			}
		} catch (Exception e) {
			System.out.println("Exception In delete Order" + e.getMessage());
		}
		return orderList;
	}

	
	
	@RequestMapping(value = "/callDeleteOrderMultiple", method = RequestMethod.GET)
	public @ResponseBody List<GetOrder> callDeleteOrderMultiple(HttpServletRequest request, HttpServletResponse response) {
		List<GetOrder> orderListResponse=orderList;
		try {
			System.out.println("/inside delete order process  ");
			String orderId = request.getParameter("orderId");
			HttpSession session = request.getSession();
			UserResponse userResponse = (UserResponse) session.getAttribute("UserDetail");
			RestTemplate restTemp = new RestTemplate();

			
			List<Integer> orderIds = Stream.of(orderId.split(",")).map(Integer::parseInt)
					.collect(Collectors.toList());
			
			
			if (!orderList.isEmpty()) {
				for(Integer orderId2: orderIds) {
				for (int i = 0; i < orderList.size(); i++) {
					if (orderList.get(i).getOrderId().equals(orderId2)) {
						System.err.println("orderList.get(i).getDeliveryDate()" +orderList.get(i).getDeliveryDate());
						DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
						Calendar cal = Calendar.getInstance();
						String curDateTime = dateFormat.format(cal.getTime());
						Date date = new Date();
						String modifiedDate = new SimpleDateFormat("dd-MM-yyyy").format(date);
						System.err.println("modifiedDate delete function " + modifiedDate);
						ChangeOrderRecord reqBody = new ChangeOrderRecord();
							/*
							 * reqBody.setDeliveryDate( new
							 * SimpleDateFormat("dd-MM-yyyy").format(orderList.get(i).getDeliveryDate()));
							 */
						
						reqBody.setDeliveryDate(orderList.get(i).getDeliveryDate());
						reqBody.setChangeDate(modifiedDate);
						reqBody.setChangeId(0);
						reqBody.setChangeName("Deleted");
						reqBody.setChangeQty(orderList.get(i).getOrderQty());
						reqBody.setChangeType(0);
						reqBody.setDateTime(curDateTime);
						reqBody.setExVar1("na");
						reqBody.setFrId(0);
						reqBody.setFrName(orderList.get(i).getFrName());
						reqBody.setItemId(0);
						reqBody.setItemName(orderList.get(i).getItemName());
						reqBody.setOrderId(orderList.get(i).getOrderId());
						reqBody.setOrigQty(orderList.get(i).getOrderQty());

						reqBody.setUserId(userResponse.getUser().getId());
						reqBody.setUserName(userResponse.getUser().getUsername());

						ChangeOrderRecord orderChangeRes = restTemp.postForObject(
								Constants.url + "saveChangeOrderRecord", reqBody, ChangeOrderRecord.class);


					}
				}
				}
			}
			
			
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("orderId", orderId);
			Integer isDeleted = restTemp.postForObject(Constants.url + "DeleteOrder", map, Integer.class);

			try {
				/*
				 * List<Integer> orderIds = Stream.of(orderId.split(",")).map(Integer::parseInt)
				 * .collect(Collectors.toList());
				 */
			System.err.println("orderIds"+orderIds);
			if (isDeleted != 0) {
				if (!orderList.isEmpty()) {
					for (int i = 0; i < orderList.size(); i++) {
						for(int j=0;j<orderIds.size();j++) {
							
						if (orderList.get(i).getOrderId() == orderIds.get(j)) {
							
							System.err.println("orderIds"+orderListResponse.get(j));
							orderListResponse.remove(i);
						}
						
						}
					}
				}
			}
			
			}catch (Exception e) {
				e.printStackTrace();
			}
		} catch (Exception e) {
			System.out.println("Exception In delete Order" + e.getMessage());
			e.printStackTrace();
		}
		System.err.println("orderListResponse"+orderListResponse.toString());
		return orderListResponse;
	}
	
	
	
	
	@RequestMapping(value = "/deleteSpOrder", method = RequestMethod.GET)
	public @ResponseBody List<SpCakeOrdersBean> deleteSpOrder(HttpServletRequest request,
			HttpServletResponse response) {

		System.out.println("/inside delete Sporder process  ");

		int spOrderNo = Integer.parseInt(request.getParameter("sp_order_no"));

		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("spOrderNo", spOrderNo);

		RestTemplate restTemp = new RestTemplate();

		Info info = restTemp.postForObject(Constants.url + "deleteSpCkOrder", map, Info.class);

		if (info.getError() == false) {
			if (!spCakeOrderList.isEmpty()) {
				for (int i = 0; i < spCakeOrderList.size(); i++) {
					if (spCakeOrderList.get(i).getSpOrderNo() == spOrderNo) {
						spCakeOrderList.remove(i);
					}
				}
			}
		}
		return spCakeOrderList;
	}

	@RequestMapping(value = "/updateOrderDetails", method = RequestMethod.GET)
	public @ResponseBody Info updateOrderDetails(HttpServletRequest request, HttpServletResponse response) {

		String ids = request.getParameter("ids");
		String delDate = request.getParameter("delDate");
		String prodDate = request.getParameter("prodDate");

		/*
		 * StringBuilder sb1 = new StringBuilder(); for (int i = 0; i < ids.length; i++)
		 * { sb1 = sb1.append(ids[i] + ",");
		 * 
		 * } String orderIds = sb1.toString(); orderIds = orderIds.substring(0,
		 * orderIds.length() - 1);
		 */
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("orderIds", ids);
		map.add("delDate", delDate);
		map.add("prodDate", prodDate);
		System.err.println(map.toString());
		RestTemplate restTemp = new RestTemplate();

		Info info = restTemp.postForObject(Constants.url + "updateOrderDetails", map, Info.class);

		return info;
	}

	@RequestMapping(value = "/saveSpOrder", method = RequestMethod.GET)
	public @ResponseBody List<SpCakeOrdersBean> saveSpOrder(HttpServletRequest request, HttpServletResponse response) {

		System.out.println("/inside Save Sporder process  ");
		try {
			int spOrderNo = Integer.parseInt(request.getParameter("sp_order_no"));

			int box = Integer.parseInt(request.getParameter("box"));
			int addon = Integer.parseInt(request.getParameter("addon"));

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("spOrderNo", spOrderNo);

			RestTemplate restTemp = new RestTemplate();

			SpCakeOrders spCakeOrderRes = restTemp.postForObject(Constants.url + "/getSpOrderBySpOrderNo", map,
					SpCakeOrders.class);
			SpCakeOrderUpdate orderJson = new SpCakeOrderUpdate();

			if (spCakeOrderRes != null) {
				orderJson.setSpOrderNo(spCakeOrderRes.getSpOrderNo());
				orderJson.setSpBookedForName("" + box);
				orderJson.setIsAllocated(addon);

				SpCakeOrderUpdate orderSaveRes = restTemp.postForObject(Constants.url + "/updateSpCakeOrder", orderJson,
						SpCakeOrderUpdate.class);

				if (orderSaveRes != null) {

					if (!spCakeOrderList.isEmpty()) {
						for (int i = 0; i < spCakeOrderList.size(); i++) {
							if (spCakeOrderList.get(i).getSpOrderNo() == spOrderNo) {
								spCakeOrderList.get(i).setSpBookedForName("" + box);
								spCakeOrderList.get(i).setIsAllocated(addon);
							}
						}
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return spCakeOrderList;
	}

	@RequestMapping(value = "/deleteRegSpOrder/{rspId}", method = RequestMethod.GET)
	public ModelAndView deleteRegSpOrder(@PathVariable int rspId, HttpServletRequest request,
			HttpServletResponse response) {

		ModelAndView model = new ModelAndView("orders/regularsporders");

		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("rspId", rspId);

		RestTemplate restTemp = new RestTemplate();

		Info info = restTemp.postForObject(Constants.url + "deleteRegularSpOrder", map, Info.class);
		System.out.println("Info" + info.toString());

		List<String> frIdList = (List) Arrays.asList(frIds);

		RestTemplate restTemplate = new RestTemplate();

		List<FranchiseeList> selectedFrList = new ArrayList<>();
		List<FranchiseeList> remFrList = new ArrayList<FranchiseeList>();

		AllFranchiseeList allFranchiseeList = restTemplate.getForObject(Constants.url + "getAllFranchisee",
				AllFranchiseeList.class);

		franchiseeList = allFranchiseeList.getFranchiseeList();
		remFrList = franchiseeList;

		try {
			for (int i = 0; i < frIdList.size(); i++) {
				for (int j = 0; j < franchiseeList.size(); j++) {
					if (Integer.parseInt(frIdList.get(i)) == franchiseeList.get(j).getFrId()) {
						selectedFrList.add(franchiseeList.get(j));
						remFrList.remove(j);
					}
				}
			}
		} catch (NullPointerException e) {
			System.out.println("Null Pointer Exc in Reg Sp Order");
		} catch (Exception e) {
			System.out.println(" Exc in Reg Sp Order:order Controller" + e.getMessage());

		}

		model.addObject("todayDate", prodDate);
		model.addObject("frIdList", selectedFrList);
		model.addObject("franchiseeList", remFrList);
		model.addObject("isDelete", 1);
		return model;
	}

	@RequestMapping(value = "/callChangeQty", method = RequestMethod.GET)
	public @ResponseBody void updateOrderQty(HttpServletRequest request, HttpServletResponse response) {

		System.out.println("/inside Update order process  ");
		HttpSession session = request.getSession();
		UserResponse userResponse = (UserResponse) session.getAttribute("UserDetail");

		String orderId = request.getParameter("order_id");
		String orderQty = request.getParameter("order_qty");

		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("orderId", orderId);
		map.add("orderQty", orderQty);

		RestTemplate restTemp = new RestTemplate();

		String s = restTemp.postForObject(Constants.url + "updateOrderQty", map, String.class);
		for (int i = 0; i < orderList.size(); i++) {
			if (orderList.get(i).getOrderId().equals(Integer.parseInt(orderId))) {
				DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				Calendar cal = Calendar.getInstance();
				String curDateTime = dateFormat.format(cal.getTime());
				Date date = new Date();
				String modifiedDate = new SimpleDateFormat("dd-MM-yyyy").format(date);
				System.err.println("modifiedDate callChangeQty" + modifiedDate);
				ChangeOrderRecord reqBody = new ChangeOrderRecord();
				reqBody.setDeliveryDate(new SimpleDateFormat("dd-MM-yyyy").format(orderList.get(i).getDeliveryDate()));

				reqBody.setChangeDate(modifiedDate);
				reqBody.setChangeId(0);
				reqBody.setChangeName("Edited");
				reqBody.setChangeQty(Integer.parseInt(orderQty));
				reqBody.setChangeType(1);
				reqBody.setDateTime(curDateTime);
				reqBody.setExVar1("na");
				reqBody.setFrId(0);
				reqBody.setFrName(orderList.get(i).getFrName());
				reqBody.setItemId(0);
				reqBody.setItemName(orderList.get(i).getItemName());
				reqBody.setOrderId(orderList.get(i).getOrderId());
				reqBody.setOrigQty(orderList.get(i).getOrderQty());

				reqBody.setUserId(userResponse.getUser().getId());
				reqBody.setUserName(userResponse.getUser().getUsername());

				ChangeOrderRecord orderChangeRes = restTemp.postForObject(Constants.url + "saveChangeOrderRecord",
						reqBody, ChangeOrderRecord.class);

				break;

			} else {

			}
		}
		// return "Success";
	}

	@RequestMapping(value = "/showHtmlViewSpcakeOrder/{spOrderNo}", method = RequestMethod.GET)
	public ModelAndView showHtmlViewSpcakeOrder(@PathVariable("spOrderNo") int spOrderNo, HttpServletRequest request,
			HttpServletResponse response) {

		ModelAndView model = new ModelAndView("orders/htmlViewSpCakeOrder");

		RestTemplate restTemp = new RestTemplate();
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("spOrderNo", spOrderNo);
		List<GetSpCakeOrders> orderListResponse = restTemp.postForObject(Constants.url + "getSpCakeOrderBySpOrderNo",
				map, List.class);

		model.addObject("spCakeOrder", orderListResponse.get(0));
		return model;
	}

	@RequestMapping(value = "/showSpcakeOrderPdf/{spOrderNo}/{key}", method = RequestMethod.GET)
	public ModelAndView showSpcakeOrderPdf(@PathVariable("spOrderNo") int spOrderNo, @PathVariable("key") int key,
			HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("orders/spCakeOrderPdf");
		System.err.println("In /showSpcakeOrderPdf/{spOrderNo}/{key}");
		RestTemplate restTemp = new RestTemplate();
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		String seprator="<";
		try {
			map.add("spOrderNo", spOrderNo);
		GetSpCkOrder[] spArr=	restTemp.postForObject(Constants.url + "getSpCKOrderBySpOrderNo", map,GetSpCkOrder[].class);
			List<GetSpCkOrder> orderListResponse = new ArrayList<>(Arrays.asList(spArr));
			GetSpCkOrder SelectedSp=   orderListResponse.get(0);
			String[] uploadedPics=SelectedSp.getCusChoicePhoto().split(seprator);
			for(String s : uploadedPics) {
				if(s.length()>1) {
					System.err.println("Uploded Pics-->"+s);
				}
				
			}
			
			
			model.addObject("uploadedPics", uploadedPics);
			model.addObject("from", key);
			System.out.println("SpOrder" + orderListResponse.toString());
			model.addObject("spCakeOrder", orderListResponse);
			model.addObject("imgUrl", Constants.SP_CAKE_FOLDER);
			model.addObject("imgUrl2", Constants.CUST_CHOICE_PHOTO_CAKE_FOLDER);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.err.println("Exceeption In /showSpcakeOrderPdf/{spOrderNo}/{key}");
		}
		return model;
	}

	@RequestMapping(value = "/showSpcakeOrderPdfInRange/{from}/{to}", method = RequestMethod.GET)
	public ModelAndView showSpcakeOrderPdfInRange(@PathVariable("from") int from, @PathVariable("to") int to,
			HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("orders/spCakeOrderPdfNew");
		String seprator="<";
		RestTemplate restTemp = new RestTemplate();
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		StringBuffer orderId = new StringBuffer("0,");
		
		List<SrWithIds> list = new ArrayList<>();
		
		for (int i = from - 1; i < to && i < spCakeOrderList.size(); i++) {
			orderId.append(Integer.toString(spCakeOrderList.get(i).getSpOrderNo()) + ",");
			SrWithIds srWithIds = new SrWithIds();
			srWithIds.setId( spCakeOrderList.get(i).getSpOrderNo() );
			srWithIds.setSr(i+1);
			list.add(srWithIds);
		}

		orderId.setLength(orderId.length() - 1);
		map.add("spOrderNo", orderId);
		GetSpCkOrder[] orderListResponse = restTemp.postForObject(Constants.url + "getSpCKOrderBySpOrderNo", map,
				GetSpCkOrder[].class);

		List<GetSpCkOrder> spOrderList=new ArrayList<>(Arrays.asList(orderListResponse));
		for(GetSpCkOrder sp : spOrderList) {
			List<String> pics=new ArrayList<>();
			String[] picNames= sp.getCusChoicePhoto().split(seprator);
			System.err.println("Selected Sp--->"+sp);
			for(String s : picNames)
			{
				pics.add(s);
				//System.err.println("Pic Name--->"+s);
			}
			
			sp.setImgList(pics);

		}
	
	
	
	//System.err.println("Pics List--->"+pics.toString());
	System.out.println("SpOrder" + spOrderList.toString());
	model.addObject("spCakeOrder", spOrderList);
		model.addObject("from", from);
		model.addObject("list", list);
		model.addObject("imgUrl", Constants.SP_CAKE_FOLDER);
		model.addObject("imgUrl2", Constants.CUST_CHOICE_PHOTO_CAKE_FOLDER);
		return model;
	}
	@RequestMapping(value = "/showSpcakeOrderPdfByOrderNo/{orderNo}/{srvalues}", method = RequestMethod.GET)
	public ModelAndView showSpcakeOrderPdfInRange(@PathVariable("orderNo")String orderNo,@PathVariable("srvalues")String srvalues,
			HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("orders/spCakeOrderPdfNew");
		String seprator="<";
		try {
		RestTemplate restTemp = new RestTemplate();
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		
		map.add("spOrderNo", orderNo);
		/*List<GetSpCkOrder> orderListResponse = restTemp.postForObject(Constants.url + "getSpCKOrderBySpOrderNo", map,
				List.class);*/

		String[] sr = srvalues.split(",");
		System.err.println(Arrays.asList(sr));
		List<SrWithIds> list = new ArrayList<>();		
		
		for(int i = 0 ; i<sr.length ; i++) { 
			
			System.out.println(sr[i]);
			String[] id = sr[i].split("-");
			SrWithIds srWithIds = new SrWithIds();
			srWithIds.setId(Integer.parseInt(id[0]));
			srWithIds.setSr(Integer.parseInt(id[1]));
			list.add(srWithIds); 
			
		}
		GetSpCkOrder[] orderListResponse = restTemp.postForObject(Constants.url + "getSpCKOrderBySpOrderNo", map,
				GetSpCkOrder[].class);

		List<GetSpCkOrder> spOrderList=new ArrayList<>(Arrays.asList(orderListResponse));
		for(GetSpCkOrder sp : spOrderList) {
			List<String> pics=new ArrayList<>();
			String[] picNames= sp.getCusChoicePhoto().split(seprator);
			System.err.println("Selected Sp--->"+sp);
			for(String s : picNames)
			{
				pics.add(s);
				//System.err.println("Pic Name--->"+s);
			}
			
			sp.setImgList(pics);

		}
	
	
	
	//System.err.println("Pics List--->"+pics.toString());
	System.out.println("SpOrder" + spOrderList.toString());
	model.addObject("spCakeOrder", spOrderList);
		model.addObject("from", 0);
		model.addObject("list", list);
		model.addObject("imgUrl", Constants.SP_CAKE_FOLDER);
		model.addObject("imgUrl2", Constants.CUST_CHOICE_PHOTO_CAKE_FOLDER);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return model;
	}
	@RequestMapping(value = "/showSpcakeOrderPdfInRangeForDotMatrix/{from}/{to}", method = RequestMethod.GET)
	public ModelAndView showSpcakeOrderPdfInRangeForDotMatrix(@PathVariable("from") int from, @PathVariable("to") int to,
			HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("orders/spCakeOrderPdfDotMatrix");
		String seprator="<";
		RestTemplate restTemp = new RestTemplate();
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		StringBuffer orderId = new StringBuffer("0,");
		//System.err.println("In Before For Loop ");
		for (int i = from - 1; i < to && i < spCakeOrderList.size(); i++) {
			//System.err.println("In For Loop "+"\ti="+i);
			orderId.append(Integer.toString(spCakeOrderList.get(i).getSpOrderNo()) + ",");
		}
		//System.err.println("Order Ids Befor Sub str--->"+orderId+"\tForm"+from+"\tTO"+to);
		orderId.setLength(orderId.length() - 1);
		//System.err.println("Order Ids--->"+orderId+"\t"+spCakeOrderList);
		map.add("spOrderNo", orderId);
		GetSpCkOrder[] orderListResponse = restTemp.postForObject(Constants.url + "getSpCKOrderBySpOrderNo", map,
				GetSpCkOrder[].class);

		List<GetSpCkOrder> spOrderList=new ArrayList<>(Arrays.asList(orderListResponse));
		for(GetSpCkOrder sp : spOrderList) {
			List<String> pics=new ArrayList<>();
			String[] picNames= sp.getCusChoicePhoto().split(seprator);
			System.err.println("Selected Sp--->"+sp);
			for(String s : picNames)
			{
				pics.add(s);
				//System.err.println("Pic Name--->"+s);
			}
			
			sp.setImgList(pics);

		}
	
	
	
	//System.err.println("Pics List--->"+pics.toString());
	System.out.println("SpOrder" + spOrderList.toString());
	model.addObject("spCakeOrder", spOrderList);
		model.addObject("from", from);
		model.addObject("imgUrl", Constants.SP_CAKE_FOLDER);
		model.addObject("imgUrl2", Constants.CUST_CHOICE_PHOTO_CAKE_FOLDER);
		return model;
	}

	@RequestMapping(value = "/showHtmlViewRegSpcakeOrder/{orderNo}", method = RequestMethod.GET)
	public ModelAndView showHtmlViewRegSpcakeOrder(@PathVariable("orderNo") int orderNo, HttpServletRequest request,
			HttpServletResponse response) {

		ModelAndView model = new ModelAndView("orders/htmlViewRegSpCakeOrder");

		RestTemplate restTemp = new RestTemplate();
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("orderNo", orderNo);
		List<GetRegSpCakeOrders> orderListResponse = restTemp
				.postForObject(Constants.url + "getRegSpCakeOrderBySpOrderNo", map, List.class);

		model.addObject("regularSpCkOrdersList", orderListResponse.get(0));
		return model;
	}

	@RequestMapping(value = "/showRegSpcakeOrderPdf/{orderNo}", method = RequestMethod.GET)
	public ModelAndView showRegSpcakeOrderPdf(@PathVariable("orderNo") int orderNo, HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView model = new ModelAndView("orders/regSpCakeOrderPdf");

		RestTemplate restTemp = new RestTemplate();
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("orderNo", orderNo);
		List<GetRegSpCakeOrders> orderListResponse = restTemp
				.postForObject(Constants.url + "getRegSpCakeOrderBySpOrderNo", map, List.class);

		System.out.println("regularSpCkOrdersList" + orderListResponse.toString());
		model.addObject("regularSpCkOrdersList", orderListResponse);
		return model;
	}

	@RequestMapping(value = "/showRegSpcakeOrderPdfInRange/{from}/{to}", method = RequestMethod.GET)
	public ModelAndView showRegSpcakeOrderPdfInRange(@PathVariable("from") int from, @PathVariable("to") int to,
			HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("orders/regSpCakeOrderPdf");

		RestTemplate restTemp = new RestTemplate();
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		StringBuffer orderId = new StringBuffer("0,");

		for (int i = from - 1; i < to && i < regOrderListResponse.getRegularSpCkOrdersList().size(); i++) {
			orderId.append(Integer.toString(regOrderListResponse.getRegularSpCkOrdersList().get(i).getRspId()) + ",");
		}

		orderId.setLength(orderId.length() - 1);
		map.add("orderNo", orderId);
		List<GetRegSpCakeOrders> orderListResponse = restTemp
				.postForObject(Constants.url + "getRegSpCakeOrderBySpOrderNo", map, List.class);

		System.out.println("regularSpCkOrdersList" + orderListResponse.toString());
		model.addObject("regularSpCkOrdersList", orderListResponse);
		model.addObject("from", from);
		return model;
	}

}
