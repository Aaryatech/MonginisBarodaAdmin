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

	<c:url value="/chkUnqRoutePrefix" var="chkUnqRoutePrefix"></c:url>
	<c:url value="/chkUnqRouteShortName" var="chkUnqRouteShortName"></c:url>
	<c:url value="/getRoutePrintIds" var="getRoutePrintIds"></c:url>
	<c:url var="getFrByRouteId" value="/getFrByRouteId" ></c:url>

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
			<!-- <div class="page-title">
				<div>
					<h1>
						<i class="fa fa-file-o"></i> Route
					</h1>

				</div>
			</div> -->
			<!-- END Page Title -->



			<!-- BEGIN Main Content -->
			<div class="row">
				<div class="col-md-12">
					<div class="box">
						<div class="box-title">
							<h3>
								<i class="fa fa-bars"></i> Add Route
							</h3>
							<div class="box-tool">
								<a href=""></a> <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a>
							</div>
							<!-- <div class="box-tool">
								<a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a> <a data-action="close" href="#"><i
									class="fa fa-times"></i></a>
							</div> -->
						</div>


						<div class="box-content padd_zro">
							<form action="addRouteProcess" class="form-horizontal"
								method="post" id="validation-form">
								
								<div class="frm_Sec_one single">
									
									<div class="row">
										<div class="col-md-6 box_marg">
											<label class="control-label left">Route</label>
												<div class="controls icon_add">
													<i class="fa fa-road frm_icon" aria-hidden="true"></i>												
													<input type="text" name="route_name" id="route_name"
											placeholder="Route" class="form-control padd_left"
											data-rule-required="true" />
												</div>
										</div>
										
										<div class="col-md-6 box_marg">
											<label class="control-label left">Prefix</label>
									<div class="controls icon_add">
										<i class="fa fa-th-large frm_icon" aria-hidden="true"></i>	
										<input type="text" name="prefix" id="prefix"
											placeholder="Prefix" class="form-control padd_left"
											data-rule-required="true" /> <span for="prefix"
											id="unq_prefix" style="display: none; color: #b94a48;">Prefix
											already exits</span>
									</div>
											
										</div>
										
										
										<div class="col-md-6 box_marg">
											<label class="control-label left">Short Name</label>
									<div class="controls icon_add">
										<i class="fa fa-user frm_icon" aria-hidden="true"></i>
										<input type="text" name="short_name" id="short_name"
											placeholder="Route Short Name" class="form-control padd_left"
											data-rule-required="true" /> <span for="short_name"
											id="unq_short_name" style="display: none; color: #b94a48;">Short
											Name already exits</span>
									</div>
											
										</div>
										
										
										<div class="col-md-6 box_marg">
											<label class="control-label left">Min Km</label>
									<div class="controls icon_add">
										<i class="fa fa-road frm_icon" aria-hidden="true"></i>			
										<input type="text" name="min_km" id="min_km"
											placeholder="Min Km" class="form-control padd_left"
											data-rule-required="true" />
									</div>
											
										</div>
										
										
										<div class="col-md-6 box_marg">
											<label class="control-label left">Max Km</label>
									<div class="controls icon_add">
											<i class="fa fa-road frm_icon" aria-hidden="true"></i>
										<input type="text" name="max_km" id="max_km"
											placeholder="Max Km" class="form-control padd_left"
											data-rule-required="true" />
									</div>
											
										</div>
										
										
										<div class="col-md-6 box_marg">
											<label class="control-label left">ABC Type</label>
									<div class="controls icon_add">
										<i class="fa fa-bars frm_icon" aria-hidden="true"></i>	
										<select class="form-control padd_left chosen" name="acbType"
											id="acbType">
											<c:forEach items="${valList}" var="list">
												<option value="${list.abcId}">${list.abcVal}</option>
											</c:forEach>
										</select>
									</div>
											
										</div>
										
										
										<div class="col-md-6 box_marg">
											<label class="control-label left">Sequence No.</label>
									<div class="controls icon_add">
										<i class="fa fa-list frm_icon" aria-hidden="true"></i>	
										<input type="number" name="seqNo" id="seqNo"
											placeholder="0" class="form-control padd_left"
											data-rule-required="true" />
									</div>
											
										</div>
										
										
										
									
									</div>
								
								
								
									
										
									
									
								</div>	
								
								<div class="clr">
										<div class="form-group">
										<div class="row three_buttons">
											<button type="submit" class="btn btn-primary">Save and Next</button>
											<button type="submit" class="btn btn-primary">Save</button>
											<button type="submit" class="btn btn-primary"> Cancel</button>
										</div>
											
										</div>

								
								</div>
								
								
								
			</div>
								


								

							
</form>



<!-- newly added /form to be tested -->

				
<div class="box-content">

								<div class="box">
									<div class="box-title">
										<h3>
											<i class="fa fa-table"></i> Route List
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
										
										
										
										<div class="tableFixHead">
      <table id="table1">
        <thead>
          <thead style="background-color: #f3b5db;">
				<tr>
					<th width="45" style="width: 18px">#</th>
					<th style="text-align: center;">Name</th>
					<th style="text-align: center;">Sequence No</th>
					<th style="text-align: center;">ABC Type</th>
					<th style="text-align: center;">Action</th>
				</tr>
			</thead>
        </thead>
        <tbody>
													<c:forEach items="${routeList}" var="routeList" varStatus="count">
															<c:set value="0" var="flag" />																																						<c:set value="0" var="flag" />
													<c:forEach items="${routeIds}" var="routeIds">
														<c:choose>
															<c:when test="${routeList.routeId==routeIds}">
																<c:set value="1" var="flag" />
															</c:when>

														</c:choose>
													</c:forEach>
													<tr>
														<td style="text-align: left;">${count.index+1}<c:if test="${flag==0}">
																<input type="checkbox" class="chk"
																	name="select_to_print" id="${routeList.routeId}"
																	value="${routeList.routeId}" />
															</c:if></td>															
															
															<%-- <td onclick="openRoutePopup(${routeList.routeId},'${routeList.routeName}')" style="text-align: left;"><c:out
																	value="${routeList.routeName}"></c:out></td> --%>
															<td style="text-align: left;"><a
															href="javascript:void(0);"
															onclick="openRoutePopup(${routeList.routeId}, '${routeList.routeName}')">
																<c:out value="${routeList.routeName}"></c:out>
															</a></td>
															
															<td style="text-align: center;"><c:out
																	value="${routeList.seqNo}"></c:out></td>
																	<c:set value="-" var="type"> </c:set>
															<c:choose>
																<c:when test="${routeList.abcType==1}">
																	<c:set value="A" var="type"> </c:set>
																</c:when>
																<c:when test="${routeList.abcType==2}">
																	<c:set value="B" var="type"> </c:set>
																</c:when>
																<c:when test="${routeList.abcType==3}">
																	<c:set value="C" var="type"> </c:set>
																</c:when>
															</c:choose>
															
															<td style="text-align: center;"><c:out
																	value="${type}"></c:out></td>
															<td style="text-align: center;">
															
															<a
																href="${pageContext.request.contextPath}/updateRoute/${routeList.routeId}">
																<!-- <span class="glyphicon glyphicon-edit"></span> -->
																<i class="fa fa-pencil" aria-hidden="true"></i>
																</a>
																<c:if test="${flag==0}">
																<a href="${pageContext.request.contextPath}/deleteRoute/${routeList.routeId}"
																onClick="return confirm('Are you sure want to delete this record');">
																<!-- <span class="glyphicon glyphicon-remove"></span> -->
																<i class="fa fa-times" aria-hidden="true"></i>
																
																</a></c:if></td>
														</tr>

													</c:forEach>
												</tbody>
      </table>
    </div>
										
										
										
										
										
									</div>
									<div class="row two_buttons">
									
										<input type="button" id="btn_delete"
											class="btn btn-primary" onclick="deleteById()" 
											value="Delete" />
											
											
										<input type="button" id="btn_exl_pdf"
											class="btn btn-primary" onclick="getHeaders()" 
											value="Excel / Pdf" />
									</div>
								</div>
						</div>
						
						<div id="id01" class="modal">

								<div class="container1" style="background-color: #ffffff">
									<div class="col-md-12">
										<h1 class="popup_title">
											<i class="fa fa-list"></i>
											<span  id="subcatHeader"></span>
										</h1>
									</div>
									
									<div class="tableFixHead">
      <table id="table_grid11">
        <thead>
          <thead style="background-color: #f3b5db;">
				<tr>
					<th style="text-align: center;">SR.NO.</th>
					<th style="text-align: center;">Franchisee Name</th>
					<th style="text-align: center;">Fr Code</th>
					<th style="text-align: center;">City</th>
					<th style="text-align: center;">Owner</th>
					<th style="text-align: center;">Contact</th>
				</tr>
			</thead>
        <tbody>												
		</tbody>
      </table>
    </div>
    
								

								
									<!-- <div class="col-md-12 table-responsive">
										<table class="table table-bordered table-striped"
											style="width: 100%; height: 80px;" id="table_grid11">
											<thead style="background-color: #f3b5db;">
												<tr>
													<th style="text-align: center;">SR.NO.</th>
													<th style="text-align: center;">Franchisee Name</th>
													<th style="text-align: center;">Fr Code</th>
													<th style="text-align: center;">City</th>
													<th style="text-align: center;">Owner</th>
													<th style="text-align: center;">Contact</th>
												</tr>
											</thead>
											<tbody>												
											</tbody>
										</table>
									</div> -->
									
								

								 <div class="col-md-12" style="text-align: right; padding:10px 0;">
									<button type="button" 
										onclick="document.getElementById('id01').style.display='none'"
										class="btn btn-primary">CLOSE</button>
										
										<div style="clear:both"></div>
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
<table width="100%" class="table table-advance" id="printtable2"
		style="display: none;">
		<thead style="background-color: #f3b5db;">
			<tr>
				<th>Route</th>
				<th>Prefix</th>
				<th>Short Name</th>
				<th>Min Km.</th>
				<th>Max Km.</th>
				<th>ABC Type</th>
				<th>Sequence No.</th>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>

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
	<script>
				function getHeaders(){
					
					openModel();
					$('#modelTable td').remove();
				var thArray = [];
	
				$('#printtable2 > thead > tr > th').each(function(){
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
								'${getRoutePrintIds}',
								{
									elemntIds : JSON.stringify(elemntIds),
									val : val,
									ajax : 'true'
								},
								function(data) {
									if(data!=null){
										//$("#modal_theme_primary").modal('hide');
										if(val==1){
											window.open("${pageContext.request.contextPath}/exportToExcelNew");
											//document.getElementById("expExcel").disabled = true;
										}else{			
											 window.open('${pageContext.request.contextPath}/pdfForReport?url=pdf/getRouteListPdf/'+elemntIds.join());
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
function deleteById()
{

var checkedVals = $('.chk:checkbox:checked').map(function() {
    return this.value;
}).get();
checkedVals=checkedVals.join(",");

if(checkedVals=="")
	{
	alert("Please Select Route")
	}
else
	{
		if (confirm("Are you sure want to delete this records!")) {
			window.location.href='${pageContext.request.contextPath}/deleteRoute/'+checkedVals;
		}
	}

}
</script>
<script type="text/javascript">
function openRoutePopup(rId,name) {
	//alert(rId)
	//alert(name)
	$('#table_grid11 td').remove();
	$.getJSON(
					'${getFrByRouteId}',
					{
						routeId : rId,
						ajax : 'true'
					},
					function(data) {
						//alert(JSON.stringify(data))
						if(data==""){
							alert("No Franchise Found");
						}else{
							document.getElementById('id01').style.display='block';				
						}		
						 document.getElementById('subcatHeader').innerHTML = name;

						 $.each(data, function(key, item) {
							 
							 
											var tr = $('<tr></tr>');

											tr
											 .append($(
															'<td></td>')
															.html(
																	key + 1));

											tr
											 .append($(
															'<td></td>')
															.html(
																	item.frName));													
											tr
											.append($(
													'<td></td>')
													.html(
															item.frCode));
											
											tr
											.append($(
													'<td></td>')
													.html(
															item.frCity));
											
											tr
											.append($(
													'<td></td>')
													.html(
															item.frOwner));
											
											tr
											.append($(
													'<td></td>')
													.html(
															item.frMob));
											
											$('#table_grid11 tbody')
													.append(tr);
										});
					});
	
}


$( "#prefix" ).change(function() {
	var routePrefix = $("#prefix").val();
	var routeId = 0;	
	$
			.getJSON(
					'${chkUnqRoutePrefix}',
					{
						routePrefix : routePrefix,								
						routeId : routeId,
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
	
$( "#short_name" ).change(function() {
	var shortName = $("#short_name").val();
	var routeId = 0;	
	$
			.getJSON(
					'${chkUnqRouteShortName}',
					{
						shortName : shortName,								
						routeId : routeId,
						ajax : 'true'
					},
					function(data) {						
						if(data.error){
							$( "#unq_short_name" ).show();
							$( "#short_name" ).val('');
						}else{
							$( "#unq_short_name" ).hide();
						}
					});
	});

</script>
</body>
</html>