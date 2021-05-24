<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
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

	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
	<body>
	
	<jsp:include page="/WEB-INF/views/include/logout.jsp"></jsp:include>
 <c:url var="typeByMakeId" value="/typeByMakeId"></c:url>
 <c:url var="variantByTypeId" value="/variantByTypeId"></c:url>
 <c:url var="dealerByMakeId" value="/dealerByMakeId"></c:url>
 <c:url var="editVehicle" value="/editVehicle"></c:url>
 <c:url var="delMultiVeh" value="/delMultiVeh" ></c:url>
<c:url var="getFrByVehId" value="/getFrByVehId" ></c:url>
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
		
		<c:set var="isEdit" value="0">
			</c:set>

			<c:set var="isDelete" value="0">
			</c:set>

			<c:forEach items="${sessionScope.newModuleList}" var="modules">
				<c:forEach items="${modules.subModuleJsonList}" var="subModule">
					<c:choose>
						<c:when
							test="${subModule.subModuleMapping eq 'showVehicleList'}">

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

		<!-- BEGIN Content -->
		<div id="main-content">
			<!-- BEGIN Page Title -->
		 	<div class="page-title">
				<div>
					<!--<h1>
						<i class="fa fa-file-o"></i>Logistics
					</h1>-->
				</div>
			</div> 
			<!-- END Page Title -->

			<div class="row">
				<div class="col-md-12">

					<div class="box">
						<div class="box-title">
							<h3>
								<i class="fa fa-table"></i>Insert New Vehicle
							</h3>
							
							<div class="box-tool">
								<a href="${pageContext.request.contextPath}/showVehicleList">Vehicle List</a> <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a>
							</div>
							
						</div>
						
						
						<div class="box-content padd_zro">

							<form id="submitMaterialStore" action="${pageContext.request.contextPath}/insertVehicle" method="post"
							enctype="multipart/form-data" class="form-horizontal"   >
							<input type="hidden" id="vehId" value="0" name="vehId"   class="form-control"   >
							
							
							
							
								<div class="frm_Sec_one single">
									
									<div class="row">
										<div class="col-md-4 box_marg">
											<label class="control-label left">Vehicle No</label>
												<div class="controls icon_add">
													<i class="fa fa-file-text frm_icon" aria-hidden="true"></i>	
													<input type="text" name="vehicleNo" id="vehicleNo"
											placeholder="Vehicle No" class="form-control padd_left"
											data-rule-required="true" />			
													
												</div>
										</div>
										
										<div class="col-md-4 box_marg">
											<label class="control-label left">Status</label>
												<div class="controls icon_add">
													<i class="fa fa-dot-circle-o frm_icon" aria-hidden="true"></i>	
													<select data-placeholder="Active Inactive"
											class="form-control padd_left chosen" name="delStatus" tabindex="-1"
											id="delStatus" data-rule-required="true">
											<option value="0" selected>Active</option>
											
											<option value="1" >In Active</option>
											
										</select>
													
													
												</div>
										</div>
										
										<div class="col-md-4 box_marg">
											<div class=" three_buttons one_row">
						
							<input type="button" class="btn btn-primary" value="Submit" onclick="validation()" >
										<input type="button" class="btn btn-primary" value="Cancel" id="cancel" onclick="window.location.reload()">

						<div class="clr"></div>
						
					</div> 
										</div>
									
									</div>
									</div>
									
										
								
								
							
								
							
							
								
							<!-- <div class="form-group">
								<div class="row three_buttons">
									<input type="button" class="btn btn-primary" value="Add New Vehicle" onclick="validation()" >
										<input type="button" class="btn btn-primary" value="Cancel" id="cancel" onclick="cancel1()"> 
						</div>
								</div> -->
						
							
							

						</form>
						</div>	
						</div>
						
						<div class="box">
						
						<div class="box-title">
							<h3>
								<i class="fa fa-table"></i>Vehicle List
							</h3>
							
							<div class="box-tool">
							
								 <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a>
							</div>
							
						</div>
						
						
						<div class="box-content">
								<label for="search" style="float: right;" class="col-md-3 search_align" id="search">
    										<i class="fa fa-search" ></i>
									<input type="text"  id="myInput" onkeyup="myFunction()" placeholder="Search items by Name or Code" title="Type in a name">
										</label> 

							 
							<div class=" box-content">
					<div class="row">
					
					
						<div class="tableFixHead">
						
      <table id="table_grid"> 
        <thead style="background-color: #f3b5db;">
									<tr>
										<th style="width: 70px; text-align: center;">Sr.No.<input type="checkbox" id="selAllChkbx" name="selAllChkbx" ></th>
										<th style="text-align: center;">vehicle No.</th> 
									    <th style="width:70px; text-align: center;">Action</th>

									</tr>
								</thead>
        <tbody>
								<c:set var = "srNo" value="0"/>
								
									<c:forEach items="${vehicleList}" var="vehicleList"
													varStatus="count">
													<c:set value="0" var="flag"></c:set>
									<c:forEach var="inUse" items="${inUserVehicle}" >
									<c:if test="${vehicleList.vehId==inUse}">
									<c:set var="flag" value="1" ></c:set>
									</c:if>
									
									
									</c:forEach>
													
													 
													<tr>
														<c:choose>
														<c:when test="${flag==1}">
														<td  style="text-align: center;"><c:out value="${count.index+1}" /></td>
														</c:when>
														<c:otherwise>
														<td  style="text-align: center;"><c:out value="${count.index+1}" /><input type="checkbox" class="chkcls" name="chkcls" id="catCheck+${vehicleList.vehId}" value="${vehicleList.vehId}"></td>
														</c:otherwise>
														</c:choose>
 														<c:set var = "srNo" value="${count.index}"/> 
														<td align="left" ><a onclick="displayFrList(${vehicleList.vehId})" ><c:out value="${vehicleList.vehNo}" /></a></td>
														<c:choose>
															<c:when test="${isEdit==1 and isDelete==1}">
																<td style="text-align: right; color: #333;"><i class="fa fa-pencil" aria-hidden="true"
															onclick="edit(${vehicleList.vehId})"></i> 
															
														<a
															href="${pageContext.request.contextPath}/deleteVehicle/${vehicleList.vehId}"
															onClick="return confirm('Are you sure want to delete this record');">

																<i class="fa fa-times" aria-hidden="true"></i>

														</a></td>
															</c:when>

															<c:when test="${isEdit==1 and isDelete==0}">
																<td style="text-align: center;"><i class="fa fa-pencil" aria-hidden="true"
															onclick="edit(${vehicleList.vehId})"></i> 
															
														<a
															href="${pageContext.request.contextPath}/deleteVehicle/${vehicleList.vehId}"
															class="disableClick" 
															onClick="return confirm('Are you sure want to delete this record');">

																<i class="fa fa-times" aria-hidden="true"></i>

														</a></td>
															</c:when>

															<c:when test="${isEdit==0 and isDelete==1}">
																<td style="text-align: center;"><i class="fa fa-pencil disableClick" aria-hidden="true"
															onclick="edit(${vehicleList.vehId})"></i> 
															
														<a
															href="${pageContext.request.contextPath}/deleteVehicle/${vehicleList.vehId}"
															onClick="return confirm('Are you sure want to delete this record');">

																<i class="fa fa-times" aria-hidden="true"></i>

														</a></td>
															</c:when>

															<c:otherwise>
																<td style="text-align: center;"><i class="fa fa-pencil disableClick" aria-hidden="true"
															onclick="edit(${vehicleList.vehId})"></i> 
															
														<a
															href="${pageContext.request.contextPath}/deleteVehicle/${vehicleList.vehId}"
															class="disableClick"
															onClick="return confirm('Are you sure want to delete this record');">

																<i class="fa fa-times" aria-hidden="true"></i>

														</a></td>
															</c:otherwise>
														</c:choose>

													</tr>
												</c:forEach>

								</tbody>
      </table>
      <div id="myModal" class="modal">

		<!-- Modal content -->
		<div class="modal-content" style="width: 40%" id="modal_theme_primary">
			<span class="close">&times;</span>
			<div class="box">
				<div class="box-title">
					<h3>
						<i class="fa fa-table"></i> Franchisee List
					</h3>
				</div>

				<div class="box-content">
					<div class="clearfix"></div>
					<div class="table-responsive" style="border: 0">
					 <table id=model_table> 
        <thead style="background-color: #f3b5db;">
									<tr>
										<th style="width: 70px; text-align: center;">Sr.No.<input type="checkbox" id="selAllChkbx" name="selAllChkbx" ></th>
										<th style="text-align: center;">Franchisee Name.</th> 
									    

									</tr>
								</thead>
        <tbody>
						</tbody>
						</table>
					</div>
				</div>
				<div class="form-group"
					style="padding: 0 0 10px 0;display: none;">
					<input type="button" class="btn btn-primary" id="expExcel" onclick="getIdsReport(1)" value="Excel" /> 
					<input type="button" class="btn btn-primary" onclick="getIdsReport(2)" value="Pdf" />
				</div>
			</div>

		</div>

	</div>
    </div>
   <input type="button" style="margin-top: 10px;margin-left: 25px;" class="btn btn-primary" value="Delete" onclick="deleteMultiVehicle()" >
					
					
					
					
					
						
					</div>
								</div>
								
							 
						</div>	
						</div>
					</div>
				</div>
			</div>
			<!-- END Main Content -->
			<footer>
			<p>2017 © MONGINIS.</p>
			</footer>

			<a id="btn-scrollup" class="btn btn-circle btn-lg" href="#"><i
				class="fa fa-chevron-up"></i></a>
		
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
		
		
		function edit(vehId) {
			
			 
			//alert("driverId");
			$('#loader').show();

			$
					.getJSON(
							'${editVehicle}',

							{
								 
								vehId : vehId, 
								ajax : 'true'

							},
							function(data) { 
								           			
								document.getElementById("vehId").value=data.vehId;
								document.getElementById("vehicleNo").value=data.vehNo; 
								document.getElementById("delStatus").value=data.delStatus; 
								
							//	document.getElementById("makeId").value=data.makeId;
								//$('#makeId').trigger("chosen:updated");
								//document.getElementById("engNo").value=data.vehEngNo;
							//	document.getElementById("chsNo").value=data.vehChesiNo;
							//	document.getElementById("color").value=data.vehColor;
							//	document.getElementById("purDate").value=data.purchaseDate;
							//	document.getElementById("regDate").value=data.regDate;
							//	document.getElementById("cmpnyAvg").value=data.vehCompAvg;
							//	document.getElementById("standAvg").value=data.vehStandAvg;
								//document.getElementById("miniAvg").value=data.vehMiniAvg;
							//	document.getElementById("fuelType").value=data.fuelType;
						//		$('#fuelType').trigger("chosen:updated");
						//		document.getElementById("frqKm").value=data.freqKm;
						//		document.getElementById("wheelChange").value=data.wheelChangeFreq;
						//		document.getElementById("batryChange").value=data.battaryChangeFreq;
						//		document.getElementById("acChang").value=data.acChangeFreq;
					//			document.getElementById("currentRunningKm").value=data.currentRunningKm;
					//			document.getElementById("lastServicingKm").value=data.lastServicingKm;
				//				document.getElementById("nextServicingKm").value=data.nextServicingKm;
				//				document.getElementById("alertNextServicingKm").value=data.alertNextServicingKm;
				//				document.getElementById("lastAmcDate").value=data.lastAmcDate;
				//				document.getElementById("nextAmcDate").value=data.nextAmcDate;
				//				document.getElementById("alertAmcDate").value=data.alertAmcDate;
								
							/* 	   
								$.getJSON('${typeByMakeId}', {
									
									makeId : data.makeId,
									ajax : 'true'
								},
										function(data1) {
									 
									var html = '<option value="">Select Type</option>';
									
									var len = data1.length;
									for ( var i = 0; i < len; i++) {
										
										if(data.vehTypeId==data1[i].vehiTypeId)
											{
											 
											html += '<option value="' + data1[i].vehiTypeId + '" selected>'
											+ data1[i].vehTypeName + '</option>';
											document.getElementById("typeId").value=data.vehTypeId;
											$('#typeId').trigger("chosen:updated");
											}
										else
											{
											html += '<option value="' + data1[i].vehiTypeId + '">'
											+ data1[i].vehTypeName + '</option>';
											}
										
									}
									html += '</option>';
									$('#typeId').html(html);
									$("#typeId").trigger("chosen:updated");
															
										});
								
								$.getJSON('${dealerByMakeId}', {
									
									typeId : data.vehTypeId,
									makeId : data.makeId,
									ajax : 'true'
								},
										function(data2) {
									 
									var html = '<option value="">Select Type</option>';
									
									var len = data2.length;
									for ( var i = 0; i < len; i++) {
										if(data.dealerId==data2[i].dealerId)
										{
										 
										html += '<option value="' + data2[i].dealerId + '" selected>'
										+ data2[i].dealerName + '</option>';
										document.getElementById("dealerId").value=data.dealerId;
										$('#dealerId').trigger("chosen:updated");
										}
										else
										{
											html += '<option value="' + data2[i].dealerId + '">'
											+ data2[i].dealerName + '</option>';
										}
										
									}
									html += '</option>';
									$('#dealerId').html(html);
									$("#dealerId").trigger("chosen:updated");
															
										});
								
								$.getJSON('${variantByTypeId}', {
									
									typeId : data.vehTypeId,
									makeId : data.makeId,
									ajax : 'true'
								},
										function(data3) {
									 
									var html = '<option value="">Select Type</option>';
									
									var len = data3.length;
									for ( var i = 0; i < len; i++) {
										if(data.variantId==data3[i].variantId)
											{
											 
											html += '<option value="' + data3[i].variantId + '" selected>'
											+ data3[i].variantName + '</option>';
											document.getElementById("variantId").value=data.dealerId;
											$('#variantId').trigger("chosen:updated");
											}
										else
											{
											html += '<option value="' + data3[i].variantId + '">'
											+ data3[i].variantName + '</option>';
											}
										
									}
									html += '</option>';
									$('#variantId').html(html);
									$("#variantId").trigger("chosen:updated");
															
										}); */
								 
								document.getElementById("cancel").disabled=false;
							});

		 
			 
		
}
	function validation() {

         //alert("hi");
		 var makeId = $("#vehicleNo").val();
		 var typeId = $("#typeId").val();
		 var variantId = $("#variantId").val();
		 var dealerId = $("#dealerId").val();
		 var fuelType = $("#fuelType").val();
		 var status = $("#delStatus").val();
		 var vehId=$("#vehId").val();
		 //alert(vehId)
		if(status==1 &&  vehId==0){
			alert("Unable To Add InActive Vehicle") 
		 }else{
			 if(makeId=="")
			 {
			 alert("Enter Vehicle No ");
			 }else{
				 $("#submitMaterialStore").submit();
			 }
			 
		 } 
		 
		 
	
		
		
		 
	
}
	
	function cancel1() {

         //alert("cancel");
         document.getElementById("cancel").disabled=true; 
		document.getElementById("vehId").value="";
								document.getElementById("vehName").value=""; 
								document.getElementById("makeId").value="";
								$('#makeId').trigger("chosen:updated");
								document.getElementById("engNo").value="";
								document.getElementById("chsNo").value="";
								document.getElementById("color").value="";
								document.getElementById("purDate").value="";
								document.getElementById("regDate").value="";
								document.getElementById("cmpnyAvg").value="";
								document.getElementById("standAvg").value="";
								document.getElementById("miniAvg").value="";
								document.getElementById("fuelType").value="";
								$('#fuelType').trigger("chosen:updated");
								document.getElementById("frqKm").value="";
								document.getElementById("wheelChange").value="";
								document.getElementById("batryChange").value="";
								document.getElementById("acChang").value="";
								document.getElementById("currentRunningKm").value="";
								document.getElementById("lastServicingKm").value="";
								document.getElementById("nextServicingKm").value="";
								document.getElementById("alertNextServicingKm").value="";
								document.getElementById("lastAmcDate").value="";
								document.getElementById("nextAmcDate").value="";
								document.getElementById("alertAmcDate").value="";
		var html = '<option value="">Select Type</option>';
		$('#typeId').html(html);
		$('#typeId').trigger("chosen:updated");
		var html = '<option value="">Select Variant</option>';
		$('#variantId').html(html);
		$('#variantId').trigger("chosen:updated");
		var html = '<option value="">Select Dealer</option>';
		$('#dealerId').html(html);
		$('#dealerId').trigger("chosen:updated");
	
}
		
		$(document).ready(function() { 
			$('#makeId').change(
					function() {
						//alert("makeId"+$(this).val());
						var makeId=$(this).val();
					    
						$.getJSON('${typeByMakeId}', {
							
							makeId : $(this).val(),
							ajax : 'true'
						},
								function(data) {
							 
							var html = '<option value="">Select Type</option>';
							
							var len = data.length;
							for ( var i = 0; i < len; i++) {
								html += '<option value="' + data[i].vehiTypeId + '">'
										+ data[i].vehTypeName + '</option>';
							}
							html += '</option>';
							$('#typeId').html(html);
							$("#typeId").trigger("chosen:updated");
													
								});
					 
						 
				})
				 		 
		});
		
		$(document).ready(function() { 
			$('#typeId').change(
					function() {
						//alert("makeId"+$(this).val());
						var typeId=$(this).val();
						var makeId = $("#makeId").val();
					    
						$.getJSON('${variantByTypeId}', {
							
							typeId : $(this).val(),
							makeId : makeId,
							ajax : 'true'
						},
								function(data) {
							 
							var html = '<option value="">Select Variant</option>';
							
							var len = data.length;
							for ( var i = 0; i < len; i++) {
								html += '<option value="' + data[i].variantId + '">'
										+ data[i].variantName + '</option>';
							}
							html += '</option>';
							$('#variantId').html(html);
							$("#variantId").trigger("chosen:updated");
													
								});
					 
						 
				})
				 		 
		});
		
		$(document).ready(function() { 
			$('#makeId').change(
					function() {
						//alert("makeId"+$(this).val());
						var typeId=$(this).val();
						var makeId = $("#makeId").val();
					    
						$.getJSON('${dealerByMakeId}', {
							
							typeId : $(this).val(),
							makeId : makeId,
							ajax : 'true'
						},
								function(data) {
							 
							var html = '<option value="">Select Dealer</option>';
							
							var len = data.length;
							for ( var i = 0; i < len; i++) {
								html += '<option value="' + data[i].dealerId + '">'
										+ data[i].dealerName + '</option>';
							}
							html += '</option>';
							$('#dealerId').html(html);
							$("#dealerId").trigger("chosen:updated");
													
								});
					 
						 
				})
				 		 
		});
		 
		 
	</script>
	
	
	
	
	<script>
function myFunction() {
  var input, filter, table, tr, td,td1, i;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("table_grid");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[1];
    td1 = tr[i].getElementsByTagName("td")[1];
    if (td || td1) {
      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      }else if (td1.innerHTML.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      }  else {
        tr[i].style.display = "none";
      }
    }       
  }//end of for
  
 
  
}
</script>
	
	<script type="text/javascript">
$('#selAllChkbx').click(function(event) {   
	//alert("Hiii")//chk
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
function displayFrList(val) {
	//alert("Hiii"+val)
	
	$.getJSON('${getFrByVehId}',

			{
		vehId:val,
				ajax : 'true'

			},
			function(data) {
				
				//alert(JSON.stringify(data))
				
					$('#model_table td').remove();
						 
						if (data == "") {
							 
							alert("No Record");
						}  
					  $.each(data,function(key, itemList) { 
										 
						  				 
										var tr = $('<tr></tr>');  
									  	tr.append($('<td></td>').html(key+1)); 
									  	tr.append($('<td></td>').html(itemList.frName)); 
									  	/* tr.append($('<td></td>').html(itemList.rmName)); 
									  	tr.append($('<td></td>').html('  <a href="${pageContext.request.contextPath}/showRmRateVerificationDetailed/'+itemList.suppId+'/'+itemList.rmId+'" class="action_btn" ><abbr title="Details"><i class="fa fa-list"></i></abbr></a> ')); */
									  	
										$('#model_table tbody').append(tr);

										 openModel();

									})
				
				
			});
}
</script>
<script type="text/javascript">
function deleteMultiVehicle(){
	var vehId = [];										
	
	$(".chkcls:checkbox:checked").each(function() {
		vehId.push($(this).val());
	}); 
	//alert(vehId)

	$.getJSON('${delMultiVeh}',

			{
		vehId:JSON.stringify(vehId),
				ajax : 'true'

			},
			function(data) {
				//alert(JSON.stringify(data))
				alert(data.message)
			window.location.reload();
				
			});



}

</script>
 
</body>
</html>