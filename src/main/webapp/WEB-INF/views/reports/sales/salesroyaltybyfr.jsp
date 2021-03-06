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

	<c:url var="getBillList" value="/getSaleRoyaltyByFr"></c:url>

	<c:url var="getAllFrListForSalesReportAjax"
		value="/getAllFrListForSalesReportAjax"></c:url>

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
					<i class="fa fa-file-o"></i>Royalty Report By FR
				</h1>
				<h4></h4>-->
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

		<!-- BEGIN Main Content -->
		<div class="box">
			<div class="box-title">
				<h3>
					<i class="fa fa-bars"></i>Franchasee-wise Royalty Report 
				</h3>

			</div>

			<div ><!-- class="box-content" -->
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
				   		
				   		<div class="col-md-12 box_marg">
							<label class="control-label left">Select Franchisee</label>
							<div class="controls icon_add">
							<i class="fa fa-user frm_icon" aria-hidden="true"></i>
							<select data-placeholder="Choose Franchisee"
								class="form-control padd_left chosen" multiple="multiple" tabindex="6"
								id="selectFr" name="selectFr"
								onchange="setAllFranchisee(this.value);"
								onchange="disableRoute()">

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
						<button class="btn btn-primary" onclick="searchReport()">Search</button>
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
			<!-- <div class="box-title">
				<h3>
					<i class="fa fa-list-alt"></i>Royalty Report (R6)
				</h3>

			</div> -->

			<form id="submitBillForm"
				action="${pageContext.request.contextPath}/submitNewBill"
				method="post">
				<div class=" box-content">
					
					<div class="tableFixHead">
	<table id="table_grid">         
	<thead style="background-color: #f3b5db;">
		<tr class="bgpink">
			<th style="text-align: center; width:80px;">Sr.No.</th>
			<th style="text-align: left;">Fr Name</th>
			<th style="text-align: right;">City</th>
			<th style="text-align: right;">Sale Value</th>
			<th style="text-align: right;">GRN Value</th>
			<th style="text-align: right;">%</th>
			<th style="text-align: right;">GVN Value</th>
			<th style="text-align: right;">Net Value</th>
			<th style="text-align: right;">Royalty Amt</th>
		</tr>
	</thead>
	
	<tbody>
	</tbody>
	</table>
</div>
</div>				
				
				<div class="form-group" style="display: none;" id="range"> <!--  -->
					<div class="three_buttons" style="padding: 0px 30px 10px 30px;">
						<input type="button" id="expExcel" class="btn btn-primary" value="Export To Excel" onclick="exportToExcel();"
						disabled="disabled">
						<input type="button" class="btn btn-primary" value="Cancel">
					</div>					
			    </div>
			    
				



				<div id="chart_div" style="width: 100%;  background-color: white;"></div><!-- height: 100%; -->
				<div id="PieChart_div" style="width: 100%; background-color: white; display: none;"></div><!-- height: 100%; -->
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

			var selectedFr = $("#selectFr").val();
			var routeId = $("#selectRoute").val();

			var from_date = $("#fromDate").val();
			var to_date = $("#toDate").val();

			$('#loader').show();

			$.getJSON('${getBillList}',

			{
				fr_id_list : JSON.stringify(selectedFr),
				fromDate : from_date,
				toDate : to_date,
				route_id : routeId,
				ajax : 'true'

			}, function(data) {

				var totalSaleValue = 0;
				var totalGrnValue = 0;
				var totalGvnValue = 0;
				var totalNetValue = 0;
				var totalRoyAmt = 0;

				$('#table_grid td').remove();
				$('#loader').hide();

				if (data == "") {
					alert("No records found !!");
					document.getElementById("expExcel").disabled = true;

				}

				var royPer = ${royPer};
				//alert(royPer);

				$.each(data, function(key, report) {
					document.getElementById("expExcel").disabled = false;
					document.getElementById('range').style.display = 'block';
					//alert("Hi");
					srNo = key + 1;
					//var index = key + 1;
					var tr = $('<tr></tr>');
					//tr.append($('<td></td>').html(cat.catName));

					totalSaleValue = totalSaleValue + report.tBillTaxableAmt;
					totalGrnValue = totalGrnValue + report.tGrnTaxableAmt;
					totalGvnValue = totalGvnValue + report.tGvnTaxableAmt;

					tr.append($('<td style="text-align:center;"></td>').html(srNo));
					tr.append($('<td style="text-align:left;"></td>').html(report.frName));
					tr.append($('<td style="text-align:right;"></td>').html(report.frCity));
					tr.append($('<td style="text-align:right;"></td>').html(
							addCommas(report.tBillTaxableAmt.toFixed(2))));
					tr.append($('<td style="text-align:right;"></td>').html(
							addCommas(report.tGrnTaxableAmt.toFixed(2))));

					tr.append($('<td style="text-align:right;"></td>').html(
							royPer));
					tr.append($('<td style="text-align:right;"></td>').html(
							addCommas(report.tGvnTaxableAmt.toFixed(2))));

					var netValue = report.tBillTaxableAmt
							- (report.tGrnTaxableAmt + report.tGvnTaxableAmt);
					netValue = netValue.toFixed(2);

					tr.append($('<td style="text-align:right;"></td>').html(
							addCommas(netValue)));
					//alert("netVAlue"+netValue);
					//alert("Per"+royPer);
					rAmt = parseFloat(netValue) * parseFloat(royPer) / 100;
					//	alert("Amt="+rAmt)
					rAmt = rAmt.toFixed(2);

					tr.append($('<td style="text-align:right;"></td>').html(
							addCommas(rAmt)));

					totalNetValue = totalNetValue + parseFloat(netValue);
					totalRoyAmt = totalRoyAmt + parseFloat(rAmt);

					$('#table_grid tbody').append(tr);

				})

				var tr = $('<tr></tr>');

				tr.append($('<td></td>').html(""));
				tr.append($('<td></td>').html(""));

				tr.append($('<td style="font-weight:bold;"></td>')
						.html("Total"));

				tr.append($('<td style="text-align:right;"></td>').html(
						addCommas(totalSaleValue.toFixed(2))));

				tr.append($('<td style="text-align:right;"></td>').html(
						addCommas(totalGrnValue.toFixed(2))));

				tr.append($('<td></td>').html(""));

				tr.append($('<td style="text-align:right;"></td>').html(
						addCommas(totalGvnValue.toFixed(2))));

				tr.append($('<td style="text-align:right;"></td>').html(
						addCommas(totalNetValue.toFixed(2))));

				tr.append($('<td style="text-align:right;"></td>').html(
						addCommas(totalRoyAmt.toFixed(2))));

				$('#table_grid tbody').append(tr);

			});

		}
	</script>
	<script type="text/javascript">
		function validate() {

			var selectedFr = $("#selectFr").val();
			var selectedRoute = $("#selectRoute").val();

			var isValid = true;

			if ((selectedFr == "" || selectedFr == null)
					&& (selectedRoute == 0)) {

				alert("Please Select Route  Or Franchisee");
				isValid = false;

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

				format : 'mm/dd/yyyy',
				startDate : '-3d'
			}
		});
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
	</script>


	<script type="text/javascript">
		function showChart() {

			$("#PieChart_div").empty();
			$("#chart_div").empty();
			document.getElementById('chart_div').style.display = "block";
			//document.getElementById('PieChart_div').style.display = "block";

			document.getElementById("table_grid").style = "display:none";

			var selectedFr = $("#selectFr").val();
			var routeId = $("#selectRoute").val();

			var from_date = $("#fromDate").val();
			var to_date = $("#toDate").val();

			$
					.getJSON(
							'${getBillList}',

							{
								fr_id_list : JSON.stringify(selectedFr),
								fromDate : from_date,
								toDate : to_date,
								route_id : routeId,
								ajax : 'true'

							},
							function(data) {

								if (data == "") {
									alert("No records found !!");

								}
								var i = 0;
								var royPer = $
								{
									royPer
								}
								;
								//alert(royPer);
								google.charts.load('current', {
									'packages' : [ 'corechart', 'bar' ]
								});
								google.charts.setOnLoadCallback(drawStuff);

								function drawStuff() {

									var chartDiv = document
											.getElementById('chart_div');
									document.getElementById("chart_div").style.border = "thin dotted red";

									var PiechartDiv = document
											.getElementById('PieChart_div');
									document.getElementById("PieChart_div").style.border = "thin dotted red";

									var dataTable = new google.visualization.DataTable();
									dataTable.addColumn('string',
											'Franchisee Name'); // Implicit domain column.
									dataTable.addColumn('number', 'netValue'); // Implicit data column.
									dataTable.addColumn('number', 'Total');

									var piedataTable = new google.visualization.DataTable();
									piedataTable.addColumn('string',
											'Franchisee Name'); // Implicit domain column.
									piedataTable.addColumn('number', 'Total');

									$
											.each(
													data,
													function(key, report) {

														var netValue = report.tBillTaxableAmt
																- (report.tGrnTaxableAmt + report.tGvnTaxableAmt);
														//netValue=netValue.toFixed();

														//	alert("netVAlue"+netValue);
														//alert("Per"+royPer);
														var rAmt = netValue
																* royPer / 100;
														//alert("Amt="+rAmt)
														//	rAmt=rAmt.toFixed(2);

														var frName = report.frName;
														//var date= item.billDate+'\nTax : ' + item.tax_per + '%';

														dataTable
																.addRows([

																		[
																				frName,
																				netValue,
																				rAmt ],

																// ["Sai", 12,14],
																//["Sai", 12,16],
																// ["Sai", 12,18],
																// ["Sai", 12,19],

																]);

														//alert("g1");

														piedataTable.addRows([

														[ frName, rAmt ],

														]);
													}) // end of  $.each(data,function(key, report) {-- function

									// Instantiate and draw the chart.

									var materialOptions = {

										width : 500,
										chart : {
											title : 'Date wise Tax Graph',
											subtitle : 'Total tax & Taxable Amount per day',

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
													label : 'Total Tax'
												}, // Left y-axis.
												brightness : {
													side : 'right',
													label : 'Taxable Amount'
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
										title : 'Sales Royalty Group By Fr'
									});

									Piechart.draw(piedataTable, {
										title : 'Sales royalty Group By Fr',
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
			window.open('pdfForReport?url=pdf/showSaleRoyaltyByFrPdf/'
					+ from_date + '/' + to_date + '/' + selectedFr + '/'
					+ routeId + '/');

		}

		function exportToExcel() {

			window.open("${pageContext.request.contextPath}/exportToExcelNew");
			document.getElementById("expExcel").disabled = true;
		}
	</script>

	<script type="text/javascript">
		function setAllFranchisee(frId) {
			if (frId == -1) {
				$.getJSON('${getAllFrListForSalesReportAjax}', {
					ajax : 'true'
				}, function(data) {
					var len = data.length;
					$('#selectFr').find('option').remove().end()

					$("#selectFr").append(
							$("<option ></option>").attr("value", -1).text(
									"Select All"));

					for (var i = 0; i < len; i++) {

						$("#selectFr").append(
								$("<option selected></option>").attr("value",
										data[i].frId).text(data[i].frName));
					}

					$("#selectFr").trigger("chosen:updated");
				});
			}
		}
	</script>
	
	<script type="text/javascript">
	 function addCommas(x){

		 x=String(x).toString();
		  var afterPoint = '';
		  if(x.indexOf('.') > 0)
		     afterPoint = x.substring(x.indexOf('.'),x.length);
		  x = Math.floor(x);
		  x=x.toString();
		  var lastThree = x.substring(x.length-3);
		  var otherNumbers = x.substring(0,x.length-3);
		  if(otherNumbers != '')
		      lastThree = ',' + lastThree;
		  return otherNumbers.replace(/\B(?=(\d{2})+(?!\d))/g, ",") + lastThree + afterPoint;
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