<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<body>

	<jsp:include page="/WEB-INF/views/include/logout.jsp"></jsp:include>

	<c:url var="getCumulativeCrn" value="/getCumulativeCrn" />
	<c:url var="excelForCreaditNote" value="/excelForCreaditNote" />

	<c:url var="excelForCreaditNoteReport" value="/exportToExcelReport" />
	<c:url value="/excelForCrnExcel" var="excelForCrnExcel" />

	<div class="container" id="main-container">

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
					<h1>
						<i class="fa fa-file-o"></i>Cumulative Crn List
					</h1>

				</div>
			</div>
			<!-- END Page Title -->

			<!-- BEGIN Main Content -->
			<div class="row">
				<div class="col-md-12">
					<div class="box">
						<div class="box-title">
							<h3>
								<i class="fa fa-bars"></i>Cumulative Crn List  
							</h3>
							<div class="box-tool">
								<a href="">Back to List</a> <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a>
							</div>

						</div>


						<div><!--  class="box-content" -->
							<form action="" class="form-horizontal" method="get"
								id="validation-form">
								
								<div class="frm_Sec_one single">
									<div class="row">
										<div class="col-md-4 box_marg">
											<label class="control-label left">From Date</label>
											<div class="controls icon_add">
											<i class="fa fa-road frm_icon" aria-hidden="true"></i>
											<input class="form-control padd_left date-picker" id="from_date" autocomplete="off"
											size="16" type="text" name="from_date" value="${fromDate}"
											required />
											</div>
									   </div>
									   
									   <div class="col-md-4 box_marg">
											<label class="control-label left">To Date</label>
											<div class="controls icon_add">
											<i class="fa fa-road frm_icon" aria-hidden="true"></i>
											<input class="form-control padd_left date-picker" id="to_date" size="16" autocomplete="off"
											type="text" value="${toDate}" name="to_date" required />
											</div>
									   </div>
									   
									   <div class="col-md-4 box_marg">
											<label class="control-label left">Franchise</label>
											<div class="controls icon_add">
											<i class="fa fa-road frm_icon" aria-hidden="true"></i>
											<select data-placeholder="Choose Franchisee"
											class="form-control padd_left chosen" multiple="multiple" tabindex="6"
											id="selectFr" name="selectFr" >
											<option value="${allFr}"><c:out value="All" /></option>
											<c:forEach items="${unSelectedFrList}" var="fr"
												varStatus="count2">
												<option value="${fr.frId}"><c:out
														value="${fr.frName}" /></option>
											</c:forEach>
										</select>
											</div>
									   </div>
									</div>
								</div>

								<div class="form-group">
									<div class="three_buttons">
										<input type="button" value="Submit" onclick="getHeader()" class="btn btn-primary">
										<input type="button" class="btn btn-primary" value="Cancel">
									</div>					
							    </div>
							</form>
							</div>

							<form action="getCrnCheckedHeaders" class="form-horizontal"
								method="post" id="validation-form">

								<div class="box">
									<div class="box-title">
										<h3>
											<i class="fa fa-table"></i>Cumulative Crn List
										</h3>
										<div class="box-tool">
											<a data-action="collapse" href="#"><i
												class="fa fa-chevron-up"></i></a>
											<!--<a data-action="close" href="#"><i class="fa fa-times"></i></a>-->
										</div>
									</div>

									<div class="box-content">
										<div class="clearfix"></div>
										
										<div class="tableFixHead">
											<table id="table1">        
											<thead style="background-color: #f3b5db;">
												<tr class="bgpink">
													<th style="text-align: center;">Sr No </th>
													<th style="text-align: left;">Date</th>
													<th style="text-align: left;">Franchise Name</th>
													<th style="text-align: left;">Taxable Amt</th>
													<th style="text-align: left;">Tax Amt</th>
													<th style="text-align: left;">Grand Amount</th>
													<th style="text-align: center;">Action</th>
												</tr>
											</thead>
										
											<tbody>
											</tbody>
											</table>
										</div>
										
										
										

										</div>
										
									</div>
								
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- END Main Content -->
			<footer>
				<p>2019 © MONGINIS.</p>
			</footer>


			<a id="btn-scrollup" class="btn btn-circle btn-lg" href="#"><i
				class="fa fa-chevron-up"></i></a>
		</div>
		<!-- END Content -->
	</div>
	<!-- END Container -->

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
	<script
		src="${pageContext.request.contextPath}/resources/assets/flot/jquery.flot.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/flot/jquery.flot.resize.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/flot/jquery.flot.pie.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/flot/jquery.flot.stack.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/flot/jquery.flot.crosshair.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/flot/jquery.flot.tooltip.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/sparkline/jquery.sparkline.min.js"></script>

	<!--page specific plugin scripts-->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/jquery-validation/dist/jquery.validate.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/jquery-validation/dist/additional-methods.min.js"></script>

	<!--flaty scripts-->
	<script src="${pageContext.request.contextPath}/resources/js/flaty.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/flaty-demo-codes.js"></script>
	<!--page specific plugin scripts-->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-fileupload/bootstrap-fileupload.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/chosen-bootstrap/chosen.jquery.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/clockface/js/clockface.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-timepicker/js/bootstrap-timepicker.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-colorpicker/js/bootstrap-colorpicker.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-daterangepicker/date.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-daterangepicker/daterangepicker.js"></script>

	<script type="text/javascript">
		function getHeader() {

			var fromDate = $("#from_date").val();
			var toDate = $("#to_date").val();
			var selectedFr = $("#selectFr").val();
			$
					.getJSON(
							'${getCumulativeCrn}',
							{
								fromDate : fromDate,
								toDate : toDate,
								fr_id_list : JSON.stringify(selectedFr),
								ajax : 'true',

							},
							function(data) {
								//alert(data);
								var len = data.length;

								$('#table1 td').remove();

								$
										.each(
												data,
												function(key, headers) {

													var tr = $('<tr></tr>');

													tr.append($('<td></td>')
															.html(key + 1));

												/* 	tr
															.append($('<td><input type=checkbox name="select_to_agree" id="select_to_agree'+key+'"  value='+headers.crnId+'></td>'));
 */
													tr
															.append($(
																	'<td></td>')
																	.html(
																			headers.crnDate));

												
													tr
															.append($(
																	'<td></td>')
																	.html(
																			headers.frName));

													tr
															.append($(
																	'<td></td>')
																	.html(
																			headers.crnTaxableAmt));

													tr
															.append($(
																	'<td></td>')
																	.html(
																			headers.crnTotalTax));

													tr
															.append($(
																	'<td></td>')
																	.html(
																			headers.crnGrandTotal));
                                                  var crnId=headers.crnNo+"";
													tr
															.append($('<td ><a href="#" class="action_btn" onclick="genPdf(['
																	+ crnId
																	+ '])">PDF</a></td>'));

													$('#table1 tbody').append(
															tr);

												})

							});

		}
	</script>

	<script type="text/javascript">
		function getCrnDetail(crnId) {
			//alert("HIII");
			//alert("header ID "+headerId)

			//alert("HHHHHH");
			var form = document.getElementById("validation-form");
			form.action = "${pageContext.request.contextPath}/getCrnDetailList/"
					+ crnId;
			form.submit();
		}
	</script>
	<script>
	
	function createExelHsnwise() {
		 
	   var select_to_print = document.forms[1];
		var txt = "";
		var i;
		var flag=0;
		var all=0;
		 for (i = 0; i < select_to_print.length; i++) {
			if (select_to_print[i].checked  && select_to_print[i].value!="on") {
	    		txt = txt + select_to_print[i].value + ",";
	    		flag=1;
		}
		} 
		 if(flag==1)
			 {
		$
				.getJSON(
						'${excelForCrnExcel}',
						{
							checkboxes : txt ,
						
							ajax : 'true'
						},
						function(data) {
							
						 //alert("Excel Ready");
							 exportToExcel();
						 
						});
			 }
		 else
			 {
			 alert("Please select minimum 1 CRN Note ");
			 }

	}
	</script>
	<script>
		function genPdf(selArray) {
			
			window.open('${pageContext.request.contextPath}/pdf?url=pdf/getCrnCumulativeHeaders/'+ selArray);
		}

		function genPdfReport() {
			//alert("Inside Gen Pdf ");
			checkboxes = document.getElementsByName('select_to_agree');
			var fromDate = $("#from_date").val();
			var toDate = $("#to_date").val();
			var selArray;

			for (var x = 0; x < checkboxes.length; x++) {
				if (document.getElementById("select_to_agree" + x).checked == true) {
					if (x == 0) {
						selArray = document.getElementById("select_to_agree"
								+ x).value;
					} else {
						selArray = selArray
								+ ","
								+ document
										.getElementById("select_to_agree" + x).value;
					}
				}

			}

			//var check = document.getElementById("select_to_agree").value;

			/*  var str =selArray;

			 str = str.replace(/^,|,$|,(?=,)/g, '');
			 alert(str); */
			window.open('${pageContext.request.contextPath}/genCrnReport/'
					+ selArray + '/' + fromDate + '/' + toDate);

			// window.open('${pageContext.request.contextPath}/getGrnPdf/'+fromDate+'/'+'/'+toDate+'/'+headerId+'/'+1);

		}

		function selectBillNo(source) {
			checkboxes = document.getElementsByName('select_to_agree');

			for (var i = 0, n = checkboxes.length; i < n; i++) {
				checkboxes[i].checked = source.checked;
			}

		}
		function createExel() {

			checkboxes = document.getElementsByName('select_to_agree');

			var flag = 0;
			var selArray = "";

			for (var x = 0; x < checkboxes.length; x++) {

				if (document.getElementById("select_to_agree" + x).checked == true) {
					flag = 1;
					if (selArray == "")
						selArray = document.getElementById("select_to_agree"
								+ x).value;
					else
						selArray = selArray
								+ ","
								+ document
										.getElementById("select_to_agree" + x).value;

				}

			}

			if (flag == 1) {
				$.getJSON('${excelForCreaditNote}', {
					checkboxes : selArray,
					ajax : 'true'
				}, function(data) {

					exportToExcel();

				});
			} else {
				alert("Select Minimum 1  ");
			}

		}

		function exportToExcel() {

			window.open("${pageContext.request.contextPath}/exportToExcel");
		}

		//new code excel Report

		function createExelReport() {

			checkboxes = document.getElementsByName('select_to_agree');

			var flag = 0;
			var selArray = "";

			for (var x = 0; x < checkboxes.length; x++) {

				if (document.getElementById("select_to_agree" + x).checked == true) {
					flag = 1;
					if (selArray == "")
						selArray = document.getElementById("select_to_agree"
								+ x).value;
					else
						selArray = selArray
								+ ","
								+ document
										.getElementById("select_to_agree" + x).value;

				}

			}
			if (flag == 1) {
				$.getJSON('${excelForCreaditNoteReport}', {
					checkboxes : selArray,
					ajax : 'true'
				}, function(data) {

					exportToExcel();

				});
			} else {
				alert("Select Minimum 1  ");
			}

		}

		/* function exportToExcel()
		 {
		
		 window.open("${pageContext.request.contextPath}/exportToExcel"); 
		 } */
	</script>

</body>
</html>
