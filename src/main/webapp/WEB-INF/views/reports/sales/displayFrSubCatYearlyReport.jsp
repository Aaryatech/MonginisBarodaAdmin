<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<body>

	<jsp:include page="/WEB-INF/views/include/logout.jsp"></jsp:include>

	<c:url var="getBillList" value="/getYearlyFrSubCatSaleReport"></c:url>


	<!-- BEGIN Sidebar -->
	<div id="sidebar" class="navbar-collapse collapse">

		<jsp:include page="/WEB-INF/views/include/navigation.jsp"></jsp:include>

		<div id="sidebar-collapse" class="visible-lg">
			<i class="fa fa-angle-double-left"></i>
		</div>
		<!-- END Sidebar Collapse Button -->
	</div>
	<!-- END Sidebar -->



	<!-- BEGIN Content -->
	<div id="main-content">
		<!-- BEGIN Page Title -->
		<div class="page-title">
			<div>
				<!-- <h1>
					<i class="fa fa-bars"></i> Yearly Franchisee wise Category wise Report
				</h1>
				<h4></h4> -->
			</div>
		</div>
		<!-- END Page Title -->

		<!-- BEGIN Breadcrumb -->
		<%-- <div id="breadcrumbs">
			<ul class="breadcrumb">
				<li><i class="fa fa-home"></i> <a
					href="${pageContext.request.contextPath}/home">Home</a> <span
					class="divider"><i class="fa fa-angle-right"></i></span></li>
				<li class="active">Bill Report</li>
			</ul>
		</div> --%>
		<!-- END Breadcrumb -->
		
		<div class="box">
			<div class="box-title">
				<h3>
					<i class="fa fa-bars"></i> Yearly Franchisee wise Category wise Report
				</h3>

			</div>


		<div ><!-- class="box-content" -->
		
			<div class="frm_Sec_one single">
				<div class="row">
					<div class="col-md-3 box_marg">
						<label class="control-label left">From Date</label>
						<div class="controls icon_add date_select">
						<i class="fa fa-calendar frm_icon" aria-hidden="true"></i>
						<input class="form-control padd_left" id="fromDate" name="fromDate"
							size="30" type="text" value="${fromDate}" readonly="readonly" />
						</div>
			   		</div>
			   		
			   		<div class="col-md-3 box_marg">
						<label class="control-label left">To Date</label>
						<div class="controls icon_add date_select">
						<i class="fa fa-calendar frm_icon" aria-hidden="true"></i>
						<input class="form-control padd_left" id="toDate" name="toDate" size="30"
							type="text" value="${toDate}" readonly="readonly" />
						</div>
			   		</div>
			   		
			   		<div class="col-md-6 box_marg">
						<label class="control-label left">Sub Category</label>
						<div class="controls icon_add">
						<i class="fa fa-list-ul frm_icon" aria-hidden="true"></i>
						<select data-placeholder="Select Sub Category" multiple="multiple"
						class="form-control padd_left chosen " name="item_grp2" id="item_grp2"
						tabindex="-1" data-rule-required="true" disabled="disabled">
						<c:forEach items="${subCategoryList}" var="subCat">
							<c:forEach items="${selectedSubCat}" var="selSubCat">
								<c:if test="${subCat.subCatId==selSubCat}">
									<option value="${subCat.subCatId}" selected><c:out
											value="${subCat.subCatName}"></c:out></option>
								</c:if>

							</c:forEach>
						</c:forEach>
					</select>
						
						</div>
			   		</div>
			   		
			   		<div class="col-md-9 box_marg">
						<label class="control-label left">Franchisee</label>
						<div class="controls icon_add date_select">
						<i class="fa fa-user frm_icon" aria-hidden="true"></i>
						<select data-placeholder="Choose Franchisee" disabled="disabled"
						class="form-control padd_left chosen" multiple="multiple" tabindex="6"
						id="selectFr" name="selectFr"
						onchange="setAllFrSelected(this.value)">

						<option value="-1"><c:out value="All" /></option>

						<c:forEach items="${unSelectedFrList}" var="fr" varStatus="count">

							<c:forEach items="${selectedFr}" var="selFr">

								<c:if test="${fr.frId==selFr}">
									<option value="${fr.frId}" selected><c:out
											value="${fr.frName}"></c:out></option>
								</c:if>

							</c:forEach>


						</c:forEach>
					</select>
						</div>
			   		</div>
			   		
			   		<div class="col-md-3 box_marg">
			   			<div class="three_buttons" style="padding:26px 0 0 0; text-align: left;">
			   			<input type="button" id="expExcel" name="expExcel" class="btn btn-primary"
			onclick="exportToExcel();" value="Export to Excel">
			   		</div></div>
			   		
				</div>
			</div>
		</div>




		<div align="center" id="loader" style="display: none">

			<span>
				<h4>
					<font color="#343690">Loading</font>
				</h4>
			</span> <span class="l-1"></span> <span class="l-2"></span> <span
				class="l-3"></span> <span class="l-4"></span> <span class="l-5"></span>
			<span class="l-6"></span>
		</div>
		</div>





		


		<div class="box">
			<div class=" box-content">
			
			<div class="tableFixHead">
	<table id="table_grid">         
	<thead style="background-color: #f3b5db;">
		<tr>
			<th></th>
			<c:forEach var="report" items="${reportList}" varStatus="cnt">
				<th colspan="9" style="text-align: center;">${report.dateStr}</th>

			</c:forEach>
		</tr>


		<tr>
			<th></th>
			<c:forEach var="report" items="${reportList}" varStatus="cnt">

				<th style="text-align: right;">Sold Qty</th>
				<th style="text-align: right;">Sold Amt</th>
				<th style="text-align: right;">Var Qty</th>
				<th style="text-align: right;">Var Amt</th>
				<th style="text-align: right;">Ret Qty</th>
				<th style="text-align: right;">Ret Amt</th>
				<th style="text-align: right;">Net Qty</th>
				<th style="text-align: right;">Net Amt</th>
				<th style="text-align: right;">Ret Amt %</th>

			</c:forEach>

		</tr>
	</thead>
	
	<tbody>

								<c:forEach items="${reportList}" var="month" varStatus="count"
									end="0">


									<c:forEach items="${month.dataList}" var="fr" varStatus="count">


										<tr>
											<td>${fr.frName}</td>
										</tr>

										<c:forEach items="${fr.subCatList}" var="sc" varStatus="count">
											<tr>

												<td>${sc.subCatName}</td>



												<c:forEach items="${reportList}" var="month1"
													varStatus="count">

													<c:forEach items="${month1.dataList}" var="fr1"
														varStatus="count">

														<c:if test="${fr1.frId==fr.frId}">

															<c:forEach items="${fr1.subCatList}" var="sc1"
																varStatus="count">

																<c:if test="${sc1.subCatId==sc.subCatId}">


																	<c:if test="${reportType==1}">

																		<td align="right">${sc1.soldQty}</td>
																		<td align="right"><fmt:formatNumber type="number"
																				minFractionDigits="2" maxFractionDigits="2"
																				value="${sc1.soldAmt}" /></td>
																		<td align="right">${sc1.varQty}</td>
																		<td align="right"><fmt:formatNumber type="number"
																				minFractionDigits="2" maxFractionDigits="2"
																				value="${sc1.varAmt}" /></td>
																		<td align="right">${sc1.retQty}</td>
																		<td align="right"><fmt:formatNumber type="number"
																				minFractionDigits="2" maxFractionDigits="2"
																				value="${sc1.retAmt}" /></td>
																		<td align="right">${(sc1.soldQty-(sc1.varQty+sc1.retQty))}</td>
																		<td align="right"><fmt:formatNumber type="number"
																				minFractionDigits="2" maxFractionDigits="2"
																				value="${(sc1.soldAmt-(sc1.varAmt+sc1.retAmt))}" /></td>
																		<%-- <td align="right"><fmt:formatNumber type="number"
																				minFractionDigits="2" maxFractionDigits="2"
																				value="${(((sc1.varAmt+sc1.retAmt)*100)/sc1.soldAmt)}" />%</td> --%>

																		<c:choose>
																			<c:when test="${sc1.soldAmt==0}">
																				<td align="right">0.00%</td>
																			</c:when>
																			<c:otherwise>
																				<td align="right"><fmt:formatNumber
																						type="number" minFractionDigits="2"
																						maxFractionDigits="2"
																						value="${(((sc1.varAmt+sc1.retAmt)*100)/sc1.soldAmt)}" />%</td>

																			</c:otherwise>
																		</c:choose>



																	</c:if>

																	<c:if test="${reportType==2}">

																		<td align="right">${sc1.soldQty}</td>
																		<td align="right"></td>
																		<td align="right">${sc1.varQty}</td>
																		<td align="right"></td>
																		<td align="right">${sc1.retQty}</td>
																		<td align="right"></td>
																		<td align="right">${(sc1.soldQty-(sc1.varQty+sc1.retQty))}</td>
																		<td align="right"></td>
																		<td align="right"></td>

																	</c:if>

																	<c:if test="${reportType==3}">

																		<td align="right"></td>
																		<td align="right"><fmt:formatNumber type="number"
																				minFractionDigits="2" maxFractionDigits="2"
																				value="${sc1.soldAmt}" /></td>
																		<td align="right"></td>
																		<td align="right"><fmt:formatNumber type="number"
																				minFractionDigits="2" maxFractionDigits="2"
																				value="${sc1.varAmt}" /></td>
																		<td align="right"></td>
																		<td align="right"><fmt:formatNumber type="number"
																				minFractionDigits="2" maxFractionDigits="2"
																				value="${sc1.retAmt}" /></td>
																		<td align="right"></td>
																		<td align="right"><fmt:formatNumber type="number"
																				minFractionDigits="2" maxFractionDigits="2"
																				value="${(sc1.soldAmt-(sc1.varAmt+sc1.retAmt))}" /></td>
																		<%-- 																		<td align="right"><fmt:formatNumber type="number"
																				minFractionDigits="2" maxFractionDigits="2"
																				value="${(((sc1.varAmt+sc1.retAmt)*100)/sc1.soldAmt)}" />%</td> --%>

																		<c:choose>
																			<c:when test="${sc1.soldAmt==0}">
																				<td align="right">0.00%</td>
																			</c:when>
																			<c:otherwise>
																				<td align="right"><fmt:formatNumber
																						type="number" minFractionDigits="2"
																						maxFractionDigits="2"
																						value="${(((sc1.varAmt+sc1.retAmt)*100)/sc1.soldAmt)}" />%</td>

																			</c:otherwise>
																		</c:choose>



																	</c:if>

																	<c:if test="${reportType==4}">

																		<td align="right">${sc1.soldQty}</td>
																		<td align="right"><fmt:formatNumber type="number"
																				minFractionDigits="2" maxFractionDigits="2"
																				value="${sc1.taxableAmt}" /></td>
																		<td align="right">${sc1.varQty}</td>
																		<td align="right"><fmt:formatNumber type="number"
																				minFractionDigits="2" maxFractionDigits="2"
																				value="${sc1.varTaxableAmt}" /></td>
																		<td align="right">${sc1.retQty}</td>
																		<td align="right"><fmt:formatNumber type="number"
																				minFractionDigits="2" maxFractionDigits="2"
																				value="${sc1.retTaxableAmt}" /></td>
																		<td align="right">${(sc1.soldQty-(sc1.varQty+sc1.retQty))}</td>
																		<td align="right"><fmt:formatNumber type="number"
																				minFractionDigits="2" maxFractionDigits="2"
																				value="${(sc1.taxableAmt-(sc1.varTaxableAmt+sc1.retTaxableAmt))}" /></td>
																		<%-- 																		<td align="right"><fmt:formatNumber type="number"
																				minFractionDigits="2" maxFractionDigits="2"
																				value="${(((sc1.varTaxableAmt+sc1.retTaxableAmt)*100)/sc1.taxableAmt)}" />%</td> --%>

																		<c:choose>
																			<c:when test="${sc1.taxableAmt==0}">
																				<td align="right">0.00%</td>
																			</c:when>
																			<c:otherwise>
																				<td align="right"><fmt:formatNumber
																						type="number" minFractionDigits="2"
																						maxFractionDigits="2"
																						value="${(((sc1.varTaxableAmt+sc1.retTaxableAmt)*100)/sc1.taxableAmt)}" />%</td>

																			</c:otherwise>
																		</c:choose>


																	</c:if>



																</c:if>
															</c:forEach>

														</c:if>
													</c:forEach>
												</c:forEach>
											</tr>

										</c:forEach>
										<tr>
											<td style='font-weight: bold'>Total</td>

											<c:forEach items="${reportList}" var="month2"
												varStatus="count">

												<c:forEach items="${month2.dataList}" var="fr2"
													varStatus="count">

													<c:if test="${fr2.frId==fr.frId}">

														<c:if test="${reportType==1}">

															<td align="right" style='font-weight: bold'><fmt:formatNumber
																	type="number" minFractionDigits="0"
																	maxFractionDigits="0" value="${fr2.frTotalSoldQty}" /></td>
															<td align="right" style='font-weight: bold'><fmt:formatNumber
																	type="number" minFractionDigits="2"
																	maxFractionDigits="2" value="${fr2.frTotalSoldAmt}" /></td>

															<td align="right" style='font-weight: bold'><fmt:formatNumber
																	type="number" minFractionDigits="0"
																	maxFractionDigits="0" value="${fr2.frTotalVarQty}" /></td>

															<td align="right" style='font-weight: bold'><fmt:formatNumber
																	type="number" minFractionDigits="2"
																	maxFractionDigits="2" value="${fr2.frTotalVarAmt}" /></td>

															<td align="right" style='font-weight: bold'><fmt:formatNumber
																	type="number" minFractionDigits="0"
																	maxFractionDigits="0" value="${fr2.frTotalRetQty}" /></td>

															<td align="right" style='font-weight: bold'><fmt:formatNumber
																	type="number" minFractionDigits="2"
																	maxFractionDigits="2" value="${fr2.frTotalRetAmt}" /></td>

															<td align="right" style='font-weight: bold'><fmt:formatNumber
																	type="number" minFractionDigits="0"
																	maxFractionDigits="0" value="${fr2.frTotalNetQty}" /></td>

															<td align="right" style='font-weight: bold'><fmt:formatNumber
																	type="number" minFractionDigits="2"
																	maxFractionDigits="2" value="${fr2.frTotalNetAmt}" /></td>

															<td align="right" style='font-weight: bold'><fmt:formatNumber
																	type="number" minFractionDigits="2"
																	maxFractionDigits="2" value="${fr2.frTotalRetAmtPer}" />%</td>


														</c:if>


														<c:if test="${reportType==2}">

															<td align="right" style='font-weight: bold'><fmt:formatNumber
																	type="number" minFractionDigits="0"
																	maxFractionDigits="0" value="${fr2.frTotalSoldQty}" /></td>
															<td align="right" style='font-weight: bold'><fmt:formatNumber
																	type="number" minFractionDigits="2"
																	maxFractionDigits="2" value="" /></td>

															<td align="right" style='font-weight: bold'><fmt:formatNumber
																	type="number" minFractionDigits="0"
																	maxFractionDigits="0" value="${fr2.frTotalVarQty}" /></td>

															<td align="right" style='font-weight: bold'><fmt:formatNumber
																	type="number" minFractionDigits="2"
																	maxFractionDigits="2" value="" /></td>

															<td align="right" style='font-weight: bold'><fmt:formatNumber
																	type="number" minFractionDigits="0"
																	maxFractionDigits="0" value="${fr2.frTotalRetQty}" /></td>

															<td align="right" style='font-weight: bold'><fmt:formatNumber
																	type="number" minFractionDigits="2"
																	maxFractionDigits="2" value="" /></td>

															<td align="right" style='font-weight: bold'><fmt:formatNumber
																	type="number" minFractionDigits="0"
																	maxFractionDigits="0" value="${fr2.frTotalNetQty}" /></td>

															<td align="right" style='font-weight: bold'><fmt:formatNumber
																	type="number" minFractionDigits="2"
																	maxFractionDigits="2" value="" /></td>

															<td align="right" style='font-weight: bold'><fmt:formatNumber
																	type="number" minFractionDigits="2"
																	maxFractionDigits="2" value="" /></td>

														</c:if>

														<c:if test="${reportType==3}">

															<td align="right" style='font-weight: bold'><fmt:formatNumber
																	type="number" minFractionDigits="0"
																	maxFractionDigits="0" value="" /></td>
															<td align="right" style='font-weight: bold'><fmt:formatNumber
																	type="number" minFractionDigits="2"
																	maxFractionDigits="2" value="${fr2.frTotalSoldAmt}" /></td>

															<td align="right" style='font-weight: bold'><fmt:formatNumber
																	type="number" minFractionDigits="0"
																	maxFractionDigits="0" value="" /></td>

															<td align="right" style='font-weight: bold'><fmt:formatNumber
																	type="number" minFractionDigits="2"
																	maxFractionDigits="2" value="${fr2.frTotalVarAmt}" /></td>

															<td align="right" style='font-weight: bold'><fmt:formatNumber
																	type="number" minFractionDigits="0"
																	maxFractionDigits="0" value="" /></td>

															<td align="right" style='font-weight: bold'><fmt:formatNumber
																	type="number" minFractionDigits="2"
																	maxFractionDigits="2" value="${fr2.frTotalRetAmt}" /></td>

															<td align="right" style='font-weight: bold'><fmt:formatNumber
																	type="number" minFractionDigits="0"
																	maxFractionDigits="0" value="" /></td>

															<td align="right" style='font-weight: bold'><fmt:formatNumber
																	type="number" minFractionDigits="2"
																	maxFractionDigits="2" value="${fr2.frTotalNetAmt}" /></td>

															<td align="right" style='font-weight: bold'><fmt:formatNumber
																	type="number" minFractionDigits="2"
																	maxFractionDigits="2" value="${fr2.frTotalRetAmtPer}" />%</td>

														</c:if>

														<c:if test="${reportType==4}">

															<td align="right" style='font-weight: bold'><fmt:formatNumber
																	type="number" minFractionDigits="0"
																	maxFractionDigits="0" value="${fr2.frTotalSoldQty}" /></td>
															<td align="right" style='font-weight: bold'><fmt:formatNumber
																	type="number" minFractionDigits="2"
																	maxFractionDigits="2"
																	value="${fr2.frTotalSoldTaxableAmt}" /></td>

															<td align="right" style='font-weight: bold'><fmt:formatNumber
																	type="number" minFractionDigits="0"
																	maxFractionDigits="0" value="${fr2.frTotalVarQty}" /></td>

															<td align="right" style='font-weight: bold'><fmt:formatNumber
																	type="number" minFractionDigits="2"
																	maxFractionDigits="2"
																	value="${fr2.frTotalVarTaxableAmt}" /></td>

															<td align="right" style='font-weight: bold'><fmt:formatNumber
																	type="number" minFractionDigits="0"
																	maxFractionDigits="0" value="${fr2.frTotalRetQty}" /></td>

															<td align="right" style='font-weight: bold'><fmt:formatNumber
																	type="number" minFractionDigits="2"
																	maxFractionDigits="2"
																	value="${fr2.frTotalRetTaxableAmt}" /></td>

															<td align="right" style='font-weight: bold'><fmt:formatNumber
																	type="number" minFractionDigits="0"
																	maxFractionDigits="0" value="${fr2.frTotalNetQty}" /></td>

															<td align="right" style='font-weight: bold'><fmt:formatNumber
																	type="number" minFractionDigits="2"
																	maxFractionDigits="2"
																	value="${fr2.frTotalNetTaxableAmt}" /></td>

															<td align="right" style='font-weight: bold'><fmt:formatNumber
																	type="number" minFractionDigits="2"
																	maxFractionDigits="2"
																	value="${fr2.frTotalRetTaxableAmtPer}" />%</td>

														</c:if>



													</c:if>
												</c:forEach>
											</c:forEach>

										</tr>


									</c:forEach>

									<tr>
										<td style='font-weight: bold'>TOTAL---</td>


										<c:forEach items="${reportList}" var="month3"
											varStatus="count">




											<c:if test="${reportType==1}">

												<td align="right" style='font-weight: bold'><fmt:formatNumber
														type="number" minFractionDigits="0" maxFractionDigits="0"
														value="${month3.monthTotalSoldQty}" /></td>
												<td align="right" style='font-weight: bold'><fmt:formatNumber
														type="number" minFractionDigits="2" maxFractionDigits="2"
														value="${month3.monthTotalSoldAmt}" /></td>

												<td align="right" style='font-weight: bold'><fmt:formatNumber
														type="number" minFractionDigits="0" maxFractionDigits="0"
														value="${month3.monthTotalVarQty}" /></td>

												<td align="right" style='font-weight: bold'><fmt:formatNumber
														type="number" minFractionDigits="2" maxFractionDigits="2"
														value="${month3.monthTotalVarAmt}" /></td>

												<td align="right" style='font-weight: bold'><fmt:formatNumber
														type="number" minFractionDigits="0" maxFractionDigits="0"
														value="${month3.monthTotalRetQty}" /></td>

												<td align="right" style='font-weight: bold'><fmt:formatNumber
														type="number" minFractionDigits="2" maxFractionDigits="2"
														value="${month3.monthTotalRetAmt}" /></td>

												<td align="right" style='font-weight: bold'><fmt:formatNumber
														type="number" minFractionDigits="0" maxFractionDigits="0"
														value="${month3.monthTotalNetQty}" /></td>

												<td align="right" style='font-weight: bold'><fmt:formatNumber
														type="number" minFractionDigits="2" maxFractionDigits="2"
														value="${month3.monthTotalNetAmt}" /></td>

												<td align="right" style='font-weight: bold'><fmt:formatNumber
														type="number" minFractionDigits="2" maxFractionDigits="2"
														value="${month3.monthTotalRetAmtPer}" />%</td>


											</c:if>
										</c:forEach>


									</tr>

								</c:forEach>
							</tbody>
	</table>
</div>


				
					
					<div class="form-group" style="display: none;" id="range"></div>
				

			</div>

		</div>
	</div>
	<!-- END Main Content -->

	<footer>
		<p>2017 © Monginis.</p>
	</footer>

	<a id="btn-scrollup" class="btn btn-circle btn-lg" href="#"><i
		class="fa fa-chevron-up"></i></a>


	<script>
		function exportToExcel() {

			window.open("${pageContext.request.contextPath}/exportToExcelNew");
			document.getElementById("expExcel").disabled = true;
		}
	</script>


	<!--basic scripts-->
	<script
		src="//ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
	<script>
		window.jQuery
				|| document
						.write('<script src="${pageContext.request.contextPath}/resources/assets/jquery/jquery-2.0.3.min.js"><\/script>')
	</script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/bootstrap/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/jquery-cookie/jquery.cookie.js"></script>

	<!--page specific plugin scripts-->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/chosen-bootstrap/chosen.jquery.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-inputmask/bootstrap-inputmask.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/jquery-tags-input/jquery.tagsinput.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/jquery-pwstrength/jquery.pwstrength.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-fileupload/bootstrap-fileupload.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-duallistbox/duallistbox/bootstrap-duallistbox.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/dropzone/downloads/dropzone.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-timepicker/js/bootstrap-timepicker.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/clockface/js/clockface.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-colorpicker/js/bootstrap-colorpicker.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-daterangepicker/date.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-daterangepicker/daterangepicker.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-switch/static/js/bootstrap-switch.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-wysihtml5/wysihtml5-0.3.0.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-wysihtml5/bootstrap-wysihtml5.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/ckeditor/ckeditor.js"></script>

	<!--flaty scripts-->
	<script src="${pageContext.request.contextPath}/resources/js/flaty.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/flaty-demo-codes.js"></script>

</body>
</html>