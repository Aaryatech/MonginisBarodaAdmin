<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.ats.adminpanel.commons.Constants" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>Configer Menu  List PDF</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->


 <style type="text/css">
 table {
	border-collapse: collapse;
	font-size: 10;
	width:100%;
page-break-inside: auto !important 

} 
p  {
    color: black;
    font-family: arial;
    font-size: 60%;
	margin-top: 0;
	padding: 0;

}
h6  {
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
<h3 align="center">${Constants.FACTORYNAME}</h3>
<p align="center">${Constants.FACTORYADDRESS}</p>

<div align="center"> <h5> Config Menu List</h5></div>
	<table  align="center" border="1" cellspacing="0" cellpadding="1" 
		id="table_grid" class="table table-bordered">
		<thead>
			<tr class="bgpink">
			<th width="10%">Sr. No.</th>
				<c:forEach items="${routeIds}" var="routeIds" varStatus="count">

					<c:if test="${routeIds==1}">
						<th>Srno</th>
					</c:if>

					<c:if test="${routeIds==2}">
						<th>Seq No</th>
					</c:if>

					<c:if test="${routeIds==3}">
						<th>Menu Tittle</th>
					</c:if>

					<c:if test="${routeIds==4}">
						<th>Category Name</th>	
					</c:if>

					<c:if test="${routeIds==5}">
						<th>Rate Type.</th>
					</c:if>

					<c:if test="${routeIds==6}">
						<th>Profit</th>
					</c:if>

					<c:if test="${routeIds==7}">
						<th>Grn</th>
					</c:if>
					
					
					<c:if test="${routeIds==8}">
						<th>Prod. Days</th>
					</c:if>
					
					<c:if test="${routeIds==9}">
						<th>Del Days</th>
					</c:if>
					
					<c:if test="${routeIds==10}">
						<th>Day/Date</th>
					</c:if>
					
					<c:if test="${routeIds==11}">
						<th>Time</th>
					</c:if>
					

						
				</c:forEach>
			</tr>
		</thead>
		<tbody>
		<c:set value="" var="abcType"/>
			<c:forEach items="${configureFrList}" var="menu" varStatus="count">
				<tr>
				<%-- <c:forEach items="${valList}" var="valList">
					<c:if test="${printRouteList.abcType==valList.abcId}">
						<c:set value="${valList.abcVal}" var="abcType"/>
					</c:if>
				</c:forEach> --%>
				
					<td>${count.index+1}</td>
					<c:forEach items="${routeIds}" var="routeIds">
										
					<c:if test="${routeIds==2}">
						<td style="text-align: left;">${menu.frId}</td>
					</c:if>
					
					<c:if test="${routeIds==3}">						
						<td style="text-align: left;">${menu.menuTitle}</td>
					</c:if>
					
					<c:if test="${routeIds==4}">						
						<td style="text-align: right;">${menu.catName}</td>
					</c:if>
					
					<c:if test="${routeIds==5}">		
					<c:choose>
					<c:when test="${menu.rateSettingType==1}">
					<td style="text-align: left;">Regular Rate</td>
					</c:when>
					<c:when test="${menu.rateSettingType==2}">
					<td style="text-align: left;">Special Rate</td>
					</c:when>
					<c:otherwise>
					<td style="text-align: left;">Local Rate</td>
					</c:otherwise>
					</c:choose>				
					
					</c:if>
					
					
					
					<c:if test="${routeIds==6}">						
						<td style="text-align: right;">${menu.profitPer}</td>
					</c:if>
					
					<c:if test="${routeIds==7}">						
						<td style="text-align: center;">${menu.grnPer}</td>
					</c:if>
					
					<c:if test="${routeIds==8}">						
						<td style="text-align: right;">${menu.prodDays}</td>
					</c:if>
					<c:if test="${routeIds==9}">						
						<td style="text-align: right;">${menu.delDays}</td>
					</c:if>	
					<c:if test="${routeIds==10}">						
						<td style="text-align: right;">${menu.fromTime}To${menu.toTime}</td>
					</c:if>	
					<c:if test="${routeIds==11}">	
					<c:choose>
						<c:when test="${menu.settingType==1}">
						<td style="text-align: right;">Daily</td>
						</c:when>
						<c:when test="${menu.settingType==2}">
						<td style="text-align: right;">Date</td>
						</c:when>
						<c:otherwise>
						<td style="text-align: right;">Day</td>
						</c:otherwise>
					
					</c:choose>					
						
					</c:if>
								
				</c:forEach>
				</tr>
			</c:forEach>				
		</tbody>
	</table>
	

	<!-- END Main Content -->

</body>
</html>