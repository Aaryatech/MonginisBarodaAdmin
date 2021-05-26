<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<body onload="getHeader()">

	<jsp:include page="/WEB-INF/views/include/logout.jsp"></jsp:include>

	<c:url var="getHeaders" value="/getHeaders" />
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
						<i class="fa fa-file-o"></i>Credit Note Header
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
								<i class="fa fa-bars"></i>View Credit Note Header
							</h3>
							<div class="box-tool">
								<a href="">Back to List</a> <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a>
							</div>

						</div>


						<div class="box-content">
							<form action="" class="form-horizontal" method="get"
								id="validation-form">



								<div class="frm_Sec_one single">
									<div class="row">
										
											<div class="col-md-2 box_marg">
												<label class="control-label left">From Date</label>
												<div class="controls icon_add">
													<i class="fa fa-calendar frm_icon" aria-hidden="true"></i>
													<input class="form-control padd_left date-picker" id="from_date" autocomplete="off"
											size="16" type="text" name="from_date" value="${todaysDate}"
											required />
												</div>
											</div>
											
											
											<div class="col-md-2 box_marg">
												<label class="control-label left">From Date</label>
												<div class="controls icon_add">
													<i class="fa fa-calendar frm_icon" aria-hidden="true"></i>
													<input class="form-control padd_left date-picker" id="to_date" size="16" autocomplete="off"
											type="text" value="${todaysDate}" name="to_date" required />
												</div>
											</div>

										<div class="col-md-5 box_marg">
											<label class="control-label left">Franchise</label>
											<div class="controls icon_add">
												<i class="fa fa-user frm_icon" aria-hidden="true"></i> <select
													data-placeholder="Choose Franchisee"
													class="form-control chosen" multiple="multiple"
													tabindex="6" id="selectFr" name="selectFr"
													onchange="getDate()">
													<option selected value="-1"><c:out value="All" /></option>

													<c:forEach items="${unSelectedFrList}" var="fr"
														varStatus="count2">
														<option value="${fr.frId}"><c:out
																value="${fr.frName}" /></option>
													</c:forEach>

												</select>

											</div>
										</div>


										<div class="col-md-2 box_marg">
											<label class="control-label left">Type</label>
											<div class="controls icon_add">
												<i class="fa fa-stack-exchange frm_icon" aria-hidden="true"></i>
												<select data-placeholder="Choose Franchisee"
											class="form-control chosen" tabindex="6" id="isGrn"
											name="isGrn">
											<option value="-1">All</option>
											<option value="1">Is GRN</option>
											<option value="0">IS GVN</option>


										</select>
											</div>
										</div>




									</div>
									</div>
								


								<%-- <div class="form-group">
									<label class="col-sm-3 col-lg-2 control-label">From
										Date</label>
									<div class="col-sm-5 col-lg-3 controls">
										<input class="form-control  date-picker" id="from_date" autocomplete="off"
											size="16" type="text" name="from_date" value="${todaysDate}"
											required />
									</div>
									<!-- </div>


								<div class="form-group"> -->
									<label class="col-sm-3 col-lg-2 control-label">To Date</label>
									<div class="col-sm-5 col-lg-3 controls">
										<input class="form-control date-picker" id="to_date" size="16" autocomplete="off"
											type="text" value="${todaysDate}" name="to_date" required />
									</div>

									<!-- <div
										class="col-sm-25 col-sm-offset-3 col-lg-30 col-lg-offset-0">
										<input type="button" value="Submit" onclick="getHeader()"
											class="btn btn-primary">

									</div> -->
								</div>

								<div class="form-group">
									<label class="col-sm-3 col-lg-2 control-label">Franchise</label>

									<div class="col-sm-5 col-lg-3 controls">

										<select data-placeholder="Choose Franchisee"
											class="form-control chosen" multiple="multiple" tabindex="6"
											id="selectFr" name="selectFr" onchange="getDate()">
											<option selected value="-1"><c:out value="All" /></option>

											<c:forEach items="${unSelectedFrList}" var="fr"
												varStatus="count2">
												<option value="${fr.frId}"><c:out
														value="${fr.frName}" /></option>
											</c:forEach>

										</select>
									</div>

									<label class="col-sm-3 col-lg-2 control-label">Is
										Grn/Gvn</label>

									<div class="col-sm-5 col-lg-3 controls">

										<select data-placeholder="Choose Franchisee"
											class="form-control chosen" tabindex="6" id="isGrn"
											name="isGrn">
											<option value="-1">All</option>
											<option value="1">Is GRN</option>
											<option value="0">IS GVN</option>


										</select>
									</div> --%>
									<div class="row">
								<div align="center" id="loader" style="display: none">

									<span>
										<h4>
											<font color="#343690">Loading</font>
										</h4>
									</span> <span class="l-1"></span> <span class="l-2"></span> <span
										class="l-3"></span> <span class="l-4"></span> <span
										class="l-5"></span> <span class="l-6"></span>
								</div>
						</div>

									<div
										class="col-sm-25 col-sm-offset-3 col-lg-30 col-lg-offset-0" style="margin-inline: 800px; margin-top: 10px;">
										<input type="button" value="Submit" onclick="getHeader()"
											class="btn btn-primary">

									</div>

									</form>
								</div>

							

							<form action="getCrnCheckedHeaders" class="form-horizontal"
								method="post" id="validation-form">

								<div class="box">
									<div class="box-title">
										<h3>
											<i class="fa fa-table"></i> Crn List
										</h3>
										<div class="box-tool">
											<a data-action="collapse" href="#"><i
												class="fa fa-chevron-up"></i></a>
											<!--<a data-action="close" href="#"><i class="fa fa-times"></i></a>-->
										</div>
									</div>

									<div class="box-content">
<jsp:include page="/WEB-INF/views/include/tableSearch.jsp"></jsp:include>

					
										<div class="clearfix"></div>
										<div class="table-responsive" style="border: 0">
											<table width="100%"
												class="table table-advance table-responsive table-position"
												id="table1">
												<thead  style="background-color:#f3b5db; ">
													<tr>
														<th></th>
														<th>Sr No <input type="checkbox"
															onClick="selectBillNo(this)" /></th>
														<th class="col-md-1" style="text-align: center;">Date</th>
														<th class="col-md-2" style="text-align: center;" >Crdit Note No</th>
														<th class="col-md-2" style="text-align: center;" >Franchise Name</th>
														<th class="col-md-2" style="text-align: center;" >Taxable Amt</th> 
														<th class="col-md-2" style="text-align: center;" >Tax Amt</th>
														<th class="col-md-2" style="text-align: center;" >total</th>
														<th class="col-md-2" style="text-align: center;" >Action</th>

													</tr>

												</thead>
												<tbody>
											</table>
										</div>

									<!-- 	<div class="form-group">
											<label class="col-sm-3 col-lg-2 control-label"> </label>
											<div class="col-sm-2 col-lg-2 controls">
												<input type="button" value="PDF Report "
													onclick="genPdfReport()" class="btn btn-primary">
											</div>

											<div class="col-sm-5 col-lg-1 controls">
												<input type="button" id="expExcel" class="btn btn-primary"
													value="Excel Report" onclick="createExelReport();">
											</div>

											<label class="col-sm-3 col-lg-2 control-label"></label>
											<div class="col-sm-2 col-lg-3 controls">
												<input type="button" value="Generate PDF For Franchise"
													onclick="genPdf()" class="btn btn-primary">
											</div>


											<div class="col-sm-5 col-lg-1 controls">
												<input type="button" id="expExcel" class="btn btn-primary"
													value="EXPORT TO Excel For ERP" onclick="createExel();">

											</div>

										</div> -->
										<div class="form-group" style="padding: 10px;" >
											<div class="col-sm-2 col-lg-2 controls" style="display: none;" >
												<input type="button" value="PDF Report "
													onclick="genPdfReport()" class="btn btn-primary">
											</div>

											<div class="col-sm-5 col-lg-1 controls">
												<input type="button" id="expExcel" class="btn btn-primary"
													value="Excel Report" onclick="createExelReport();">
											</div>

											<label class="col-sm-3 col-lg-1 control-label"></label>
											<div class="col-sm-2 col-lg-2 controls">
												<input type="button" value="Generate PDF For Franchisee"
													onclick="genPdf()" class="btn btn-primary">
											</div>


											<div class="col-sm-5 col-lg-3 controls" style="display: none;" >
												<input type="button" id="expExcel" class="btn btn-primary"
													value="EXP TO Excel Itemwise(ERP)" onclick="createExel();">
											</div>
											<div class="col-sm-2 col-lg-2 controls" style="display: none;">
												<input type="button" id="expExcel" class="btn btn-primary"
													value="Excel Hsnwise Summary"
													onclick="createExelHsnwise();">
											</div>
										</div>
										


										<!-- <div class="form-group">
										
										<div
											class="col-sm-25 col-sm-offset-3 col-lg-30 col-lg-offset-5">
											<input type="button" value="Generate PDF Franchise" onclick="genPdf()"
												class="btn btn-primary">
												<input type="button" id="expExcel" class="btn btn-primary" value="EXPORT TO Excel Franchise" onclick="createExel();" >
										</div>
										
										
										<div
											class="col-sm-25 col-sm-offset-3 col-lg-30 col-lg-offset-5">
											<input type="button" value="Generate Report PDF" onclick="genPdfReport()"
												class="btn btn-primary">
												<input type="button" id="expExcel" class="btn btn-primary" value="EXPORT TO Excel Report" onclick="createExelReport();" >
										</div>
										</div> -->

										<!-- </form> -->
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
			var isGrn = $("#isGrn").val();
			
			$('#loader').show();
			$
					.getJSON(
							'${getHeaders}',
							{
								fromDate : fromDate,
								toDate : toDate,
								fr_id_list : JSON.stringify(selectedFr),
								isGrn :isGrn,
								ajax : 'true',

							},
							function(data) {
								var len = data.length;
								$('#loader').hide();
								if(data.length<=0){
									alert("No Record Found!!!!")
								}

								$('#table1 td').remove();

								$
										.each(
												data,
												function(key, headers) {

													var tr = $('<tr></tr>');

													tr.append($('<td></td>')
															.html(key + 1));

													tr
															.append($('<td><input type=checkbox name="select_to_agree" id="select_to_agree'+key+'"  value='+headers.crnId+'></td>'));

													tr
															.append($(
																	'<td></td>')
																	.html(
																			headers.crnDate));

													tr
															.append($(
																	'<td></td>')
																	.html(
																			headers.crnNo));

													tr
															.append($(
																	'<td></td>')
																	.html(
																			headers.frName));

													tr
															.append($(
																	'<td style="text-align: right;" ></td>')
																	.html(
																			headers.crnTaxableAmt));

													tr
															.append($(
																	'<td style="text-align: right;" ></td>')
																	.html(
																			headers.crnTotalTax));

													tr
															.append($(
																	'<td style="text-align: right;" ></td>')
																	.html(
																			headers.crnGrandTotal));

													tr
															.append($('<td ><a href="#" class="action_btn" onclick="getCrnDetail('
																	+ headers.crnId
																	+ ')"><abbr title="Detail"><i class="fa fa-list"></i></abbr></a></td>'));

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
		function genPdf() {
			//alert("Inside Gen Pdf ");
			checkboxes = document.getElementsByName('select_to_agree');

			var selArray;
			var flag = 0;
			for (var x = 0; x < checkboxes.length; x++) {
				if (document.getElementById("select_to_agree" + x).checked == true) {
					flag = 1;
					
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
				if (flag == 1) {
					window
					.open('${pageContext.request.contextPath}/pdf?url=pdf/getCrnCheckedHeaders/'
							+ selArray);
				} else {
					alert("Select Minimum Single Creadit Note  ");
				}

	

			// window.open('${pageContext.request.contextPath}/getGrnPdf/'+fromDate+'/'+'/'+toDate+'/'+headerId+'/'+1);

		}

		function genPdfReport() {
			//alert("Inside Gen Pdf ");
			checkboxes = document.getElementsByName('select_to_agree');
			var fromDate = $("#from_date").val();
			var toDate = $("#to_date").val();
			var selArray;
			var flag = 0;
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
				alert("Select Minimum Single Creadit Note  ");
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
				alert("Select Minimum Single Credit Note  ");
			}

		}

		/* function exportToExcel()
		 {
		
		 window.open("${pageContext.request.contextPath}/exportToExcel"); 
		 } */
	</script>

</body>
</html>
