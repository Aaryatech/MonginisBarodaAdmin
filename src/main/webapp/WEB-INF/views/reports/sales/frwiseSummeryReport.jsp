<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<body>

	<jsp:include page="/WEB-INF/views/include/logout.jsp"></jsp:include>

	<c:url var="getBillList" value="/getSaleFrwiseReport"></c:url>
	<c:url var="getFrListofAllFr" value="/getFrListofAllFrForFrSummery"></c:url>
	<c:url var="getAllCatByAjax" value="/getAllCatByAjax"></c:url>



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
					<i class="fa fa-file-o"></i>Franchise Summary Report
				</h1> -->
				<h4></h4>
			</div>
		</div>
		<!-- END Page Title -->

		<!-- BEGIN Main Content -->
		<div class="box">
			<div class="box-title">
				<h3>
					<i class="fa fa-bars"></i>Franchise Summary Report 
				</h3>

			</div>

			<div><!-- class="box-content" -->
			
				<div class="frm_Sec_one single">
					<div class="row">
						<div class="col-md-3 box_marg">
							<label class="control-label left">From Date</label>
							<div class="controls icon_add">
							<i class="fa fa-calendar frm_icon" aria-hidden="true"></i>
							<input class="form-control padd_left date-picker" id="fromDate"
								name="fromDate" size="30" type="text" value="${todaysDate}" />
							</div>
					   </div>
					   
					   <div class="col-md-3 box_marg">
							<label class="control-label left">To Date</label>
							<div class="controls icon_add">
							<i class="fa fa-calendar frm_icon" aria-hidden="true"></i>
							<input class="form-control padd_left date-picker" id="toDate" name="toDate"
								size="30" type="text" value="${todaysDate}" />
							</div>
					   </div>
					   
					   <div class="col-md-6 box_marg">
							<label class="control-label left">Select Franchise</label>
							<div class="controls icon_add">
							<i class="fa fa-user frm_icon" aria-hidden="true"></i>
							<select data-placeholder="Choose Franchisee"
								class="form-control padd_left chosen" multiple="multiple" tabindex="6"
								id="selectFr" name="selectFr"
								onchange="setAllFrSelected(this.value)">
								<option value="-1"><c:out value="All" /></option>
								<c:forEach items="${unSelectedFrList}" var="fr"
									varStatus="count">
									<option value="${fr.frId}"><c:out value="${fr.frName}" /></option>
								</c:forEach>
							</select>
							</div>
					   </div>
					</div>
				</div>	
				
				<div class="form-group">
					<div class="three_buttons">
						<button class="btn btn-primary" onclick="searchReport()">Search Report</button>
							<button class="btn btn-primary" value="PDF" id="PDFButton" onclick="genPdf()">PDF</button>
						<input type="button" class="btn btn-primary" value="Cancel">
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
		</div>


		<div class="box">
			<div class="box-title">
				<h3>
					<i class="fa fa-list-alt"></i>Franchisee Report
				</h3>

			</div>

			<form id="submitBillForm" action="${pageContext.request.contextPath}/submitNewBill" method="post">
				<div class=" box-content">
				
					<div class="tableFixHead">
						<table id="table_grid">        
						<thead style="background-color: #f3b5db;">
							<tr class="bgpink">
								<th style="text-align: center; width:80px;">Sr.No.</th>
								<th style="text-align: right;">Date</th>
								<th style="text-align: right;">Type</th>
								<th style="text-align: right;">Document</th>
								<th style="text-align: left;">Order Ref</th>
								<th style="text-align: right;">Dr Amt</th>
								<th style="text-align: right;">Cr Amt</th>
								<th style="text-align: right;">Balance</th>
							</tr>
						</thead>
					
						<tbody>
						</tbody>
						</table>
					</div>
					
					</div>
					
					<div class="form-group" style="display: none;" id="range">
					<div class="three_buttons">
						<input type="button" id="expExcel" class="btn btn-primary" value="EXPORT TO Excel" onclick="exportToExcel();" disabled="disabled">
						<input type="button" class="btn btn-primary" value="Cancel">
					</div>					
			    </div>

				</div>
			</form>
			
			<footer>
		<p>2017 © Monginis.</p>
	</footer>
		</div>
		
		
	</div>
	<!-- END Main Content -->

	
	<a id="btn-scrollup" class="btn btn-circle btn-lg" href="#"><i
		class="fa fa-chevron-up"></i></a>



	<script type="text/javascript">
		function searchReport() {
			//	var isValid = validate();

			var selectedFr = $("#selectFr").val();

			var from_date = $("#fromDate").val();
			var to_date = $("#toDate").val();

			$('#loader').show();

			$
					.getJSON(
							'${getBillList}',

							{
								fr_id_list : JSON.stringify(selectedFr),
								fromDate : from_date,
								toDate : to_date,
								ajax : 'true'

							},
							function(data) {

								$('#table_grid td').remove();
								$('#loader').hide();

								if (data == "") {
									alert("No records found !!");
									document.getElementById("expExcel").disabled = true;
								}
								var index = 0;
								$
										.each(
												data.frIdNamesList,
												function(key, fr) {

													index = 0;

													var tr = $('<tr></tr>');

													tr
															.append($(
																	'<td style="text-align:center;"></td>')
																	.html(
																			fr.frName));
													tr.append($('<td style="text-align:right;"></td>')
															.html(""));
													tr.append($('<td style="text-align:right;"></td>')
															.html(""));
													tr.append($('<td style="text-align:right;"></td>')
															.html(""));
													tr.append($('<td style="text-align:left;"></td>')
															.html(""));
													tr.append($('<td style="text-align:right;"></td>')
															.html(""));
													tr.append($('<td style="text-align:right;"></td>')
															.html(""));

													tr.append($('<td style="text-align:right;"></td>')
															.html(""));

													$('#table_grid tbody')
															.append(tr);

													var totalArAmt = 0;
													var totalCrAmt = 0;

													$
															.each(
																	data.salesReportFranchiseeList,
																	function(
																			key,
																			report) {

																		if (fr.frId == report.frId) {

																			document
																					.getElementById("expExcel").disabled = false;
																			document
																					.getElementById('range').style.display = 'block';

																			//var tr = "<tr>";
																			index = index + 1;
																			var tr = $('<tr></tr>');

																			tr
																					.append($(
																							'<td style="text-align:center;"></td>')
																							.html(
																									index));
																			tr
																					.append($(
																							'<td style="text-align:right;"></td>')
																							.html(
																									report.billDate));
																			tr
																					.append($(
																							'<td style="text-align:right;"></td>')
																							.html(
																									report.type));
																			tr
																					.append($(
																							'<td style="text-align:right;"></td>')
																							.html(
																									report.invoiceNo));

																			tr
																					.append($(
																							'<td style="text-align:left;"></td>')
																							.html(
																									report.orderRef));
																			if (report.type == 'INV') {
																				totalArAmt = totalArAmt
																						+ report.grandTotal;
																				tr
																						.append($(
																								'<td style="text-align:right;"></td>')
																								.html(
																										(report.grandTotal)
																												.toFixed(2)));
																				tr
																						.append($(
																								'<td style="text-align:right;"></td>')
																								.html(
																										(0)
																												.toFixed(2)));
																			} else {
																				totalCrAmt = totalCrAmt
																						+ report.grandTotal;
																				tr
																						.append($(
																								'<td style="text-align:right;"></td>')
																								.html(
																										(0)
																												.toFixed(2)));
																				tr
																						.append($(
																								'<td style="text-align:right;"></td>')
																								.html(
																										(report.grandTotal)
																												.toFixed(2)));
																			}

																			tr
																					.append($(
																							'<td style="text-align:right;"></td>')
																							.html(
																									(totalArAmt - totalCrAmt)
																											.toFixed(2)));

																			$(
																					'#table_grid tbody')
																					.append(
																							tr);
																		}

																	})

													var tr = $('<tr></tr>');

													tr.append($('<td></td>')
															.html(""));
													tr.append($('<td></td>')
															.html(""));
													tr.append($('<td></td>')
															.html(""));
													tr.append($('<td></td>')
															.html(""));

													tr
															.append($(
																	'<td style="font-weight:bold;"></td>')
																	.html(
																			"Total"));

													tr
															.append($(
																	'<td style="text-align:right;"></td>')
																	.html(
																			totalArAmt
																					.toFixed(2)));
													tr
															.append($(
																	'<td style="text-align:right;"></td>')
																	.html(
																			totalCrAmt
																					.toFixed(2)));

													var totalBalance = totalArAmt
															- totalCrAmt;

													tr
															.append($(
																	'<td style="text-align:right;"></td>')
																	.html(
																			totalBalance
																					.toFixed(2)));

													$('#table_grid tbody')
															.append(tr);
												})

								/* var tr = $('<tr></tr>');

								tr.append($('<td></td>').html(""));
								tr.append($('<td></td>').html(""));
								tr.append($('<td></td>').html(""));
								tr.append($('<td></td>').html(""));

								tr.append($(
										'<td style="font-weight:bold;"></td>')
										.html("Total"));

								tr.append($(
										'<td style="text-align:right;"></td>')
										.html(totalArAmt.toFixed(2)));
								tr.append($(
										'<td style="text-align:right;"></td>')
										.html(totalCrAmt.toFixed(2)));

								var totalBalance = totalArAmt - totalCrAmt;

								tr.append($(
										'<td style="text-align:right;"></td>')
										.html(totalBalance.toFixed(2)));

								$('#table_grid tbody').append(tr); */

							});

		}
	</script>

	<script type="text/javascript">
		function validate() {

			var selectedFr = $("#selectFr").val();
			var selectedMenu = $("#selectMenu").val();
			var selectedRoute = $("#selectRoute").val();

			var isValid = true;

			if (selectedFr == "" || selectedFr == null) {

				if (selectedRoute == "" || selectedRoute == null) {
					alert("Please Select atleast one ");
					isValid = false;
				}
				//alert("Please select Franchise/Route");

			} else if (selectedMenu == "" || selectedMenu == null) {

				isValid = false;
				alert("Please select Menu");

			}
			return isValid;

		}
	</script>

	<script type="text/javascript">
		function updateTotal(orderId, rate) {

			var newQty = $("#billQty" + orderId).val();

			var total = parseFloat(newQty) * parseFloat(rate);

			$('#billTotal' + orderId).html(total);
		}
	</script>

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

		function genPdf() {
			var from_date = $("#fromDate").val();
			var to_date = $("#toDate").val();
			var selectedFr = $("#selectFr").val();

			window
					.open('${pageContext.request.contextPath}/pdfForDisReport?url=pdf/showSummeryFrByFrPdf/'
							+ from_date + '/' + to_date + '/' + selectedFr);

		}
	</script>

	<script type="text/javascript">
		function disableFr() {

			//alert("Inside Disable Fr ");
			document.getElementById("selectFr").disabled = true;

		}

		function disableRoute() {

			//alert("Inside Disable route ");
			var x = document.getElementById("selectRoute")
			//alert(x.options.length);
			var i;
			for (i = 0; i < x; i++) {
				document.getElementById("selectRoute").options[i].disabled;
				//document.getElementById("pets").options[2].disabled = true;
			}
			//document.getElementById("selectRoute").disabled = true;

		}

		function exportToExcel() {

			window.open("${pageContext.request.contextPath}/exportToExcelNew");
			document.getElementById("expExcel").disabled = true;
		}
	</script>

	<script>
		function setAllFrSelected(frId) {
			//alert("hii")
			if (frId == -1) {

				$.getJSON('${getFrListofAllFr}', {

					ajax : 'true'
				},
						function(data) {

							var len = data.length;

							//alert(len);

							$('#selectFr').find('option').remove().end()
							$("#selectFr").append(
									$("<option value='-1'>All</option>"));
							for (var i = 0; i < len; i++) {
								$("#selectFr").append(
										$("<option selected ></option>").attr(
												"value", data[i].frId).text(
												data[i].frName));
							}
							$("#selectFr").trigger("chosen:updated");
						});
			}
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