<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
.alert {
    padding: 20px;
    background-color: red;
    color: white;
    
}

.closebtn {
    margin-left: 15px;
    color: white;
    font-weight: bold;
    float: right;
    font-size: 22px;
    line-height: 20px;
    cursor: pointer;
    transition: 0.3s;
}

.closebtn:hover {
    color: black;
}
</style>
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<body>

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
				<!-- <div>
					<h1>
						<i class="fa fa-file-o"></i> Franchisee
					</h1>
				</div> -->
				<c:choose>
				<c:when test="${isError==true}">
				<div class="alert">
					<span class="closebtn"
						onclick="this.parentElement.style.display='none';">&times;</span>
					<strong>Failed !</strong>     Failed to Add New Franchisee !!
				</div>
				</c:when>
				</c:choose>
			
			</div>
			<!-- END Page Title -->


			<c:set var="isAdd" value="0">
			</c:set>

			<c:set var="isDelete" value="0">
			</c:set>

			<c:forEach items="${sessionScope.newModuleList}" var="modules">
				<c:forEach items="${modules.subModuleJsonList}" var="subModule">
					<c:choose>
						<c:when
							test="${subModule.subModuleMapping eq 'showAddNewFranchisee'}">

							<c:choose>
								<c:when test="${subModule.addApproveConfig=='visible'}">
									<c:set var="isAdd" value="1">
									</c:set>
								</c:when>
								<c:otherwise>
									<c:set var="isAdd" value="0">
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
					<div class="row">
						<div class="col-md-12">
							<div class="box">
								<div class="box-title">
									<h3>
										<i class="fa fa-bars"></i> Add Franchisee
									</h3>
									<div class="box-tool">
										<a href="${pageContext.request.contextPath}/listAllFranchisee">Back
											to List</a> <a data-action="collapse" href="#"><i
											class="fa fa-chevron-up"></i></a>
									</div>
								</div>

								<div class="box-content">
									<form action="addNewFrProcess" class="form-horizontal"
										id="validation-form" enctype="multipart/form-data"
										method="post">

										<div class="form-group marg_zero">
										
										<div class="frm_Sec_one">
											<div class="txt_title">Franchisee Info</div>
											
											<div class="row">
											<div class="col-md-6 box_marg">
												<label class="control-label left" for="fr_code">Code</label>
												<div class="controls icon_add">
													<i class="fa fa-code frm_icon" aria-hidden="true"></i>													
													<input type="text" name="fr_code" id="fr_code" autocomplete="off"
														class="form-control padd_left" value="${frCode}" required readonly />
												</div>
											</div>
											<div class="col-md-6 box_marg">
												<label class="control-label left">Opening
												Date</label>
											<div class="controls icon_add">
												<i class="fa fa-calendar frm_icon" aria-hidden="true"></i>
												<input class="form-control padd_left date-picker" id="fr_opening_date"
													size="16" type="text" name="fr_opening_date"  autocomplete="off"  
													placeholder="Opening Date" />
											</div>
											</div>
											
											<div class="col-md-6 box_marg">
												<label class="control-label left" for="fr_name">
												Name</label>
											<div class="controls icon_add">
											<i class="fa fa-user frm_icon" aria-hidden="true"></i>
												<input type="text" name="fr_name" id="fr_name" autocomplete="off"
													data-rule-required="true" class="form-control padd_left"
													placeholder="Name" required />
											</div>
											</div>
										
										<div class="col-md-6 box_marg">
												<label class="control-label left" for="fr_name"> Short Name</label>
											<div class="controls icon_add">
											<i class="fa fa-user frm_icon" aria-hidden="true"></i>
												<input type="text" name="showItem" id="showItem" autocomplete="off"
													data-rule-required="true" class="form-control padd_left"
													placeholder="Short Name" required />
											</div>
											</div>
											
											<div class="col-md-12 box_marg">
												<label class="control-label left" for="fr_name">Address</label>
											<div class="controls icon_add">
											<i class="fa fa-map-marker frm_icon" aria-hidden="true"></i>
											<input type="text" name="fr_addr" id="fr_addr" autocomplete="off"
													class="form-control padd_left"
													placeholder="Address" required />
											
												<!-- <textarea rows="9" cols="25" name="fr_addr" id="fr_addr"
													placeholder="Address" class="form-control" style="resize:none;"
													form="validation-form" required></textarea> -->
											</div>
											</div>
											
											<div class="col-md-6 box_marg">
												<label class="control-label left">Image</label>
											<div class="controls ">
												<div class="fileupload fileupload-new"
													data-provides="fileupload">
													<div class="fileupload-new img-thumbnail"
														style="width: 200px; height: 150px;">
														<img
															src="http://www.placehold.it/200x150/EFEFEF/AAAAAA&amp;text=no+image"
															alt="" />
													</div>
													<div
														class="fileupload-preview fileupload-exists img-thumbnail"
														style="max-width: 200px; max-height: 150px; line-height: 20px;"></div>
													<div>
														<span class="btn btn-default btn-file"><span
															class="fileupload-new">Select image</span> <span
															class="fileupload-exists">Change</span> <input
															type="file" class="file-input" name="fr_image"
															id="fr_image" /></span> <a href="#"
															class="btn btn-default fileupload-exists"
															data-dismiss="fileupload">Remove</a>
													</div>
												</div>

											</div>
											</div>
											
											
											
											<div class="col-md-6 box_marg">
												<label class="control-label left">Target Per Year</label>
											<div class="controls icon_add">
											<i class="fa fa-dot-circle-o frm_icon" aria-hidden="true"></i>
											
												<input type="text" name="fr_target" id="fr_target" autocomplete="off"
													placeholder="Target Per Year" class="form-control padd_left"
													data-rule-required="true" data-rule-number="true"
													onKeyPress="return isNumberCommaDot(event)" />
											</div>
											</div>
											<div class="col-md-6 box_marg">
												<label class="control-label left">Route</label>
											<div class="controls icon_add">
											<i class="fa fa-road frm_icon" aria-hidden="true"></i>
											
												<select class="form-control padd_left  chosen" name="fr_route_id" autocomplete="off"
													id="fr_route_id" data-rule-required="true">

													<c:forEach items="${routeList}" var="routeList">
														<option value="${routeList.routeId}"><c:out value="${routeList.routeName}---${routeList.exVar2}---${routeList.seqNo}"/></option>

													</c:forEach>
												</select>
											</div>
											</div>
											
											
											<div class="col-md-6 box_marg">
												<label class="control-label left">Rate Type</label>
											<div class="controls icon_add">
												<i class="fa fa-inr frm_icon" aria-hidden="true"></i>
												<select class="form-control padd_left chosen" name="fr_rate_cat"  autocomplete="off"
													id="fr_rate_cat" data-rule-required="true">

													<option value="1">Local Rate</option>
												
													<option value="3">Special Rate</option>

												</select>
											</div>
											</div>
											
											<div class="clr"></div>
											
											<div class="col-md-6 box_marg">
												<label class="control-label left">Stock Type</label>
											<div class="controls icon_add">
												<i class="fa fa-stack-exchange frm_icon" aria-hidden="true"></i>
												<select class="form-control padd_left  chosen" name="stock_type"  autocomplete="off"
													id="stock_type" data-rule-required="true">
												<c:forEach items="${stockTypeList}" var="stockType">
												<option value="${stockType.id}">${stockType.stockTypeName}</option>
												</c:forEach>
												<!-- 	<option value="1">Local Rate</option>
													<option value="2">OutStation Rate</option>
													<option value="3">Special Rate</option> -->

												</select>
											</div>
											</div>
											
											<div class="col-md-6 box_marg">
												<label class="control-label left">Rating</label>
											<div class="controls icon_add">
												<i class="fa fa-star frm_icon" aria-hidden="true"></i>
												<select class="form-control padd_left chosen" name="fr_rate"  autocomplete="off"
													id="fr_rate" data-rule-required="true">
													<option value="0">Rating 0.5</option>
													<option value="1">Rating 1</option>
													<option value="2">Rating 1.5</option>
													<option value="3">Rating 2</option>
													<option value="4">Rating 2.5</option>
													<option value="5">Rating 3</option>
													<option value="6">Rating 3.5</option>
													<option value="7">Rating 4</option>
													<option value="8">Rating 4.5</option>
													<option value="9">Rating 5</option>

												</select>
											</div>
											</div>
											<div class="col-md-6 box_marg">
												<label class="control-label left">City</label>
											<div class="controls icon_add">
												<i class="fa fa-map-marker frm_icon" aria-hidden="true"></i>
												<input type="text" name="fr_city" id="fr_city"  autocomplete="off"
													placeholder="City" class="form-control padd_left"
													data-rule-required="true" />
											</div>
											</div>
											
											<div class="col-md-6 box_marg">
												<label class="control-label left">Vehicle No.</label>
											<div class="controls icon_add">
												<i class="fa fa-map-marker frm_icon" aria-hidden="true"></i>
												<select class="form-control padd_left  chosen" name="kg_1"  autocomplete="off"
													id="kg_1" data-rule-required="true"  required="required" >
													<option value="0">Select Delivery Vehicle No</option>		
													<c:forEach items="${vehicleList}" var="vehicleList">
														<option value="${vehicleList.vehId}"><c:out value="${vehicleList.vehNo}"/></option>
													</c:forEach>
												</select>
											</div>
											</div>
											
											<div class="col-md-6 box_marg" style="display: none;">
												<label class="control-label left">1/2 Kg
												Cake</label>
											<div class="controls icon_add">
												<i class="fa fa-birthday-cake frm_icon" aria-hidden="true"></i>
												<input type="text" name="kg_2" id="kg_2" value="0" placeholder="Qty"  autocomplete="off"
													value="0" class="form-control padd_left" data-rule-number="true"
													onKeyPress="return isNumberCommaDot(event)"/>
											</div>
											</div>
											
											<div class="col-md-6 box_marg" style="display: none;">
													<label class="control-label left">1 Kg
												Cake</label>
											<div class="controls icon_add">
												<i class="fa fa-birthday-cake frm_icon" aria-hidden="true"></i>
												<input type="text" name="kg_3" id="kg_3" value="0" placeholder="Qty"  autocomplete="off"
													class="form-control padd_left" data-rule-number="true" 
													onKeyPress="return isNumberCommaDot(event)"/>
											</div>
												</div>
												
											<div class="col-md-6 box_marg" style="display: none;">
													<label class="control-label left">Above
												1 Kg Cake</label>
											<div class="controls icon_add">
												<i class="fa fa-birthday-cake frm_icon" aria-hidden="true"></i>
												<input type="text" name="kg_4" id="kg_4" placeholder="Qty"  autocomplete="off"
													class="form-control padd_left" 
													data-rule-number="true" value="0"
													onKeyPress="return isNumberCommaDot(event)"  />
											</div>
												</div>	
												
											<div class="col-md-6 box_marg" >
												<label class="control-label left"
												for="fr_password">Password</label>
											<div class="controls icon_add">
												<i class="fa fa-key frm_icon" aria-hidden="true"></i>
												<input type="password" name="fr_password" id="fr_password"  autocomplete="off"
													class="form-control padd_left" value="NA"	placeholder="Password" />
											</div>
											</div>
											
											<div class="col-md-6 box_marg" >
												<label class="control-label left"
												for="fr_confirm_password">Confirm Password</label>
											<div class="controls icon_add">
												<i class="fa fa-key frm_icon" aria-hidden="true"></i>
												<input type="password" name="fr_confirm_password"  autocomplete="off"
													id="fr_confirm_password" class="form-control padd_left"
													 value="NA" data-rule-equalTo="#fr_password"
													placeholder="Confirm Password" />
											</div>
											</div>	
											
											</div>
											<div class="clr"></div>
										</div>
										
										
										
											
											
											
										</div>

										


										


										
										


										
										
											<div class="form-group marg_zero">
											
											<div class="frm_Sec_one">
												<div class="txt_title">Owner Info</div>
												
												<div class="row">
												
												<div class="col-md-6 box_marg">
												<label class="control-label left" for="fr_email">Email
												Address:</label>
											<div class="controls icon_add">
												<i class="fa fa-envelope frm_icon" aria-hidden="true"></i>
												<input type="email" name="fr_email" id="fr_email"  autocomplete="off"
													class="form-control padd_left" data-rule-required="true"
													data-rule-email="true" placeholder="Enter Email Id" />
											</div>
											</div>
											
											<div class="col-md-6 box_marg">
												<label class="control-label left">Mobile</label>
											<div class="controls icon_add">
												<i class="fa fa-mobile frm_icon" aria-hidden="true"></i>
												<input type="text" name="fr_mob" id="fr_mob"  autocomplete="off"
													placeholder="Mobile" class="form-control padd_left"
													data-rule-required="true" data-rule-minlength="10"
													data-rule-maxlength="10"
													onKeyPress="return isNumberCommaDot(event)" />
											</div>
											</div>
											
											<div class="col-md-6 box_marg">
												<label class="control-label left">Owner
												Name</label>
											<div class="controls icon_add">
												<i class="fa fa-user frm_icon" aria-hidden="true"></i>
												<input type="text" name="fr_owner" id="fr_owner" autocomplete="off"
													placeholder="Owner Name" class="form-control padd_left"
													data-rule-required="true" />
											</div>
											</div>
											<div class="col-md-6 box_marg">
												<label class="control-label left">Owner's
												Birthdate</label>
											<div class="controls icon_add">
												<i class="fa fa-calendar frm_icon" aria-hidden="true"></i>
												<input class="form-control padd_left date-picker" id="fr_birth_date"
													size="16" type="text" name="fr_birth_date" 
													placeholder="Birthdate" />
											</div>
											</div>
												
												<div class="clr"></div>
												</div>
											</div>
											
												
												
												
											
											
											
												
											
										</div>
						
						
						
						<div class="form-group marg_zero">
											
											<div class="frm_Sec_one">
												<div class="txt_title">Tax Info</div>
												
												<div class="row">
												
												<div class="col-md-6 box_marg">
												<label class="control-label left">FDA License Expire Date</label>
											<div class="controls icon_add">
												<i class="fa fa-calendar frm_icon" aria-hidden="true"></i>
												<input class="form-control padd_left date-picker" autocomplete="off"
													id="fba_license_date" size="16" type="text"
													name="fba_license_date" required
													placeholder="FDA License Date" />
											</div>
											</div>
											<div class="col-md-6 box_marg">
												<label class="control-label left">Agreement Date</label>
											<div class="controls icon_add">
												<i class="fa fa-calendar frm_icon" aria-hidden="true"></i>
												<input class="form-control padd_left date-picker" autocomplete="off"
													id="fr_agreement_date" size="16" type="text"
													name="fr_agreement_date" 
													placeholder="Agreement Date" />
											</div>
											</div>
											
											<div class="col-md-6 box_marg">
												<label class="control-label left">GST Type</label>
											<div class="controls icon_add">
												<i class="fa fa-file-text frm_icon" aria-hidden="true"></i>
												<select class="form-control padd_left chosen" name="fr_gst_type" autocomplete="off"
													id="fr_gst_type" data-rule-required="true"
													onChange="changetextbox();">
													<option value="">Select GST Type</option>

													<c:forEach items="${frItemStockConfigures}"
														var="frItemStockConfigures">

														<option value="${frItemStockConfigures.settingValue}"><c:out value="${frItemStockConfigures.settingKey}" /></option>
													</c:forEach>

												</select>
											</div>
											</div>
											<div class="col-md-6 box_marg">
												<label class="control-label left">GST
												NO.</label>
											<div class="controls icon_add">
												<i class="fa fa-file-text frm_icon" aria-hidden="true"></i>
												<input type="text" name="fr_gst_no" id="fr_gst_no" autocomplete="off"
													placeholder="GST Number" class="form-control padd_left"
													data-rule-required="true"
													onKeyPress="return isNumberCommaDot(event)" />
											</div>
											</div>
											
											<div class="col-md-6 ">
												<label class="control-label left">Is Same State?</label>
											<div class="controls">
												<label class="radio-inline"> <input type="radio"
													name="is_same_state" id="optionsRadios1" value="1" checked /> Yes
												</label> <label class="radio-inline"> <input type="radio"
													name="is_same_state" id="optionsRadios1" value="0"> No
												</label>
											</div>
											</div>
											<div class="col-md-6 ">
												<label class="control-label left">Dispatch Applicable</label>
											<div class="controls">
												<label class="radio-inline"> <input type="radio"
													name="grn_two" id="optionsRadios1" value="1" checked/> Regular
												</label> <label class="radio-inline"> <input type="radio"
													name="grn_two" id="optionsRadios1" value="0"> Non-Regular
												</label>
											</div>
											</div>
											<div class="clr"></div>
											<div class="col-md-6 ">
												<label class="control-label left">Status</label>
											<div class="controls">
												<label class="radio-inline"> <input type="radio"
													name="fr_status" id="optionsRadios1" value="0" checked> Active
												</label> <label class="radio-inline"> <input type="radio"
													name="fr_status" id="optionsRadios1" value="1" /> In-active
												</label>
											</div>
											</div>
											
											
											
											
											
												
												<div class="clr"></div>
												</div>
											</div>
											
												
												
												
											
											
											
												
											
										</div>
										
										

										<div class="form-group">
											
												
											
												
										</div>


											
										
										

										<div class="form-group">
											<div
												class="col-sm-12" style="text-align: right;">
												<input type="submit" class="btn btn-primary"
															value="Save and Next ">
												<c:choose>
													<c:when test="${isAdd==1}">
														<input type="submit" class="btn btn-primary"
															value="Save">
													</c:when>
													<c:otherwise>
														<input type="submit" class="btn btn-primary"
															disabled="disabled" value="Save">
													</c:otherwise>
												</c:choose>
												
												
					
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

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/jquery-validation/dist/jquery.validate.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/jquery-validation/dist/additional-methods.min.js"></script>

	<script type="text/javascript">
function changetextbox()
{
    if (document.getElementById("fr_gst_type").value === "0") {
        document.getElementById("fr_gst_no").disabled = true;
    } else  if (document.getElementById("fr_gst_type").value === "2000000") {
        document.getElementById("fr_gst_no").disabled = false;
    }
    else
    	{
    	document.getElementById("fr_gst_no").disabled = false;
    	}
}
</script>

</body>
</html>