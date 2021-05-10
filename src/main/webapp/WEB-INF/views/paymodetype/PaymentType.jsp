<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<style>
table {
	overflow: hidden;
}

tr:hover {
	background-color: #ffa;
}

td, th {
	position: relative;
}

td:hover::after, th:hover::after {
	content: "";
	position: absolute;
	background-color: #ffa;
	left: 0;
	top: -5000px;
	height: 10000px;
	width: 100%;
	z-index: -1;
}
</style>


<body>


	<jsp:include page="/WEB-INF/views/include/logout.jsp"></jsp:include>



	<c:url var="showPaymentType"
		value="/showPaymentType" />
	
	<c:url var="getPaymentTypeByIdAjax" value="/getPaymentTypeByIdAjax" />
<c:url var="getPaymentModeAjaxList" value="/getPaymentModeAjaxList" />
	<c:url var="deletePaymentTypeByIdAjax" value="/deletePaymentTypeByIdAjax" />

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
						<i class="fa fa-file-o"></i>Payment Type
					</h1>

				</div>
			</div>
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





			<!-- BEGIN Main Content -->
			<div class="row">
				<div class="col-md-12">
					<div class="box">
						<div class="box-title">
							<h3>
								<i class="fa fa-bars"></i>Add Payment Mode
							</h3>
							<div class="box-tool">
								<a href="">Back to List</a> <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a>
							</div>
							<!-- <div class="box-tool">
								<a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a> <a data-action="close" href="#"><i
									class="fa fa-times"></i></a>
							</div> -->
						</div>


						<div class="box-content">
							<form class="form-horizontal">

		

								<div class="form-group">
								
								<div class="col-md-3 box_marg">
											<label class="control-label left">Payment Mode</label>
									<div class="controls icon_add">
										<i class="fa fa-home frm_icon" aria-hidden="true"></i>
										<select name="fr_id" id="fr_id" class="form-control padd_left chosen"
											 data-rule-required="true"
											>
											<option value="">Select Payment Mode</option>
											<c:forEach items="${contryList1}" var="contryList1">
												
														<option value="${contryList1.modeId}"><c:out
																value="${contryList1.modeName}"></c:out></option>
												
											</c:forEach>

										</select>
										 <p class="form-control" id="error_mode" style="display: none;">Enter rule.</p>
									</div>
										</div>
											<input type="hidden" id=type_id name="type_id" value="${country.paymentTypeId}" >
										<div class="col-md-3 box_marg">
											<label class="control-label left">Payment Type</label>
									<div class="controls icon_add">
										<i class="fa fa-credit-card frm_icon" aria-hidden="true"></i>
										<input type="text" name="type" id="type"
											placeholder="Payment Type" class="form-control padd_left"
											data-rule-required="true" value="${country.typeName}" />
										 <p class="form-control" id="error_type" style="display: none;">Enter rule.</p>	
										
									</div>
										</div>
									
									
					
								</div>

						



								<div align="center" class="form-group">
									<div
										class="col-sm-25 col-sm-offset-3 col-lg-30 col-lg-offset-0">
										<input type="button" class="btn btn-primary" value="Save"
											 id="sub_btn">


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
									<div class="box-title">
										<h3>
											<i class="fa fa-table"></i> Payment Type List
										</h3>
										<div class="box-tool">
											<a data-action="collapse" href="#"><i
												class="fa fa-chevron-up"></i></a>
											<!--<a data-action="close" href="#"><i class="fa fa-times"></i></a>-->
										</div>
									</div>

									<div class="box-content">

										<div class="clearfix"></div>
										<div id="table-scroll" class="table-scroll">

										
											<div class="table-wrap">

												<table id="table1" class="table table-advance">
													<thead>
														<tr class="bgpink">
<!-- 															<th class="col-sm-1"><input type="checkbox" id="all" /> -->
<!-- 																All</th> -->
															<th width="200" style="width: 18px" align="left">No</th>
															<th width="400" align="left">Payment Mode</th>
															<th width="400" align="left">Payment Type</th>
															<th width="5" align="right">Action</th>
														</tr>
													</thead>



													<tbody>
														<c:forEach items="${contryList}" var="orderList"
															varStatus="count">
															<c:set var="dis" value="block" />
															<tr>
																<td><c:out value="${count.index+1}" /></td>

																<td align="left"><c:out value="${contryList.typeName}" /></td>

																



															</tr>
														</c:forEach>

													</tbody>
												</table>
											</div>
										</div>


									</div>
								

							
									<div align="center" id="loader1" style="display: none">

										<span>
											<h4>
												<font color="#343690">Loading</font>
											</h4>
										</span> <span class="l-1"></span> <span class="l-2"></span> <span
											class="l-3"></span> <span class="l-4"></span> <span
											class="l-5"></span> <span class="l-6"></span>
									</div>

									<div class="form-group"
										style="display: <c:out value="${dis}" />;" id="range">



										
										<div align="center" id="loader1" style="display: none">

											<span>
												<h6>
													<font color="#343690">Loading</font>
												</h6>
											</span> <span class="l-1"></span> <span class="l-2"></span> <span
												class="l-3"></span> <span class="l-4"></span> <span
												class="l-5"></span> <span class="l-6"></span>
										</div>
									</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- END Main Content -->
			<footer>
				<p style="text-align: center;">2018 © MONGINIS.</p>
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
$( "#sub_btn" ).on( "click", function() {
	var isError = false;
	var errMsg = "";

	if (!$("#type").val().trim()) {
		isError = true;
		$("#error_type").show();
	} else {
		$("#error_type").hide();
	}
	
	if ($("#fr_id").val()==-1) {
		isError = true;
		$("#error_mode").show();
	} else {
		$("#error_mode").hide();
	}
	var paymentTypeId = $("#type_id").val();
	var typeName = $("#type").val();
	var modeId = $("#fr_id").val();
	if (!isError) {
		var r = confirm("Are you sure you want to Submit?");
		if (r == true) {
// 			document.getElementById("overlay2").style.display = "block";
		     var formData = { 
		    		 paymentTypeId:paymentTypeId,
		    		 modeId:modeId,
		    		 typeName:typeName,

	        	   };
		   
		      $.ajax({
		        type: "POST",
		        url: "${pageContext.request.contextPath}/newPaymentType",
		        data:formData,
		        success: function (data) {
// 		        	document.getElementById("overlay2").style.display = "none";
					
					if ($("#type_id").val() == 0){
						alert("Payment Type inserted successfully.");
					} else {
						alert("Payment Type updated successfully.");
					}
					
					   $("#fr_id").val('');
		               $("#type").val('');
		               $("#type_id").val(0);
// 		               $("#uuid").val('');
		               showCmpList();
		        }
		      });
		} else {
		}
		//end ajax send this to php page
		return false;
	}//end of if !isError
	return false;
	});
	
$( document ).ready(function() {
	showCmpList();
	
});

function showCmpList() {
	$
			.getJSON(
					'${showPaymentType}',

					{
						ajax : 'true'
					},
					function(data) {
						
						$('#table1 td').remove();
						$
								.each(
										data,
										function(key, Cmp) {

											var tr = $('<tr></tr>');
											tr.append($('<td></td>')
													.html(key + 1));
											tr
													.append($(
															'<td></td>')
															.html(
																	Cmp.modeName));
											tr
											.append($(
													'<td></td>')
													.html(
															Cmp.typeName));
																				
											tr
													.append($(
															'<td></td>')
															.html(
							"<a href='javascript:void(0);' onclick=editData("+ Cmp.paymentTypeId+ ") title='Edit' class='addcust_open'><i class='fa fa-pencil'></i></a>"+
							" &nbsp;&nbsp;<a href='javascript:void(0);' onclick=deleteData("+ Cmp.paymentTypeId+ ") title='Edit' class='addcust_open'><i class='fa fa-trash-o'></i></a>"));
											$('#table1 tbody')
													.append(tr);

										})

					});

}


function getSelmode(modid){
	
	 $.getJSON('${getPaymentModeAjaxList}', {
			ajax : 'true'
		}, function(data) {			

			if (data!=null) {
				 var cateHtml = '';
					var cateLen = data.length;						
					for (var i = 0; i < cateLen; i++) {
						 if(data[i].paymentModeId==modid){
							 cateHtml += '<option selected value="' + data[i].paymentModeId + '">'
								+ data[i].country + '</option>';
						 }else{
							 cateHtml += '<option value="' + data[i].paymentModeId + '">'
								+ data[i].country + '</option>';
						 }
					}//end of for loop
					$('#con_cat').html(cateHtml);
					$("#con_cat").trigger("chosen:updated");
		}

		}); 
} 



function editData(paymentTypeId){
	if (paymentTypeId != null) {

		$
				.getJSON(
						'${getPaymentTypeByIdAjax}',

						{
							paymentTypeId : paymentTypeId,
// 							titleDescription: titleDescription,
// 							titleName : titleName,
							ajax : 'true'
						},
						function(data) {

							$("#type_id").val(data.paymentTypeId);
							$("#type").val(data.typeName);
// 							$("#uuid").val(data.uuId);
						getSelmode(data.paymentModeId)
				        
						});
	}
}


function deleteData(paymentTypeId){
	if (paymentTypeId != null) {
		var r = confirm("Are you sure you want to delete?");
			if (r == true) {
// 				document.getElementById("overlay2").style.display = "block";
			$
					.getJSON(
							'${deletePaymentTypeByIdAjax}',
	
							{
								paymentTypeId : paymentTypeId,
								
								ajax : 'true'
							},
							function(data) {
// // 								document.getElementById("overlay2").style.display = "none";
// 								alertify.success("Country deleted successfully.");
								showCmpList();
							});
		}
	}
}
	</script>





	
	
	

	


	</script>

</body>
</html>