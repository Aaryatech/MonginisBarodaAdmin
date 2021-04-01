<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>Dashboard - MONGINIS Admin</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->

<!--base css styles-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/data-tables/bootstrap3/dataTables.bootstrap.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/assets/bootstrap-fileupload/bootstrap-fileupload.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/assets/chosen-bootstrap/chosen.min.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/assets/bootstrap-timepicker/compiled/timepicker.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/assets/clockface/css/clockface.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/assets/bootstrap-datepicker/css/datepicker.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/assets/bootstrap-daterangepicker/daterangepicker.css" />



<!--page specific css styles-->

<!--flaty css styles-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/flaty.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/flaty-responsive.css">

<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/img/favicon.png">

<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/common.js"></script>

</head> --%>
	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>

<body >

	<jsp:include page="/WEB-INF/views/include/logout.jsp"></jsp:include> 
	<c:url var="findEventList" value="/findEventList" />
<c:url var="getFlavoursByType" value="/getFlavoursByType" />

<style type="text/css">
	.two_col{display: inline-block; width: 100%; margin: 0 0 20px 0;}
	.help-block{color: #b94a48 !important;}
</style>


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
						<i class="fa fa-file-o"></i>Special Cake
					</h1>
				</div>
			</div> -->
			<!-- END Page Title -->


			<!-- BEGIN Main Content -->
			<div class="row">
				<div class="col-md-12">
					<div class="row">
						<div class="col-md-12">
							<div class="box">
								<div class="box-title">
									<h3>
										<i class="fa fa-bars"></i> Add Special Cake  
										
									</h3>
                         <div class="box-tool">
								<a href="${pageContext.request.contextPath}/showSpecialCake">Back to List</a> <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a>
							</div>
								</div>
								<div > <!-- class="box-content" -->
									<form action="addSpCakeProcess" class="form-horizontal"
									id="validation-form"
										enctype="multipart/form-data" method="post">
										
									
									<div class="frm_Sec_one single">									
										<div class="row">
											
										
										
											<div class="col-md-6 box_marg">
											<label class="control-label left">Code</label>
												<div class="controls icon_add">
													<i class="fa fa-road frm_icon" aria-hidden="true"></i>
													<input type="text" name="spc_code" id="spc_code"
													placeholder="Code" class="form-control padd_left" value="${spCode}"
													data-rule-required="true" />
													</div>
										</div>
										
										<div class="col-md-6 box_marg">
											<label class="control-label left">Name</label>
												<div class="controls icon_add">
													<i class="fa fa-road frm_icon" aria-hidden="true"></i>
													<input type="text" name="spc_name" id="spc_name" 
													class="form-control padd_left" placeholder="Name" data-rule-required="true"  />
													</div>
										</div>
										
										
										
										<div class="clr"></div>
										
										<div class="col-md-12 box_marg">
											<label class="control-label left">Description</label>
												<div class="controls icon_add">
													<i class="fa fa-road frm_icon" aria-hidden="true"></i>
													<input type="text" name="sp_desc" id="sp_desc"
													class="form-control padd_left" placeholder="Description" data-rule-required="true"  />
													
													
													
													</div>
										</div>
										
										
										
										<div class="col-md-6 box_marg">
											<label class="control-label left">Image</label>
												<div class="controls icon_add"><div class="fileupload fileupload-new"
													data-provides="fileupload">
													<div class="fileupload-new img-thumbnail"
														style="width: 200px; height: 150px;">
														<img
															src="http://www.placehold.it/200x150/EFEFEF/AAAAAA&amp;text=no+image"
															alt="" />
													</div>
													<div
														class="fileupload-preview fileupload-exists img-thumbnail"
														style="max-width: 211px; max-height: 150px; line-height: 20px;"></div>
													<div>
														<span class="btn btn-default btn-file"><span
															class="fileupload-new">Select image</span> <span
															class="fileupload-exists">Change</span> <input
															type="file" class="file-input" name="sp_image"
															id="fr_image" /></span> <a href="#"
															class="btn btn-default fileupload-exists"
															data-dismiss="fileupload">Remove</a>
													</div>
												</div>
													</div>
										</div>
										
										<div class="col-md-6 box_marg">
											<label class="control-label left">HSN Code</label>
												<div class="controls icon_add">
													<i class="fa fa-road frm_icon" aria-hidden="true"></i>
													<input type="text" name="spck_hsncd" id="spck_hsncd"
											placeholder="HSN Code" class="form-control padd_left"
											data-rule-required="true" value="19059010" />
													</div>
										</div>
										
										<div class="col-md-6 box_marg">
											<label class="control-label left">UOM</label>
												<div class="controls icon_add">
													<i class="fa fa-road frm_icon" aria-hidden="true"></i>
													<select name="spck_uom" id="spck_uom" class="form-control padd_left chosen"
											placeholder="Special Cake UOM" data-rule-required="true"
											onchange="uomChanged()">
											<option value="">Select Special Cake UOM</option>
											<c:forEach items="${rmUomList}" var="rmUomList"
												varStatus="count">
											  <c:choose>
											  <c:when test="${rmUomList.uom eq 'Kg'}">
											  <option value="${rmUomList.uomId}" selected><c:out value="${rmUomList.uom}"/></option>
											  
											  </c:when>
											  <c:otherwise>
											   <option value="${rmUomList.uomId}" ><c:out value="${rmUomList.uom}"/></option>
											  
											  </c:otherwise>
											  </c:choose>
												
											</c:forEach>
										</select>
										
													</div>
										</div>
										<input type="hidden" name="sp_uom_name" id="sp_uom_name"
									value="Kg" />
									
									<div class="col-md-6 box_marg">
											<label class="control-label left">Cake Type</label>
												<div class="controls icon_add">
													<i class="fa fa-road frm_icon" aria-hidden="true"></i>
													<select name="cut_section" id="cut_section"
											class="form-control padd_left chosen" data-rule-required="true">															
											<c:forEach items="${cakeTypeList}" var="cakeTypeList">
												<option value="${cakeTypeList.cakeTypeId}">${cakeTypeList.typeName}</option>
											</c:forEach>												
										</select>
										
													</div>
										</div>
										
										
										<div class="clr"></div>
										
										<div class="col-md-6 box_marg">
											<label class="control-label left">Cake Shape</label>
												<div class="controls icon_add">
													<i class="fa fa-road frm_icon" aria-hidden="true"></i>
													<select name="cake_shape" id="cake_shape"
											class="form-control padd_left chosen" multiple="multiple" data-rule-required="true">															
											<c:forEach items="${shapeList}" var="shapeList">
												<option value="${shapeList.shapeId}">${shapeList.shapeName}</option>
											</c:forEach>												
										</select>
													</div>
										</div>
										
										<div class="col-md-6 box_marg">
											<label class="control-label left">No. of Chars</label>
												<div class="controls icon_add">
													<i class="fa fa-road frm_icon" aria-hidden="true"></i>
													<input type="text" name="no_of_char" id="no_of_char"
													placeholder="No. of characters" class="form-control padd_left"
													data-rule-required="true" data-rule-number="true" value="0" />
													
													</div>
										</div>
										
										<div class="col-md-6 box_marg">
											<label class="control-label left">Is Customer Choice Cake?</label>
												<div class="controls icon_add"><label class="radio-inline"> <input type="radio" onchange="picReqView()"
													name="is_cust_choice_ck" id="is_cust_choice_ck" value="0"
													checked>No
												</label> <label class="radio-inline"> <input type="radio" onchange="picReqView()"
													name="is_cust_choice_ck" id="is_cust_choice_ck" value="1">
													Yes
												</label>
													
													</div>
										</div>
										
										<div class="col-md-6 box_marg">
											<label class="control-label left">Is Photo Upload Allow?</label>
												<div class="controls icon_add">
													<label class="radio-inline"> <input type="radio"
													name="allowphupload" id="allowphupload" value="0" onchange="picReqView()"
													checked>No
												</label> <label class="radio-inline"> <input type="radio" onchange="picReqView()"
													name="allowphupload" id="allowphupload" value="1">
													Yes
												</label>
													
													</div>
										</div>
										
										
										
										<div class="col-md-6 box_marg">
											<label class="control-label left">Flavour Type</label>
												<div class="controls icon_add">
													<i class="fa fa-road frm_icon" aria-hidden="true"></i>
													<select class="form-control padd_left chosen" name="spc_type" id="spc_type" data-rule-required="true">
													<option value="">Select Weight Increment By</option>
													
													<option value="1">Chocolate</option>
													<option value="2">Frsh Cream</option>
														<option value="3">ChocoFresh</option>
															<option value="4">All</option>
													
												</select>
													
													</div>
										</div>
										
										
										
										
										<div class="col-md-6 box_marg">
											<label class="control-label left">Min Weight</label>
												<div class="controls icon_add">
													<i class="fa fa-road frm_icon" aria-hidden="true"></i>
													<input type="text" name="min_weight" id="min_weight"
													placeholder="Min Weight" data-rule-required="true"
													class="form-control padd_left" data-rule-number="true"
													 />
													 
													
													</div>
										</div>
										
										<div class="col-md-6 box_marg">
											<label class="control-label left">Max Weight</label>
												<div class="controls icon_add">
													<i class="fa fa-road frm_icon" aria-hidden="true"></i>
													<input type="text" name="max_weight" id="max_weight"
													placeholder="Max Weight" data-rule-required="true"
													class="form-control padd_left" data-rule-number="true"
													 />
													 
													
													</div>
										</div>
										
										<div class="col-md-6 box_marg">
											<label class="control-label left">Book Before</label>
												<div class="controls icon_add">
													<i class="fa fa-road frm_icon" aria-hidden="true"></i>
													<input type="text" name="book_before" id="book_before"
													placeholder="Book Before" class="form-control padd_left"
													data-rule-required="true"
													data-rule-number="true" />
													
													</div>
										</div>
										
										<div class="col-md-6 box_marg">
											<label class="control-label left">Weight Increment By</label>
												<div class="controls icon_add">
													<i class="fa fa-road frm_icon" aria-hidden="true"></i>
													<select class="form-control padd_left chosen" name="sp_rate2" id="sp_rate2" data-rule-required="true">
													<option value="">Select Weight Increment By</option>
													<option value="0.5">0.5</option>
													<option value="1">1</option>
													<option value="1.5">1.5</option>
													<option value="2">2</option>
													<option value="2.5">2.5</option>
													<option value="3">3</option>
													<option value="3.5">3.5</option>
													<option value="4">4</option>
													<option value="4.5">4.5</option>
													<option value="5">5</option>
												</select>
													</div>
										</div>
										
										<div class="col-md-6 box_marg">
											<label class="control-label left">MRP1</label>
												<div class="controls icon_add">
													<i class="fa fa-road frm_icon" aria-hidden="true"></i>
													<input type="text" name="mrp_rate1" id="mrp_rate1"
													 placeholder="MRP Rate 1" class="form-control padd_left"
													 data-rule-required="true" value="0"
													data-rule-number="true" onchange="calMrp()"/>
													
													</div>
										</div>
										
										<div class="col-md-6 box_marg">
											<label class="control-label left">MRP2</label>
												<div class="controls icon_add">
													<i class="fa fa-road frm_icon" aria-hidden="true"></i>
													<input type="text" name="mrp_rate2" id="mrp_rate2"
													 placeholder="MRP Rate 2" class="form-control padd_left"
													 data-rule-required="true"
													data-rule-number="true" />
													
													</div>
										</div>
										
										<div class="col-md-6 box_marg">
											<label class="control-label left">MRP3</label>
												<div class="controls icon_add">
													<i class="fa fa-road frm_icon" aria-hidden="true"></i>
													<input type="text" name="mrp_rate3" id="mrp_rate3"
									                placeholder="MRP Rate 3" class="form-control padd_left" value="0"
													data-rule-number="true" data-rule-required="true" onchange="calMrp()"/>
													
													</div>
										</div>
										
										 <input type="hidden" value="0" name="margin">
											<input type="hidden" value="0" name="sp_rate1" id="sp_rate1">
											<input type="hidden" value="0" name="sp_rate3" id="sp_rate3">
											<input type="hidden" value="0" name="order_qty" id="order_qty">
											<input type="hidden" value="0" name="order_disc" id="order_disc"> 
											
											<div class="col-md-6 box_marg">
											<label class="control-label left">Tax %</label>
												<div class="controls icon_add">
													<i class="fa fa-road frm_icon" aria-hidden="true"></i>
													<input type="text" name="tax_3" id="tax_3"
													tax_3"" placeholder="IGST" class="form-control padd_left"
													data-rule-required="true" data-rule-number="true" value="18" onchange="calTotalGst()"/>
													
													</div>
										</div>
										
										<div class="col-md-6 box_marg" style="display:none;">
											<label class="control-label left">CGST %</label>
												<div class="controls icon_add">
													<i class="fa fa-road frm_icon" aria-hidden="true"></i>
													<input type="text" name="tax_1" id="tax_1"
													 placeholder="CGST" class="form-control padd_left"
													data-rule-required="true"
													data-rule-number="true" value="9.0" onchange="calTotalGst()"/>
													
													</div>
										</div>
										
										<div class="col-md-6 box_marg" style="display: none;">
											<label class="control-label left" >SGST %</label>
												<div class="controls icon_add">
													<i class="fa fa-road frm_icon" aria-hidden="true"></i>
													<input type="text" name="tax_2" id="tax_2"
													 placeholder="SGST" class="form-control padd_left"	
													data-rule-required="true" data-rule-number="true"
													value="9.0" />
													
													</div>
										</div>
										
										<div class="col-md-6 box_marg" style="display:none;">
											<label class="control-label left" >Cess(%)</label>
												<div class="controls icon_add">
													<i class="fa fa-road frm_icon" aria-hidden="true"></i>
													<input type="text" name="sp_cess" id="sp_cess"
													placeholder="Cess %" class="form-control padd_left"
													data-rule-required="true" data-rule-number="true"
													value="0.0" />
													
													</div>
										</div>
										
										<div class="col-md-6 box_marg">
											<label class="control-label left" style="display:none;">Is Photo Mandetory?</label>
												<div class="controls icon_add"><label class="radio-inline"> <input type="radio"
													name="isSlotUsed" id="isSlotUsed" value="0"
													checked>No
												</label> <label class="radio-inline"> <input type="radio"
													name="isSlotUsed" id="isSlotUsed" value="1">
													Yes
												</label>
													
													</div>
										</div>
										
										<div class="clr"></div>
										
										<input type="hidden" value="0" name="total_gst_appli">
										<div class="col-md-12 box_marg" >
											<label class="control-label left">Events</label>
												<div class="controls icon_add">
													<i class="fa fa-road frm_icon" aria-hidden="true"></i>
													<select data-placeholder="Select Events"
													class="form-control padd_left chosen" multiple="multiple"
													tabindex="6" name="spe_id_list[]" id="spe_id_list[]" data-rule-required="true" onchange="eventChange()">
													<option value=""> </option>
													<option value="0" >All</option>
														<c:forEach items="${eventList}" var="eventList">
															<option value="${eventList.speId}" selected>${eventList.speName}</option>
														</c:forEach>

												</select>
													
													</div>
										</div>
										
										<div class="col-md-12 box_marg" >
											<label class="control-label left">Flavours</label>
												<div class="controls icon_add">
													<i class="fa fa-road frm_icon" aria-hidden="true"></i>
													<select data-placeholder="Select Flavours" name="erplinkcode"
													class="form-control padd_left chosen" tabindex="-1" id="erplinkcode" multiple="multiple">
                                               		<c:forEach items="${flavoursList}" var="flavoursList"> 
                                               				<option value="${flavoursList.spfId}" selected>${flavoursList.spfName}</option>
                                               		</c:forEach>
												</select>
													
													</div>
										</div>
										
										<div class="col-md-6 box_marg">
											<label class="control-label left" >Is Addon Rate Appli?</label>
												<div class="controls icon_add">
												<label class="radio-inline"> <input type="radio"
													name="is_addon_rate_appli" id="is_addon_rate_appli" value="0"
													checked>No
												</label> <label class="radio-inline"> <input type="radio"
													name="is_addon_rate_appli" id="is_addon_rate_appli" value="1">
													Yes
												</label>
													
													</div>
										</div>
										<input type="hidden" name="type_2_applicable" id="type_2_applicable" value="1" >
										<div class="col-md-6 box_marg">
											<label class="control-label left" >Is Active?</label>
												<div class="controls icon_add">
												<label class="radio-inline"> <input type="radio"
													name="is_used" id="is_used" value="0"  > No
												</label> <label class="radio-inline"> <input type="radio"
													name="is_used" id="is_used" value="1" checked/> Yes
												</label>
												
												
													
													</div>
										</div>
										
										</div>
									</div>	
										
									
										
										
										
										
									
										
									
										
									<c:set var="eventList" value="${eventList}"></c:set>
										
										<!-- <input type="hidden" value="0" name="allowphupload"> -->
										
										<div class="form-group">
								<div class="row three_buttons">
									<button type="submit" class="btn btn-primary" style="width: 70px" onclick="return validation()">Submit</button>
									<button type="button" class="btn btn-primary">Cancel</button>
										
									
						</div>
								</div>
								
										
										
										
									
									</form>
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
	<%-- <script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-daterangepicker/date.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-daterangepicker/daterangepicker.js"></script> --%>
	
</body>
		
<script>
    function calTotalGst() {
   
	  var igst=parseFloat($("#tax_3").val());	  
	  $("#tax_1").val(igst/2);
	  $("#tax_2").val(igst/2);
	  //var totGst=parseFloat(cgst+sgst);
	 //document.getElementById("tax_2").setAttribute('value',sgst);
	 //document.getElementById("total_gst_appli").setAttribute('value', totGst);
}
   
</script>	
<!-- <script type="text/javascript">
function calMrp()
{
	var rate1 = parseFloat($("#sp_rate1").val());
	var rate2 = parseFloat($("#sp_rate2").val());
	var rate3 = parseFloat($("#sp_rate3").val());
	var margin= parseFloat($("#margin").val());
	
	var calRate1=rate1+(rate1*margin/100);
	var calRate2=rate2+(rate2*margin/100);
	var calRate3=rate3+(rate3*margin/100);
	document.getElementById("mrp_rate1").setAttribute('value', calRate1);
	document.getElementById("mrp_rate2").setAttribute('value', calRate2);
	document.getElementById("mrp_rate3").setAttribute('value', calRate3);
}
</script> -->
<script>
function eventChange()
{
 var event=$('#spe_id_list option:selected').val()
  if(event==0){
	  $.getJSON('${findEventList}', {
			ajax : 'true'
		}, function(data) {

			$('#spe_id_list')
		    .find('option')
		    .remove()
		    .end()

	var html = '<option value="0">ALL</option>';
	var len = data.length;
	
	for ( var i = 0; i < len; i++) {

       $("#spe_id_list").append(
               $("<option selected></option>").attr(
                   "value", data[i].speId).text(data[i].speName)
           );
	}

	   $("#spe_id_list").trigger("chosen:updated");
		});
  }
}
</script>


<script type="text/javascript">
	function uomChanged() {

		document.getElementById('sp_uom_name').value = $('#spck_uom option:selected').text();

	}
</script>

<script>
function picReqView() {
	//alert("Hiii");

	var custCh=$("input[type='radio'][name='is_cust_choice_ck']:checked").val();
	var picAllow=	$("input[type='radio'][name='allowphupload']:checked").val();
	//alert(custCh)
	//alert(picAllow)
	if(custCh==0 &  picAllow ==0){
		document.getElementById("picReqdiv").style.display = "none";	
		document.getElementById("isSlotUsed").value="0";
	}else{
		document.getElementById("picReqdiv").style.display = "block";	
	}
	
	 
	
}


</script>


<script type="text/javascript">
/* $(document).ready(function() { 
	$('#spc_type').change(
			function() {
				$.getJSON('${getFlavoursByType}', {
					type : $(this).val(),
					ajax : 'true'
				}, function(data) {
					var html = '<option value="" disabled>Flavours</option>';
				
					var len = data.length;
					
					$('#erplinkcode')
				    .find('option')
				    .remove()
				    .end()
				    
				 $("#erplinkcode").append(
                                $("<option></option>").attr(
                                    "value", 0).text("Select Flavours")
                            );
					
					for ( var i = 0; i < len; i++) {
                        $("#erplinkcode").append(
                                $("<option selected></option>").attr(
                                    "value", data[i].spfId).text(data[i].spfName)
                            );
					}
					   $("#erplinkcode").trigger("chosen:updated");
				});
			});
}); */
</script>
<!-- <script type="text/javascript">
function calMrp()
{
	var mrp1 = parseFloat($("#mrp_rate1").val());
	//var mrp2 = parseFloat($("#item_mrp2").val());
	var mrp3 = parseFloat($("#mrp_rate3").val());
	var margin= parseFloat($("#margin").val());
	
	var calRate1=mrp1-((mrp1*margin)/100);      
	//var calRate2=((mrp2*100)/(100+margin));  
	var calRate3=mrp3-((mrp3*margin)/100);  
	document.getElementById("sp_rate1").setAttribute('value', (calRate1).toFixed(2));
	//document.getElementById("item_rate2").setAttribute('value', (calRate2).toFixed(2));
	document.getElementById("sp_rate3").setAttribute('value', (calRate3).toFixed(2));
}
</script> -->
</html>