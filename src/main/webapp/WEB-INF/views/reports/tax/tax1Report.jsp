<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<body>

	<jsp:include page="/WEB-INF/views/include/logout.jsp"></jsp:include>

	<c:url var="getBillList" value="/getSaleBillwise"></c:url>

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
					<i class="fa fa-file-o"></i>Tax Report
				</h1>
				<h4></h4> -->
			</div>
		</div>
		<!-- END Page Title -->


		<!-- BEGIN Main Content -->
		<div class="box">
			<div class="box-title">
				<h3>
					<i class="fa fa-bars"></i>Tax Report
				</h3>

			</div>

			<div><!-- class="box-content" -->			
				<form action="${pageContext.request.contextPath}/showTaxReport"
					class="form-horizontal" method="get" id="validation-form">
					
					<div class="frm_Sec_one single">
						<div class="row">
							<div class="col-md-3 box_marg">
							<label class="control-label left">From Date</label>
							<div class="controls icon_add date_select">
							<i class="fa fa-calendar frm_icon" aria-hidden="true"></i>
							<input class="form-control padd_left date-picker" id="fromDate"
									name="fromDate" size="30" type="text" value="${fromDate}" />
							</div>
				   		</div>
				   		
				   		<div class="col-md-3 box_marg">
							<label class="control-label left">To Date</label>
							<div class="controls icon_add date_select">
							<i class="fa fa-calendar frm_icon" aria-hidden="true"></i>
							<input class="form-control padd_left date-picker" id="toDate"
									name="toDate" size="30" type="text" value="${toDate}" />
							</div>
				   		</div>
				   		
				   		<div class="col-md-3 box_marg">
				   			<div class="three_buttons" style="padding:33px 0 0 0; text-align: left;">
								<input type="submit" class="btn btn-primary" value="Search" />
								<input type="button" class="btn btn-primary" value="Cancel">
							</div>	
				   		</div>
				   		
						</div>
					</div>
					
					<!-- <div class="form-group">
					<div class="three_buttons">
						<input type="submit" class="btn btn-primary" value="Search" />
						<input type="button" class="btn btn-primary" value="Cancel">
					</div>					
			    </div> -->
				</form>


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
		</div>


		<div class="box">


			<div class=" box-content">
				<div class="tableFixHead">
					<table id="table_grid">         
					<thead style="background-color: #f3b5db;">
						<tr class="bgpink">
							<th style="text-align: center; width:80px;">Sr.No.</th>
							<th style="text-align: left;">Invoice No</th>
							<th style="text-align: right;">Bill No.</th>
							<th style="text-align: right;">Bill Date</th>
							<th style="text-align: left;">Franchise</th>
							<th style="text-align: right;">GSTIN</th>
							<th style="text-align: right;">CGST %</th>
							<th style="text-align: right;">SGST %</th>
							<th style="text-align: right;">CGST Amt</th>
							<th style="text-align: right;">SGST Amt</th>
							<th style="text-align: right;">Taxable Amt</th>
							<th style="text-align: right;">Igst Amt</th>
							<th style="text-align: right;">Grand Total</th>
						</tr>
					</thead>
					
					<tbody>
							
								<c:set var="totalCgstAmt" value="0" />
								<c:set var="totalIgstAmt" value="0" />
								<c:set var="totalTaxableAmt" value="0" />
								<c:set var="totalTax" value="0" />
								<c:set var="totalGrandTotal" value="0" />
								
								<c:forEach items="${taxReportList}" var="taxList"
									varStatus="count">
									<tr>
										<c:set var="totalCgstAmt"
											value="${totalCgstAmt+taxList.cgstAmt}" />

										<c:set var="totalIgstAmt"
											value="${totalIgstAmt+taxList.sgstAmt}" />

										<c:set var="totalTaxableAmt"
											value="${totalTaxableAmt+taxList.taxableAmt}" />

										<c:set var="totalTax" value="${totalTax+taxList.totalTax}" />

										<c:set var="totalGrandTotal"
											value="${totalGrandTotal+taxList.grandTotal}" />


										<td style="text-align: center;"><c:out value="${count.index+1}" /></td>
										<td style="text-align: left;"><c:out value="${taxList.invoiceNo}" /></td>
										<td style="text-align: right;"><c:out value="${taxList.billNo}" /></td>
										<td style="text-align: right;"><c:out value="${taxList.billDate}" /></td>
										<td style="text-align: left;"><c:out value="${taxList.frName}" /></td>

										<td><c:out value="${taxList.frGstNo}" /></td>
										<td style="text-align: right;"><c:out
												value="${taxList.cgstPer}" /></td>
										<td style="text-align: right;"><c:out
												value="${taxList.sgstPer}" /></td>

										<td style="text-align: right;"><fmt:formatNumber
												type="number" maxFractionDigits="2" minFractionDigits="2"
												value="${taxList.cgstAmt}" /></td>

										<td style="text-align: right;"><fmt:formatNumber
												type="number" maxFractionDigits="2" minFractionDigits="2"
												value="${taxList.sgstAmt}" /></td>

										<td style="text-align: right;"><fmt:formatNumber
												type="number" maxFractionDigits="2" minFractionDigits="2"
												value="${taxList.taxableAmt}" /></td>

										<td style="text-align: right;"><fmt:formatNumber
												type="number" maxFractionDigits="2" minFractionDigits="2"
												value="${taxList.totalTax}" /></td>

										<td style="text-align: right;"><fmt:formatNumber
												type="number" maxFractionDigits="2" minFractionDigits="2"
												value="${taxList.grandTotal}" /></td>

									</tr>
								</c:forEach>

								<tr>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>

									<td style="text-align: right; font-weight: bold;">Total</td>


									<td style="text-align: right; font-weight: bold;""><fmt:formatNumber
											type="number" maxFractionDigits="2" minFractionDigits="2"
											value="${totalCgstAmt}" /></td>
									<td style="text-align: right; font-weight: bold;""><fmt:formatNumber
											type="number" maxFractionDigits="2" minFractionDigits="2"
											value="${totalIgstAmt}" /></td>
									<td style="text-align: right; font-weight: bold;""><fmt:formatNumber
											type="number" maxFractionDigits="2" minFractionDigits="2"
											value="${totalTaxableAmt}" /></td>
									<td style="text-align: right; font-weight: bold;""><fmt:formatNumber
											type="number" maxFractionDigits="2" minFractionDigits="2"
											value="${totalTax}" /></td>
									<td style="text-align: right; font-weight: bold;""><fmt:formatNumber
											type="number" maxFractionDigits="2" minFractionDigits="2"
											value="${totalGrandTotal}" /></td>

								</tr>


							</tbody>
					</table>
				</div>
			
			
			
				<div class="form-group">
					<div class="three_buttons" style="padding:10px 0 0 0;">
						<input type="button" id="expExcel" class="btn btn-primary"
								value="Export To Excel" onclick="exportToExcel();">
						<input type="button" id="expExcelTally" class="btn btn-primary"
								value="Export To Excel For Tally"
								onclick="exportToExcelTally();">
						<input type="button" class="btn btn-primary" value="Cancel">
					</div>					
			    </div>
				
			</div>

		</div>
		<footer>
		<p>2018 © Monginis.</p>
	</footer>
	</div>
	<!-- END Main Content -->

	

	<a id="btn-scrollup" class="btn btn-circle btn-lg" href="#"><i
		class="fa fa-chevron-up"></i></a>








	<script>
		$('.datepicker').datepicker({
			format : {
				/*
				 * Say our UI should display a week ahead,
				 * but textbox should store the actual date.
				 * This is useful if we need UI to select local dates,
				 * but store in UTC
				 */
				format : 'mm/dd/yyyy',
				startDate : '-3d'
			}
		});
	</script>

	<script type="text/javascript">
		function exportToExcel() {

			window.open("${pageContext.request.contextPath}/exportToExcelNew");
			document.getElementById("expExcel").disabled = true;
		}
		function exportToExcelTally() {

			window
					.open("${pageContext.request.contextPath}/exportToExcelTally");
			document.getElementById("expExcelTally").disabled = true;
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