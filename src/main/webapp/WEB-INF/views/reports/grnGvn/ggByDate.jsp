<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>

<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<body>
	<jsp:include page="/WEB-INF/views/include/logout.jsp"></jsp:include>
	<c:url var="getGrnGvnByDatewise" value="/getGrnGvnByDatewise"></c:url>

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
				<!--<h1>
					<i class="fa fa-file-o"></i>Grn Gvn Report By Date
				</h1>
				<h4></h4>-->
			</div>
		</div> 
		<!-- END Page Title -->

		<!-- BEGIN Breadcrumb -->
		<%-- 	<div id="breadcrumbs">
			<ul class="breadcrumb">
				<li><i class="fa fa-home"></i> <a
					href="${pageContext.request.contextPath}/home">Home</a> <span
					class="divider"><i class="fa fa-angle-right"></i></span></li>
				<li class="active">Bill Report</li>
			</ul>
		</div> --%>
		<!-- END Breadcrumb -->

		<!-- BEGIN Main Content -->
		<div class="box">
			<div class="box-title">
				<h3>
					<i class="fa fa-bars"></i>View Grn Gvn DateWise 
				</h3>

			</div>

			<div><!-- class="box-content" -->
				<div class="frm_Sec_one single">
					<div class="row">
						<div class="col-md-3 box_marg">
							<label class="control-label left">From Date</label>
							<div class="controls icon_add date_select date_select">
							<i class="fa fa-calendar frm_icon" aria-hidden="true"></i>
							<input class="form-control padd_left date-picker" id="fromDate"
								name="fromDate" size="30" type="text" value="${todaysDate}" />
							</div>
				   		</div>
				   		
				   		<div class="col-md-3 box_marg">
							<label class="control-label left">To Date</label>
							<div class="controls icon_add date_select date_select">
							<i class="fa fa-calendar frm_icon" aria-hidden="true"></i>
							<input class="form-control padd_left date-picker" id="toDate" name="toDate"
								size="30" type="text" value="${todaysDate}" />
							</div>
				   		</div>
				   		
				   		<div class="col-md-6 box_marg">
							<label class="control-label left">Select Route</label>
							<div class="controls icon_add date_select">
							<i class="fa fa-road frm_icon" aria-hidden="true"></i>
							<select data-placeholder="Select Route"
								class="form-control padd_left chosen" name="selectRoute" id="selectRoute"
								onchange="disableFr()">
								<option value="0">Select Route</option>
								<c:forEach items="${routeList}" var="route" varStatus="count">
									<option value="${route.routeId}"><c:out
											value="${route.routeName}" />
									</option>
								</c:forEach>
							</select>
							</div>
				   		</div>
				   		
				   		<div class="col-md-9 box_marg">
							<label class="control-label left">Select Franchisee</label>
							<div class="controls icon_add date_select">
							<i class="fa fa-user frm_icon" aria-hidden="true"></i>
							<select data-placeholder="Choose Franchisee"
								class="form-control padd_left chosen" multiple="multiple" tabindex="6"
								id="selectFr" name="selectFr" onchange="disableRoute()">
								<option value="-1"><c:out value="All" /></option>
								<c:forEach items="${unSelectedFrList}" var="fr"
									varStatus="count">
									<option value="${fr.frId}"><c:out value="${fr.frName}" /></option>
								</c:forEach>
							</select>
							</div>
				   		</div>
				   		
				   		<div class="col-md-3 box_marg">
							<label class="control-label left">View Option</label>
							<div class="controls icon_add date_select">
							<i class="fa fa-eye frm_icon" aria-hidden="true"></i>
							<select class="form-control padd_left" name="isGrn" id="isGrn">
							<option value="-1">Select View Option</option>
							<option selected value="1">GRN</option>
							<option value="0">GVN</option>
							<option value="2">ALL</option>
						</select>
							</div>
				   		</div>
				   		
					</div>
				</div>
				
			
				<div class="form-group">
					<div class="three_buttons">
						<button class="btn btn-primary" onclick="searchReport()">Search Report</button>
						<button class="btn btn-primary" onclick="showChart()">Graph</button>
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
			<div class="box-content">
				<form id="submitBillForm" method="post">
				
					<div class="tableFixHead">
	<table id="table_grid">         
	<thead style="background-color: #f3b5db;">
		<tr class="bgpink">
			<th style="text-align: center;">Sr.No.</th>
			<th style="text-align: right;">Date</th>
			<th style="text-align: right;">Type</th>
			<th style="text-align: left;">Grn Gvn Sr No</th>
			<th style="text-align: left;">Fr Name</th>
			<th style="text-align: right;">Req Qty</th>
			<th style="text-align: right;">Req Value</th>
			<th style="text-align: right;">Apr Qty</th>
			<th style="text-align: right;">Apr Value</th>
		</tr>
	</thead>
	
	<tbody>
	</tbody>
	</table>
</div>
</div>

			<div class="form-group" style="display: none;" id="range">
					<div class="three_buttons" style="padding: 0px 30px 10px 30px;">
						<input type="button" id="expExcel" class="btn btn-primary" value="EXPORT TO Excel" onclick="exportToExcel();"
									disabled="disabled">
						<input type="button" class="btn btn-primary" value="Cancel">
					</div>					
			    </div>

					<div class="col-md-12 ">
						<div align="center" id="showchart" style="display: none"></div>
					</div>

				


					<div id="chart"">
						<div id="chart_div" style="width: 100%; height: 100%;"></div>
						<div id="PieChart_div" style="width: 100%; height: 100%;"></div>
					</div>
				</form>
			
		
		</div>
		<footer>
		<p>2018 © Monginis.</p>
	</footer>
	</div>
	<!-- END Main Content -->

	


	<a id="btn-scrollup" class="btn btn-circle btn-lg" href="#"><i
		class="fa fa-chevron-up"></i></a>

	<script type="text/javascript">
		function searchReport() {
			//	var isValid = validate();
			document.getElementById('chart').style.display = "display:none";
			document.getElementById("table_grid").style = "block";
			var isGrn = $("#isGrn").val();
			//alert("isGrn " +isGrn);

			//report 1
			var selectedFr = $("#selectFr").val();
			var routeId = $("#selectRoute").val();

			var from_date = $("#fromDate").val();
			var to_date = $("#toDate").val();

			$('#loader').show();

			$.getJSON('${getGrnGvnByDatewise}',

			{
				fr_id_list : JSON.stringify(selectedFr),
				from_date : from_date,
				to_date : to_date,
				route_id : routeId,
				is_grn : isGrn,
				ajax : 'true'

			}, function(data) {

				$('#table_grid td').remove();
				$('#loader').hide();

				var totalReqQty = 0;
				var totalReqAmt = 0;
				var totalAprQty = 0;
				var totalAprValue = 0;

				if (data == "") {
					alert("No records found !!");
					document.getElementById("expExcel").disabled = true;
				}

				$.each(data, function(key, report) {

					document.getElementById("expExcel").disabled = false;
					document.getElementById('range').style.display = 'block';

					var index = key + 1;
					//var tr = "<tr>";
					var tr = $('<tr></tr>');
					tr.append($('<td style="text-align:center;"></td>').html(key + 1));

					totalReqQty = totalReqQty + report.reqQty;
					totalReqAmt = totalReqAmt + report.totalAmt;
					totalAprQty = totalAprQty + report.aprQty;
					totalAprValue = totalAprValue + report.aprGrandTotal;

					if (report.isGrn == 1) {
						var type = "GRN"
					} else {
						var type = "GVN"
					}
					tr.append($('<td style="text-align:right;"></td>').html(report.grngvnDate));
					tr.append($('<td style="text-align:right;"></td>').html(type));
					tr.append($('<td style="text-align:left;"></td>').html(report.grngvnSrno));
					tr.append($('<td style="text-align:right;"></td>').html(report.frName));
					tr.append($('<td style="text-align:right;"></td>').html(
							report.reqQty.toFixed(2)));
					tr.append($('<td style="text-align:right;"></td>').html(
							report.totalAmt.toFixed(2)));
					tr.append($('<td style="text-align:right;"></td>').html(
							report.aprQty.toFixed(2)));
					tr.append($('<td style="text-align:right;"></td>').html(
							report.aprGrandTotal.toFixed(2)));

					$('#table_grid tbody').append(tr);

				})

				var tr = $('<tr></tr>');

				tr.append($('<td></td>').html(""));
				tr.append($('<td></td>').html(""));
				tr.append($('<td></td>').html(""));
				tr.append($('<td></td>').html(""));
				tr.append($('<td style="font-weight:bold;"></td>')
						.html("Total"));
				tr.append($('<td  style="text-align:right;"></td>').html(
						totalReqQty.toFixed(2)));
				tr.append($('<td  style="text-align:right;"></td>').html(
						totalReqAmt.toFixed(2)));
				tr.append($('<td  style="text-align:right;"></td>').html(
						totalAprQty.toFixed(2)));
				tr.append($('<td  style="text-align:right;"></td>').html(
						totalAprValue.toFixed(2)));

				$('#table_grid tbody').append(tr);

			});

		}
	</script>


	<script type="text/javascript">
		function validate() {

			var selectedFr = $("#selectFr").val();
			var isGrn = $("#isGrn").val();
			var selectedRoute = $("#selectRoute").val();

			var isValid = true;

			if (selectedFr == "" || selectedFr == null) {

				if (selectedRoute == "0" || selectedRoute == null) {
					alert("Please Select Franchise or Route ");
					isValid = false;
				}
				//alert("Please select Franchise/Route");

			} else if (isGrn == "-1" || isGrn == null) {

				isValid = false;
				alert("Please select Option");

			}
			return isValid;

		}
	</script>






	<script type="text/javascript">
		function showChart() {
			$("#PieChart_div").empty();
			$("#chart_div").empty();
			document.getElementById('chart').style.display = "block";
			document.getElementById("table_grid").style = "display:none";

			document.getElementById('chart').style.display = "display:none";
			document.getElementById("table_grid").style = "block";
			var isGrn = $("#isGrn").val();
			//alert("isGrn " +isGrn);

			//report 1
			var selectedFr = $("#selectFr").val();
			var routeId = $("#selectRoute").val();

			var from_date = $("#fromDate").val();
			var to_date = $("#toDate").val();

			$('#loader').show();

			$
					.getJSON(
							'${getGrnGvnByDatewise}',

							{
								fr_id_list : JSON.stringify(selectedFr),
								from_date : from_date,
								to_date : to_date,
								route_id : routeId,
								is_grn : isGrn,
								ajax : 'true'

							},
							function(data) {

								//alert(data);
								if (data == "") {
									alert("No records found !!");
									$('#loader').hide();

								}
								var i = 0;
								$('#loader').hide();
								google.charts.load('current', {
									'packages' : [ 'corechart', 'bar' ]
								});
								google.charts.setOnLoadCallback(drawStuff);

								function drawStuff() {

									// alert("Inside DrawStuff");

									var chartDiv = document
											.getElementById('chart_div');
									document.getElementById("chart_div").style.border = "thin dotted red";

									var PiechartDiv = document
											.getElementById('PieChart_div');
									document.getElementById("PieChart_div").style.border = "thin dotted red";

									var dataTable = new google.visualization.DataTable();
									dataTable.addColumn('string', 'Date'); // Implicit domain column.
									dataTable.addColumn('number',
											'Requested Value'); // Implicit data column.
									dataTable.addColumn('number',
											'Approved Value');

									var piedataTable = new google.visualization.DataTable();
									piedataTable.addColumn('string', 'Date'); // Implicit domain column.
									piedataTable.addColumn('number',
											'Approved Value');

									$.each(data, function(key, report) {

										// alert("In Data")
										var reqValue = report.totalAmt;
										var aprValue = report.aprGrandTotal;

										//var total=report.taxableAmt+report.sgstSum+report.cgstSum;
										//alert("total ==="+total);
										//alert("base Value "+baseValue);

										var date = report.grngvnDate;
										//alert("frNAme "+frName);
										//var date= item.billDate+'\nTax : ' + item.tax_per + '%';

										dataTable.addRows([

										[ date, reqValue, aprValue ],

										]);

										piedataTable.addRows([

										[ date, aprValue ],

										]);
									}) // end of  $.each(data,function(key, report) {-- function

									// Instantiate and draw the chart.

									var materialOptions = {

										width : 500,
										chart : {
											title : 'Date wise Grn Gvn Report',
											subtitle : 'Requested and Approved Value',

										},
										series : {
											0 : {
												axis : 'distance'
											}, // Bind series 0 to an axis named 'distance'.
											1 : {
												axis : 'brightness'
											}
										// Bind series 1 to an axis named 'brightness'.
										},
										axes : {
											y : {
												distance : {
													label : 'Req Value'
												}, // Left y-axis.
												brightness : {
													side : 'right',
													label : 'Apr  Value'
												}
											// Right y-axis.
											}
										}
									};

									function drawMaterialChart() {
										var materialChart = new google.charts.Bar(
												chartDiv);

										// alert("mater chart "+materialChart);
										materialChart
												.draw(
														dataTable,
														google.charts.Bar
																.convertOptions(materialOptions));
										// button.innerText = 'Change to Classic';
										// button.onclick = drawClassicChart;
									}

									var chart = new google.visualization.ColumnChart(
											document
													.getElementById('chart_div'));

									var Piechart = new google.visualization.PieChart(
											document
													.getElementById('PieChart_div'));
									chart.draw(dataTable, {
										title : 'Date wise Grn Gvn Report'
									});

									Piechart.draw(piedataTable, {
										title : 'Date wise Grn Gvn Report',
										is3D : true
									});
									// drawMaterialChart();
								}
								;

							});

		}

		function genPdf() {
			var from_date = $("#fromDate").val();
			var to_date = $("#toDate").val();

			var selectedFr = $("#selectFr").val();
			var routeId = $("#selectRoute").val();
			var isGrn = $("#isGrn").val();

			window
					.open('${pageContext.request.contextPath}/pdfForReport?url=pdf/showGGreportByDate/'
							+ from_date
							+ '/'
							+ to_date
							+ '/'
							+ selectedFr
							+ '/' + routeId + '/' + isGrn + '/');

		}
		function exportToExcel() {

			window.open("${pageContext.request.contextPath}/exportToExcel");
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