<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>


<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<body>

	<jsp:include page="/WEB-INF/views/include/logout.jsp"></jsp:include>

	<c:url var="getFlavourWiseList" value="/getFlavourWiseList"></c:url>

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
					<i class="fa fa-file-o"></i> Special Cake Flavour-wise Report Sort by Flavour 
				</h1>
				<h4></h4> -->
			</div>
		</div>
		<!-- END Page Title -->

		<div class="box">
			<div class="box-title">
				<h3>
					<i class="fa fa-bars"></i>Special Cake Flavour-wise Report Sort by Flavour 
				</h3>

			</div>

			<div ><!-- class="box-content" -->
				<div class="frm_Sec_one single">
					<div class="row">
						<div class="col-md-3 box_marg">
							<label class="control-label left">From Date</label>
							<div class="controls icon_add date_select">
							<i class="fa fa-calendar frm_icon" aria-hidden="true"></i>
							<input class="form-control padd_left date-picker" id="fromDate"
								name="fromDate" size="30" type="text" value="${todaysDate}" />
							</div>
				   		</div>
				   		
				   		<div class="col-md-3 box_marg">
							<label class="control-label left">To Date</label>
							<div class="controls icon_add date_select">
							<i class="fa fa-calendar frm_icon" aria-hidden="true"></i>
							<input class="form-control padd_left date-picker" id="toDate" name="toDate"
								size="30" type="text" value="${todaysDate}" />
							</div>
				   		</div>
				   		
				   		<div class="col-md-6 box_marg">
							<label class="control-label left">Franchisee</label>
							<div class="controls icon_add">
							<i class="fa fa-user frm_icon" aria-hidden="true"></i>
							<select data-placeholder="Choose Franchisee"
								class="form-control padd_left chosen" multiple="multiple" tabindex="6"
								id="selectFr" name="selectFr">
								<option value="${frId}"><c:out value="All" /></option>
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
					<i class="fa fa-list-alt"></i>Special Cake Flavour-wise Report Sort by Flavour
				</h3>

			</div> -->
			
			<div class="three_buttons" style="padding-bottom: 0;">
						<input type="button" class="btn btn-primary"
				onclick="tableToExcel('table_grid', 'name', 'SpecialCakeFlavorWiseSpReport_SortByFlavour.xls')"
				value="Export to Excel">
					</div>	
					
			

			<div class=" box-content">
			
				<div class="tableFixHead">
	<table id="table_grid">         
	<thead style="background-color: #f3b5db;">
		<tr class="bgpink">
			<th style="text-align: center;">Sr.No.</th>
			<th style="text-align: left;">Item</th>
			<th style="text-align: left;">Flavour</th>
			<th style="text-align: right;">Bill Qty</th>
			<th style="text-align: right;">Bill Value</th>
			<th style="text-align: right;">Return Qty</th>
			<th style="text-align: right;">Return Value</th>
			<th style="text-align: right;">Net Qty</th>
			<th style="text-align: right;">Net Value</th>
		</tr>
	</thead>
	
	<tbody>
	</tbody>
	</table>
</div>
</div>

	<div class="form-group" style="display: none;" id="range"><!--  -->
					<div class="three_buttons">
							<input type="button" id="expExcel" class="btn btn-primary"
								value="EXPORT TO Excel" onclick="exportToExcel();"
								disabled="disabled">
						<input type="button" class="btn btn-primary" value="Cancel">
									
			    </div>
				</div>
		</div>
		<footer>
		<p>2019 © Monginis.</p>
	</footer>
	</div>
	<!-- END Main Content -->

	

	<a id="btn-scrollup" class="btn btn-circle btn-lg" href="#"><i
		class="fa fa-chevron-up"></i></a>


	<script type="text/javascript">
		function searchReport() {
			var selectedFr = $("#selectFr").val();
			var from_date = $("#fromDate").val();
			var to_date = $("#toDate").val();
			$('#loader').show();

			$.getJSON('${getFlavourWiseList}', {
				fr_id_list : JSON.stringify(selectedFr),
				fromDate : from_date,
				toDate : to_date,
				ajax : 'true'

			}, function(data) {

				//alert("O/P -- " + JSON.stringify(data));

				$('#table_grid td').remove();
				$('#loader').hide();

				if (data == "") {
					alert("No records found !!");
					document.getElementById("expExcel").disabled = true;

				}
				
				var spQtyTotal = 0;
				var spValueTotal = 0;
				var crnQtyTotal = 0;
				var grnGvnAmtTotal = 0;
				var netValueGrandTotal = 0;
				var netQtyGrandTotal = 0;

				var srNo=0;
				
				
				$.each(data.flavourIdList, function(key, flvr){
					
					var tr = $('<tr style="color:red;font-weight:bold;"></tr>');
					
					tr.append($('<td style="text-align:center;"></td>')
							.html(" "));
					
					tr.append($('<td style="text-align:left;"></td>')
							.html("FLAVOUR"));
					
					/* tr.append($('<td ></td>')
							.html("" + flvr)); */

					
					 $.each(data.summaryDaoList, function(key, report1) {
						
						if (flvr == report1.spFlavourId) {
							
							tr.append($('<td  style="text-align:left;"></td>')
									.html("" + report1.spfName));
							return false;
							
						}
						
					}); 

					
					
					
					
					tr
							.append($(
									'<td  style="text-align:right;"></td>')
									.html("_"));
					tr
							.append($(
									'<td  style="text-align:right;"></td>')
									.html("_"));
					tr
							.append($(
									'<td  style="text-align:right;"></td>')
									.html("_"));
					tr
							.append($(
									'<td  style="text-align:right;"></td>')
									.html("_"));
					tr
							.append($(
									'<td  style="text-align:right;"></td>')
									.html("_"));
					tr
							.append($(
									'<td  style="text-align:right;"></td>')
									.html("_"));
					$('#table_grid tbody')
							.append(tr);
					
					
					var spQty = 0;
					var spValue = 0;
					var crnQty = 0;
					var grnGvnAmt = 0;
					var netQtyTotal = 0;
					var netValueTotal = 0;
					
					//--------------------------------------------------------
					
					$.each(data.summaryDaoList, function(key, report) {
						
						//alert("loop -- > "+report);
						
						
						if (flvr == report.spFlavourId) {
						

							//srNo = key + 1;
							srNo = srNo + 1;
							
							var tr = $('<tr></tr>');
							tr.append($('<td style="text-align:center;"></td>').html(srNo));
							tr.append($('<td  style="text-align:left;"></td>').html(report.spName));

							tr.append($('<td style="text-align:left;" ></td>').html(report.spfName));

							tr.append($('<td  style="text-align:right;"></td>')
									.html(report.spQty));

							var netQty = report.spQty - report.crnQty;
							netQtyTotal = netQtyTotal + netQty;
							netQtyGrandTotal = netQtyGrandTotal + netQty;

							var netValue = report.spValue - report.grnGvnAmt;
							netValueTotal = netValueTotal + netValue;
							netValueGrandTotal = netValueGrandTotal + netValue;

							spQty = spQty + report.spQty;
							spQtyTotal = spQtyTotal + report.spQty;
							

							tr.append($('<td  style="text-align:right;"></td>')
									.html((report.spValue).toFixed(2)));

							spValue = spValue + report.spValue;
							spValueTotal = spValueTotal + report.spValue;
							
							tr.append($('<td  style="text-align:right;"></td>')
									.html((report.crnQty)));

							crnQty = crnQty	+ report.crnQty;
							crnQtyTotal = crnQtyTotal + report.crnQty;
							
							tr.append($('<td  style="text-align:right;"></td>')
									.html((report.grnGvnAmt).toFixed(2)));

							grnGvnAmt = grnGvnAmt + report.grnGvnAmt;
							grnGvnAmtTotal = grnGvnAmtTotal + report.grnGvnAmt;

							tr.append($('<td  style="text-align:right;"></td>')
									.html(netQty.toFixed(2)));
							tr.append($('<td  style="text-align:right;"></td>')
									.html(netValue.toFixed(2)));
							$('#table_grid tbody').append(tr);
							
						}
						
					});
					
					
					
					var tr = $('<tr style="font-weight:bold;"></tr>');

					tr
							.append($(
									'<td style="font-weight:bold;"></td>')
									.html(
											" "));
					tr
							.append($(
									'<td style="font-weight:bold;"></td>')
									.html("TOTAL OF FLAVOUR"));
					
					
					 $.each(data.summaryDaoList, function(key, report1) {
							
							if (flvr == report1.spFlavourId) {
								
								tr
								.append($(
										'<td style="font-weight:bold;"></td>')
										.html("" + report1.spfName));
								return false;
								
							}
							
						}); 
					
					
					
					tr
							.append($(
									'<td  style="text-align:right;font-weight:bold;"></td>')
									.html(
											""
													+ spQty
															.toFixed(2)));
					tr
							.append($(
									'<td  style="text-align:right;font-weight:bold;"></td>')
									.html(
											""
													+ spValue
															.toFixed(2)));
					tr
							.append($(
									'<td  style="text-align:right;font-weight:bold;"></td>')
									.html(
											""
													+ crnQty
															.toFixed(2)));
					tr
							.append($(
									'<td  style="text-align:right;font-weight:bold;"></td>')
									.html(
											""
													+ grnGvnAmt
															.toFixed(2)));
					tr
							.append($(
									'<td  style="text-align:right;font-weight:bold;"></td>')
									.html(
											""
													+ netQtyTotal
															.toFixed(2)));
					tr
							.append($(
									'<td  style="text-align:right;font-weight:bold;"></td>')
									.html(
											""
													+ netValueTotal
															.toFixed(2)));
					$('#table_grid tbody')
							.append(tr);
					
					
					
					
					
					
					
				});//flavour_list
				
				

				
				
				
				var tr = $('<tr style="font-weight:bold;"></tr>');

				tr.append($(
						'<td style="font-weight:bold;"></td>')
						.html("TOTAL"));
				tr.append($(
						'<td  style="font-weight:bold;"></td>')
						.html(" "));
				
				tr.append($(
				'<td  style="font-weight:bold;"></td>')
				.html(" "));
				
				tr
						.append($(
								'<td  style="text-align:right;font-weight:bold;"></td>')
								.html(
										""
												+ spQtyTotal
														.toFixed(2)));
				tr
						.append($(
								'<td  style="text-align:right;font-weight:bold;"></td>')
								.html(
										""
												+ spValueTotal
														.toFixed(2)));
				tr
						.append($(
								'<td  style="text-align:right;font-weight:bold;"></td>')
								.html(
										""
												+ crnQtyTotal
														.toFixed(2)));
				tr
						.append($(
								'<td  style="text-align:right;font-weight:bold;"></td>')
								.html(
										""
												+ grnGvnAmtTotal
														.toFixed(2)));
				tr
						.append($(
								'<td  style="text-align:right;font-weight:bold;"></td>')
								.html(
										""
												+ netQtyGrandTotal
														.toFixed(2)));
				tr
						.append($(
								'<td  style="text-align:right;font-weight:bold;"></td>')
								.html(
										""
												+ netValueGrandTotal
														.toFixed(2)));
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
	<script type="text/javascript">
		function tableToExcel(table, name, filename) {
			let uri = 'data:application/vnd.ms-excel;base64,', template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><title></title><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--><meta http-equiv="content-type" content="text/plain; charset=UTF-8"/></head><body><table>{table}</table></body></html>', base64 = function(
					s) {
				return window.btoa(decodeURIComponent(encodeURIComponent(s)))
			}, format = function(s, c) {
				return s.replace(/{(\w+)}/g, function(m, p) {
					return c[p];
				})
			}

			if (!table.nodeType)
				table = document.getElementById(table)
			var ctx = {
				worksheet : name || 'Worksheet',
				table : table.innerHTML
			}

			var link = document.createElement('a');
			link.download = filename;
			link.href = uri + base64(format(template, ctx));
			link.click();
		}
	</script>
</body>
</html>