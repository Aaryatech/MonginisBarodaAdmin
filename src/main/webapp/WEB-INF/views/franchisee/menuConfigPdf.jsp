<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>Bill-wise Report Pdf</title>
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
<h3 align="center">${FACTORYNAME}</h3>
<p align="center">${FACTORYADDRESS}</p>
	
<div align="center"> <h5> Franchisee Wise Configuered Menu&nbsp;&nbsp;&nbsp;&nbsp; <%-- From &nbsp; ${fromDate}  &nbsp;To &nbsp; ${toDate} --%></h5></div>
	<table  align="center" border="1" cellspacing="0" cellpadding="1" 
		id="table_grid" class="table table-bordered">
		<thead>
																<tr class="bgpink">
																	<th width="27" style="width: 28px"id="sr">#</th>
																	<th width="124" align="left"id="fr">Franchisee Name</th>
																	<th width="202" align="left"id="menu">Menu Title</th>
																<th width="106" align="left"id="cat">Category Name</th>
																	<th width="126" align="left" id="time">Time</th>
																	<th width="66" align="left"id="type">Type</th> 
															
																</tr>
															</thead>
		<tbody>
																<c:forEach items="${configList}"
																	var="configureFrList" varStatus="count">


																	<tr>
																		<td><c:out value="${count.index+1}"></c:out></td>
																		<td align="left"><c:out
																				value="${configureFrList.frName}"></c:out> <!-- <img src="http://monginisaurangabad.com/admin/uploads/cakes/0L6KEg55AhP18.jpg" alt="" width="150" height="100" /> -->
																		</td>
																		<td align="left"><c:out
																				value="${configureFrList.menuTitle}  "></c:out></td>
																		 <td align="left"><c:out
																				value="${configureFrList.catName}  "></c:out></td>
														 				<%-- 	<td align="left"><c:out
																			value="${configureFrList.itemShow}"></c:out></td>
 --%>

																		<td align="left"><c:out
																				value="${configureFrList.fromTime} To ${configureFrList.toTime}"></c:out></td>

																		<c:choose>
																			<c:when test="${configureFrList.settingType==1}">
																				<td align="left"><c:out value="Daily"></c:out></td>
																			</c:when>
																			<c:when test="${configureFrList.settingType==2}">
																				<td align="left"><c:out value="Date"></c:out></td>
																			</c:when>
																			<c:when test="${configureFrList.settingType==3}">
																				<td align="left"><c:out value="Day"></c:out></td>
																			</c:when>
																		</c:choose> 
<%-- 
																		<c:choose>
																			<c:when test="${isEdit==1}">
 --%>	<%-- 	
																				<td style="text-align: center;"><a
																					href="updateFranchiseeConf/${configureFrList.settingId}"><span
																						class="glyphicon glyphicon-edit"></span></a>&nbsp;&nbsp;&nbsp;&nbsp;


																		
																			</c:when>
																			<c:otherwise>
																				<td style="text-align: center;"><a
																					href="updateFranchiseeConf/${configureFrList.settingId}" class="disableClick"><span
																						class="glyphicon glyphicon-edit"></span></a>&nbsp;&nbsp;&nbsp;&nbsp;

																			</c:otherwise>
																		</c:choose> --%>
																		<%-- <td align="left"><a
																			href="updateFranchiseeConf/${configureFrList.settingId}"><span
																				class="glyphicon glyphicon-edit"></span></a>&nbsp;&nbsp;&nbsp;&nbsp;
 --%>														
																	</tr>

																</c:forEach>


															</tbody>
	</table>
	

	<!-- END Main Content -->

</body>
</html>