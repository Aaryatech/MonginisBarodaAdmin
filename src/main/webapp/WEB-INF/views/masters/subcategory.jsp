<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
/* Extra styles for the cancel button */
.cancelbtn {
	width: auto;
	padding: 10px 18px;
	background-color: #f44336;
}

.container1 {
	padding: 16px;
	margin-left: 5%;
	margin-right: 5%;
}

/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
	padding-top: 60px;
}

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

/* Add Zoom Animation */
.animate {
	-webkit-animation: animatezoom 0.6s;
	animation: animatezoom 0.6s
}

@
-webkit-keyframes animatezoom {
	from {-webkit-transform: scale(0)
}

to {
	-webkit-transform: scale(1)
}

}
@
keyframes animatezoom {
	from {transform: scale(0)
}

to {
	transform: scale(1)
}

}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
	span.psw {
		display: block;
		float: none;
	}
	.cancelbtn {
		width: 100%;
	}
}
</style>
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<body>

<c:url value="/getSubCategoryByPrefix" var="getSubCategoryByPrefix"/>
<c:url var="getSubcatPrint" value="/getSubcatPrint" ></c:url>

<c:url value="/getItemsBySubcatId" var="getItemsBySubcatId"></c:url>
	<jsp:include page="/WEB-INF/views/include/logout.jsp"></jsp:include>
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
					<!--<h1>
						<i class="fa fa-file-o"></i>Sub Category
					</h1>-->

				</div>
			</div> 
			<!-- END Page Title -->
			
			<c:set var="isEdit" value="0">
			</c:set>

			<c:set var="isDelete" value="0">
			</c:set>

			<c:forEach items="${sessionScope.newModuleList}" var="modules">
				<c:forEach items="${modules.subModuleJsonList}" var="subModule">
					<c:choose>
						<c:when
							test="${subModule.subModuleMapping eq 'showSubCatList'}">

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

			<!-- BEGIN Main Content -->
			<div class="row">
				<div class="col-md-12">
					<div class="box">
						<div class="box-title">
							<h3>
								<i class="fa fa-bars"></i>Add Sub Category
							</h3>
							<div class="box-tool">
								<a href="${pageContext.request.contextPath}/showSubCatList"></a>
								<a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a>
							</div>

						</div>
						<div >
							<form
								action="${pageContext.request.contextPath}/addSubCategoryProcess"
								class="form-horizontal" method="post" id="validation-form">

								<input type="hidden" name="subCatId" id="subCatId"
									value="${subCategory.subCatId}" />
									
									<div class="frm_Sec_one single">									
										<div class="row">
											<div class="col-md-3 box_marg">
											<label class="control-label left">Category</label>
												<div class="controls icon_add">
													<i class="fa fa-list-ul frm_icon" aria-hidden="true"></i>	
													<select data-placeholder="Select Category"
											class="form-control padd_left chosen" name="cat_id" tabindex="-1"
											id="cat_id" data-rule-required="true">
											<option value="" selected>Select Category</option>

											<c:forEach items="${catList}" var="catList">
												<c:choose>
													<c:when test="${catList.catId==subCategory.catId}">
														<option value="${catList.catId}" selected><c:out
																value="${catList.catName}"></c:out></option>
													</c:when>
													<c:otherwise>
														<option value="${catList.catId}"><c:out
																value="${catList.catName}"></c:out></option>
													</c:otherwise>
												</c:choose>
											</c:forEach>

										</select>									
												</div>
										</div>
										
										
										<div class="col-md-3 box_marg">
											<label class="control-label left">Sub Category Name</label>
												<div class="controls icon_add">
													<i class="fa fa-list-ul frm_icon" aria-hidden="true"></i>	
													<input type="text" name="sub_cat_name" id="sub_cat_name"
											placeholder="Sub Category Name" class="form-control padd_left"
											data-rule-required="true" value="${subCategory.subCatName}" />
												</div>
										</div>
										
										<div class="col-md-3 box_marg">
											<label class="control-label left">Prefix</label>
												<div class="controls icon_add">
													<i class="fa fa-check-circle-o frm_icon" aria-hidden="true"></i>	
													<input type="text" name="prefix" id="prefix"
											placeholder="Prefix" class="form-control padd_left"
											data-rule-required="true" value="${subCategory.prefix}"/>
											<span for="prefix" id="unq_prefix" style="display: none; color: #b94a48;">Prefix already exits</span>
												</div>
										</div>
										
										<div class="col-md-3 box_marg">
											<label class="control-label left">Sequence No.</label>
												<div class="controls icon_add">
													<i class="fa fa-list-ol frm_icon" aria-hidden="true"></i>	
													<input type="text" name="seqNo" id="seqNo" onkeyup="this.value=this.value.replace(/[^\d]/,'')"
											placeholder="Sequence No." class="form-control padd_left"
											data-rule-required="true" value="${subCategory.seqNo}" />
												</div>
										</div>
										
										
										
										</div>
									</div>
									
									
								
								<div class="form-group">
								<div class="row three_buttons">
									<!-- <button type="submit" class="btn btn-primary">Save and Next </button> -->
									<button type="submit" class="btn btn-primary" onclick="return validate()">Submit </button>
									<button type="button" class="btn btn-primary" onclick="window.location.reload()" >Cancel</button>
										
									
						</div>
								</div>									
								
								
								
								
								

								
							</form>
						</div>


					</div>
				</div>
			</div>
			<div class="box">
				<div class="box-title">
					<h3>
						<i class="fa fa-table"></i> Sub Category List
					</h3>
					<div class="box-tool">
						<a data-action="collapse" href="#"><i class="fa fa-chevron-up"></i></a>
						<a data-action="close" href="#"><i class="fa fa-times"></i></a>
					</div>
				</div>
				<div class="box-content">

					<jsp:include page="/WEB-INF/views/include/tableSearch.jsp"></jsp:include>

					<div class="clearfix"></div>
					
					
					<div class="tableFixHead">
					
      <table id="table2">
        <thead>
          <thead style="background-color: #f3b5db;">
				<tr class="bgpink">
					<th style="text-align: center; width:50px;">#<input type="checkbox" id="selAllChkbx" name="selAllChkbx" ></th>
					<th style="text-align: center;">Name</th>
					<th style="text-align: center;">Category Name</th>
					<th style="text-align: center;">Prefix</th>
					<th style="text-align: center;">Sequence No.</th>
					<th style="text-align: center; width:50px;">Action</th>
				</tr>
			</thead>
        <tbody>
        
									<c:set var="cnt" value="0"></c:set>
									<c:forEach items="${catList}" var="catList" varStatus="count">

										<c:forEach items="${catList.subCategoryList}" var="subCatList"
											varStatus="count">
											<c:set var="cnt" value="${cnt+1}"></c:set>
											<c:choose>
												<c:when test="${subCatList.catId==catList.catId}">
												
														<c:set value="0" var="flag" />
											<c:forEach items="${subCatIds}" var="subCatIds">
												<c:choose>
													<c:when test="${subCatList.subCatId==subCatIds}">
														<c:set value="1" var="flag" />
													</c:when>

												</c:choose>

											</c:forEach>
													<tr>
														<td style="text-align: left;"><c:out value="${cnt}" /><input type="checkbox" class="chk"
																	name="select_to_print" id="${subCatList.subCatId}"
																	value="${subCatList.subCatId}" /></td>
														<td style="text-align: left;" onclick="clickSubcat(${subCatList.subCatId},' ${subCatList.subCatName}')">
														<c:out value="${subCatList.subCatName}" /></td>
														<td style="text-align: left;"><c:out
																value="${catList.catName}" /></td>
														<td style="text-align: center;"><c:out
																value="${subCatList.prefix}" /></td>
																
														<td style="text-align: right;"><c:out
																value="${subCatList.seqNo}" /></td>


													<c:choose>
														<c:when test="${isEdit==1 and isDelete==1}">
															<td style="text-align: right; !important"><a
																href="updateSubCategory?subCatId=${subCatList.subCatId}">
																	<i class="fa fa-pencil" aria-hidden="true"></i>
															</a> <c:if test="${flag==0}">
																	<a href="deleteSubCategory/${subCatList.subCatId}"
																		onClick="return confirm('Are you sure want to delete this record');"><span
																		class="glyphicon glyphicon-remove"></span></a>
																</c:if></td>
														</c:when>

														<c:when test="${isEdit==1 and isDelete==0}">
															<td style="text-align: right; !important"><a
																href="updateSubCategory?subCatId=${subCatList.subCatId}">
																	<i class="fa fa-pencil" aria-hidden="true"></i>
															</a> <c:if test="${flag==0}">
																	<a href="deleteSubCategory/${subCatList.subCatId}"
																		class="disableClick"
																		onClick="return confirm('Are you sure want to delete this record');"><span
																		class="glyphicon glyphicon-remove"></span></a>
																</c:if></td>
														</c:when>

														<c:when test="${isEdit==0 and isDelete==1}">

															<td style="text-align: right; !important"><a
																class="disableClick"
																href="updateSubCategory?subCatId=${subCatList.subCatId}">
																	<i class="fa fa-pencil" aria-hidden="true"></i>
															</a> <c:if test="${flag==0}">
																	<a href="deleteSubCategory/${subCatList.subCatId}"
																		onClick="return confirm('Are you sure want to delete this record');"><span
																		class="glyphicon glyphicon-remove"></span></a>
																</c:if></td>
														</c:when>

														<c:otherwise>
															<td style="text-align: right; !important"><a
																class="disableClick"
																href="updateSubCategory?subCatId=${subCatList.subCatId}">
																	<i class="fa fa-pencil" aria-hidden="true"></i>
															</a> <c:if test="${flag==0}">
																	<a href="deleteSubCategory/${subCatList.subCatId}"
																		class="disableClick"
																		onClick="return confirm('Are you sure want to delete this record');"><span
																		class="glyphicon glyphicon-remove"></span></a>
																</c:if></td>
														</c:otherwise>
													</c:choose>

												</tr>
												</c:when>

											</c:choose>
										</c:forEach>
									</c:forEach>
								</tbody>
      </table>
    </div>
    <div id="myModal" class="modal">

		<!-- Modal content -->
		<div class="modal-content" style="width: 40%" id="modal_theme_primary">
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

	</div>
					
					
			<button type="button" class="btn btn-primary"onclick="getHeaders()" >Excel/Pdf</button>		

					
					
					<div id="id01" class="modal">

								<div class="container1" style="background-color: #ffffff">
									<h1 class="pop_title">
										<i class="fa fa-list" ></i>
										<span id="subcatHeader"></span>
									</h1>
									
									<div class="tableFixHead">
										<table id="table_grid11">         
										<thead style="background-color: #f3b5db;">
											<tr class="bgpink">
												<th style="text-align: left; width:50px">SR.NO.</th>
												<th style="text-align: left;">ITEM NAME</th>
												<th style="text-align: right;">MRP</th>
												<th style="text-align: rightr;">Item Tax</th>
												<th style="text-align: right;">Shelf Life</th>
											</tr>
										</thead>
										
										<tbody>												
										</tbody>
										</table>
									</div>
								

								
									
									
								<div class="form-group">
								<div class="row" style="text-align: right; padding: 15px 15px 0 0;">
									<button type="button"
										onclick="document.getElementById('id01').style.display='none'"
										class="btn btn-primary">CLOSE</button>
								</div>
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
		src="//ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js">
	</script>
	
	<script type="text/javascript">
	$('#selAllChkbx').click(function(event) {   
		//alert("Hiii")
	   if(this.checked) {
	        // Iterate each checkbox
	        $(':checkbox').each(function() {
	            this.checked = true;                        
	        });
	    } else {
	        $(':checkbox').each(function() {
	            this.checked = false;                       
	        });
	    }
	});
	
	

	
	</script>
	<script type="text/javascript">
	
	
	function clickSubcat(subcatId,name) {
		//alert(subcatId+" "+name);
		
			$('#table_grid11 td').remove();
			$.getJSON(
							'${getItemsBySubcatId}',
							{
								subcatId : subcatId,
								ajax : 'true'
							},
							function(data) {
								
								document.getElementById('id01').style.display='block';
								
								 document.getElementById('subcatHeader').innerHTML = name;

								 $.each(data, function(key, item) {
									 
									 
													var tr = $('<tr></tr>');

													tr
													 .append($(
																	'<td style="text-align:left;"></td>')
																	.html(
																			key + 1));

													tr
													 .append($(
																	'<td style="text-align:left;"></td>')
																	.html(
																			item.itemName));													
													tr
													.append($(
															'<td style="text-align:right;"></td>')
															.html(
																	item.itemMrp1));
													
													tr
													.append($(
															'<td style="text-align:right;"></td>')
															.html(
																	item.itemTax1+item.itemTax2));
													
													tr
													.append($(
															'<td style="text-align:right;"></td>')
															.html(
																	item.shelfLife));
													
													$('#table_grid11 tbody')
															.append(tr);
												});
							});
		}
	
	/* function clickSubcat(subcatId,name) {
		//alert("Hiiii");
		alert(subcatId);
		alert(name);
		$('#table_grid11 td').remove();
		
		$.post('${getItemsBySubcatId}', {
			subcatId : subcatId,
			ajax : 'true'
		}, function(data) {
			
		document.getElementById('id01').style.display='block';
			
			document.getElementById('subcatHeader').innerHTML = name; 
			
			$.each(data, function(key, item) {
				
				var tr = $('<tr></tr>');

				 tr.append($('<td></td>').html(key + 1));

					tr
					.append($(
							'<td></td>')
							.html(
									item.itemName));

					tr
					.append($(
							'<td></td>')
							.html(
									item.itemName));
				
					tr
					.append($(
							'<td></td>')
							.html(
									item.itemName));
					tr
					.append($(
							'<td></td>')
							.html(
									item.itemName));
			
 		$('#table_grid11 tbody').append(tr);

			});
			
		});
		
	} */
	
	
	$( "#prefix" ).change(function() {
		var prefix = $("#prefix").val();
		var subCatId = $("#subCatId").val();	
		if(subCatId==""){
			subCatId=0;
		}
		$
				.getJSON(
						'${getSubCategoryByPrefix}',
						{
							prefix : prefix,								
							subCatId : subCatId,
							ajax : 'true'
						},
						function(data) {	
							
							if(data.error){
								$( "#unq_prefix" ).show();
								$( "#prefix" ).val('');
							}else{
								$( "#unq_prefix" ).hide();
							}
						});
		});
	</script>


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

</body>




<script>
				function getHeaders(){
					
					openModel();
					$('#modelTable td').remove();
				var thArray = [];
	
				$('#table2 > thead > tr > th').each(function(){
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
				}
				
				$(document).ready(

						function() {

							$("#selAllChk").click(
									function() {
										$('#modelTable tbody input[type="checkbox"]')
												.prop('checked', this.checked);

									});
						});
				
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
												
						$
						.getJSON(
								'${getSubcatPrint}',
								{
									elemntIds : JSON.stringify(elemntIds),
									val : val,
									ajax : 'true'
								},
								function(data) {
									
									if(data!=null){
										//$("document.getElementById("myModal");#modal_theme_primary").modal('hide');
										if(val==1){
											window.open("${pageContext.request.contextPath}/exportToExcelNew");
											//document.getElementById("expExcel").disabled = true;
										}else{		
											//alert("Gen PDF alert");
											 window.open('${pageContext.request.contextPath}/pdfForReport?url=pdf/getSubcatListPdf/'+elemntIds.join());
											 $('#selAllChk').prop('checked', false);
										}
									}
								});
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

</html>