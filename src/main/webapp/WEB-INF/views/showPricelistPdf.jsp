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
	
<div align="center"> <h5> Price List&nbsp;&nbsp;&nbsp;&nbsp; <%-- From &nbsp; ${fromDate}  &nbsp;To &nbsp; ${toDate} --%></h5></div>
	<table id="table1" class="table table-advance" border="1">
															<thead>
																<tr class="bgpink">
																	<th width="27" style="width: 28px" id="sr">#</th>
																	<th width="100" align="left" id="fr">Item Name</th>
																	<th width="101" align="left" id="menu">MRP</th>
																	<th width="30" align="left">Rate1</th>
																	<th width="30" align="left">Rate1</th>
																	<th width="30" align="left">Rate1</th>
																	</tr>
															</thead>
															<tbody>
																<c:forEach items="${configList}" var="item" varStatus="count">
																<tr>
																<td><c:out value="${count.index+1}"></c:out></td>
																<td align="left"><c:out
																				value="${item.itemName}"></c:out> <!-- <img src="http://monginisaurangabad.com/admin/uploads/cakes/0L6KEg55AhP18.jpg" alt="" width="150" height="100" /> -->
																</td>
																<td align="left"><c:out
																				value="${item.itemMrp1}"></c:out> <!-- <img src="http://monginisaurangabad.com/admin/uploads/cakes/0L6KEg55AhP18.jpg" alt="" width="150" height="100" /> -->
																</td>
																<td align="left"><c:out
																				value="${item.itemRate1}"></c:out> <!-- <img src="http://monginisaurangabad.com/admin/uploads/cakes/0L6KEg55AhP18.jpg" alt="" width="150" height="100" /> -->
																</td>
																<td align="left"><c:out
																				value="${item.itemRate2}"></c:out> <!-- <img src="http://monginisaurangabad.com/admin/uploads/cakes/0L6KEg55AhP18.jpg" alt="" width="150" height="100" /> -->
																</td>
																<td align="left"><c:out
																				value="${item.itemRate3}"></c:out> <!-- <img src="http://monginisaurangabad.com/admin/uploads/cakes/0L6KEg55AhP18.jpg" alt="" width="150" height="100" /> -->
																</td>
																
																</tr>
																</c:forEach>

															</tbody>

														</table>
	

	<!-- END Main Content -->

</body>
</html>