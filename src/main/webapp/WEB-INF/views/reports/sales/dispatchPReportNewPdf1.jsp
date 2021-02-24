<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.ats.adminpanel.commons.Constants"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
	<h4 align="center">MONGINIS</h4>
	<p align="center">${Constants.CITY}</p>

	<c:forEach items="${routeList}" var="route">
		<h5>Delivery Date : ${date},&nbsp; Route: ${route.routeName}</h5>
		<table align="center" border="1" cellspacing="0" cellpadding="1"
			id="table_grid" class="table table-bordered">
			<thead>
				<tr class="bgpink">
					<th width="3%"></th>
					<c:forEach items="${frNameList}" var="fr">
						<c:if test="${fr.frRouteId==route.routeId}">
							<th>${fr.frName}</th>
						</c:if>
					</c:forEach>
					<th width="3%">Total</th>
				</tr>
			</thead>
			<tbody>

				<c:forEach items="${subCatList}" var="subCat">

					<tr>
						<td><b>${subCat.subCatName}</b></td>
					</tr>
					<c:forEach items="${items}" var="item">
						<c:set var="itemTotal" value="0"></c:set>
						<c:if test="${item.itemGrp2==subCat.subCatId}">
							<tr>
								<td>${item.itemName}</td>
								<c:forEach items="${frNameList}" var="fr">
									<c:if test="${fr.frRouteId==route.routeId}">
										<c:set var="findItem" value="0"></c:set>
										<c:forEach items="${reportDataList}" var="reportDataList">
											<c:if
												test="${item.id==reportDataList.itemId && fr.frId==reportDataList.frId}">
												<td>${reportDataList.orderQty}</td>
												<c:set var="findItem" value="1"></c:set>
												<c:set var="itemTotal"
													value="${itemTotal+reportDataList.orderQty}"></c:set>
											</c:if>
										</c:forEach>
										<c:if test="${findItem==0}">
											<td>0</td>
										</c:if>
									</c:if>

								</c:forEach>
								<td>${itemTotal}</td>
							</tr>
						</c:if>
					</c:forEach>
				</c:forEach>




			</tbody>
		</table>
		<div style="page-break-after: always;"></div>
	</c:forEach>

	<br>
	<table align="center" border="1" cellspacing="0" cellpadding="1"
		id="table_grid1" class="table table-bordered">
		<thead>
			<tr class="bgpink">
				<th width="3%">SubCategory</th>
				<c:forEach items="${frNameList}" var="fr">
					<th>${fr.frName}</th>
				</c:forEach>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${subCatList}" var="subCat">
				<tr>
					<td><b>${subCat.subCatName}</b></td>
					
					<c:forEach items="${frNameList}" var="fr">
					<c:set var="subCatTotal" value="0"></c:set>
						<c:forEach items="${reportDataList}" var="reportDataList">
							<c:if
								test="${subCat.subCatId==reportDataList.itemGrp2 && fr.frId==reportDataList.frId}">
								<c:set var="subCatTotal" value="${subCatTotal+reportDataList.orderQty}"></c:set>
							</c:if>
						</c:forEach>
<td>${subCatTotal}</td>
					</c:forEach>
					
				</tr>
			</c:forEach>
		</tbody>
	</table>
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