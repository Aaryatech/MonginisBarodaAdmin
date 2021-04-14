<%@page import="java.io.IOException"%>
<%@page import="org.springframework.web.client.HttpClientErrorException"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.ats.adminpanel.commons.Constants"%>
<%@ page import="com.ats.adminpanel.model.DispTransferBean"%>
<%@ page import="org.springframework.web.client.RestTemplate"%>
<%@ page import="org.springframework.util.LinkedMultiValueMap"%>
<%@ page import="org.springframework.util.MultiValueMap"%>
<%@ page import="com.ats.adminpanel.model.franchisee.SubCategory"%>
<%-- <%@ page import="java.util.stream.Collectors"%>
 --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>Dispatch Report Pdf</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->



<style type="text/css">
table {
	border-collapse: collapse;
	font-size: 14;
	width: 100%;
	page-break-inside: auto !important
}

p {
	color: black;
	font-family: arial;
	font-size: 60%;
	margin-top: 0;
	padding: 0;
}

h6 {
	color: black;
	font-family: arial;
	font-size: 80%;
}

th {
	background-color: #EA3291;
	color: white;
}
</style>
</head>
<body onload="myFunction()">
	<h4 align="center">Trilochan Foods Pvt. Ltd.</h4>
	<p align="center">${Constants.CITY}</p>
	<c:set var="convertedDate" value="${convertedDate}"></c:set>
	<c:set var="abcTypes" value="${abcTypes}"></c:set>
	<c:set var="stationIds" value="${stationIds}"></c:set>
	<c:set var="routId" value="${routId}"></c:set>

	<c:set var="catId" value="${catId}"></c:set>

	<c:set var="menuIds" value="${menuIds}"></c:set>
	<%
		String convertedDate = (String) pageContext.getAttribute("convertedDate");
			String abcTypes = (String) pageContext.getAttribute("abcTypes");
			String stationIds = (String) pageContext.getAttribute("stationIds");
			int routId = (int) pageContext.getAttribute("routId");
			String menuIds = (String) pageContext.getAttribute("menuIds");
			//int catId = (int) pageContext.getAttribute("catId");
			String catId = (String) pageContext.getAttribute("catId");
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
			map.add("date", convertedDate);
			map.add("abcType", abcTypes);
			map.add("stationNos", stationIds);
			map.add("routId", routId);
			map.add("menuIds", menuIds);
			map.add("catId", catId);

			System.out.println("map SACHIN " + map);

			RestTemplate restTemplate = new RestTemplate();
			DispTransferBean dispTransRes = null;

			try {
		dispTransRes = restTemplate.postForObject(Constants.url + "/getAbcDepatchReportMin1New", map,
				DispTransferBean.class);
			} catch (Exception e) {
		e.printStackTrace();
			}

			SubCategory[] subCatList = restTemplate.getForObject(Constants.url + "getAllSubCatList",
			SubCategory[].class);
			List<SubCategory> subCatAList = new ArrayList<SubCategory>(Arrays.asList(subCatList));
			System.out.println(dispTransRes);
			List<Integer> catIdList =new ArrayList<>();// catIdListStr.stream().map(Integer::parseInt).collect(Collectors.toList());

			 String[] array = catId.split(",");
			 for(int a=0;a<array.length;a++){
				 catIdList.add(Integer.parseInt(array[a]));
			 }
		//List<String> catIdListStr = Arrays.asList(catId.split("\\s*,\\s*"));
		//List<Integer> catIdList = catIdListStr.stream().map(Integer::parseInt).collect(Collectors.toList());
		for (int i = 0; i < dispTransRes.getRouteList().size(); i++) {
			int isFrDataInRoute = 0;
			//Sac 09-03
			for (int m = 0; m < dispTransRes.getReportDataList().size(); m++) {
				if (dispTransRes.getReportDataList().get(m).getFrRouteId() == dispTransRes.getRouteList().get(i)
						.getRouteId()) {

					isFrDataInRoute = 1;
					break;
				} //end of If
			} //End of report for
			if (isFrDataInRoute == 1) {
				//End 09-03
	%>
	<%-- <h5>
		Delivery Date : ${date},&nbsp; Route:
		<%
		out.println(dispTransRes.getRouteList().get(i).getRouteName());
	%>
	</h5> --%>
	<%
		for (int c = 0; c < catIdList.size(); c++) {
			int catFoundInData=0;
					for (int m = 0; m < dispTransRes.getReportDataList().size(); m++) {

						/* if(catIdList.get(c)
								.equalsIgnoreCase(String.valueOf(dispTransRes.getReportDataList().get(m).getItemGrp1()))){ */
							if(catIdList.get(c)==dispTransRes.getReportDataList().get(m).getItemGrp1()&&
									dispTransRes.getRouteList().get(i).getRouteId()==dispTransRes.getReportDataList().get(m).getFrRouteId()){
							 catFoundInData=1;
							
							break;
						}
					}
	if(catFoundInData==1){%>
	<h5>
		Delivery Date : ${date},&nbsp; Route:
		<%
		out.println(dispTransRes.getRouteList().get(i).getRouteName()); 
		//out.print(dispTransRes.getRouteList().get(i).getRouteId());
	%>
	</h5>
	<table align="center" border="1" cellspacing="0" cellpadding="1"
		id="table_grid" class="table table-bordered">
		<thead>
			<tr class="bgpink">
				<th width="3%"></th>
				<%
					for (int j = 0; j < dispTransRes.getFrNameList().size(); j++) {

									if (dispTransRes.getFrNameList().get(j).getFrRouteId() == dispTransRes.getRouteList().get(i)
											.getRouteId()) {
				%><th>
					<%
						out.println(dispTransRes.getFrNameList().get(j).getFrName());
					%>
				</th>
				<%
					}

								}
				%>
				<th width="3%">Total</th>
			</tr>
		</thead>
		<tbody>
			<%
				for (int j = 0; j < subCatAList.size(); j++) {

								int subCatFound = 0;
								for (int l = 0; l < dispTransRes.getFrNameList().size(); l++) {
									if (dispTransRes.getFrNameList().get(l).getFrRouteId() == dispTransRes.getRouteList()
											.get(i).getRouteId()) {
										for (int m = 0; m < dispTransRes.getReportDataList().size(); m++) {
											if (subCatAList.get(j).getSubCatId() == dispTransRes.getReportDataList().get(m)
													.getItemGrp2()
													&& dispTransRes.getFrNameList().get(l).getFrId() == dispTransRes
															.getReportDataList().get(m).getFrId()) {
												subCatFound = 1;
												break;
											}
										}

										if (subCatFound == 1) {
											break;
										}
									}

								}
								/* if (subCatFound == 1 && catIdList.get(c)
										.equalsIgnoreCase(String.valueOf(subCatAList.get(j).getCatId()))) { */
									
									if (subCatFound == 1 && catIdList.get(c)
										==subCatAList.get(j).getCatId()) {
									//int catId1=subCatAList.get(j).getCatId();
									//int catId2=0;
			%>
			<tr>
				<td width="20%"><b> <%
 	out.println(subCatAList.get(j).getSubCatName());
 %>
				</b></td>
			</tr>
			<%
				for (int k = 0; k < dispTransRes.getItems().size(); k++) {

										if (dispTransRes.getItems().get(k).getItemGrp2() == subCatAList.get(j)
												.getSubCatId()) {

											int finalItemFind = 0;

											for (int l = 0; l < dispTransRes.getFrNameList().size(); l++) {
												if (dispTransRes.getFrNameList().get(l).getFrRouteId() == dispTransRes
														.getRouteList().get(i).getRouteId()) {
													for (int m = 0; m < dispTransRes.getReportDataList().size(); m++) {
														if (dispTransRes.getItems().get(k).getId() == dispTransRes
																.getReportDataList().get(m).getItemId()
																&& dispTransRes.getFrNameList().get(l)
																		.getFrId() == dispTransRes.getReportDataList()
																				.get(m).getFrId()) {
															finalItemFind = 1;
															break;
														}
													}

													if (finalItemFind == 1) {
														break;
													}
												}

											}

											if (finalItemFind == 1) {
												//System.out.println( "catId" +dispTransRes.getItems().get(k).getItemGrp1());
			%>
			<tr>
				<td width="20%">
					<%
						out.println(dispTransRes.getItems().get(k).getItemName());
														float totalQty = 0;
					%>
				</td>
				<%
					for (int l = 0; l < dispTransRes.getFrNameList().size(); l++) {

														if (dispTransRes.getFrNameList().get(l).getFrRouteId() == dispTransRes
																.getRouteList().get(i).getRouteId()) {

															int findItem = 0;
															for (int m = 0; m < dispTransRes.getReportDataList().size(); m++) {
																if (dispTransRes.getItems().get(k).getId() == dispTransRes
																		.getReportDataList().get(m).getItemId()
																		&& dispTransRes.getFrNameList().get(l)
																				.getFrId() == dispTransRes.getReportDataList()
																						.get(m).getFrId()) {
																	pageContext.setAttribute("intOrdQty", dispTransRes
																			.getReportDataList().get(m).getOrderQty());
				%><td align="center"><b><fmt:formatNumber
							value="${intOrdQty}" var="ordQty" maxFractionDigits="0" /> <c:out
							value="${ordQty}"></c:out> <%
 	//out.println(dispTransRes.getReportDataList().get(m).getOrderQty());
 													totalQty = totalQty + dispTransRes.getReportDataList()
 															.get(m).getOrderQty();
 													findItem = 1;
 													//catId2=dispTransRes.getItems().get(k).getItemGrp1();
 													//break;
 %> </b></td>
				<%
					break;
																}

															}

															if (findItem == 0) {
				%><td align="center"><b></b></td>
				<%
					}

														}
													}
													pageContext.setAttribute("intTotal", totalQty);
				%>

				<td align="center"><b><fmt:formatNumber value="${intTotal}"
							var="tot" maxFractionDigits="0">
						</fmt:formatNumber> <c:out value="${tot}"></c:out> <%
 	//out.println(totalQty);
 %> </b></td>
			</tr>

			<%
				}
										}

									}

								} //end of subcatitem found if

							}
			%>
		</tbody>

	</table>
	<div style="page-break-after: always;"></div>
	<%
	}
		}
	%>
	<!-- SAC 9-03-2021 -->
	<br>
	<%-- <h4>
		SubCategory Summary for <u> <%
 	out.print(dispTransRes.getRouteList().get(i).getRouteName());
 %>
		</u>
	</h4>
	<table align="center" border="1" cellspacing="0" cellpadding="1"
		id="table_grid1" class="table table-bordered">
		<thead>
			<tr class="bgpink">
				<th width="3%">SubCategory</th>
				<%
					for (int l = 0; l < dispTransRes.getFrNameList().size(); l++) {
								if (dispTransRes.getFrNameList().get(l).getFrRouteId() == dispTransRes.getRouteList().get(i)
										.getRouteId()) {
				%><th>
					<%
						out.println(dispTransRes.getFrNameList().get(l).getFrName());
									}
					%>
				</th>
				<%
					}
				%>
			</tr>
		</thead>
		<tbody>

			<%
				for (int j = 0; j < subCatAList.size(); j++) {

							int subCatFound = 0;
							for (int l = 0; l < dispTransRes.getFrNameList().size(); l++) {
								if (dispTransRes.getFrNameList().get(l).getFrRouteId() == dispTransRes.getRouteList().get(i)
										.getRouteId()) {
									for (int m = 0; m < dispTransRes.getReportDataList().size(); m++) {
										if (subCatAList.get(j).getSubCatId() == dispTransRes.getReportDataList().get(m)
												.getItemGrp2()
												&& dispTransRes.getFrNameList().get(l).getFrId() == dispTransRes
														.getReportDataList().get(m).getFrId()) {
											subCatFound = 1;
											break;
										}
									}

									if (subCatFound == 1) {
										break;
									}
								}

							}
							if (subCatFound == 1) {
			%><tr>
				<td><b> <%
 	out.println(subCatAList.get(j).getSubCatName());
 %>
				</b></td>
				<%
					for (int l = 0; l < dispTransRes.getFrNameList().size(); l++) {
										float subCatTotal = 0;
										int isFrFound = 0;
										if (dispTransRes.getRouteList().get(i).getRouteId() == dispTransRes.getFrNameList()
												.get(l).getFrRouteId()) {
											isFrFound = 1;
											//System.out.println("Fr and Route route id match" +dispTransRes.getRouteList().get(i)
											//.getRouteId() +"fr route " +dispTransRes.getFrNameList().get(l).getFrRouteId()+ "name  " +dispTransRes.getRouteList().get(i).getRouteName() );

											for (int m = 0; m < dispTransRes.getReportDataList().size(); m++) {
												if (subCatAList.get(j).getSubCatId() == dispTransRes.getReportDataList().get(m)
														.getItemGrp2()
														&& dispTransRes.getFrNameList().get(l).getFrId() == dispTransRes
																.getReportDataList().get(m).getFrId()) {

													subCatTotal = subCatTotal
															+ dispTransRes.getReportDataList().get(m).getOrderQty();
												}
											}
											pageContext.setAttribute("intsubCatTotal", subCatTotal);
				%><td align="center"><b> <%
 	if (subCatTotal > 0) {
 %><fmt:formatNumber value="${intsubCatTotal}" var="intsubCatTotal"
							maxFractionDigits="0" /> <c:out value="${intsubCatTotal}"></c:out>
						<%
							}
													//out.println(subCatTotal);
													else
														out.println();
						%>
				</b></td>
				<%
					} //enf of if fr route match to route id

									} //End of fr for Loop
				%>
			</tr>
			<%
				} //End of if subcatfound==1
						}
			%>
		</tbody>
	</table> --%><!-- Un comment 'Commented' Block from to 323 to 423 to show Summary -->
	<!-- SAC 09-03-2021 END -->

	<%%>
	<!--  <div style="page-break-after: always;"></div> --><!-- Un comment line to show Summary -->
	<%
		} //End of if frDataInRoute
		} //End of routeList for loop 

		/* pageContext.setAttribute("show", 1) */;
	%>



	<!-- <br>
	<h4>SubCategory</h4> -->
	<%-- <table align="center" border="1" cellspacing="0" cellpadding="1"
		id="table_grid1" class="table table-bordered">
		<thead>
			<tr class="bgpink">
				<th width="3%">SubCategory</th>
				<%
					for (int l = 0; l < dispTransRes.getFrNameList().size(); l++) {
				%><th>
					<%
						out.println(dispTransRes.getFrNameList().get(l).getFrName());
					%>
				</th>
				<%
					}
				%>
			</tr>
		</thead>
		<tbody>
			<%
				for (int j = 0; j < subCatAList.size(); j++) {
			%><tr>
				<td><b> <%
 	out.println(subCatAList.get(j).getSubCatName());
 %>
				</b></td>
				<%
					for (int l = 0; l < dispTransRes.getFrNameList().size(); l++) {
							float subCatTotal = 0;
							for (int m = 0; m < dispTransRes.getReportDataList().size(); m++) {
								if (subCatAList.get(j).getSubCatId() == dispTransRes.getReportDataList().get(m).getItemGrp2()
										&& dispTransRes.getFrNameList().get(l).getFrId() == dispTransRes.getReportDataList()
												.get(m).getFrId()) {

									subCatTotal = subCatTotal + dispTransRes.getReportDataList().get(m).getOrderQty();
								}
							}
				%><td>
					<%
						out.println(subCatTotal);
					%>
				</td>
				<%
					}
				%>
			</tr>
			<%
			}%>

			<c:forEach items="${subCatList}" var="subCat">
				<tr>
					<td><b>${subCat.subCatName}</b></td>

					<c:forEach items="${frNameList}" var="fr">
						<c:set var="subCatTotal" value="0"></c:set>
						<c:forEach items="${reportDataList}" var="reportDataList">
							<c:if
								test="${subCat.subCatId==reportDataList.itemGrp2 && fr.frId==reportDataList.frId}">
								<c:set var="subCatTotal"
									value="${subCatTotal+reportDataList.orderQty}"></c:set>
							</c:if>
						</c:forEach>
						<td>${subCatTotal}</td>
					</c:forEach>

				</tr>
			</c:forEach>
		</tbody>
	</table> --%>
	<%-- <c:forEach items="${staionListWithFranchiseeList}"
		var="staionListWithFranchiseeList">
		<div align="left">
			<h5>
				Station No : ${staionListWithFranchiseeList.stationNo}, &nbsp;
				Production Date : ${date},&nbsp;
				<c:choose>
					<c:when test="${abcType==0}"> All Rout</c:when>
					<c:when test="${abcType==1}"> A Rout</c:when>
					<c:when test="${abcType==2}"> B Rout</c:when>
					<c:when test="${abcType==3}"> C Rout</c:when>
				</c:choose>
			</h5>
		</div>


		<table align="center" border="1" cellspacing="0" cellpadding="1"
			id="table_grid" class="table table-bordered">
			<thead>
				<tr class="bgpink">
					<th width="3%">Sr.No.</th>
					<th>Franchisee Name</th>
					<c:set var="itemCount" value="2"></c:set>
					<%
						List<Integer> newList = new ArrayList<Integer>();
					%>
					<c:forEach items="${itemList}" var="itemList">
						<c:choose>
							<c:when
								test="${itemList.itemMrp2==staionListWithFranchiseeList.stationNo}">
								<th style="font-size: 12px;">${itemList.itemName}</th>
								<c:set var="itemCount" value="${itemCount+1}"></c:set>
								<c:set var="id" value="${itemList.id}"></c:set>
								<%
									int itemid = (int) pageContext.getAttribute("id");
													newList.add(itemid);
								%>
							</c:when>
						</c:choose>

					</c:forEach>

				</tr>
			</thead>
			<tbody>

				<c:choose>
					<c:when test="${abcType==0 || abcType==1}">
						<c:set var="sr" value="0"></c:set>
						<c:forEach items="${staionListWithFranchiseeList.list}" var="list">
							<c:forEach items="${allFrIdNameList}" var="allFrIdNameList"
								varStatus="count">
								<c:choose>
									<c:when
										test="${list.frId==allFrIdNameList.frId and list.abcType==1}">
										<tr>
											<td width="3%"><c:out value="${sr+1}" /> <c:set
													var="sr" value="${sr+1}"></c:set></td>
											<td align="left"><c:out value="${list.frName}" /></td>
											<%
												for (int i = 0; i < newList.size(); i++) {
											%>
											<c:forEach items="${list.itemList}" var="itemList">

												<c:set var="itemId" value="${itemList.itemId}"></c:set>
												<%
													int itemid = (int) pageContext.getAttribute("itemId");

																						if (itemid == newList.get(i)) {
												%>
												<td style="text-align: center; font-weight: bold;"><c:choose>
														<c:when
															test="${staionListWithFranchiseeList.stationNo==itemList.itemMrp2}">



															<c:choose>
																<c:when test="${itemList.orderQty>0}">

																	<fmt:formatNumber type="number" minFractionDigits="0"
																		maxFractionDigits="0" value="${itemList.orderQty}" />

																</c:when>
																<c:otherwise>


																</c:otherwise>

															</c:choose>



														</c:when>
														<c:otherwise>ER</c:otherwise>
													</c:choose></td>
												<%
													}
												%>

											</c:forEach>
											<%
												}
											%>
										</tr>


									</c:when>
								</c:choose>

							</c:forEach>

						</c:forEach>
						<tr bgcolor="#D3D3D3">
							<td colspan="2" style="text-align: center;"><b> Rout A
									Total </b></td>
							<c:forEach items="${itemListStatioinWiseList}"
								var="itemListStatioinWiseList">
								<c:choose>
									<c:when
										test="${itemListStatioinWiseList.stationNo==staionListWithFranchiseeList.stationNo}">
										<c:forEach
											items="${itemListStatioinWiseList.typeWiseItemTotalList}"
											var="typeWiseItemTotalList">
											<td style="text-align: center;"><b> <fmt:formatNumber
														type="number" minFractionDigits="0" maxFractionDigits="0"
														value="${typeWiseItemTotalList.aTotal}" />


											</b></td>
										</c:forEach>
									</c:when>
								</c:choose>

							</c:forEach>
						</tr>
					</c:when>
				</c:choose>

				<c:choose>
					<c:when test="${abcType==0 || abcType==2}">
						<c:forEach items="${staionListWithFranchiseeList.list}" var="list">
							<c:forEach items="${allFrIdNameList}" var="allFrIdNameList"
								varStatus="count">
								<c:choose>
									<c:when
										test="${list.frId==allFrIdNameList.frId and list.abcType==2}">
										<tr>
											<td><c:out value="${sr+1}" /> <c:set var="sr"
													value="${sr+1}"></c:set></td>
											<td align="left"><c:out value="${list.frName}" /></td>
											<%
												for (int i = 0; i < newList.size(); i++) {
											%>
											<c:forEach items="${list.itemList}" var="itemList">
												<c:set var="itemId" value="${itemList.itemId}"></c:set>
												<%
													int itemid = (int) pageContext.getAttribute("itemId");

																						if (itemid == newList.get(i)) {
												%>
												<td style="text-align: center; font-weight: bold;"><c:choose>
														<c:when
															test="${staionListWithFranchiseeList.stationNo==itemList.itemMrp2}">
															<c:choose>
																<c:when test="${itemList.orderQty>0}">

																	<fmt:formatNumber type="number" minFractionDigits="0"
																		maxFractionDigits="0" value="${itemList.orderQty}" />

																</c:when>
																<c:otherwise>


																</c:otherwise>

															</c:choose>
														</c:when>
														<c:otherwise>ER</c:otherwise>
													</c:choose></td>
												<%
													}
												%>
											</c:forEach>
											<%
												}
											%>
										</tr>


									</c:when>
								</c:choose>

							</c:forEach>
						</c:forEach>
						<tr bgcolor="#D3D3D3">
							<td colspan="2" style="text-align: center;"><b>Rout B
									Total</b></td>
							<c:forEach items="${itemListStatioinWiseList}"
								var="itemListStatioinWiseList">
								<c:choose>
									<c:when
										test="${itemListStatioinWiseList.stationNo==staionListWithFranchiseeList.stationNo}">
										<c:forEach
											items="${itemListStatioinWiseList.typeWiseItemTotalList}"
											var="typeWiseItemTotalList">

											<td style="text-align: center;"><b> <fmt:formatNumber
														type="number" minFractionDigits="0" maxFractionDigits="0"
														value="${typeWiseItemTotalList.bTotal}" />


											</b></td>

										</c:forEach>
									</c:when>
								</c:choose>

							</c:forEach>
						</tr>
					</c:when>
				</c:choose>

				<c:choose>
					<c:when test="${abcType==0 || abcType==3}">
						<c:forEach items="${staionListWithFranchiseeList.list}" var="list">
							<c:forEach items="${allFrIdNameList}" var="allFrIdNameList"
								varStatus="count">
								<c:choose>
									<c:when
										test="${list.frId==allFrIdNameList.frId and list.abcType==3}">
										<tr>
											<td><c:out value="${sr+1}" /> <c:set var="sr"
													value="${sr+1}"></c:set></td>
											<td align="left"><c:out value="${list.frName}" /></td>
											<%
												for (int i = 0; i < newList.size(); i++) {
											%>
											<c:forEach items="${list.itemList}" var="itemList">
												<c:set var="itemId" value="${itemList.itemId}"></c:set>
												<%
													int itemid = (int) pageContext.getAttribute("itemId");

																						if (itemid == newList.get(i)) {
												%>
												<td style="text-align: center; font-weight: bold;"><c:choose>
														<c:when
															test="${staionListWithFranchiseeList.stationNo==itemList.itemMrp2}">
															<c:choose>
																<c:when test="${itemList.orderQty>0}">

																	<fmt:formatNumber type="number" minFractionDigits="0"
																		maxFractionDigits="0" value="${itemList.orderQty}" />

																</c:when>
																<c:otherwise>


																</c:otherwise>

															</c:choose>
														</c:when>
														<c:otherwise>ER</c:otherwise>
													</c:choose></td>
												<%
													}
												%>
											</c:forEach>
											<%
												}
											%>
										</tr>


									</c:when>
								</c:choose>

							</c:forEach>

						</c:forEach>
						<tr bgcolor="#D3D3D3">
							<td colspan="2" style="text-align: center;"><b> Rout C
									Total </b></td>
							<c:forEach items="${itemListStatioinWiseList}"
								var="itemListStatioinWiseList">
								<c:choose>
									<c:when
										test="${itemListStatioinWiseList.stationNo==staionListWithFranchiseeList.stationNo}">
										<c:forEach
											items="${itemListStatioinWiseList.typeWiseItemTotalList}"
											var="typeWiseItemTotalList">


											<td style="text-align: center;"><b> <fmt:formatNumber
														type="number" minFractionDigits="0" maxFractionDigits="0"
														value="${typeWiseItemTotalList.cTotal}" />


											</b></td>


										</c:forEach>
									</c:when>
								</c:choose>

							</c:forEach>
						</tr>
					</c:when>
				</c:choose>

				<tr bgcolor="#D3D3D3">
					<td colspan="2" style="text-align: center;"><b> Station
							${staionListWithFranchiseeList.stationNo} Total </b></td>
					<c:forEach items="${itemListStatioinWiseList}"
						var="itemListStatioinWiseList">
						<c:choose>
							<c:when
								test="${itemListStatioinWiseList.stationNo==staionListWithFranchiseeList.stationNo}">
								<c:forEach
									items="${itemListStatioinWiseList.typeWiseItemTotalList}"
									var="typeWiseItemTotalList">

									<td style="text-align: center;"><b> <fmt:formatNumber
												type="number" minFractionDigits="0" maxFractionDigits="0"
												value="${typeWiseItemTotalList.aTotal+typeWiseItemTotalList.bTotal+
																		  typeWiseItemTotalList.cTotal}" />


									</b></td>

								</c:forEach>
							</c:when>
						</c:choose>

					</c:forEach>


				</tr>

			</tbody>
		</table>
		<div style="page-break-after: always;"></div>
	</c:forEach> --%>

	<!-- END Main Content -->

</body>
</html>