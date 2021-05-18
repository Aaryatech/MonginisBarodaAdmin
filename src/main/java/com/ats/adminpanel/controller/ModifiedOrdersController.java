package com.ats.adminpanel.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
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
import com.ats.adminpanel.commons.DateConvertor;
import com.ats.adminpanel.model.AllRoutesListResponse;
import com.ats.adminpanel.model.ChangeOrderRecord;
import com.ats.adminpanel.model.Route;
import com.ats.adminpanel.model.franchisee.AllFranchiseeList;
import com.ats.adminpanel.model.franchisee.FrNameIdByRouteId;
import com.ats.adminpanel.model.franchisee.FrNameIdByRouteIdResponse;
import com.ats.adminpanel.model.franchisee.FranchiseeList;

@Controller
@Scope("session")
public class ModifiedOrdersController {


	public List<FranchiseeList> franchiseeList = new ArrayList<FranchiseeList>();
	
	@RequestMapping(value = "/showModifiedOrders", method = RequestMethod.GET)
	public ModelAndView showModifiedOrders(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("orders/changed_orders");
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
			System.err.println("Exce in /showModifiedOrders at OrderController ");
		}

		return model;
	}
	
	
	// -GET DATA for Deleted/Edited t_order Data Shubham 18-05-2021
		@RequestMapping(value = "/getModifiedOrdersData", method = RequestMethod.GET)
		public @ResponseBody List<ChangeOrderRecord> getModifiedOrdersData(HttpServletRequest request,
				HttpServletResponse response) {

			MultiValueMap<String, Object> mvm = new LinkedMultiValueMap<String, Object>();

			RestTemplate restTemplate = new RestTemplate();

			String frIdString = request.getParameter("fr_id_list");
			String fromDate = request.getParameter("fromDate");
			String toDate = request.getParameter("toDate");
			int routeId = Integer.parseInt(request.getParameter("route_id"));
			fromDate = DateConvertor.convertToYMD(fromDate);
			toDate = DateConvertor.convertToYMD(toDate);

			List<String> franchIds = new ArrayList();

			if (frIdString != null) {
				frIdString = frIdString.substring(1, frIdString.length() - 1);
				frIdString = frIdString.replaceAll("\"", "");
				System.out.println("frIds  New =" + frIdString);

				franchIds = Arrays.asList(frIdString);
			}
			System.out.println("fr Id ArrayList " + franchIds.toString());
			if (routeId != 0) {

				mvm = new LinkedMultiValueMap<String, Object>();

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
				mvm = new LinkedMultiValueMap<String, Object>();

				mvm.add("frIdList", frIdString);
				mvm.add("fromDate", fromDate);
				mvm.add("toDate", toDate);

			} else

			if (franchIds.contains("-1")) {
				System.out.println("all fr selected");
				mvm = new LinkedMultiValueMap<String, Object>();
				mvm.add("frIdList", "-1");
				mvm.add("fromDate", fromDate);
				mvm.add("toDate", toDate);
			} // end of if
			else {

				System.out.println("few fr selected" + frIdString.toString());
				mvm = new LinkedMultiValueMap<String, Object>();

				mvm.add("frIdList", frIdString);
				mvm.add("fromDate", fromDate);
				mvm.add("toDate", toDate);
				System.err.println(" map " + mvm);
				System.out.println(" frIdString" +frIdString);
				System.out.println(" fr fromDate" +fromDate);
				System.out.println(" fr toDate" +toDate);
			} // end of else
			System.err.println("Mvm map " + mvm);
			System.out.println("few fr frIdString" +frIdString);
			System.out.println("few fr fromDate" +fromDate);
			System.out.println("few fr toDate" +toDate);

			List<ChangeOrderRecord> changeOrList = restTemplate.postForObject(Constants.url + "getChangedOrdersRecordList",
					mvm, List.class);

			return changeOrList;

		}
}
