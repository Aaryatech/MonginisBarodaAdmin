<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/include/logout.jsp"></jsp:include>
<head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/tableSearch.css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
table {
	width: 100%;
	border: 1px solid #ddd;
}
</style>
</head>
<body>

    <c:url var="deleteRegSpOrder" value="/deleteRegSpByIdAjax" />
	<c:url var="regSpCakeListProcess" value="/regSpCakeListProcess" />
	<c:url var="saveSpOrder" value="/saveSpOrder" />
	<c:url var="updateRegSpCKByIdAjax" value="/updateRegSpCKByIdAjax" />
	<c:url var="updateBillStatusForSp" value="/updateBillStatusForSp" />
	<c:url value="/getAllMenusForjsp" var="getAllMenusForjsp"></c:url>
	<c:url value="/RegSpOrderMenusSectionAjax"
		var="RegSpOrderMenusSectionAjax"></c:url>



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
			<!-- 	<div class="page-title">
				<div>
					<h1>
						<i class="fa fa-file-o"></i> Special Cake Orders
					</h1>

				</div>
			</div> -->
			<!-- END Page Title -->



			<c:set var="isEdit" value="0">
			</c:set>
			<c:set var="isView" value="0">
			</c:set>
			<c:set var="isDelete" value="0">
			</c:set>

			<input type="hidden" id="modList"
				value="${sessionScope.newModuleList}">

			<c:forEach items="${sessionScope.newModuleList}" var="modules">
				<c:forEach items="${modules.subModuleJsonList}" var="subModule">

					<c:choose>
						<c:when test="${subModule.subModuleMapping eq 'spCakeOrders'}">

							<c:choose>
								<c:when test="${subModule.editReject=='visible'}">
									<c:set var="isEdit" value="1">
									</c:set>
								</c:when>
								<c:otherwise>
									<c:set var="isEdit" value="0">
									</c:set>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${subModule.view=='visible'}">
									<c:set var="isView" value="1">
									</c:set>
								</c:when>
								<c:otherwise>
									<c:set var="isView" value="0">
									</c:set>
								</c:otherwise>
							</c:choose>


							<c:choose>
								<c:when test="${subModule.deleteRejectApprove=='visible'}">
									<c:set var="isDelete" value="1">
									</c:set>
								</c:when>
								<c:otherwise>
									<c:set var="isDelete" value="0">
									</c:set>
								</c:otherwise>
							</c:choose>

						</c:when>
					</c:choose>
				</c:forEach>
			</c:forEach>

			<input type="hidden" id="isDelete" value="${isDelete}"> <input
				type="hidden" id="isEdit" value="${isEdit}"> <input
				type="hidden" id="url" value="${url}">
			<!-- BEGIN Main Content -->
			<div class="row">
				<div class="col-md-12">
					<div class="box">
						<div class="box-title">
							<h3>
								<i class="fa fa-bars"></i>Regular Special Cake Report List
							</h3>

						</div>


						<div>
							<!-- class="box-content" -->
							<form action="${pageContext.request.contextPath}/showEditSpOrder" class="form-horizontal" method="post" id="sp_order_view_form">
								<!-- action="spCakeOrderProcess" -->
				<input type="hidden" id="editspOrderNo" name="editspOrderNo" value="0">

								<div class="frm_Sec_one single">
									<div class="row">
									
									<div class="col-md-6 box_marg">
											<label class="control-label left">From Date</label>
											<div class="controls icon_add">
												<i class="fa fa-road frm_icon" aria-hidden="true"></i> <input
													class="form-control padd_left date-picker"
													value="${todayDate }" id="dp1" size="16" type="text"
													name="prod_date" data-rule-required="true" /> </select>
											</div>
										</div>
										
										<div class="col-md-6 box_marg">
											<label class="control-label left">To Date</label>
											<div class="controls icon_add">
												<i class="fa fa-road frm_icon" aria-hidden="true"></i> <input
													class="form-control padd_left date-picker"
													value="${todayDate }" id="dp2" size="16" type="text"
													name="prod_date" data-rule-required="true" /> </select>
											</div>
										</div>
									
											<div class="col-md-6 box_marg">
											<label class="control-label left">Section</label>
											<div class="controls icon_add">
												<i class="fa fa-road frm_icon" aria-hidden="true"></i> <select
													data-placeholder="Choose Section"
													class="form-control padd_left chosen" tabindex="6"
													id="section" name="section" onchange="getMenus(this.value)">
													<!-- <option value="-1">All</option> -->
													<option value="">Select Section</option>
													<c:forEach items="${section}" var="section"
														varStatus="count">
														<option value="${section.sectionId}"><c:out
																value="${section.sectionName}" /></option>
													</c:forEach>
												</select>
											</div>
										</div>

										<div class="col-md-6 box_marg">
											<label class="control-label left">Menu</label>
											<div class="controls icon_add">
												<i class="fa fa-road frm_icon" aria-hidden="true"></i> <select
													name="spMenuId" class="form-control padd_left chosen"
													data-placeholder="Menu" id="spMenuId" multiple="multiple"
													onchange="selMenus()" required>
													<option value="-1">Select All</option>
<%-- 													<c:forEach items="${allMenuList}" var="allMenuList" --%>
<%-- 														varStatus="count"> --%>
<%-- 														<option value="${allMenuList.menuId}"><c:out --%>
<%-- 																value="${allMenuList.menuTitle}" /></option> --%>
<%-- 													</c:forEach>	 --%>
												</select>
											</div>
										</div>
									
										<div class="col-md-6 box_marg">
											<label class="control-label left">Franchisee</label>
											<div class="controls icon_add">
												<i class="fa fa-road frm_icon" aria-hidden="true"></i> <select
													data-placeholder="Select Franchisee"
													class="form-control padd_left chosen" multiple="multiple"
													tabindex="6" name="fr_id" id="fr_id"
													onchange="disableRoute()">
													<option value="0">All</option>
													<c:forEach items="${franchiseeList}" var="franchiseeList">
														<option value="${franchiseeList.frId}">${franchiseeList.frName}</option>
													</c:forEach>
												</select>
											</div>
										</div>

										<div class="col-md-6 box_marg" style="display: none;">
											<label class="control-label left">Route</label>
											<div class="controls icon_add">
												<i class="fa fa-road frm_icon" aria-hidden="true"></i> <select
													data-placeholder="Select Route"
													class="form-control padd_left chosen" name="selectRoute"
													id="selectRoute" onchange="disableFr()">
													<option value="0">Select Route</option>
													<c:forEach items="${routeList}" var="route"
														varStatus="count">
														<option value="${route.routeId}"><c:out
																value="${route.routeName}" />
														</option>
													</c:forEach>
												</select>
											</div>
										</div>

								

										
										
										

									</div>
								</div>


								<div class="form-group">
									<div class="three_buttons">
										<input class="btn btn-primary" type="button" value="Search"
											id="callSubmit" onclick="callSearch()">
									
									</div>
								</div>



								<div class="box-content">
									<div class="" style="margin: 0 0 15px 0;">
										<div class="col-md-9">&nbsp;</div>
										<label for="search" class="col-md-3" id="search"> <i
											class="fa fa-search"></i> <input type="text"
											style="border-radius: 25px;" id="myInput"
											onkeyup="myFunction()" style="border-radius: 25px;"
											placeholder="Search by SlipNo or Name">
										</label>
									</div>
									<div class="clr"></div>
								</div>



								<div align="center" id="loader" style="display: none">
									<span>
										<h4>
											<font color="#343690">Loading</font>
										</h4>
									</span> <span class="l-1"></span> <span class="l-2"></span> <span
										class="l-3"></span> <span class="l-4"></span> <span
										class="l-5"></span> <span class="l-6"></span>
								</div>


								<div class="box">

									<c:set var="dis" value="none" />

									<div class="box-content">

										<div class="clearfix"></div>

										<div class="tableFixHead">
											<table id="table1">
												<thead style="background-color: #f3b5db;">
													<tr>
									                    <th class="col-sm-1"><input type="checkbox"
															onClick="selectOrderIdNo(this)" id="all" /> All</th>
														<th width="148" style="width: 18px" align="left">Sr</th>
														<th width="180" style="text-align: center;">Franchisee Name</th>
														<th width="208" style="text-align: center;">Product Name</th>
														<th width="183" style="text-align: center;">Qty</th>
														<th width="159" style="text-align: center;"><span
															style="width: 130px; text-align: center;">Customer Name</span></th>														
														<th width="105" style="text-align: center;">Mobile No</th>													
														<th width="100" style="text-align: center;">Action</th>
													
													<!-- 	<th width="47" style="text-align: center;">PDF</th> -->
														


													</tr>
												</thead>

												<tbody>

							
												</tbody>
											</table>
										</div>


    <div class="form-group">
		<div class="three_buttons">
			<input type="button" class="btn btn-primary" value="Delete" disabled="disabled" id="calldelete" onclick="deleteMultipleOrder()">
	</div>
		</div>

									</div>
								</div>

								<div class="a" id="range" style="display: <c:out value="${dis}" />;">
<!-- 									<div class="frm_Sec_one single"> -->
<!-- 										<div class="row"> -->
<!-- 											<div class="col-md-6 box_marg"> -->
<!-- 												<label class="control-label left">Range From</label> -->
<!-- 												<div class="controls icon_add"> -->
<!-- 													<i class="fa fa-road frm_icon" aria-hidden="true"></i> <input -->
<!-- 														type="text" class="form-control padd_left" id="from" -->
<!-- 														placeholder="from"> -->
<!-- 												</div> -->
<!-- 											</div> -->

<!-- 											<div class="col-md-6 box_marg"> -->
<!-- 												<label class="control-label left">Range to</label> -->
<!-- 												<div class="controls icon_add"> -->
<!-- 													<i class="fa fa-road frm_icon" aria-hidden="true"></i> <input -->
<!-- 														type="text" class="form-control padd_left" id="to" -->
<!-- 														placeholder="to"> -->
<!-- 												</div> -->
<!-- 											</div> -->
<!-- 										</div> -->
<!-- 									</div> -->

									<div class="form-group">
										<div class="three_buttons">
											<input type="button" id="from" class="btn btn-primary"
												value="PDF IN RANGE DOT MATRIX"
												onclick="inRangePdfForDotMatrix();">
												<input type="button" id="from" class="btn btn-primary"
												value="PDF IN RANGE "
												onclick="inRangePdf();"> <input
												type="button" class="btn btn-primary"
												value="Add To Production" disabled="disabled" id="addtoprod"
												onclick="updateBillGenStatusToProd()"> <input
												type="button" id="expExcel" class="btn btn-primary"
												value="Export To Excel" onclick="exportToExcel();"
												disabled="disabled">

										</div>
									</div>

								</div>



							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- END Main Content -->
			<jsp:include page="/WEB-INF/views/include/copyrightyear.jsp"></jsp:include>

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
		$('#from').on(
				'input',
				function() {
					this.value = this.value.replace(/[^0-9]/g, '').replace(
							/(\..*)\./g, '$1');
				});
		$('#to').on(
				'input',
				function() {
					this.value = this.value.replace(/[^0-9]/g, '').replace(
							/(\..*)\./g, '$1');
				});

		function validate() {

			var selectedFr = $("#fr_id").val();
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
		function selMenus() {
			//alert("Hiii")
			var mId = $("#spMenuId").val();
			//alert(mId);
			if (mId == -1) {
				// alert("Sel All")

				$
						.getJSON(
								'${getAllMenusForjsp}',
								{

									ajax : 'true'
								},
								function(data) {
									//alert(JSON.stringify(data));
									var html = '<option value="-1">Select All</option>';
									//alert(JSON.stringify(data));
									var len = data.length;

									for (var i = 0; i < len; i++) {
										html += '<option selected value="' + data[i].menuId + '">'
												+ data[i].menuTitle
												+ '</option>';
									}
									html += '</option>';
									$('#spMenuId').html(html);
									$("#spMenuId").trigger("chosen:updated");

								});

			}

		}
	</script>

	<script type="text/javascript">
		function callSearch() {

			var isDelete = document.getElementById("isDelete").value;
			var isEdit = document.getElementById("isEdit").value;

			var isValid = validate();
			if (isValid == true) {

				var frIds = $("#fr_id").val();
				var spMenuId = $("#spMenuId").val();
				var array = [];
				var routeIds = $("#selectRoute").val();
				var URL = $("#url").val(); 
				var fromDate = document.getElementById("dp1").value;
				var toDate = document.getElementById("dp2").value;
				$('#loader').show();

				$
						.getJSON(
								'${regSpCakeListProcess}',
								{
									fr_id_list : JSON.stringify(frIds),
									fromDate : fromDate,
									toDate : toDate,
									route_id : routeIds,
									spMenuId : JSON.stringify(spMenuId),
									ajax : 'true',
								},
								function(data) {
									//alert(JSON.stringify(data))
									$('#table1 td').remove();
									$('#loader').hide();
									if (data == "") {
										alert("No Orders Found");
										document.getElementById("expExcel").disabled = true;
										document.getElementById("addtoprod").disabled = true;

									}
									$
											.each(
													data,
													function(key, RegSpCakeReportResponse1) {
														
												 		document.getElementById("expExcel").disabled = false;
														document.getElementById("addtoprod").disabled = false;
														document.getElementById('range').style.display='block'; 
														var len = data.length
														//alert(JSON.stringify(spCakeOrder))
														var tr = $('<tr></tr>');
														
														tr
														.append($(
																'<td class="col-sm-1"></td>')
																.html(
																		"<input type='checkbox' name='rspid' class='selorder' id="+RegSpCakeReportResponse1.rspId+"   value="+RegSpCakeReportResponse1.rspId+">"));

											         	tr
														.append($(
																'<td></td>')
																.html(
																		key + 1));	
														
																									
														tr
																.append($(
																		'<td></td>')
																		.html(
																				RegSpCakeReportResponse1.frName));
													
														
														
														tr
																.append($(
																		'<td></td>')
																		.html(
																				RegSpCakeReportResponse1.itemName));
														
													
														
														if (isEdit == 1 && RegSpCakeReportResponse1.isBillGenerated>2) {
															tr
																	.append($(
																			'<td></td>')
																			.html(
																					"<input type='number' onkeypress='return IsNumeric(event);' ondrop='return false;' onpaste='return false;' style='text-align: right;    height: 24px;' class='form-control' min='0' id=qty"
																							+ RegSpCakeReportResponse1.rspId
																							+ " value="
																							+ RegSpCakeReportResponse1.qty
																							+ " disabled='disabled' >"));

														} else {
															tr
																	.append($(
																			'<td></td>')
																			.html(
																					"<input type='number' onkeypress='return IsNumeric(event);'  ondrop='return false;' onpaste='return false;' style='text-align: right;    height: 24px;' class='form-control' min='0' id=qty"
																							+ RegSpCakeReportResponse1.rspId
																							+ " value="
																							+ RegSpCakeReportResponse1.qty
																							+ "  disabled='disabled' >"));

														}
														
														tr
														.append($(
																'<td></td>')
																.html(
																		RegSpCakeReportResponse1.rspCustName));
														
														tr
														.append($(
																'<td></td>')
																.html(
																		RegSpCakeReportResponse1.rspCustMobileNo));
														
														
														if (RegSpCakeReportResponse1.isEdit == 2) {
															tr
																	.append($(
																			'<td></td>')
																			.html());

														} else {
															if (isDelete == 1) {
																tr
																		.append($(
																				'<td></td>')
																				.html(
																						' <a>   <span class="glyphicon glyphicon-edit" id="edit'
																								+ RegSpCakeReportResponse1.rspId
																								+ '" onClick=editQty('
																								+ RegSpCakeReportResponse1.rspId
																								+ ');> </span> </a><a><span class="glyphicon glyphicon-remove" id="delete'
																								+ RegSpCakeReportResponse1.rspId
																								+ '" onClick=deleteOrder('
																								+ RegSpCakeReportResponse1.rspId
																								+ ');> </span></a>'));

															} else {
																tr
																		.append($(
																				'<td></td>')
																				.html(
																						' <a>  <span class="glyphicon glyphicon-edit" id="edit'
																								+ RegSpCakeReportResponse1.rspId
																								+ '" onClick=editQty('
																								+ RegSpCakeReportResponse1.rspId
																								+ ');> </span> </a><a><span class="glyphicon glyphicon-remove" id="delete'
																								+ RegSpCakeReportResponse1.rspId
																								+ '" onClick=deleteOrder('
																								+ RegSpCakeReportResponse1.rspId
																								+ ');> </span></a>'));
															}
														}
												$('#table1 tbody')
														.append(tr);
												})

													});

			}
		}

		
		function editQty(rspId) {
			var state = document.getElementById("qty" + rspId).disabled;
			var textId = document.getElementById("qty" + rspId).value;

			//document.getElementById(orderId).disabled=false;
			if (state) {
				$("#edit" + rspId).removeClass("glyphicon glyphicon-edit");
				$("#edit" + rspId).addClass("glyphicon glyphicon-ok");
				document.getElementById("qty" + rspId).disabled = false;

			} else {
				$("#edit" + rspId).removeClass("glyphicon glyphicon-ok");
				$("#edit" + rspId).addClass("glyphicon glyphicon-edit");
				document.getElementById("qty" + rspId).disabled = true;
				$.getJSON('${updateRegSpCKByIdAjax}', {

					rspId : rspId,
					qty : textId,

					ajax : 'true'

				});
			}
		}
		
		
		function inRangePdf() {
			var to = document.getElementById("to").value;

			var from = document.getElementById("from").value;

			if (from == null || from == "") {
				alert("Enter to from");
			} else if (to == null || to == "") {
				alert("Enter to no");
			} else {

				window
						.open("${pageContext.request.contextPath}/showSpcakeOrderPdfInRange/"
								+ from + "/" + to);

			}
		}

		function inRangePdfForDotMatrix() {
			var to = document.getElementById("to").value;

			var from = document.getElementById("from").value;

			if (from == null || from == "") {
				alert("Enter to from");
			} else if (to == null || to == "") {
				alert("Enter to no");
			} else {

				window
						.open("${pageContext.request.contextPath}/showSpcakeOrderPdfInRangeForDotMatrix/"
								+ from + "/" + to);

			}
		}
	</script>
	<script type="text/javascript">
		function deleteOrder(rspId) {
			$('#loader').show();
			var URL = $("#url").val();
			if (confirm("Do you want to Delete this order?") == true) {
				$
						.getJSON(
								'${deleteRegSpOrder}',
								{
									rspId : rspId,
									ajax : 'true',
								},
								function(data) {
									$('#table1 td').remove();
									$('#loader').hide();
									if (data == "") {
										alert("No Orders Found");
										document.getElementById("expExcel").disabled = true;
										document.getElementById("addtoprod").disabled = true;

									}
									callSearch();
									$
											.each(
													data,
													function(key, spCakeOrder) {
														document
																.getElementById("expExcel").disabled = false;
														document
																.getElementById("addtoprod").disabled = false;

														document
																.getElementById('range').style.display = 'block';
														var len = data.length

														var tr = $('<tr></tr>');
														if (spCakeOrder.isBillGenerated == 0) {
															tr
																	.append($(
																			'<td class="col-sm-1"></td>')
																			.html(
																					(key + 1)
																							+ "<input type='checkbox' name='selorder' class='selorder' id="+spCakeOrder.spOrderNo+"   value="+spCakeOrder.spOrderNo+">"));
														} else {
															tr
																	.append($(
																			'<td></td>')
																			.html(
																					key + 1));
														}
														var spImage = (spCakeOrder.spImage)
																.replace(/ /g,
																		'%20');
														tr
																.append($(
																		'<td></td>')
																		.html(
																				spCakeOrder.slipNo));
														tr
																.append($(
																		'<td></td>')
																		.html(
																				spCakeOrder.frName));
														tr
																.append($(
																		'<td></td>')
																		.html(
																				spCakeOrder.spDeliveryDate));
														tr
																.append($(
																		'<td></td>')
																		.html(
																				"<a href="+URL+""+spImage+" target=_blank >"
																						+ spCakeOrder.spName
																						+ "</a>"));
														tr
																.append($(
																		'<td></td>')
																		.html(
																				spCakeOrder.itemId));
														tr
																.append($(
																		'<td></td>')
																		.html(
																				spCakeOrder.spSelectedWeight));
														tr
																.append($(
																		'<td></td>')
																		.html(
																				spCakeOrder.spfName));
														tr
																.append($(
																		'<td></td>')
																		.html(
																				"<input type=number value="+spCakeOrder.spBookedForName+"  name=box"+spCakeOrder.spOrderNo+" id=box"+spCakeOrder.spOrderNo+" class=form-control />"));
														tr
																.append($(
																		'<td></td>')
																		.html(
																				"<select class=form-control name=addon"+spCakeOrder.spOrderNo+" id=addon"+spCakeOrder.spOrderNo+" data-rule-required=true > <option value=0>N</option><option value=1>Y</option>	</select>"));

														var totalValue = parseFloat(spCakeOrder.spTotalAddRate)
																+ parseFloat(spCakeOrder.spPrice);
														tr
																.append($(
																		'<td></td>')
																		.html(
																				totalValue));

														tr
																.append($(
																		'<td></td>')
																		.html(
																				'<a href="${pageContext.request.contextPath}/showHtmlViewSpcakeOrder/'+spCakeOrder.spOrderNo+'" target="blank"><i class="fa fa-file-text-o" style="font-size:15px;"></i></a>'));

			
														$('#table1 tbody')
																.append(tr);
														document
																.getElementById("addon"
																		+ spCakeOrder.spOrderNo).value = spCakeOrder.isAllocated;

													})
													

								});
			}
		}
	</script>
	<script type="text/javascript">
	function editSpOrder(spOrderNo){
		document.getElementById("editspOrderNo").value=spOrderNo;
			var form=document.getElementById("sp_order_view_form");
			form.submit();
	}
		function saveSpOrder(spOrderNo) {
			$('#loader').show();
			var URL = $("#url").val();
			if (confirm("Do you want to Save this order?") == true) {

				var box = $("#box" + spOrderNo).val();
				var addon = $("#addon" + spOrderNo).val();

				$
						.getJSON(
								'${saveSpOrder}',
								{
									sp_order_no : spOrderNo,
									box : box,
									addon : addon,
									ajax : 'true',
								},
								function(data) {
									$('#table1 td').remove();
									$('#loader').hide();
									if (data == "") {
										alert("No Orders Found");
										document.getElementById("expExcel").disabled = true;
										document.getElementById("addtoprod").disabled = true;

									}
									$
											.each(
													data,
													function(key, spCakeOrder) {
														document
																.getElementById("expExcel").disabled = false;
														document
																.getElementById("addtoprod").disabled = false;

														document
																.getElementById('range').style.display = 'block';
														var len = data.length

														var tr = $('<tr></tr>');
														if (spCakeOrder.isBillGenerated == 0) {
															tr
																	.append($(
																			'<td class="col-sm-1"></td>')
																			.html(
																					(key + 1)
																							+ "<input type='checkbox' name='selorder' class='selorder' id="+spCakeOrder.spOrderNo+"   value="+spCakeOrder.spOrderNo+">"));
														} else {
															tr
																	.append($(
																			'<td></td>')
																			.html(
																					key + 1));
														}
														var spImage = (spCakeOrder.spImage)
																.replace(/ /g,
																		'%20');
														tr
																.append($(
																		'<td></td>')
																		.html(
																				spCakeOrder.slipNo));
														tr
																.append($(
																		'<td></td>')
																		.html(
																				spCakeOrder.frName));
														tr
																.append($(
																		'<td></td>')
																		.html(
																				spCakeOrder.spDeliveryDate));
														tr
																.append($(
																		'<td></td>')
																		.html(
																				"<a href="+URL+""+spImage+" target=_blank >"
																						+ spCakeOrder.spName
																						+ "</a>"));
														tr
																.append($(
																		'<td></td>')
																		.html(
																				spCakeOrder.itemId));
														tr
																.append($(
																		'<td></td>')
																		.html(
																				spCakeOrder.spSelectedWeight));
														tr
																.append($(
																		'<td></td>')
																		.html(
																				spCakeOrder.spfName));
														tr
																.append($(
																		'<td></td>')
																		.html(
																				"<input type=number value="+spCakeOrder.spBookedForName+"  name=box"+spCakeOrder.spOrderNo+" id=box"+spCakeOrder.spOrderNo+" class=form-control />"));
														tr
																.append($(
																		'<td></td>')
																		.html(
																				"<select class=form-control name=addon"+spCakeOrder.spOrderNo+" id=addon"+spCakeOrder.spOrderNo+" data-rule-required=true > <option value=0>N</option><option value=1>Y</option>	</select>"));

														var totalValue = parseFloat(spCakeOrder.spTotalAddRate)
																+ parseFloat(spCakeOrder.spPrice);
														tr
																.append($(
																		'<td></td>')
																		.html(
																				totalValue));

														tr
																.append($(
																		'<td></td>')
																		.html(
																				'<a href="${pageContext.request.contextPath}/showHtmlViewSpcakeOrder/'+spCakeOrder.spOrderNo+'" target="blank"><i class="fa fa-file-text-o" style="font-size:15px;"></i></a>'));

														tr
																.append($(
																		'<td></td>')
																		.html(
																				'<a href="${pageContext.request.contextPath}/showSpcakeOrderPdf/'
																						+ spCakeOrder.spOrderNo
																						+ '/'
																						+ (key + 1)
																						+ '" target="blank"><i class="fa fa-file-pdf-o" style="font-size:15px;"></i></a>'));

														tr
																.append($(
																		'<td></td>')
																		.html(
																				'<a href=# class=action_btn onclick=saveSpOrder('
																						+ spCakeOrder.spOrderNo
																						+ ');title=Save><i class="fa fa-save" style="font-size:17px;"></i></a>&nbsp;&nbsp;&nbsp;<a href=# class=action_btn onclick=deleteOrder('
																						+ spCakeOrder.spOrderNo
																						+ '); title=Delete><i class="glyphicon glyphicon-remove" style="font-size:17px;"></i></a>'));

														$('#table1 tbody')
																.append(tr);
														document
																.getElementById("addon"
																		+ spCakeOrder.spOrderNo).value = spCakeOrder.isAllocated;

													})

								});
			}
		}
	</script>
	<script>
		function exportToExcel() {
			window.open("${pageContext.request.contextPath}/exportToExcel");
			document.getElementById("expExcel").disabled = true;
		}
	</script>
	<script type="text/javascript">
		function disableFr() {

			document.getElementById("fr_id").disabled = true;

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
		function updateBillGenStatusToProd() {

			var checkedVals = $('.selorder:checkbox:checked').map(function() {

				var id = (this.value).split("-");
				return id[0];
			}).get();

			var srvalues = $('.selorder:checkbox:checked').map(function() {

				return this.value;
			}).get();

			var spOrderNo = checkedVals.join(",");
			var srvaluesNo = srvalues.join(",");
			//alert(srvaluesNo);
			if (checkedVals != "" && checkedVals != null) {
				$.getJSON('${updateBillStatusForSp}', {
					spOrderNo : spOrderNo,
					srvalues : srvaluesNo,
					ajax : 'true',
				},
						function(data) {

							if (data.error == false) {
								alert("Special Cake Taken for Production");
								callSearch();
								window.open(
										"${pageContext.request.contextPath}/showSpcakeOrderPdfByOrderNo/"
												+ spOrderNo + "/" + srvalues,
										'_blank');
							}

						});
			} else {
				alert("Select atleast 1 Sp Order !!")
			}
		}
	</script>
	<script>
		function myFunction() {
			var input, filter, table, tr, td, td1, i;
			input = document.getElementById("myInput");
			filter = input.value.toUpperCase();
			table = document.getElementById("table1");
			tr = table.getElementsByTagName("tr");
			for (i = 0; i < tr.length; i++) {
				td = tr[i].getElementsByTagName("td")[1];
				td1 = tr[i].getElementsByTagName("td")[4];

				if (td) {
					if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
						tr[i].style.display = "";
					} else if (td1.innerHTML.toUpperCase().indexOf(filter) > -1) {
						tr[i].style.display = "";
					} else {
						tr[i].style.display = "none";
					}
				}
			}
		}
	</script>

	<script type="text/javascript">
		function getMenus(sectionId) {
			$.getJSON('${RegSpOrderMenusSectionAjax}', {
				sectionId : sectionId,
				ajax : 'true'
			}, function(data) {
				var len = data.length;


				$('#spMenuId').find('option').remove().end()
				/* $("#selectMenu").append($("<option></option>").attr( "value",-1).text("ALL")); */

				for (var i = 0; i < len; i++) {
				
					$("#spMenuId").append(
							$("<option selected ></option>")
									.attr("value", data[i].menuId).text(
											data[i].menuTitle));
				}

				$("#spMenuId").trigger("chosen:updated");
			});
		}
	
	</script>

</body>
</html>