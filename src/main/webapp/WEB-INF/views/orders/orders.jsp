<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<style>
table {
	width: 100%;
	border: 1px solid #ddd;
}

tr:hover {
	background-color: #ffa;
}

td, th {
	position: relative;
}

/* td:hover::after, th:hover::after {
	content: "";
	position: absolute;
	background-color: #ffa;
	left: 0;
	top: -5000px;
	height: 10000px;
	width: 100%;
	z-index: -1;
} */


/* Modal Content/Box */
.modal-content {
	background-color: #fefefe;
	margin: 5% auto 15% auto;
	/* 5% from the top, 15% from the bottom and centered */
	border: 1px solid #888;
	width: 80%; /* Could be more or less, depending on screen size */
}

/* The Close Button (x) */
.close {
	position: absolute;
	right: 25px;
	top: 0;
	color: #000;
	font-size: 35px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: red;
	cursor: pointer;
}
</style>


<body>

	<jsp:include page="/WEB-INF/views/include/logout.jsp"></jsp:include>

<c:url value="/getDynamicPdfForOrderList" var="getDynamicPdfForOrderList" ></c:url>
	<c:url var="callSearchOrdersProcessByItem"
		value="/searchOrdersProcessByItem" />
	<c:url var="callSearchOrdersProcess" value="/searchOrdersProcess" />
	<c:url var="callChangeQty" value="/callChangeQty" />
	<c:url var="callDeleteOrder" value="/callDeleteOrder" />
	<c:url var="callDeleteOrderMultiple" value="/callDeleteOrderMultiple" />
	<c:url var="updateOrderDetails" value="/updateOrderDetails" />
	<c:url value="/getOrderListSectionMenusAjax" var="getOrderListSectionMenusAjax"></c:url>
	<c:url var="getItemListByMenuId" value="/getItemsByMenuIdMultiple"></c:url>



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
						<i class="fa fa-file-o"></i>Orders
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
						<c:when test="${subModule.subModuleMapping eq 'showOrders'}">

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
				type="hidden" id="isEdit" value="${isEdit}">

<input type="hidden" id="deleteAccess" value="${deleteAccess}"> <input
				type="hidden" id="editAccess" value="${editAccess}">




			<!-- BEGIN Main Content -->
			<div class="row">
				<div class="col-md-12">
					<div class="box">
						<div class="box-title">
							<h3>
								<i class="fa fa-bars"></i>Orders List 
							</h3>
							<!-- <div class="box-tool">
								<a href="">Back to List</a> <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a>
							</div> -->
							<!-- <div class="box-tool">
								<a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a> <a data-action="close" href="#"><i
									class="fa fa-times"></i></a>
							</div> -->
						</div>


						<div ><!-- class="box-content" -->
							<form action="searchOrdersProcess" class="form-horizontal"
								method="post" id="validation-form">
								
								
								<div class="frm_Sec_one single">
									<div class="row">
										<div class="col-md-4 box_marg">
											<label class="control-label left">Section</label>
												<div class="controls icon_add">
													<i class="fa fa-square frm_icon" aria-hidden="true"></i>
													<select data-placeholder="Choose Section"
											class="form-control padd_left chosen" tabindex="6" id="section"
											name="section" onchange="getMenus(this.value)">
											<!-- <option value="-1">All</option> -->
											<option value="">Select Section</option>
											<c:forEach items="${section}" var="section" varStatus="count">
												<option value="${section.sectionId}"><c:out
														value="${section.sectionName}" /></option>
											</c:forEach>
										</select>
											</div>
												<span id="section_alert" class="span_err">Please select section</span>
										</div>
			
										<div class="col-md-4 box_marg">
											<label class="control-label left">Menu</label>
												<div class="controls icon_add">
													<i class="fa fa-bars frm_icon" aria-hidden="true"></i>
													<select class="form-control padd_left chosen" tabindex="6" name="menuId"
											id="menuId" onchange="getItemsByMenuId()">
													</select>
											</div>
																						<span id="menu_alert" class="span_err">Please select menu</span>
											
										</div>
										<div class="col-md-4 box_marg">
											<label class="control-label left">Product Date</label>
												<div class="controls icon_add">
													<i class="fa fa-calendar frm_icon" aria-hidden="true"></i>
													<input class="form-control padd_left date-picker" id="date"  size="16"
											type="text" name="date" value="${date}" required />
											</div>
										</div>
										<div class="col-md-6 box_marg">
											<label class="control-label left">Franchise</label>
												<div class="controls icon_add">
													<i class="fa fa-user frm_icon" aria-hidden="true"></i>
													<select data-placeholder="Select Franchisee"
											class="form-control padd_left chosen" multiple="multiple" tabindex="6"
											name="fr_id" id="fr_id" onchange="disableRoute()">

											<option value="0">All</option>
											<c:forEach items="${franchiseeList}" var="franchiseeList">
												<option value="${franchiseeList.frId}">${franchiseeList.frName}</option>
											</c:forEach>
										</select>
											</div>
											<span id="fr_alert" class="span_err">Please select franchise</span>
											
										</div>
										
										<input data-placeholder="Select Route" type="hidden"
										name="selectRoute" id="selectRoute" onchange="disableFr()">
										
										
										<div class="col-md-6 box_marg">
											<label class="control-label left">Items</label>
												<div class="controls icon_add">
													<i class="fa fa-coffee frm_icon" aria-hidden="true"></i>
													<select data-placeholder="Select Items" name="items[]"
											class="form-control padd_left chosen" tabindex="-1" id="item"
											multiple="multiple" data-rule-required="true">
											<option value=""></option>
											<optgroup label="All Items">
												<option value=""></option>

											</optgroup>
										</select>
													
											</div>
																																	<span id="item_alert" class="span_err">Please select items</span>
											
										</div>
										
									</div>
								</div>

								<div class="form-group">
								<div class="three_buttons">
									<input type="button" class="btn btn-primary" value="Submit" id="callSubmit" onclick="callSearch()">
										<button type="button" class="btn btn-primary" onClick="window.location.reload();" >Cancel</button>
										
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
								
								</div>
								
								

								<c:set var="dis" value="none" />


								<div class="box">
									<!-- 		<div class="box-title">
										<h3>
											<i class="fa fa-table"></i> Order List
										</h3>
										<div class="box-tool">
											<a data-action="collapse" href="#"><i
												class="fa fa-chevron-up"></i></a>
											<a data-action="close" href="#"><i class="fa fa-times"></i></a>
										</div>
									</div>
 -->
 	<jsp:include page="/WEB-INF/views/include/tableSearch.jsp"></jsp:include>

									<div class="box-content">
									
									<div class="tableFixHead">
						
      <table id="table1">
        <thead>
          </thead><thead style="background-color: #f3b5db;">
				<tr class="bgpink">
					<th class="col-sm-1"><input type="checkbox"
						  id="all" /> All</th>
					<th width="148" style="width: 18px" align="left">Sr</th>
					<th width="198" style="text-align: center;">Franchisee
						Name</th>
						
						<th width="198" style="text-align: center;">Menu
						Name</th>
					<th width="190" style="text-align: center;">Item
						Name</th>
					<th width="199" style="text-align: center;">Category</th>
					<th width="199" style="text-align: center;">Quantity</th>
					<th width="199" style="text-align: center;">DISC %</th>
					<th width="199" style="text-align: center;">GRN %</th>
					<th width="199" style="text-align: center;">Bill Rate</th>
					<th width="199" style="text-align: center;">Del.
						Date</th>
					<th width="100" style="text-align: center;">Action</th>
				</tr>
			</thead>
        <tbody>
														<c:forEach items="${orderList}" var="orderList"
															varStatus="count">
															<c:set var="dis" value="block" />
															<tr>
																<td><c:out value="${count.index+1}" /></td>

																<td align="left"><c:out value="${orderList.frName}" /></td>

																<td align="left"><c:out
																		value="${orderList.itemName}" /></td>


																<td align="left"><c:out
																		value="${orderList.catName}" /></td>


																<td align="left"><c:out value="${orderList.id}" /></td>

																

															</tr>
														</c:forEach>

													</tbody>
      </table>
    </div>
    
    
    
    <div class="form-group">
		<div class="three_buttons">
<!-- 					<input type="button" class="btn btn-primary" value="Delete" disabled="disabled" id="calldelete" onclick="deleteMultipleOrder()">
 -->		
	</div>
		</div>
		
		<div class="form-group" style="display: none;">
		<input type="button"><p>Summry Table</p>
		</div>
		
		
		
		<div class="" >
									<div class="row">
									
									<div class="col-md-2 box_marg">
								<div class=" three_buttons one_row">
								<button type="button" class="btn btn-primary" onclick="exportToExcelDyn()" id="exportExcelDyn" >Excell</button>
																												<!-- <input type="button" class="btn btn-primary" value="Delete"  id="calldelete" onclick="deleteMultipleOrder()">
								 -->
								<c:if test="${isDelete==1}">
																				<input type="button" class="btn btn-primary" value="Delete" disabled="disabled" id="calldelete" onclick="deleteMultipleOrder()">
								
								</c:if>
								<c:if test="${isDelete==0}">
																				<input disabled type="button" class="btn btn-primary" value="Delete"   id="calldelete">
								
								</c:if>
									
														
									
								</div>
								
							
								</div>
								
										<div class="col-md-4 box_marg">
											<label class="control-label left">Production Date</label>
												<div class="controls icon_add">
													<i class="fa fa-calendar frm_icon" aria-hidden="true"></i>
													<input class="form-control padd_left date-picker"
															name="production_date" id="production_date" type="text" />
											</div>
										</div>
										
										<div class="col-md-4 box_marg">
											<label class="control-label left">Delivery Date</label>
												<div class="controls icon_add">
													<i class="fa fa-calendar frm_icon" aria-hidden="true"></i>
													<input class="form-control padd_left date-picker"
															name="delivery_date" id="delivery_date" type="text" />
											</div>
										</div>
										
										<div class="col-md-2 box_marg">
								<div class=" three_buttons one_row">
<!-- 								<button type="button" class="btn btn-primary" onclick="exportToExcelDyn()" id="exportExcelDyn" >Excell</button>
 --><c:if test="${isEdit==1}">									<input type="button" class="btn btn-primary" value="Update" disabled="disabled" id="callupdate"
														onclick="updateDetails()">
														</c:if>
														<c:if test="${isEdit==0}">									<input type="button" class="btn btn-primary" value="Update" disabled="disabled" id="callupdate"
														onclick="updateDetails()">
														</c:if>
														
														
									
								</div>
								
							
								</div>
								
									</div>
						</div>				
									
									

										<div class="clearfix"></div>
										
										<div class="form-group"
											style="display: <c:out value="${dis}" />;" id="range">



											<div class="col-sm-3  controls" style="display: none;">
												<input type="button" id="expExcel" class="btn btn-primary"
													value="EXPORT TO Excel" onclick="exportToExcel();"
													disabled="disabled">
											</div>
										</div>
									</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			
			
			
			
			<!-- <div id="myModal" class="modal">

		Modal content
		<div class="modal-content" id="modal_theme_primary">
			<span class="close">&times;</span>
			<div class="box">
				<div class="box-title">
					<h3>
						<i class="fa fa-table"></i> Select Columns
					</h3>
				</div>

				<div class="box-content">
					<div class="clearfix"></div>
					<div class="table-responsive" style="border: 0">
						<table width="100%" class="table table-advance" id="modelTable">
							<thead style="background-color: #f3b5db;">
								<tr>
									<th width="15"><input type="checkbox" name="selAll"
										id="selAllChk" /></th>
									<th>Headers</th>
								</tr>
							</thead>
							<tbody>
							</tbody>
						</table>
						<span class="validation-invalid-label" id="error_modelchks"
							style="display: none;">Select Check Box.</span>
					</div>
				</div>
				<div class="form-group"
					style="padding: 0 0 10px 0;">
					<input type="button" class="btn btn-primary" id="expExcel" onclick="getIdsReport(1)" value="Excel" /> 
					<input type="button" class="btn btn-primary" onclick="getIdsReport(2)" value="Pdf" />
				</div>
			</div>

		</div>

	</div> -->
	
	<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content" id="modal_theme_primary">
    <span class="close">&times;</span>
    <div class="box">
									<div class="box-title">
										<h3>
											<i class="fa fa-table"></i> Select Columns
										</h3>										
									</div>

				<div class="box-content">
					<div class="clearfix"></div>
					<div class="table-responsive" style="border: 0">
						<table width="100%" class="table table-advance" id="modelTable">
							<thead style="background-color: #f3b5db;">
								<tr>
									<th width="15"><input type="checkbox" name="selAll"
										id="selAllChk" />
									</th>
									<th>Headers</th>
								</tr>
							</thead>
							<tbody>
							</tbody>
						</table>
						<span class="validation-invalid-label" id="error_modelchks"
										style="display: none;">Select Check Box.</span>
					</div>
				</div>
				<div class="form-group" style="background-color: white; padding:0 0 10px 0;">
									&nbsp;	&nbsp;	&nbsp;	&nbsp;
										<input type="button" margin-right: 5px;"
											class="btn btn-primary" id="expExcel" onclick="getIdsReport(1)" 
											value="Excel" />
									&nbsp;	&nbsp;	&nbsp;	&nbsp;
										<input type="button" margin-right: 5px;"
											class="btn btn-primary" onclick="getIdsReport(2)" 
											value="Pdf" />
									</div>
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
		function updateDetails() {

			var delDate = $("#delivery_date").val();
			var prodDate = $("#production_date").val();
			if (prodDate == "") {

				alert("Please Select Production Date");
			} else if (delDate == "") {
				alert("Please Select Delivery Date");
			} else {
				var selectedItems = new Array();

				var checkedVals = $('.selorder:checkbox:checked').map(
						function() {
							return this.value;
						}).get();

				if (checkedVals == "") {
					alert("Please select atleast one order!!")
				} else {

					$.getJSON('${updateOrderDetails}', {

						ids : checkedVals.join(","),
						delDate : delDate,
						prodDate : prodDate,
						ajax : 'true'

					}, function(data) {

						if (data.error == false) {

							alert("Delivery Date updated Successfully.");
							callSearch();
						} else {
							alert("Delivery Date Not Updated.");
						}
					});
				}
			}
		}
	</script>
	<script>
//Get the modal
var modal = document.getElementById("myModal");
function openModel(){
	modal.style.display = "block";
}

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
  modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}
</script>
<script type="text/javascript">
$(document).ready(
	
		function() {
			$("#all").click(
					function() {
						$('#table1 tbody input[type="checkbox"]')
								.prop('checked', this.checked);
						
				        
					});
		});

</script>

	<script type="text/javascript">
	var modal = document.getElementById("myModal");
	function openModel(){
		modal.style.display = "block";
	}
	</script>
	<script type="text/javascript">
	function exportToExcelDyn() {
		//alert("Hiii")
		openModel();
		$('#modelTable td').remove();
		var thArray = [];
		$('#table1 > thead > tr > th').each(function(){
		    thArray.push($(this).text())
		})
		
		
		var seq = 0;
		for (var i = 0; i < thArray.length; i++) {
			seq=i+1;					
			var tr1 = $('<tr></tr>');
			tr1.append($('<td style="padding: 7px; line-height:0; border-top:0px;"></td>').html('<input type="checkbox" class="chkcls" name="chkcls'
					+ seq
					+ '" id="catCheck'
					+ seq
					+ '" value="'
					+ seq
					+ '">') );
			tr1.append($('<td style="padding: 7px; line-height:0; border-top:0px;"></td>').html(innerHTML=thArray[i]));
			$('#modelTable tbody').append(tr1);
		}
		
		
		
		$(document).ready(

				function() {

					$("#selAllChk").click(
							function() {
								$('#modelTable tbody input[type="checkbox"]')
										.prop('checked', this.checked);

							});
				});
		
		
			
	
	}
	  function getIdsReport(val) {
		  
		  var isError = false;
			var checked = $("#modal_theme_primary input:checked").length > 0;
		
			if (!checked) {
				$("#error_modelchks").show()
				isError = true;
			} else {
				$("#error_modelchks").hide()
				isError = false;
			}

			if(!isError){
		  var elemntIds = [];										
					
					$(".chkcls:checkbox:checked").each(function() {
						elemntIds.push($(this).val());
					}); 
					//alert(elemntIds);	
									
			$.getJSON(
					'${getDynamicPdfForOrderList}',
					{
						elemntIds : JSON.stringify(elemntIds),
						val : val,
						ajax : 'true'
					},
					function(data) {
					if(data!=null){
							//$("#modal_theme_primary").modal('hide');
							if(val==1){
								window.open("${pageContext.request.contextPath}/exportToExcel");
								//document.getElementById("expExcel").disabled = true;
								
							
								
							}else{	
								
								var menuIds = $("#menuId").val();
								var itemId = $("#item").val();
								var frIds = $("#fr_id").val();
								var date = $("#date").val();
								 window.open('${pageContext.request.contextPath}/pdfForReport?url=pdf/getOrderListPdf/'+elemntIds.join()+'/'+menuIds+'/'+itemId+'/'+frIds+'/'+date);
								 $('#selAllChk').prop('checked', false);
							}
						}
					});
			}
		}
	</script>
	
	
	<script type="text/javascript">
		function validate() {
			$("#fr_alert").hide();
			$("#menu_alert").hide();
			$("#item_alert").hide();
			$("#section_alert").hide();
			
			var menu = $("#menuId").val();
			var selectFr = $("#fr_id").val();
			var selectItem = $("#item").val();
			var section=$("#section").val();
			var isValid = true;
			
			if (section == "" || section == null) {
				isValid = false;
				//alert("Please Select Franchise");
				$("#section_alert").show();
			} 
else if (selectFr == "" || selectFr == null) {
				isValid = false;
				//alert("Please Select Franchise");
				$("#fr_alert").show();
			} else if (menu == "" || menu == null) {
				$("#menu_alert").show();
				isValid = false;
				//alert("Please Select Menu");
			} else if (selectItem == "" || selectItem == null) {
				$("#item_alert").show();
				isValid = false;
				//alert("Please Select Items");
			}
			return isValid;

		}
	</script>




	<script type="text/javascript">
		function callSearch() {

			$('#all').prop('checked', false);

			var isDelete = document.getElementById("isDelete").value;
			var isEdit = document.getElementById("isEdit").value;
			var deleteAccess = document.getElementById("deleteAccess").value;
			var editAccess = document.getElementById("editAccess").value;

			//	alert("isDelete" +isDelete);
			//alert("isEdit" +isEdit);

			var isValid = validate();
			if (isValid == true) {
				var menuIds = $("#menuId").val();
				var itemId = $("#item").val();
				var array = [];
				//alert(itemId);
				var routeIds = $("#selectRoute").val();
				var frIds = $("#fr_id").val();

				var date = $("#date").val();
				//alert(date);
				$('#loader').show();
				if (itemId == "-1" || itemId == "") {
					$
							.getJSON(
									'${callSearchOrdersProcess}',
									{

										fr_id_list : JSON.stringify(frIds),
										item_id_list : JSON.stringify(menuIds),
										route_id : routeIds,
										date : date,

										ajax : 'true'

									},
									function(data) {
										//alert(JSON.stringify(data));
										document.getElementById("expExcel").disabled = true;
										document.getElementById("callupdate").disabled = false;
										document.getElementById("calldelete").disabled = true;
										$("#opt").css("display", "block");

										$('#loader').hide();
										var len = data.length;

										$('#table1 td').remove();

										$
												.each(
														data,
														function(key, orders) {
															document
																	.getElementById("expExcel").disabled = false;
															document
																	.getElementById("calldelete").disabled = false;

															document
																	.getElementById('range').style.display = 'block';
															var tr = $('<tr></tr>');

															tr
																	.append($(
																			'<td class="col-sm-1"></td>')
																			.html(
																					"<input type='checkbox' name='selorder' class='selorder' id="+orders.orderId+"   value="+orders.orderId+">"));

															tr
																	.append($(
																			'<td></td>')
																			.html(
																					key + 1));

															tr
																	.append($(
																			'<td></td>')
																			.html(
																					orders.frName));
															
															tr
															.append($(
																	'<td></td>')
																	.html(
																			orders.menuTitle));

															tr
																	.append($(
																			'<td></td>')
																			.html(
																					orders.itemName));

															tr
																	.append($(
																			'<td></td>')
																			.html(
																					orders.catName));

															if (isEdit == 1) {
																tr
																		.append($(
																				'<td></td>')
																				.html(
																						"<input type='number' onkeypress='return IsNumeric(event);' ondrop='return false;' onpaste='return false;' style='text-align: right;    height: 24px;' class='form-control' min='0' id=qty"
																								+ orders.orderId
																								+ " value="
																								+ orders.orderQty
																								+ " disabled='disabled' >"));

															} else {
																tr
																		.append($(
																				'<td></td>')
																				.html(
																						"<input type='number' onkeypress='return IsNumeric(event);'  ondrop='return false;' onpaste='return false;' style='text-align: right;    height: 24px;' class='form-control' min='0' id=qty"
																								+ orders.orderId
																								+ " value="
																								+ orders.orderQty
																								+ "  disabled='disabled' >"));

															}
															
															tr
															.append($(
																	'<td></td>')
																	.html(
																			orders.isPositive));
															tr
															.append($(
																	'<td></td>')
																	.html(
																			orders.grnType));
															tr
															.append($(
																	'<td></td>')
																	.html(
																			orders.orderRate));
															
															tr
																	.append($(
																			'<td></td>')
																			.html(
																					orders.deliveryDate));

															if (orders.isEdit == 2) {
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
																									+ orders.orderId
																									+ '" onClick=editQty('
																									+ orders.orderId
																									+ ');> </span> </a><a><span class="glyphicon glyphicon-remove" id="delete'
																									+ orders.orderId
																									+ '" onClick=deleteOrder('
																									+ orders.orderId
																									+ ');> </span></a>'));

																} else {
																	tr
																			.append($(
																					'<td></td>')
																					.html(
																							' <a>  <span class="glyphicon glyphicon-edit" id="edit'
																									+ orders.orderId
																									+ '" onClick=editQty('
																									+ orders.orderId
																									+ ');> </span> </a><a><span class="glyphicon glyphicon-remove" id="delete'
																									+ orders.orderId
																									+ '" onClick=deleteOrder('
																									+ orders.orderId
																									+ ');> </span></a>'));
																}
															}

															//tr.append($('<td></td>').html("<input type=number onkeypress='return IsNumeric(event);' ondrop='return false;' onpaste='return false;' style='text-align: center;' class='form-control' min=0 id="+orders.orderId+" Value="+orders.orderQty+" disabled>"));

															//tr.append($('<td></td>').html(' <a>   <span class="glyphicon glyphicon-edit" id="edit'+orders.orderId+'" onClick=editQty('+orders.orderId+');> </span> </a><a><span class="glyphicon glyphicon-remove" id="delete'+orders.orderId+'" onClick=deleteOrder('+orders.orderId+');> </span></a>'));

															$('#table1 tbody')
																	.append(tr);

														})

									});

				} else {

					$
							.getJSON(
									'${callSearchOrdersProcessByItem}',
									{

										fr_id_list : JSON.stringify(frIds),
										item_id_list : JSON.stringify(menuIds),
										itemId : JSON.stringify(itemId),
										route_id : routeIds,
										date : date,

										ajax : 'true'

									},
									function(data) {
										document.getElementById("expExcel").disabled = true;
										document.getElementById("callupdate").disabled = false;
										document.getElementById("calldelete").disabled = true;

										$("#opt").css("display", "block");

										$('#loader').hide();
										var len = data.length;

										$('#table1 td').remove();

										$
												.each(
														data,
														function(key, orders) {
															document
																	.getElementById("expExcel").disabled = false;
															document
																	.getElementById("calldelete").disabled = false;

															document
																	.getElementById('range').style.display = 'block';
															var tr = $('<tr></tr>');

															tr
																	.append($(
																			'<td class="col-sm-1"></td>')
																			.html(
																					"<input type='checkbox' name='selorder' class='selorder' id="+orders.orderId+"   value="+orders.orderId+">"));

															tr
																	.append($(
																			'<td></td>')
																			.html(
																					key + 1));

															tr
																	.append($(
																			'<td></td>')
																			.html(
																					orders.frName));
															
															tr
															.append($(
																	'<td></td>')
																	.html(
																			orders.menuTitle));

															tr
																	.append($(
																			'<td></td>')
																			.html(
																					orders.itemName));

															tr
																	.append($(
																			'<td></td>')
																			.html(
																					orders.catName));

															if (isEdit == 1) {
																tr
																		.append($(
																				'<td></td>')
																				.html(
																						"<input type='number' onkeypress='return IsNumeric(event);' ondrop='return false;' onpaste='return false;' style='text-align: right;    height: 24px;' class='form-control' min='0' id=qty"
																								+ orders.orderId
																								+ " value="
																								+ orders.orderQty
																								+ " disabled='disabled' >"));

															} else {
																tr
																		.append($(
																				'<td></td>')
																				.html(
																						"<input type='number' onkeypress='return IsNumeric(event);'  ondrop='return false;' onpaste='return false;' style='text-align: right;    height: 24px;' class='form-control' min='0' id=qty"
																								+ orders.orderId
																								+ " value="
																								+ orders.orderQty
																								+ "  disabled='disabled' >"));

															}
															
															tr
															.append($(
																	'<td></td>')
																	.html(
																			orders.isPositive));
															tr
															.append($(
																	'<td></td>')
																	.html(
																			orders.grnType));
															tr
															.append($(
																	'<td></td>')
																	.html(
																			orders.orderRate));
															
															tr
																	.append($(
																			'<td></td>')
																			.html(
																					orders.deliveryDate));

															if (isDelete == 1) {
																tr
																		.append($(
																				'<td></td>')
																				.html(
																						' <a>   <span class="glyphicon glyphicon-edit" id="edit'
																								+ orders.orderId
																								+ '" onClick=editQty('
																								+ orders.orderId
																								+ ');> </span> </a><a><span class="glyphicon glyphicon-remove" id="delete'
																								+ orders.orderId
																								+ '" onClick=deleteOrder('
																								+ orders.orderId
																								+ ');> </span></a>'));

															} else  {
																tr
																		.append($(
																				'<td></td>')
																				.html(
																						' <a>  <span class="glyphicon glyphicon-edit" id="edit'
																								+ orders.orderId
																								+ '" onClick=editQty('
																								+ orders.orderId
																								+ ');> </span> </a><a><span class="glyphicon glyphicon-remove" id="delete'
																								+ orders.orderId
																								+ '" onClick=deleteOrder('
																								+ orders.orderId
																								+ ');> </span></a>'));
															}

															//tr.append($('<td></td>').html("<input type=number onkeypress='return IsNumeric(event);' ondrop='return false;' onpaste='return false;' style='text-align: center;' class='form-control' min=0 id="+orders.orderId+" Value="+orders.orderQty+" disabled>"));

															//tr.append($('<td></td>').html(' <a>   <span class="glyphicon glyphicon-edit" id="edit'+orders.orderId+'" onClick=editQty('+orders.orderId+');> </span> </a><a><span class="glyphicon glyphicon-remove" id="delete'+orders.orderId+'" onClick=deleteOrder('+orders.orderId+');> </span></a>'));

															$('#table1 tbody')
																	.append(tr);

														})

									});

				}
			}

		}
	</script>




	<script type="text/javascript">
		function editQty(orderId) {
			var state = document.getElementById("qty" + orderId).disabled;
			var textId = document.getElementById("qty" + orderId).value;

			//document.getElementById(orderId).disabled=false;
			if (state) {
				$("#edit" + orderId).removeClass("glyphicon glyphicon-edit");
				$("#edit" + orderId).addClass("glyphicon glyphicon-ok");
				document.getElementById("qty" + orderId).disabled = false;

			} else {
				$("#edit" + orderId).removeClass("glyphicon glyphicon-ok");
				$("#edit" + orderId).addClass("glyphicon glyphicon-edit");
				document.getElementById("qty" + orderId).disabled = true;
				$.getJSON('${callChangeQty}', {

					order_id : orderId,
					order_qty : textId,

					ajax : 'true'

				});
			}
		}

		var specialKeys = new Array();
		specialKeys.push(8); //Backspace
		function IsNumeric(e) {
			var keyCode = e.which ? e.which : e.keyCode
			var ret = ((keyCode >= 48 && keyCode <= 57) || specialKeys
					.indexOf(keyCode) != -1);
			/*  document.getElementById("error").style.display = ret ? "none" : "inline"; */
			return ret;
		}
	</script>
	<script type="text/javascript">
		function deleteOrder(orderId) {
			document.getElementById("myInput").value="";
			var isDelete = document.getElementById("isDelete").value;
			var isEdit = document.getElementById("isEdit").value;
			
			if (confirm("Do you want to Delete this order?") == true) {
				$
						.getJSON(
								'${callDeleteOrder}',
								{
									order_id : orderId,

									ajax : 'true'

								},
								function(data) {
									document.getElementById("expExcel").disabled = true;
									document.getElementById("callupdate").disabled = false;
									document.getElementById("calldelete").disabled = true;

									$('#loader').hide();
									var len = data.length;

									$('#table1 td').remove();

									$
											.each(
													data,
													function(key, orders) {
														document
																.getElementById("expExcel").disabled = false;
														document
																.getElementById("calldelete").disabled = false;

														document
																.getElementById('range').style.display = 'block';
														var tr = $('<tr></tr>');

														tr
																.append($(
																		'<td class="col-sm-1"></td>')
																		.html(
																				"<input type='checkbox' name='selorder' class='selorder' id="+orders.orderId+"   value="+orders.orderId+">"));

														tr
																.append($(
																		'<td></td>')
																		.html(
																				key + 1));

														tr
																.append($(
																		'<td></td>')
																		.html(
																				orders.frName));

														tr
																.append($(
																		'<td></td>')
																		.html(
																				orders.itemName));

														tr
																.append($(
																		'<td></td>')
																		.html(
																				orders.catName));

														if (isEdit == 1) {
															tr
																	.append($(
																			'<td></td>')
																			.html(
																					"<input type=number onkeypress='return IsNumeric(event);' ondrop='return false;' onpaste='return false;' style='text-align: center;' class='form-control' min=0 id=qty"
																							+ orders.orderId
																							+ " Value="
																							+ orders.orderQty
																							+ "  disabled='disabled' >"));

														} else {
															tr
																	.append($(
																			'<td></td>')
																			.html(
																					"<input type=number onkeypress='return IsNumeric(event);' disabled ondrop='return false;' onpaste='return false;' style='text-align: center;' class='form-control' min=0 id=qty"
																							+ orders.orderId
																							+ " Value="
																							+ orders.orderQty
																							+ "  disabled='disabled' >"));

														}
														tr
																.append($(
																		'<td></td>')
																		.html(
																				orders.deliveryDate));

														if (isDelete == 1) {
															tr
																	.append($(
																			'<td></td>')
																			.html(
																					' <a>   <span class="glyphicon glyphicon-edit" id="edit'
																							+ orders.orderId
																							+ '" onClick=editQty('
																							+ orders.orderId
																							+ ');> </span> </a><a><span class="glyphicon glyphicon-remove" id="delete'
																							+ orders.orderId
																							+ '" onClick=deleteOrder('
																							+ orders.orderId
																							+ ');> </span></a>'));

														} else {
															tr
																	.append($(
																			'<td></td>')
																			.html(
																					' <a>  <span class="glyphicon glyphicon-edit" id="edit'
																							+ orders.orderId
																							+ '" onClick=editQty('
																							+ orders.orderId
																							+ ');> </span> </a><a><span class="glyphicon glyphicon-remove" id="delete'
																							+ orders.orderId
																							+ '" onClick=deleteOrder('
																							+ orders.orderId
																							+ ');> </span></a>'));
														}

														/* tr.append($('<td></td>').html("<input type=number onkeypress='return IsNumeric(event);' ondrop='return false;' onpaste='return false;' style='text-align: center;' class='form-control' min=0 id="+orders.orderId+" Value="+orders.orderQty+" disabled>"));
														
														tr.append($('<td></td>').html(' <a>   <span class="glyphicon glyphicon-edit" id="edit'+orders.orderId+'" onClick=editQty('+orders.orderId+');> </span> </a><a><span class="glyphicon glyphicon-remove" id="delete'+orders.orderId+'" onClick=deleteOrder('+orders.orderId+');> </span></a>'));
														 */

														$('#table1 tbody')
																.append(tr);

													})

								});

			}

		}
		var $rows = $('#table1 tbody tr');
		$('#search1').keyup(function() {
		    var val = $.trim($(this).val()).replace(/ +/g, ' ').toLowerCase();

		    $rows.show().filter(function() {
		        var text = $(this).text().replace(/\s+/g, ' ').toLowerCase();
		        return !~text.indexOf(val);
		    }).hide();
		});
		
		
		
	</script>
	
	
	<script type="text/javascript">
		function deleteMultipleOrder() {
			var isDelete = document.getElementById("isDelete").value;
			var isEdit = document.getElementById("isEdit").value;
			document.getElementById("myInput").value="";
			 $('#myInput').keyup();
			var checkedVals = $('.selorder:checkbox:checked').map(function() {
				return this.value;
			}).get();
			if (checkedVals != "") {
				if (confirm("Do you want to Delete this order?") == true) {
					$.getJSON('${callDeleteOrderMultiple}', {
						orderId : checkedVals.join(","),

						ajax : 'true'

					}, function(data) {
						callSearch();
						/* document.getElementById("expExcel").disabled=true;
						$('#loader').hide();
						var len = data.length;


						$('#table1 td').remove();
						
						$.each(data,function(key, orders) {
							document.getElementById("expExcel").disabled=false;
							document.getElementById('range').style.display = 'block';
						var tr = $('<tr></tr>');

						tr.append($('<td class="col-sm-1"></td>').html("<input type='checkbox' name='selorder' class='selorder' id="+orders.orderId+"   value="+orders.orderId+">"));

						tr.append($('<td></td>').html(key+1));

						tr.append($('<td></td>').html(orders.frName));

						tr.append($('<td></td>').html(orders.itemName));

						tr.append($('<td></td>').html(orders.catName));
						
						if(isEdit==1){
						 	tr.append($('<td></td>').html("<input type=number onkeypress='return IsNumeric(event);' ondrop='return false;' onpaste='return false;' style='text-align: center;' class='form-control' min=0 id=qty"+orders.orderId+" Value="+orders.orderQty+"  disabled='disabled' >"));

							
						}else{
						 	tr.append($('<td></td>').html("<input type=number onkeypress='return IsNumeric(event);' disabled ondrop='return false;' onpaste='return false;' style='text-align: center;' class='form-control' min=0 id=qty"+orders.orderId+" Value="+orders.orderQty+"  disabled='disabled' >"));

							
						}
						tr.append($('<td></td>').html(orders.deliveryDate));
						
						if(isDelete==1){
						tr.append($('<td></td>').html(' <a>   <span class="glyphicon glyphicon-edit" id="edit'+orders.orderId+'" onClick=editQty('+orders.orderId+');> </span> </a><a><span class="glyphicon glyphicon-remove" id="delete'+orders.orderId+'" onClick=deleteOrder('+orders.orderId+');> </span></a>'));
						
						}else{
						 	tr.append($('<td></td>').html(' <a>  <span class="glyphicon glyphicon-edit" id="edit'+orders.orderId+'" onClick=editQty('+orders.orderId+');> </span> </a><a><span class="glyphicon glyphicon-remove" id="delete'+orders.orderId+'" onClick=deleteOrder('+orders.orderId+');> </span></a>'));
						}

						
						
						
						$('#table1 tbody').append(tr);

						})
						 */

					});

				}
			} else {
				alert("Please Select atleast 1 record to delete!!");
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

			//alert("Inside Disable Fr ");
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
	<script>
		function getItemsByMenuId() {

			var menuIds = $("#menuId").val();

			if (menuIds == "" || menuIds == null) {

				$('#item').find('option').remove().end()
				$("#item").trigger("chosen:updated");
			} else {
				$.getJSON('${getItemListByMenuId}', {

					menuId : JSON.stringify(menuIds),
					ajax : 'true'
				}, function(data) {
					var html = '<option value="">Select Item</option>';

					var len = data.length;

					$('#item').find('option').remove().end()

					$("#item").append(
							$("<option></option>").attr("value", -1)
									.text("ALL"));

					for (var i = 0; i < len; i++) {
						$("#item").append(
								$("<option ></option>").attr("value",
										data[i].id).text(data[i].itemName));
					}
					$("#item").trigger("chosen:updated");
				});
			}
		}
	</script>
	<script type="text/javascript">
function getMenus(sectionId) {
	$.getJSON('${getOrderListSectionMenusAjax}', {	
		sectionId : sectionId,
		ajax : 'true'
	}, function(data) {
		var len = data.length;
		
		$('#menuId')
	    .find('option')
	    .remove()
	    .end()
		  $("#menuId").append($("<option></option>").attr( "value","").text("Select Any Menu")); 

		for ( var i = 0; i < len; i++) {

			$("#menuId").append(
                       $("<option></option>").attr(
                           "value", data[i].menuId).text(data[i].menuTitle)
             );
		}

		   $("#menuId").trigger("chosen:updated");
	});
}
</script>
</body>
</html>