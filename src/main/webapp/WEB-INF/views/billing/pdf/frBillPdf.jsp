
<%@page contentType="text/html; charset=ISO8859_1"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.lang.*"%>
 <%@ page import="com.ats.adminpanel.commons.Constants" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>FR Bill PDF</title>

 <style type="text/css">

 table {
	border-collapse: collapse;
	font-size: 10;
	width:100%;
page-break-inside: auto !important 

} 
</style>
</head>
<body>
	<c:forEach items="${billDetails}" var="frDetails" varStatus="count">
	<c:set var="srCnt" value="0" />
	<c:set var="totalRowCount" value="0" />
	<c:set var="maxRowCount" value="35" />
	
	<div style="text-align: center; font-size: 12px;"><b>TAX INVOICE</b></div>
		<div style="text-align: right; font-size: 10px;">
			</div>
		<table width="100%" border="0" cellpadding="0" cellspacing="0"  
			style="border-left: 1px solid #313131; border-right: 1px solid #313131; border-top: 1px solid #313131;">
			<tr>
				
				<td width="60%" colspan="6" rowspan="2"
					style="border-left: 1px solid #313131; padding: 0; color: #000; font-size: 15px; text-align: left">
					<p style="color: #000; font-size: 10px; text-align: left; margin: 0px; padding: 5px 0 0 5px;">&nbsp;Name & Address of Licensee:<br></br></p>
					<h4 style="color: #000; font-size: 16px; text-align: left; margin: 0px; padding: 0 0 5px 5px;">&nbsp;${frDetails.company.compName}</h4>
					<p style="color: #000; font-size: 10px; text-align: left; margin: 0px; padding: 0 0 10px 5px;">&nbsp;
						Fact.Address: ${frDetails.company.factAddress} <br />&nbsp;
						Phone: ${frDetails.company.phoneNo1}, Email: ${frDetails.company.email}
					</p>
					
					<table>
					 <tr style="height: 42px;">
						<td width="50%" style="border-top: 1px solid #313131; border-right: 1px solid #313131; padding: 8px; color: #000; font-size: 
					13px;"><p
						style="color: #000; font-size: 13px; text-align:left; margin: 0px;">&nbsp;
						<b>GST No:</b>
						<!-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->&nbsp;${frDetails.company.gstin}
						
					</p>
					</td>
						<td width="50%" style="border-top: 1px solid #313131; padding: 8px; color: #000; font-size: 
					13px;">CIN : ${frDetails.company.cinNo}</td>
					</tr>
					</table>
					
					
					
				</td>
				<td colspan="4" width="40%" 
					style="border-left: 1px solid #313131; border-right: 1px solid #313131; padding: 10px; color: #FFF; font-size: 15px;">
					<p
						style="color: #000; font-size: 9px; text-align: left; margin: 0px;">
						ORIGINAL - FOR BUYER <br /> DUPLICATE - FOR TRANSPORTER/ACESSEE
					</p>
				</td>

			</tr>
			<tr>
			<td colspan="4" width="40%" 
					style="border-left: 1px solid #313131; border-top: 1px solid #313131;border-right: 1px solid #313131; padding: 10px; color: #FFF; font-size: 15px;">
					<p
						style="color: #000; font-size: 10px; text-align: left; margin: 0px;">
						Name Of Receiver (Bill To/Ship To)<br /> 
					</p>
					<p style="color: #000; font-size: 16px; text-align: left; margin: 0px;">
					<b>${frDetails.partyName}</b>   <br /> 
						<span style="font-size: 10px;"> ${frDetails.frAddress} </span><br></br>
						<span style="font-size: 10px;">GSTIN:   ${frDetails.partyGstin}</span>
					</p>
				</td>
			</tr>

			<tr>
				<td width="50%" colspan="6"
					style="border-top: 1px solid #313131; padding: 8px; color: #FFF; font-size: 
					14px;">
					
					<p
						style="color: #000; font-size: 13px;font-weight:bold; text-align: left; margin: 0px;">
						Invoice No: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>${frDetails.invoiceNo}</b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<!-- </p>
					<p
						style="color: #000; font-size: 13px; text-align: left; margin: 0px;"> -->
						<!-- Invoice  -->Date: &nbsp;&nbsp;&nbsp;<b>${frDetails.billDate}</b>
					</p>
					<!-- <p
						style="color: #000; font-size: 13px; text-align: left; margin: 0px;">Is reverse tax Applicable?(Yes/No): No</p>
			 -->	</td>

				<td width="50%" colspan="5"
					style="border-top: 1px solid #313131; border-left: 1px solid #313131; padding: 8px; color: #FFF; font-size: 15px;">
					
					<p
						style="color: #000; font-size: 13px; text-align: left; margin: 0px;">
						Vehicle No:
						&nbsp;&nbsp;&nbsp;<b>${frDetails.vehNo}</b>
					</p>
					
					<p
						style="color: #000; font-weight:bold; font-size: 13px; text-align: left; margin: 0px;"><%-- Place
						of supply: &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; ${Constants.STATE}    &nbsp;&nbsp;&nbsp;&nbsp; --%>&nbsp; <%-- Date Of Remo.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${frDetails.billDate}&nbsp;&nbsp;${frDetails.billTime} --%></p>
				</td>
			</tr>
		
		</table>

		<table width="100%" border="1" cellpadding="0" cellspacing="0"
			style="border-top: 1px solid #313131; border-left: 1px solid #313131; border-right: 1px solid #313131">
			<tr>
				<td rowspan="2" width="2%"
					style="border-bottom: 1px solid #313131; border-bottom: 1px solid #313131; border-left: 1px solid #313131; padding: 5px; color: #000; font-size: 10px;">No.</td>
				<td align="left" width="36%" rowspan="2"
					style="border-bottom: 1px solid #313131; border-left: 1px solid #313131; padding: 15px; color: #000; font-size: 10px; text-align: left">Item
					Description</td>
				<td align="center" width="5%" rowspan="2"
					style="border-bottom: 1px solid #313131; border-left: 1px solid #313131; padding: 0.2px; color: #000; font-size: 10px;">HSN
					Code</td>

				<td align="center" width="5%" rowspan="2"
					style="border-bottom: 1px solid #313131; border-left: 1px solid #313131; padding: 10px; color: #000; font-size: 10px;">Qty</td>
				<td align="center" width="5%" rowspan="2"
					style="border-bottom: 1px solid #313131; border-left: 1px solid #313131; padding: 10px; color: #000; font-size: 10px;">UOM
				</td>
				<td align="center" width="5%" rowspan="2"
					style="border-bottom: 1px solid #313131; border-left: 1px solid #313131; padding: 10px; color: #000; font-size: 10px;">Rate</td>
				<td align="center" width="5%" rowspan="2"
					style="border-bottom: 1px solid #313131;border-left: 1px solid #313131; padding: 10px; color: #000; font-size: 10px; text-align: center;">
					Disc %</td>
				<td align="center" width="10%" rowspan="2"
					style="border-bottom: 1px solid #313131; border-left: 1px solid #313131; padding: 10px; color: #000; font-size: 10px;">Taxable Amt</td>
			
				<td align="center" width="10%" rowspan="2"
					style="border-bottom: 1px solid #313131; border-left: 1px solid #313131; padding: 10px; color: #000; font-size: 10px; text-align: center;">
					CGST</td>
				<td align="center" width="10%" rowspan="2"
					style="border-bottom: 1px solid #313131; border-left: 1px solid #313131; padding: 10px; color: #000; font-size: 10px; text-align: center;">SGST</td>
				<!-- <td align="center" width="10%" colspan="2"
					style="border-left: 1px solid #313131; padding: 10px; color: #000; font-size: 10px; text-align: center;">CESS</td> -->	
				<td align="center" width="10%" rowspan="2"
					style="border-bottom: 1px solid #313131; border-left: 1px solid #313131; padding: 10px; color: #000; font-size: 10px;">Total</td>
			</tr>
			<tr>
		
				
			</tr>

			<c:set var="totalQty" value="0" />
			<c:set var="totalSpKgQty" value="0" />
			<c:set var="totalAmt" value="0" />
			<c:set var="totalCgst" value="0" />
				<c:set var="totalDisc" value="0" />
			<c:set var="totalSgst" value="0" /><c:set var="totalCess" value="0" />
			<c:set var="acttotal" value="0" />
			
			<c:forEach items="${frDetails.subCatList}" var="category">
					<c:if test="${category.delStatus==0}">
	<c:set var="totalRowCount" value="${totalRowCount+1}" />

				<tr>
					<td
						style="border-left: 1px solid #313131; padding: 3px 5px; color: white; font-size: 10px;">-</td>
					<td colspan="10"
						style="border-left: 1px solid #313131; padding: 3px 5px; color: #000; font-size: 10px;"><b><u>${category.subCatName}</u> GST ${category.taxPer} % Group</b></td>
					
				</tr>
		</c:if>	
				
				<c:forEach items="${frDetails.billDetailsList}" var="billDetails"
					varStatus="count">
					
					<c:choose>
				<%-- 	<c:set var="txPer" value="${billDetails.sgstPer+billDetails.cgstPer}"></c:set> --%>
						<c:when test="${category.taxPer eq (billDetails.sgstPer+billDetails.cgstPer)}">
						
					<c:choose>
						
						<c:when test="${totalRowCount gt maxRowCount}">
						
						</table>
						<div style="page-break-after: always;"></div>
						<!-- 	<table width="100%" border="1" cellpadding="0" cellspacing="0"
			style="border-top: 1px solid #313131; border-right: 1px solid #313131;">
		</table> -->
						
						
							<%-- <b>${totalRowCount}</b>	 --%>
		<%-- <div style="text-align: center; font-size: 12px;"><b>TAX INVOICE NP ${totalRowCount} </b></div>
		<div style="text-align: right; font-size: 10px;">CIN: ${frDetails.company.cinNo}
			</div> --%>
		<table width="100%" border="0" cellpadding="0" cellspacing="0"  
			style="border-left: 1px solid #313131; border-right: 1px solid #313131; border-top: 1px solid #313131;">
<%-- 			<tr>
				<td width="60%" colspan="6" rowspan="2"
					style="border-left: 1px solid #313131; padding: 0; color: #000; font-size: 15px; text-align: left">
					<p style="color: #000; font-size: 10px; text-align: left; margin: 0px; padding: 5px 0 0 5px;">&nbsp;Name & Address of Licensee:<br></br></p>
					<h4 style="color: #000; font-size: 16px; text-align: left; margin: 0px; padding: 0 0 5px 5px;">&nbsp;${frDetails.company.compName}</h4>
					<p style="color: #000; font-size: 10px; text-align: left; margin: 0px; padding: 0 0 10px 5px;">&nbsp;
						Fact.Address: ${frDetails.company.factAddress} <br />&nbsp;
						Phone: ${frDetails.company.phoneNo1}, Email: ${frDetails.company.email}
					</p>
					
					<table>
					 <tr  style="height: 42px;">
						<td width="50%" style="border-top: 1px solid #313131; border-right: 1px solid #313131; padding: 8px; color: #000; font-size: 
					14px;"><p
						style="color: #000; font-size: 13px; text-align:left; margin: 0px;">&nbsp;
						<b>GST No:</b>
						<!-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->&nbsp;${frDetails.company.gstin}
						
					</p>
					</td>
						<td width="50%" style="border-top: 1px solid #313131; padding: 8px; color: #000; font-size: 
					14px;">CIN : ${frDetails.company.cinNo}</td>
					</tr>
					</table>
				</td>
				<td colspan="4" width="40%" 
					style="border-left: 1px solid #313131; border-right: 1px solid #313131; padding: 10px; color: #FFF; font-size: 15px;">
					<p
						style="color: #000; font-size: 9px; text-align: left; margin: 0px;">
						ORIGINAL - FOR BUYER <br /> DUPLICATE - FOR TRANSPORTER/ACESSEE
					</p>
				</td>

			</tr>
			<tr>
			<td colspan="4" width="40%" 
					style="border-left: 1px solid #313131; border-top: 1px solid #313131;border-right: 1px solid #313131; padding: 10px; color: #FFF; font-size: 15px;">
					<p
						style="color: #000; font-size: 10px; text-align: left; margin: 0px;">
						Date Of Receiver (Bill To/Ship To)<br /> 
					</p>
					<p style="color: #000; font-size: 12px; text-align: left; margin: 0px;">
					<b>${frDetails.partyName}</b>   <br /> 
						<span style="font-size: 10px;"> ${frDetails.frAddress} </span><br></br>
						<span style="font-size: 10px;">GSTIN:   ${frDetails.partyGstin}</span>
					</p>
				</td>
			</tr> --%>

			<tr>
				<td width="50%" colspan="6"
					style="border-top: 1px solid #313131; padding: 8px; color: #FFF; font-size: 
					14px;">
					<p
						style="color: #000; font-size: 13px;font-weight:bold; text-align: left; margin: 0px;">
						Invoice No: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>${frDetails.invoiceNo}</b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<!-- Invoice  -->Date: &nbsp;&nbsp;&nbsp;<b>${frDetails.billDate}</b>
					</p>
						</td>

				<td width="50%" colspan="5"
					style="border-top: 1px solid #313131; border-left: 1px solid #313131; padding: 8px; color: #FFF; font-size: 15px;">
		
						<p style="color: #000; font-size: 16px; text-align: left; margin: 0px;">
					<b>${frDetails.partyName}</b>   <br /> 
						<span style="font-size: 10px;"> ${frDetails.frAddress} </span><br></br>
						<span style="font-size: 10px;">GSTIN:   ${frDetails.partyGstin}</span>
					</p><%-- <p
						style="color: #000; font-size: 13px; text-align: left; margin: 0px;">
						Vehicle No:
						&nbsp;&nbsp;&nbsp;<b>${frDetails.vehNo}</b>
					</p> --%><%-- Place
						of supply: &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; ${Constants.STATE}    &nbsp;&nbsp;&nbsp;&nbsp; --%><%-- &nbsp; Date Of Remo.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${frDetails.billDate}&nbsp;&nbsp;${frDetails.billTime} --%></p>
				</td>
			</tr>
		
		</table>
						
			<table width="100%" border="1" cellpadding="0" cellspacing="0"
			style="border-top: 1px solid #313131; border-right: 1px solid #313131;border-left: 1px solid #313131">
			<tr>
				<td rowspan="1" width="2%"
					style="border-bottom: 1px solid #313131; border-bottom: 1px solid #313131; border-left: 1px solid #313131; padding: 5px; color: #000; font-size: 10px;">No.</td>
				<td align="left" width="36%" rowspan="1"
					style="border-bottom: 1px solid #313131; border-left: 1px solid #313131; padding: 15px; color: #000; font-size: 10px; text-align: left">Item
					Description</td>
				<td align="center" width="5%" rowspan="1"
					style="border-bottom: 1px solid #313131; border-left: 1px solid #313131; padding: 0.2px; color: #000; font-size: 10px;">HSN
					Code</td>


				<td align="center" width="5%" rowspan="1"
					style="border-bottom: 1px solid #313131; border-left: 1px solid #313131; padding: 10px; color: #000; font-size: 10px;">Qty</td>
					<td align="center" width="5%" rowspan="1"
					style="border-bottom: 1px solid #313131; border-left: 1px solid #313131; padding: 10px; color: #000; font-size: 10px;">UOM</td>
					
			<!-- change	<td align="center" width="5%" rowspan="2"
					style="border-bottom: 1px solid #313131; border-left: 1px solid #313131; padding: 10px; color: #000; font-size: 10px;">UOM
				</td> -->
				<td align="center" width="5%" rowspan="1"
					style="border-bottom: 1px solid #313131; border-left: 1px solid #313131; padding: 10px; color: #000; font-size: 10px;">Rate</td>
			<td align="center" width="5%" rowspan="1"
					style="border-bottom: 1px solid #313131;border-left: 1px solid #313131; padding: 10px; color: #000; font-size: 10px; text-align: center;">
					Disc %</td>
				<td align="center" width="10%" rowspan="1"
					style="border-bottom: 1px solid #313131; border-left: 1px solid #313131; padding: 10px; color: #000; font-size: 10px;">Taxable Amt</td>
					
				<td align="center" width="10%" colspan="1"
					style="border-bottom: 1px solid #313131; border-left: 1px solid #313131; padding: 10px; color: #000; font-size: 10px; text-align: center;">
					CGST</td>
				<td align="center" width="10%" colspan="1"
					style="border-bottom: 1px solid #313131; border-left: 1px solid #313131; padding: 10px; color: #000; font-size: 10px; text-align: center;">SGST</td>
		<!-- <td align="center" width="10%" colspan="2"
					style="border-left: 1px solid #313131; padding: 10px; color: #000; font-size: 10px; text-align: center;">CESS</td> -->				
						<td align="center" width="10%" colspan="2"
					style="border-bottom: 1px solid #313131;border-left: 1px solid #313131; padding: 10px; color: #000; font-size: 10px; text-align: center;">Total</td>
			</tr>
			<tr>
			
				</tr>	 
						
							
							
							<c:set var="totalRowCount" value="0" />
								<c:set var="maxRowCount" value="41" />
							
							</c:when>
						</c:choose>
						<c:set var="srCnt" value="${srCnt+1}" />
							<c:set var="totalRowCount" value="${totalRowCount+1}" />
							<tr>
								<td
									style="border-left: 1px solid #313131; padding: 3px 5px; color: #000; font-size: 12px;">${srCnt}</td>
									
									<%-- <c:choose>
									<c:when test="${billDetails.grnType==3}">
									<td
								style="border-left: 1px solid #313131; padding: 3px 5px; color: #000; font-size: 12px;">${billDetails.itemName} [NR]
								
								</td>
									
									</c:when>
									<c:when test="${billDetails.grnType==4}">
									<td
									style="border-left: 1px solid #313131; padding: 3px 5px; color: #000; font-size: 12px;">${billDetails.itemName} [R]</td>
									</c:when>
									<c:otherwise> --%>
									
									<td
									style="border-left: 1px solid #313131; padding: 3px 5px; color: #000; font-size: 12px;">${billDetails.itemName}</td>
									
									<%-- </c:otherwise>
									
									</c:choose>
								 --%>
								<td align="left"
									style="border-left: 1px solid #313131; padding: 3px 5px; color: #000; font-size: 12px;">${billDetails.itemHsncd}</td>
										<td align="right"
									style="border-left: 1px solid #313131; padding: 3px 5px; color: #000; font-size: 12px;">
									<c:choose>
									<c:when test="${billDetails.catId==5}">
									${billDetails.remark} Kg
									<c:set var="spKg" value="${billDetails.remark}"/>
									<% 
									  String spKgStr =(String) pageContext.getAttribute("spKg");
									  float spKgFloat=Float.parseFloat(spKgStr.trim());
                                    %>
                                    	<c:set var="spKgFloat" value="<%=spKgFloat%>" />
                                    	<c:set var="totalSpKgQty" value="${spKgFloat+totalSpKgQty}" />
									</c:when>
									<c:otherwise>
									<fmt:formatNumber
										type="number" maxFractionDigits="2" minFractionDigits="2"
										value="${billDetails.billQty}" />
										<c:set var="totalQty" value="${totalQty+billDetails.billQty}" />
									</c:otherwise>
									</c:choose>
									</td>
									<td align="left"
									style="border-left: 1px solid #313131; padding: 3px 5px; color: #000; font-size: 12px;">${billDetails.itemUom}</td>
							
									
								
										<td align="right"
									style="border-left: 1px solid #313131; padding: 3px 4px; color: #000; font-size: 12px;"><fmt:formatNumber
										type="number" maxFractionDigits="2" minFractionDigits="2"
										value="${billDetails.baseRate}" /></td>
								<td align="right"
									style="border-left: 1px solid #313131; padding: 3px 5px; color: #000; font-size: 12px;"><fmt:formatNumber
										type="number" maxFractionDigits="2" minFractionDigits="2"
										value="${billDetails.discPer}" /></td>		
								<td align="right"
									style="border-left: 1px solid #313131; padding: 3px 4px; color: #000; font-size: 12px;"><fmt:formatNumber
										type="number" maxFractionDigits="2" minFractionDigits="2"
										value="${billDetails.taxableAmt}" /></td>
								<c:set var="totalAmt" value="${totalAmt+billDetails.taxableAmt}" />
							
							  <c:set var="totalDisc" value="${totalDisc+billDetails.discAmt}" /> 
								<td align="right"
									style="border-left: 1px solid #313131; padding: 3px 5px; color: #000; font-size: 12px;"><fmt:formatNumber
										type="number" maxFractionDigits="2" minFractionDigits="2"
										value="${billDetails.cgstRs}" /></td>
								<c:set var="totalCgst" value="${totalCgst+billDetails.cgstRs}" />
								<td align="right"
									style="border-left: 1px solid #313131; padding: 3px 5px; color: #000; font-size: 12px;"><fmt:formatNumber
										type="number" maxFractionDigits="2" minFractionDigits="2"
										value="${billDetails.sgstRs}" /></td>
								<c:set var="totalSgst" value="${totalSgst+billDetails.sgstRs}" />
								
								<c:set var="totalCess" value="${totalCess+billDetails.cessRs}" />
									
								
								<td align="right"
									style="border-left: 1px solid #313131; padding: 3px 5px; color: #000; font-size: 12px;"><fmt:formatNumber
										type="number" maxFractionDigits="2" minFractionDigits="2"
										value="${(billDetails.sgstRs)+(billDetails.cgstRs)+(billDetails.cessRs)+(billDetails.taxableAmt)}" /></td>
											<c:set var="acttotal" value="${acttotal+(billDetails.sgstRs)+(billDetails.cgstRs)+(billDetails.cessRs)+(billDetails.taxableAmt)}" />
							</tr>
						</c:when>
					</c:choose>
				</c:forEach>
			</c:forEach>
			<tr>
				<td align="left"
					style="border-top: 1px solid #313131; border-left: 1px solid #313131; border-bottom: 1px solid #313131; padding: 4px; color: #000; font-size: 0px;">-</td>
				<td align="left"
					style="border-top: 1px solid #313131; border-left: 1px solid #313131; border-bottom: 1px solid #313131; padding: 4px; color: #000; font-size: 12px;"><b>Total <!-- MOH --></b></td>
				<td align="center"
					style="border-top: 1px solid #313131; border-left: 1px solid #313131; border-bottom: 1px solid #313131; padding: 4px; color: #000; font-size: 12px;">SP <b>${totalSpKgQty} Kg</b></td>
				<td align="right"
					style="border-top: 1px solid #313131; border-left: 1px solid #313131; border-bottom: 1px solid #313131; padding: 4px; color: #000; font-size: 12px;"><b><fmt:formatNumber
							type="number" maxFractionDigits="2" minFractionDigits="2"
							value="${totalQty}" /></b></td>
				<td align="center"
					style="border-top: 1px solid #313131; border-left: 1px solid #313131; border-bottom: 1px solid #313131; padding: 4px; color: #000; font-size: 0px;">-</td>
				<td align="center"
					style="border-top: 1px solid #313131; border-left: 1px solid #313131; border-bottom: 1px solid #313131; padding: 4px; color: #000; font-size: 0px;">-</td>
				<td align="center"
					style="border-top: 1px solid #313131; border-left: 1px solid #313131; border-bottom: 1px solid #313131; padding: 4px; color: #000; font-size: 0px;">-</td>
				<td align="right"
					style="border-top: 1px solid #313131; border-left: 1px solid #313131; border-bottom: 1px solid #313131; padding: 4px; color: #000; font-size: 12px;"><b><fmt:formatNumber
							type="number" maxFractionDigits="2" minFractionDigits="2"
							value="${totalAmt}" /></b></td>
			

<td align="right"
					style="border-top: 1px solid #313131; border-left: 1px solid #313131; border-bottom: 1px solid #313131; padding: 4px; color: #000; font-size: 12px;"><b><fmt:formatNumber
							type="number" maxFractionDigits="2" minFractionDigits="2"
							value="${totalCgst}" /></b></td>				 
				
				<td align="right"
					style="border-top: 1px solid #313131; border-left: 1px solid #313131; border-bottom: 1px solid #313131; padding: 4px; color: #000; font-size: 12px;"><b><fmt:formatNumber
							type="number" maxFractionDigits="2" minFractionDigits="2"
							value="${totalSgst}" /></b></td>
							
					<td align="right"
					style="border-top: 1px solid #313131; border-left: 1px solid #313131; border-bottom: 1px solid #313131; padding: 4px; color: #000; font-size: 12px;"><b><fmt:formatNumber
							type="number" maxFractionDigits="2" minFractionDigits="2"
							value="${acttotal}" /></b></td>			
			</tr>
			<tr>
			
   <fmt:formatNumber type="number"
							minFractionDigits="0" 	  groupingUsed = "false" maxFractionDigits="0" value="${totalAmt+totalCgst+totalSgst+totalCess}" var="totAmt"/>
		
				<td align="right"
					style="border-left: 1px solid #313131; border-bottom: 1px solid #313131; padding: 4px; color: #000; font-size: 0px;">-</td>
				<td align="right"
					style="border-left: 1px solid #313131; border-bottom: 1px solid #313131; padding: 4px; color: #000; font-size: 0px;">-</td>
				<td style="border-bottom: 1px solid #313131; font-size: 0px;">-</td>
				<td style="border-bottom: 1px solid #313131; font-size: 0px;">-</td>
				<td style="border-bottom: 1px solid #313131; font-size: 0px;">-</td>
				<td
					style="border-bottom: 1px solid #313131; padding: 4px; color: #000; font-size: 0px;">-</td>
				
				<td
					style="border-bottom: 1px solid #313131; padding: 4px; color: #000; font-size: 0px;">-</td>
				<td style="border-bottom: 1px solid #313131; font-size: 0px;">-</td>
				<td style="border-bottom: 1px solid #313131; font-size: 0px;">-</td>
				
				<td style="border-bottom: 1px solid #313131; font-size: 12px;"><b>&nbsp;Round off:</b></td>
				<td align="right"
					style="border-left: 1px solid #313131; border-bottom: 1px solid #313131; padding: 4px; color: #000; font-size: 12px;"><b>
							<fmt:formatNumber type="number"
							minFractionDigits="2" 	maxFractionDigits="2"   groupingUsed = "false" value="${totAmt-(totalAmt+totalCgst+totalSgst+totalCess)}"/>
				
				</b></td>
			</tr>
			<tr>
				<c:set var="finalAmt" value="${totalAmt+totalCgst+totalSgst+totalCess}"></c:set>
				<%
					double fAmt = 0;// (Double)pageContext.getAttribute("finalAmt");
						fAmt = Math.round(fAmt);
				%>
								<c:set var="finalAmtActual" value="${fAmt}"></c:set>
				
				<td align="right"
					style="border-left: 1px solid #313131; border-bottom: 1px solid #313131; padding: 4px; color: #000; font-size: 0px;">-</td>
				<td align="right"
					style="border-left: 1px solid #313131; border-bottom: 1px solid #313131; padding: 4px; color: #000; font-size: 0px;">-</td>
				<td style="border-bottom: 1px solid #313131; font-size: 0px;">-</td>
				<td style="border-bottom: 1px solid #313131; font-size: 0px;">-</td>
				<td style="border-bottom: 1px solid #313131; font-size: 0px;">-</td>
					<td style="border-bottom: 1px solid #313131; font-size: 0px;">-</td>
				<td
					style="border-bottom: 1px solid #313131; padding: 4px; color: #000; font-size: 0px;">-</td>
				
				<td
					style="border-bottom: 1px solid #313131; padding: 4px; color: #000; font-size: 0px;">-</td>
				<td style="border-bottom: 1px solid #313131; font-size: 0px;">-</td>
				<!-- <td style="border-bottom: 1px solid #313131; font-size: 0px;">-</td><td style="border-bottom: 1px solid #313131; font-size: 0px;">-</td>
				<td style="border-bottom: 1px solid #313131; font-size: 0px;">-</td><td style="border-bottom: 1px solid #313131; font-size: 0px;">-</td>
			 -->
				<td style="border-bottom: 1px solid #313131; font-size: 12px;"><b>&nbsp;Total:</b></td>
				<td align="right"
					style="border-left: 1px solid #313131; border-bottom: 1px solid #313131; padding: 4px; color: #000; font-size: 12px;"><b>
						<fmt:formatNumber type="number" value="${totAmt}" />
				</b></td>
			</tr>
		</table>
   
		<table width="100%" border="0" cellpadding="0" cellspacing="0" 
			style="border-right: 1px solid #313131; border-top: 1px solid #313131">
			<tr>
			<td align="center" width="9%" colspan="1"
					style="border-left: 1px solid #313131; padding: 2px; color: #000; font-size: 10px; text-align: center;">HSNCD</td>
				<td align="center" width="9%" colspan="1"
					style="border-left: 1px solid #313131; padding: 2px; color: #000; font-size: 10px; text-align: center;">Bill Qty</td>
			
				<td align="center" width="9%" colspan="1"
					style="border-left: 1px solid #313131; padding: 2px; color: #000; font-size: 10px; text-align: center;">Tax(%)</td>
				<td align="center" width="9%" colspan="1"
					style="border-left: 1px solid #313131; padding: 2px; color: #000; font-size: 10px; text-align: center;">Taxable
					Amount</td>

				<td align="center" width="9%" colspan="1"
					style="border-left: 1px solid #313131; padding: 2px; color: #000; font-size: 10px; text-align: center;">CGST
					Amount</td>
				<td align="center" width="9%" colspan="1"
					style="border-left: 1px solid #313131; padding: 2px; color: #000; font-size: 10px; text-align: center;">SGST
					Amount</td>
				<td align="center" width="9%" colspan="1"
					style="border-left: 1px solid #313131; padding: 2px; color: #000; font-size: 10px; text-align: center;">Total
					Tax</td>
				<td align="center" width="9%" colspan="1"
					style="border-left: 1px solid #313131; padding: 2px; color: #000; font-size: 10px; text-align: center;">Total
					Amount</td>

			</tr>
			<c:forEach items="${slabwiseBillList}" var="slabwiseBills"
				varStatus="count">

				<c:choose>
					<c:when test="${slabwiseBills.billNo==frDetails.billNo}">
<c:set value="0" var="billQty_sum" ></c:set>
<c:set value="0" var="taxableAmt_sum" ></c:set>
<c:set value="0" var="cgstAmt_sum" ></c:set>
<c:set value="0" var="sgstAmt_sum" ></c:set>
<c:set value="0" var="totalTax_sum" ></c:set>
<c:set value="0" var="grandTotal_sum" ></c:set>

						<c:forEach items="${slabwiseBills.slabwiseBill}"
							var="slabwiseBill" varStatus="count">
							<tr>
								<td align="right" width="9%" colspan="1"
									style="border-top: 1px solid #313131; border-left: 1px solid #313131; padding: 1px 5px; color: #000; font-size: 10px; text-align: right">${slabwiseBill.itemHsncd}</td>
								<td align="right" width="9%" colspan="1"
									style="border-top: 1px solid #313131; border-left: 1px solid #313131; padding: 1px 5px; color: #000; font-size: 10px; text-align: right">${slabwiseBill.billQty}</td>
								<c:set value="${slabwiseBill.billQty+billQty_sum}" var="billQty_sum" ></c:set>
								<td align="right" width="9%" colspan="1"
									style="border-top: 1px solid #313131; border-left: 1px solid #313131; padding: 1px 5px; color: #000; font-size: 10px; text-align: right">${slabwiseBill.taxPer}</td>
								<td align="right" width="9%" colspan="1"
									style="border-top: 1px solid #313131; border-left: 1px solid #313131; padding: 1px 5px; color: #000; font-size: 10px; text-align: right"><fmt:formatNumber
										type="number" maxFractionDigits="2" minFractionDigits="2"
										value="${slabwiseBill.taxableAmt}" /></td>
	<c:set value="${slabwiseBill.taxableAmt+taxableAmt_sum}" var="taxableAmt_sum" ></c:set>
								<td align="right" width="9%" colspan="1"
									style="border-top: 1px solid #313131; border-left: 1px solid #313131; padding: 1px 5px; color: #000; font-size: 10px; text-align: right"><fmt:formatNumber
										type="number" maxFractionDigits="2" minFractionDigits="2"
										value="${slabwiseBill.cgstAmt}" /></td>
											<c:set value="${slabwiseBill.cgstAmt+cgstAmt_sum}" var="cgstAmt_sum" ></c:set>
										
								<td align="right" width="9%" colspan="1"
									style="border-top: 1px solid #313131; border-left: 1px solid #313131; padding: 1px 5px; color: #000; font-size: 10px; text-align: right"><fmt:formatNumber
										type="number" maxFractionDigits="2" minFractionDigits="2"
										value="${slabwiseBill.sgstAmt}" /></td>
										<c:set value="${slabwiseBill.sgstAmt+sgstAmt_sum}" var="sgstAmt_sum" ></c:set>
								<td align="right" width="9%" colspan="1"
									style="border-top: 1px solid #313131; border-left: 1px solid #313131; padding: 1px 5px; color: #000; font-size: 10px; text-align: right"><fmt:formatNumber
										type="number" maxFractionDigits="2" minFractionDigits="2"
										value="${slabwiseBill.totalTax}" /></td>
											<c:set value="${slabwiseBill.totalTax+totalTax_sum}" var="totalTax_sum" ></c:set>
								<td align="right" width="9%" colspan="1"
									style="border-top: 1px solid #313131; border-left: 1px solid #313131; padding: 1px 5px; color: #000; font-size: 10px; text-align: right"><fmt:formatNumber
										type="number" maxFractionDigits="2" minFractionDigits="2"
										value="${slabwiseBill.grandTotal}" /></td>
										<c:set value="${slabwiseBill.grandTotal+grandTotal_sum}" var="grandTotal_sum" ></c:set>
							</tr>
						</c:forEach>
					</c:when>
				</c:choose>
			</c:forEach>
			
			<tr>
								<td align="right" width="9%" colspan="1"
									style="border-top: 1px solid #313131; border-left: 1px solid #313131; padding: 1px 5px; color: #000; font-size: 10px; text-align: right">Total</td>
								<td align="right" width="9%" colspan="1"
									style="border-top: 1px solid #313131; border-left: 1px solid #313131; padding:1px 5px; color: #000; font-size: 10px; text-align: right">${billQty_sum}</td>
								
								<td align="right" width="9%" colspan="1"
									style="border-top: 1px solid #313131; border-left: 1px solid #313131; padding: 1px 5px; color: #000; font-size: 10px; text-align: right">-</td>
								<td align="right" width="9%" colspan="1"
									style="border-top: 1px solid #313131; border-left: 1px solid #313131; padding: 1px 5px; color: #000; font-size: 10px; text-align: right"><fmt:formatNumber
										type="number" maxFractionDigits="2" minFractionDigits="2"
										value="${taxableAmt_sum}" /></td>

								<td align="right" width="9%" colspan="1"
									style="border-top: 1px solid #313131; border-left: 1px solid #313131; padding: 1px 5px; color: #000; font-size: 10px; text-align: right"><fmt:formatNumber
										type="number" maxFractionDigits="2" minFractionDigits="2"
										value="${cgstAmt_sum}" /></td>
								<td align="right" width="9%" colspan="1"
									style="border-top: 1px solid #313131; border-left: 1px solid #313131; padding: 1px 5px; color: #000; font-size: 10px; text-align: right"><fmt:formatNumber
										type="number" maxFractionDigits="2" minFractionDigits="2"
										value="${sgstAmt_sum}" /></td>
								<td align="right" width="9%" colspan="1"
									style="border-top: 1px solid #313131; border-left: 1px solid #313131; padding: 1px 5px; color: #000; font-size: 10px; text-align: right"><fmt:formatNumber
										type="number" maxFractionDigits="2" minFractionDigits="2"
										value="${totalTax_sum}" /></td>
								<td align="right" width="9%" colspan="1"
									style="border-top: 1px solid #313131; border-left: 1px solid #313131; padding: 1px 5px; color: #000; font-size: 10px; text-align: right"><fmt:formatNumber
										type="number" maxFractionDigits="2" minFractionDigits="2"
										value="${grandTotal_sum}" /></td>
							</tr>
		</table>

		<table width="100%" border="0" cellpadding="0" cellspacing="0"
			style="border-top: 1px solid #313131; border-right: 1px solid #313131;">
			<tr>
				<td colspan="10" width="100%"
					style="border-left: 1px solid #313131; padding: 4px; color: #000; font-size: 10px;">
					<p
						style="color: #000; font-size: 12px; text-align: left; margin: 0px;">FDA
						Declaration:${frDetails.company.fdaDeclaration} FDA Lic. No: ${frDetails.company.fdaLicenceNo}</p>
				</td>


			 <td colspan="11" width="40%" rowspan="2"
					style="color: #000; font-size: 10px;">

					
				</td> 
			</tr>
			<tr>
				<td colspan="8" width="60%"
					style="border-top: 1px solid #313131; border-left: 1px solid #313131; padding: 5px; color: #000; font-size: 12px;"><p>
						<b>Invoice Value in Rs.</b>  ${frDetails.amtInWords}
					</p>
					</br>
					<%-- <p>
						<b>User Id : </b>${user}
					</p> --%>
					</td>
				<td colspan="5" width="40%"
					style="border-top: 1px solid #313131; border-left: 1px solid #313131; padding: 8px; color: #000; font-size: 15px;">

					<table width="100%" border="0" align="left" cellpadding="0"
						cellspacing="0" style="border-right: 0px solid #313131">
						<tr>
							<td align="center" width="9%" colspan="2"
								style="border-top: 0px solid #313131; padding: 2px; color: #000; font-size: 13px; text-align: center;"><b><%-- Grand
									Total: Rs. </b>&nbsp;&nbsp;<b><fmt:formatNumber type="number"
										value="${totAmt}" /> --%></b><p style="font-size: 9px;">Amount of tax subject to reverse charge</p><p style="font-size: 9px;">Certify that the particulars given above are true and correct.</p></td>
						</tr>

					</table>

				</td>
			</tr>
			<tr>
				<td colspan="8" width="50%"
					style="border-bottom: 1px solid #313131; border-top: 1px solid #313131; border-left: 1px solid #313131; padding-top: 4px; color: #000; font-size: 8px;">
					<p>&nbsp;&nbsp;TERMS & CONDITION:</p>
					<p>&nbsp;&nbsp;(1) Overdue interest will be charged @ 18% PA.</p>
					<p
						style="color: #000; font-size: 9px; text-align: left; margin: 0px;">&nbsp;&nbsp; Subject
						to ${Constabst.CITY} Jurisdiction E & OE.
						<!-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Receiver's
						Signature</p> -->
				</td>

				<td align="center" colspan="5" width="38%"
					style="border-bottom: 1px solid #313131; border-top: 1px solid #313131; border-left: 1px solid #313131; padding-top: 4px; color: #000; font-size: 9px;"><p>
						<b>For ${frDetails.company.compName}<br></br> <br></br> <br></br>
							Authorised Signatory
						</b>
					</p></td>
			</tr>
		</table>
		<div style="page-break-after: always;"></div>
	</c:forEach>
</body>
</html>




<%-- <%@page
contentType="text/html; charset=ISO8859_1"%>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
  
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>FR Bill PDF</title>

</head>
<body>
  	<c:forEach items="${billDetails}" var="frDetails" varStatus="count">
						<h6 align="center">TAX INVOICE</h6>
<table width="100%" border="0"  cellpadding="0" cellspacing="0" style="border-left:1px solid #313131;border-right:1px solid #313131;border-top:1px solid #313131;">
  <tr>
    <td colspan="2" width="20%" style=" padding:10px;color:#FFF; font-size:15px;">&nbsp;</td>
    <td width="60%" colspan="6" style="border-left:1px solid #313131; padding:5px;color:#000; font-size:15px; text-align:center">
    <h4 style="color:#000; font-size:16px; text-align:center; margin:0px;">Galdhar Foods Pvt.Ltd</h4>
   <p style="color:#000; font-size:10px; text-align:center;margin:0px;">Factory Add: A-32 Shendra, MIDC, Auraangabad-4331667 <br />
Phone:0240-2466217, Email: aurangabad@monginis.net</p>
 </td>
    <td colspan="3" width="20%" style="border-left:1px solid #313131; padding:10px;color:#FFF; font-size:15px;">
   	<p style="color:#000; font-size:11px; text-align:center;margin:0px;"> Original for buyer <br />
duplicate for tranpoter</p> 
    </td>
    
  </tr>

 
  <tr>
    <td width="50%" colspan="6" style="border-top:1px solid #313131;padding:8px;color:#FFF; font-size:14px;">
        <p style="color:#000; font-size:13px; text-align:;left;margin:0px;">GSTIIN: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>27AHIPJ7279D1Z3</b>&nbsp;&nbsp;&nbsp;&nbsp;<span> State:&nbsp;27 ${Constants.STATE} </span> </p>
<!--         <p style="color:#000; font-size:13px; text-align:left;margin:0px;"></p>
 -->        <p style="color:#000; font-size:13px; text-align:left;margin:0px;">Invoice No: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>${frDetails.invoiceNo}</b></p>
        <p style="color:#000; font-size:13px; text-align:left;margin:0px;">Invoice Date: &nbsp;&nbsp;&nbsp;<b>${frDetails.billDate}</b></p>
        <p style="color:#000; font-size:13px; text-alignSELECT t_bill_detail.* , \n" + 
			"			    CASE  \n" + 
			"			 WHEN t_bill_detail.cat_id=5 THEN (SELECT CONCAT(m_sp_cake.sp_name, '-' ,m_sp_cake.sp_code)  FROM  m_sp_cake\n" + 
			"			WHERE m_sp_cake.sp_id= t_bill_detail.item_id) \n" + 
			"			            ELSE (SELECT  m_item.item_name FROM m_item WHERE t_bill_detail.item_id=m_item.id)\n" + 
			"			      END AS item_name,\n" + 
			"			       m_category.cat_name,\n" + 
			"			        t_bill_header.bill_date,\n" + 
			"			CASE \n" + 
			"			            WHEN t_bill_detail.cat_id=5 THEN (SELECT m_spcake_sup.sp_hsncd   \n" + 
			"			           FROM m_spcake_sup WHERE  m_spcake_sup.sp_id=t_bill_detail.item_id) ELSE (SELECT m_item_sup.item_hsncd  \n" + 
			"			FROM m_item_sup WHERE  m_item_sup.item_id=t_bill_detail.item_id) \n" + 
			"			        END AS item_hsncd,\n" + 
			"			 \n" + 
			"			CASE \n" + 
			"			            WHEN t_bill_detail.cat_id=5 THEN (SELECT m_spcake_sup.sp_uom  FROM m_spcake_sup \n" + 
			"			WHERE  m_spcake_sup.sp_id=t_bill_detail.item_id)\n" + 
			"			            ELSE (SELECT m_item_sup.item_uom FROM m_item_sup \n" + 
			"			 WHERE  m_item_sup.item_id=t_bill_detail.item_id) \n" + 
			"			        END AS item_uom,\n" + 
			"\n" + 
			"CASE  WHEN t_bill_detail.cat_id=5 THEN (0)\n" + 
			"			            ELSE (SELECT m_item.item_grp2 FROM m_item\n" + 
			"			 WHERE  m_item.id=t_bill_detail.item_id) \n" + 
			"			        END AS sub_cat_id\n" + 
			"			 \n" + 
			"			 FROM\n" + 
			"			        t_bill_detail,\n" + 
			"			        m_category,\n" + 
			"			        t_bill_header\n" + 
			"			 \n" + 
			"			    WHERE\n" + 
			"			        t_bill_detail.bill_no IN (:billNoList)  \n" + 
			"			 \n" + 
			"			        AND m_category.cat_id=t_bill_detail.cat_id \n" + 
			"			        AND t_bill_detail.bill_no=t_bill_header.bill_no:left;margin:0px;">Tax is payble on reverse charges(Yes/no):No</p>
    </td>

    <td width="50%" colspan="5" style="border-top:1px solid #313131;border-left:1px solid #313131; padding:8px;color:#FFF; font-size:15px;">
        <p style="color:#000; font-size:13px; text-align:;left;margin:0px;"> Mode of Transport &nbsp;&nbsp;&nbsp;&nbsp;<b>${transportMode}</b></p>
        <p style="color:#000; font-size:13px; text-align:left;margin:0px;">Vehicle no  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>${vehicleNo}</b></p>
        <p style="color:#000; font-size:13px; text-align:left;margin:0px;">Supply Dt & Time&nbsp;&nbsp;&nbsp; &nbsp;<b>${dateTime}</b></p>
        <p style="color:#000; font-size:13px; text-align:left;margin:0px;">Place of supply &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Maharashtra</p>
    </td>
  </tr>
  <tr>
    <td width="50%" colspan="6" style="border-top:1px solid #313131;padding:7px;color:#FFF; font-size:15px;">
        <p style="color:#000; font-size:13px; text-align:;left;margin:0px;"><b> Billed To:&nbsp; &nbsp; ${frDetails.frName}</b></p>
        <p style="color:#000; font-size:11px; text-align:;left;margin:0px;">${frDetails.frAddress}</p>
        
    </td>
    <td width="50%" colspan="5" style="border-top:1px solid #313131;border-left:1px solid #313131; padding:7px;color:#FFF; font-size:15px;">
        <p style="color:#000; font-size:13px; text-align:;left;margin:0px;"> <b> Ship to:&nbsp; &nbsp; ${frDetails.frName}</b></p>
        <p style="color:#000; font-size:11px; text-align:;left;margin:0px;">${frDetails.frAddress}</p>
        
    </td>
      </tr>
      </table>
      
      <table width="100%" border="0"  cellpadding="0" cellspacing="0" style="border-top:1px solid #313131;border-right:1px solid #313131">
  <tr>
    <td rowspan="2"  width="2%"  style="border-bottom:1px solid #313131; border-bottom:1px solid #313131;border-left:1px solid #313131; padding:5px;color:#000; font-size:10px;">No.</td>
    <td align="left" width="36%" rowspan="2" style="border-bottom:1px solid #313131; border-left:1px solid #313131; padding:15px;color:#000; font-size:10px;text-align: left">Item Decription</td>
   <td align="center" width="5%" rowspan="2" style="border-bottom:1px solid #313131; border-left:1px solid #313131; padding:0.2px;color:#000; font-size:10px;">HSN Code</td>
 
     
 <td align="center" width="5%" rowspan="2" style=" border-bottom:1px solid #313131; border-left:1px solid #313131; padding:10px;color:#000; font-size:10px;">Qty</td>
    <td align="center" width="5%" rowspan="2" style="border-bottom:1px solid #313131; border-left:1px solid #313131; padding:10px;color:#000; font-size:10px;">UOM </td>
    <td align="center" width="5%" rowspan="2" style="border-bottom:1px solid #313131; border-left:1px solid #313131; padding:10px;color:#000; font-size:10px;">Rate</td>
    <td align="center" width="10%" rowspan="2" style="border-bottom:1px solid #313131; border-left:1px solid #313131; padding:10px;color:#000; font-size:10px;">Amount</td>
    <td align="center" width="10%" colspan="2" style="border-left:1px solid #313131; padding:10px;color:#000; font-size:10px; text-align:center;"> CGST</td>
    <td align="center" width="10%" colspan="2" style="border-left:1px solid #313131; padding:10px;color:#000; font-size:10px;text-align:center;">SGST</td>
  </tr>
  <tr>
    <td align="center" style="border-top:1px solid #313131;border-left:1px solid #313131;border-bottom:1px solid #313131; padding:4px;color:#000; font-size:10px;">Rate% </td>
    <td align="center" style="border-top:1px solid #313131;border-left:1px solid #313131;border-bottom:1px solid #313131;  padding:4px;color:#000; font-size:10px;">Amount</td>
    <td align="center" style="border-top:1px solid #313131;border-left:1px solid #313131;border-bottom:1px solid #313131; padding:4px;color:#000; font-size:10px;">Rate%</td>
    <td align="center" style="border-top:1px solid #313131;border-left:1px solid #313131;border-bottom:1px solid #313131; padding:4px;color:#000; font-size:10px;">Amount</td>
  </tr>
 
  <c:set var = "totalQty" value = "0"/>
   <c:set var = "totalAmt" value = "0"/>
    <c:set var = "totalCgst" value = "0"/>
      <c:set var = "totalSgst" value = "0"/>
        <c:forEach items="${frDetails.billDetailsList}" var="billDetails" varStatus="count">
  
  <tr>
    <td  style="border-left:1px solid #313131; padding:3px 5px;color:#000; font-size:10px;">${count.index+1}</td>
    <td style="border-left:1px solid #313131;  padding:3px 5px;color:#000; font-size:10px;">${billDetails.itemName}</td>
    <td align="left" style="border-left:1px solid #313131;  padding:3px 5px;color:#000; font-size:10px;">${billDetails.itemHsncd}</td>
    <td align="right" style="border-left:1px solid #313131; padding:3px 5px;color:#000;font-size:10px;"><fmt:formatNumber type="number"
								maxFractionDigits="2" minFractionDigits="2" value="${billDetails.billQty}"/></td>
			  <c:set var = "totalQty" value = "${totalQty+billDetails.billQty}"/>					
    <td align="center" style="border-left:1px solid #313131; padding:3px 5px;color:#000; font-size:10px;">${billDetails.itemUom}</td>
    <td align="right" style="border-left:1px solid #313131; padding:3px 4px;color:#000; font-size:10px;"><fmt:formatNumber type="number"
								maxFractionDigits="2" minFractionDigits="2" value="${billDetails.baseRate}"/></td>
    <td align="right" style="border-left:1px solid #313131; padding:3px 4px;color:#000;font-size:10px;"><fmt:formatNumber type="number"
								maxFractionDigits="2" minFractionDigits="2" value="${billDetails.taxableAmt}"/></td>
								   <c:set var = "totalAmt" value = "${totalAmt+billDetails.taxableAmt}"/>
    <td align="right" style="border-left:1px solid #313131; padding:3px 5px;color:#000; font-size:10px;"><fmt:formatNumber type="number"
								maxFractionDigits="2" minFractionDigits="2" value="${billDetails.cgstPer}"/></td>
    <td align="right" style="border-left:1px solid #313131; padding:3px 5px;color:#000; font-size:10px;"><fmt:formatNumber type="number"
								maxFractionDigits="2" minFractionDigits="2" value="${billDetails.cgstRs}"/></td>
								  <c:set var = "totalCgst" value = "${totalCgst+billDetails.cgstRs}"/>
    <td align="right" style="border-left:1px solid #313131; padding:3px 5px;color:#000;font-size:10px;"><fmt:formatNumber type="number"
								maxFractionDigits="2" minFractionDigits="2" value="${billDetails.sgstPer}"/></td>
    <td align="right" style="border-left:1px solid #313131; padding:3px 5px;color:#000;font-size:10px;"><fmt:formatNumber type="number"
								maxFractionDigits="2" minFractionDigits="2" value="${billDetails.sgstRs}"/></td>
								  <c:set var = "totalSgst" value = "${totalSgst+billDetails.sgstRs}"/>
  </tr>
  </c:forEach>
   <tr>
    <td  align="left" style="border-top:1px solid #313131;border-left:1px solid #313131;border-bottom:1px solid #313131; padding:4px;color:#000; font-size:0px;">-</td>
    <td align="left" style="border-top:1px solid #313131;border-left:1px solid #313131;border-bottom:1px solid #313131; padding:4px;color:#000; font-size:12px;"><b>Total</b></td>
    <td align="center" style="border-top:1px solid #313131;border-left:1px solid #313131;border-bottom:1px solid #313131; padding:4px;color:#000; font-size:0px;">-</td>
    <td align="right" style="border-top:1px solid #313131;border-left:1px solid #313131;border-bottom:1px solid #313131; padding:4px;color:#000; font-size:12px;"><b><fmt:formatNumber type="number"
								maxFractionDigits="2" minFractionDigits="2" value="${totalQty}"/></b></td>
    <td align="center" style="border-top:1px solid #313131;border-left:1px solid #313131;border-bottom:1px solid #313131; padding:4px;color:#000; font-size:0px;">-</td>
    <td align="center" style="border-top:1px solid #313131;border-left:1px solid #313131;border-bottom:1px solid #313131; padding:4px;color:#000; font-size:0px;">-</td>
    <td align="right" style="border-top:1px solid #313131;border-left:1px solid #313131;border-bottom:1px solid #313131; padding:4px;color:#000; font-size:12px;"><b><fmt:formatNumber type="number"
								maxFractionDigits="2" minFractionDigits="2" value="${totalAmt}"/></b></td>
    <td align="center" style="border-top:1px solid #313131;border-left:1px solid #313131;border-bottom:1px solid #313131; padding:4px;color:#000; font-size:0px;">-</td>
    <td align="right" style="border-top:1px solid #313131;border-left:1px solid #313131;border-bottom:1px solid #313131; padding:4px;color:#000; font-size:12px;"><b><fmt:formatNumber type="number"
								maxFractionDigits="2" minFractionDigits="2" value="${totalCgst}"/></b></td>
    <td align="center" style="border-top:1px solid #313131;border-left:1px solid #313131;border-bottom:1px solid #313131; padding:4px;color:#000; font-size:0px;">-</td>
    <td align="right" style="border-top:1px solid #313131;border-left:1px solid #313131;border-bottom:1px solid #313131; padding:4px;color:#000; font-size:12px;"><b><fmt:formatNumber type="number"
								maxFractionDigits="2" minFractionDigits="2" value="${totalSgst}"/></b></td>
  </tr>
   <tr>
   
    <td align="right" style="border-left:1px solid #313131;border-bottom:1px solid #313131; padding:4px;color:#000; font-size:0px;">-</td>
        <td align="right" style="border-left:1px solid #313131;border-bottom:1px solid #313131; padding:4px;color:#000; font-size:0px;">-</td>
    <td style="border-bottom:1px solid #313131; font-size:0px;">-</td><td style="border-bottom:1px solid #313131; font-size:0px;">-</td><td style="border-bottom:1px solid #313131;font-size:0px;">-</td><td style="border-bottom:1px solid #313131;padding:4px;color:#000; font-size:0px;">-</td><td style="border-bottom:1px solid #313131;font-size:0px;">-</td><td style="border-bottom:1px solid #313131;padding:4px;color:#000; font-size:0px;">-</td><td style="border-bottom:1px solid #313131;font-size:0px;">-</td><td style="border-bottom:1px solid #313131;font-size:12px;"><b>Total:</b></td>
    <td align="right" style="border-left:1px solid #313131;border-bottom:1px solid #313131; padding:4px;color:#000; font-size:12px;"><b><fmt:formatNumber type="number"
								maxFractionDigits="2" minFractionDigits="2" value="${totalAmt+totalCgst+totalSgst}"/></b></td>
  </tr>
</table>

      <table width="56%" border="0"  cellpadding="0" cellspacing="0" style="border-right:1px solid #313131">
  <tr>
    <td align="center" width="9%" colspan="2" style="border-left:1px solid #313131; padding:2px;color:#000; font-size:10px;text-align:center;">Tax(%)</td>
   <td align="center" width="9%" colspan="2" style="border-left:1px solid #313131; padding:2px;color:#000; font-size:10px;text-align:center;">Taxable Amount</td>
 
    <td align="center" width="9%" colspan="2" style="border-left:1px solid #313131; padding:2px;color:#000; font-size:10px;text-align:center;">CGST Amount</td>
    <td align="center" width="9%" colspan="2" style="border-left:1px solid #313131; padding:2px;color:#000; font-size:10px;text-align:center;">SGST Amount</td>
    <td align="center" width="9%" colspan="2" style="border-left:1px solid #313131; padding:2px;color:#000; font-size:10px;text-align:center;">Total Tax</td>
    <td align="center" width="9%" colspan="2" style="border-left:1px solid #313131; padding:2px;color:#000; font-size:10px;text-align:center;">Total Amount</td>

  </tr>
<c:forEach items="${slabwiseBillList}" var="slabwiseBills" varStatus="count">

  <c:choose>
<c:when test="${slabwiseBills.billNo==frDetails.billNo}">
  
  <c:forEach items="${slabwiseBills.slabwiseBill}" var="slabwiseBill" varStatus="count">
   <tr>
     <td align="right" width="9%" colspan="2" style="border-top:1px solid #313131;border-left:1px solid #313131; padding:5px;color:#000; font-size:10px;text-align: right">${slabwiseBill.taxPer}</td>
   <td align="right" width="9%" colspan="2" style="border-top:1px solid #313131;  border-left:1px solid #313131; padding:5px;color:#000; font-size:10px;text-align: right"><fmt:formatNumber type="number"
								maxFractionDigits="2" minFractionDigits="2" value="${slabwiseBill.taxableAmt}"/></td>
 
    <td align="right" width="9%" colspan="2" style=" border-top:1px solid #313131; border-left:1px solid #313131; padding:5px;color:#000; font-size:10px;text-align: right"><fmt:formatNumber type="number"
								maxFractionDigits="2" minFractionDigits="2" value="${slabwiseBill.cgstAmt}"/></td>
    <td align="right" width="9%" colspan="2" style="border-top:1px solid #313131;  border-left:1px solid #313131; padding:5px;color:#000; font-size:10px;text-align: right"><fmt:formatNumber type="number"
								maxFractionDigits="2" minFractionDigits="2" value="${slabwiseBill.sgstAmt}"/></td>
    <td align="right" width="9%" colspan="2" style="border-top:1px solid #313131; border-left:1px solid #313131; padding:5px;color:#000; font-size:10px;text-align: right"><fmt:formatNumber type="number"
								maxFractionDigits="2" minFractionDigits="2" value="${slabwiseBill.totalTax}"/></td>
    <td align="right" width="9%" colspan="2" style="border-top:1px solid #313131;  border-left:1px solid #313131; padding:5px;color:#000; font-size:10px;text-align: right"><fmt:formatNumber type="number"
								maxFractionDigits="2" minFractionDigits="2" value="${slabwiseBill.grandTotal}"/></td>

 </tr> 
  
  </c:forEach>

  </c:when>

</c:choose>
</c:forEach>
  </table>




  <table width="100%" border="0"  cellpadding="0" cellspacing="0" style="border-top:1px solid #313131;border-right:1px solid #313131;">
  
 
    
  <tr>
    <td colspan="6" width="50%" style="border-left:1px solid #313131; padding:8px;color:#000; font-size:12px;">
     <p style="color:#000; font-size:12px; text-align:left;margin:0px;">FDA Declaration: We hereby vertify  food mentionerl in the tax invoice is wa.</p>
</td>
    <td colspan="5" width="38%" rowspan="2" style="border-left:1px solid #313131; padding:8px;color:#000;font-size:15px;">&nbsp;</td>
  </tr>
  
    <tr>
    <td colspan="6" width="50%"  style="border-top:1px solid #313131;border-left:1px solid #313131; padding:8px;color:#000; font-size:15px;">&nbsp;</td>
  </tr>
  
    
  <tr>
    <td colspan="6" width="50%"  style="border-top:1px solid #313131;border-left:1px solid #313131; padding:8px;color:#000; font-size:15px;">&nbsp;

</td>
    <td colspan="5" width="38%" style="border-top:1px solid #313131;border-left:1px solid #313131; padding:8px;color:#000;font-size:15px;">     
    <p style="color:#000; font-size:11px; text-align:left;margin:0px;">Continue...</p></td>
  </tr>
  
  <tr>
    <td colspan="6"  width="50%" style="border-bottom:1px solid #313131;border-top:1px solid #313131;border-left:1px solid #313131; padding:10px;color:#000; font-size:11px;">
     <p style="color:#000; font-size:11px; text-align:left;margin:0px;">Subject to Aurangabad Jurisdiction &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Receiver's Signature</p>
</td>
    <td  align="center" colspan="5" width="38%" style="border-bottom:1px solid #313131;border-top:1px solid #313131;border-left:1px solid #313131; padding:10px;color:#000;font-size:11px;">Authorised Signature</td>
  </tr>
  
</table>

<div style="page-break-after: always;"></div>
  </c:forEach>

</body>
</html> --%>