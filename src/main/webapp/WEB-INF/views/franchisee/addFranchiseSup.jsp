<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<body onload="disableFranchise(${isEdit},${frIdForSupp})">

	<jsp:include page="/WEB-INF/views/include/logout.jsp"></jsp:include>

	<c:url var="findFranchiseeData" value="/findFranchiseeData" />


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
						<i class="fa fa-file-o"></i>Franchisee Supplement
					</h1>-->

				</div>
			
			</div> 
			<!-- END Page Title -->

			<c:set var="isEdit" value="0">
			</c:set>

			<c:set var="isDelete" value="0">
			</c:set>

			<c:set var="isAdd" value="0">
			</c:set>


			<c:forEach items="${sessionScope.newModuleList}" var="modules">
				<c:forEach items="${modules.subModuleJsonList}" var="subModule">
					<c:choose>
						<c:when
							test="${subModule.subModuleMapping eq 'showAddFranchiseSup'}">

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


						</c:when>
					</c:choose>

				</c:forEach>
			</c:forEach>

<%-- ${isEdit} ${isDelete} --%>
			<!-- BEGIN Main Content -->
			<div class="row">
				<div class="col-md-12">
					<div class="box">
						<div class="box-title">
							<h3>
								<i class="fa fa-bars"></i> Add Franchisee Supplement 
							</h3>
							<div class="box-tool">
								<a href="${pageContext.request.contextPath}/"></a> <a
									data-action="collapse" href="#"><i class="fa fa-chevron-up"></i></a>
							</div>

						</div>




						<div class="box-content">
							<form action="${pageContext.request.contextPath}/addFrSupProcess"
								class="form-horizontal" method="post" id="validation-form">

								<input type="hidden" name="id" id="id" value="${frSup.id}" />
								
								
								<div class="form-group marg_zero">
									<div class="frm_Sec_one">
									
									<div class="row">
										<div class="col-md-3 box_marg">
											<label class="control-label left">Franchisee</label>
									<div class="controls icon_add">
										<i class="fa fa-home frm_icon" aria-hidden="true"></i>
										<select name="fr_id" id="fr_id" class="form-control padd_left chosen"
											placeholder="Select Franchise" data-rule-required="true"
											onchange="onFrIdChange(this.value)">
											<option value="">Select Franchise</option>
											<c:forEach items="${franchiseeList}" var="franchiseeList">
												<c:choose>
													<c:when
														test="${franchiseeList.frId==frSup.frId || franchiseeList.frId==frIdForSupp}">
														<option value="${franchiseeList.frId}" selected><c:out
																value="${franchiseeList.frName}"></c:out></option>
													</c:when>
													<c:otherwise>
														<option value="${franchiseeList.frId}"><c:out
																value="${franchiseeList.frName}"></c:out></option>
													</c:otherwise>
												</c:choose>
											</c:forEach>

										</select>
									</div>
									<span class="span_err" id="err_fan" >Select Franchise</span>
										</div>
										
										<div class="col-md-3 box_marg">
											<label class="control-label left">PAN No.</label>
									<div class="controls icon_add">
										<i class="fa fa-credit-card frm_icon" aria-hidden="true"></i>
										<input type="text" name="pan_no" id="pan_no"
											placeholder="PAN No" class="form-control padd_left"
											data-rule-required="true" value="${frSup.frPanNo}" />
											
										
									</div>
									<span class="span_err" id="err_pan" >Enter PAN No</span>
										</div>
										
										
										<div class="col-md-3 box_marg">
											<label class="control-label left">No. In Route</label>
									<div class="controls icon_add">
										<i class="fa fa-road frm_icon" aria-hidden="true"></i>
										<input type="text" name="no_in_route" id="no_in_route"
											placeholder="No. In Route" class="form-control padd_left"
											data-rule-required="true" value="${frSup.noInRoute}" />
									</div>
										</div>
										
										<div class="col-md-3 box_marg" style="display: none;">
											<label class="control-label left">Country</label>
									<div class="controls icon_add">
										<i class="fa fa-map-marker frm_icon" aria-hidden="true"></i>
										<input type="text" name="fr_country" id="fr_country"
											placeholder="Country" class="form-control padd_left"
											value="NA" />
									</div>
										</div>
										
										<div class="col-md-3 box_marg">
											<label class="control-label left">State</label>
									<div class="controls icon_add">
										<i class="fa fa-map-marker frm_icon" aria-hidden="true"></i>
										<select class="form-control padd_left chosen" data-live-search="true"
											title="Please Select" name="fr_state" id="fr_state"
										 required>

											<c:forEach items="${stateList}" var="stateList">
												<c:choose>
													<c:when
														test="${stateList.stateName eq frSup.frState}">
														<option value="${stateList.stateName}" selected>${stateList.stateName}</option>
													</c:when>
													<c:otherwise>
														<option value="${stateList.stateName}">${stateList.stateName}</option>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</select>
									</div>
										</div>
										
										<div class="clr"></div>
										
										<div style="display: none;">
											<div class="col-md-3 box_marg">
											<label class="control-label left">Owner Password</label>
									<div class="controls icon_add">
										<i class="fa fa-key frm_icon" aria-hidden="true"></i>
										<input type="text" name="pass1" id="pass1"
												placeholder="User1 Password" class="form-control padd_left"
												data-rule-required="true" value="NA" value="${frSup.pass1}" />
									</div>
										</div>
										
										<div class="col-md-3 box_marg">
											<label class="control-label left">Captain Password</label>
									<div class="controls icon_add">
										<i class="fa fa-key frm_icon" aria-hidden="true"></i>
										<input type="text" name="pass2" id="pass2"
												placeholder="User2 Password" class="form-control padd_left"
												data-rule-required="true" value="NA" value="${frSup.pass2}"  />
									</div>
										</div>
										
										<div class="col-md-3 box_marg">
											<label class="control-label left">CSP Password</label>
									<div class="controls icon_add">
										<i class="fa fa-key frm_icon" aria-hidden="true"></i>
										<input type="text" name="pass3" id="pass3"
												placeholder="User3 Password" class="form-control padd_left"
												data-rule-required="true" value="NA" value="${frSup.pass3}" />
									</div>
										</div>
										
										<div class="col-md-3 box_marg">
											<label class="control-label left">Pest Control Date</label>
									<div class="controls icon_add">
										<i class="fa fa-calendar frm_icon" aria-hidden="true"></i>
										<input class="form-control padd_left date-picker" id="pest_control_date"
												size="16" type="text" name="pest_control_date" required
												placeholder="Pest Control Date"
												value="NA"
												onblur="return onPestControlDateChange()" ${frSup.pestControlDate} />
									</div>
										</div>
										
										<div class="col-md-3 box_marg">
											<label class="control-label left">Frequency</label>
									<div class="controls icon_add">
										<i class="fa fa-code frm_icon" aria-hidden="true"></i>
										<input type="text" name="frequency" id="frequency"
												placeholder="Frequency" class="form-control padd_left"
												data-rule-required="true" value="1" readonly ${frSup.frequency} />
									</div>
										</div>
										
										
										
										
										</div>
										
										<div class="col-md-3 box_marg">
											<label class="control-label left">Applicable to Dispatch</label>
									<div class="controls icon_add">
										<c:choose>
											<c:when test="${frSup.pass5==0}">

												<label class="radio-inline"> <input type="radio"
													name="fr_status" id="optionsRadios1" value="1" /> Yes
												</label>

												<label class="radio-inline"> <input type="radio"
													name="fr_status" id="optionsRadios1" value="0" checked />
													No
												</label>

											</c:when>
											<c:when test="${frSup.pass5==1}">

												<label class="radio-inline"> <input type="radio"
													name="fr_status" id="optionsRadios1" value="1" checked />
													Yes
												</label>
												<label class="radio-inline"> <input type="radio"
													name="fr_status" id="optionsRadios1" value="0" /> No
												</label>
											</c:when>
											<c:otherwise>

												<label class="radio-inline"> <input type="radio"
													name="fr_status" id="optionsRadios1" value="1" checked />
													Yes
												</label>

												<label class="radio-inline"> <input type="radio"
													name="fr_status" id="optionsRadios1" value="0" /> No
												</label>
											</c:otherwise>

										</c:choose>
									</div>
										</div>
										
										
										<div class="col-md-3 box_marg" style="display: none;">
											<label class="control-label left">Remainder Date</label>
									<div class="controls icon_add">
										<i class="fa fa-code frm_icon" aria-hidden="true"></i>
										<input class="form-control padd_left date-picker" id="remainder_date" size="16"
													type="text" name="remainder_date"
													 placeholder="Remainder Date" value="${frSup.remainderDate}"/>
									</div>
										</div>
										
										
										
										
									</div></div>
								</div>
								
							
						
								
								
								


							
								 <div class="form-group">
									<div class="row three_buttons padd_dic">
										<c:choose>
											<c:when test="${isAdd==1}">
												<input type="submit" class="btn btn-primary" value="Submit" id="sub_btn">
											</c:when>
											<c:otherwise>
												<input type="submit" disabled="disabled"
													class="btn btn-primary" value="Submit" id="sub_btn">
											</c:otherwise>
										</c:choose>
										<button type="button" class="btn btn-primary" onclick="window.location.reload()" >Cancel</button>
									</div>
								</div> 
							</form>
							
							</div></div>
							
							<div class="box">
								<div class="box-title">
									<h3>
										<i class="fa fa-table"></i>Franchisee Supplement List
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
      <table id="table2">
        <thead>
          <thead style="background-color: #f3b5db;">
				<tr>
					<th style="width: 75px; text-align: center;">Sr.No.</th>
					<th style="text-align: center;">Franchisee</th>
					<th style="text-align: center;">PAN No.</th>
					<th style="text-align: center;">State</th>
					<th style="text-align: center; width: 50px;">Action</th>
				</tr>
			</thead>
        <tbody>

													<c:forEach items="${frSupList}" var="frSupList"
														varStatus="count">
														<tr>

															<td  style="text-align: center;"><c:out value="${count.index+1}" /></td>
															<td  style="text-align: left;"><c:out value="${frSupList.frName}"></c:out></td>
															<td style="text-align: right;"><c:out value="${frSupList.frPanNo}"></c:out></td>
															<td align="center"><c:out value="${frSupList.frState}"></c:out></td>
														<c:choose>
															<c:when test="${isEdit==1}">
																<td style="text-align: right;"><a
																	href="${pageContext.request.contextPath}/updateFranchiseSup/${frSupList.id}"><i
																		class="fa fa-pencil" aria-hidden="true"></i></a>&nbsp;&nbsp;	
																</td>															
															</c:when>


															<c:otherwise>
																<td style="text-align: right;"><a class="disableClick" style="opacity: 0.5;"
																	href="${pageContext.request.contextPath}/updateFranchiseSup/${frSupList.id}"><i
																		class="fa fa-pencil" aria-hidden="true"></i></a>&nbsp;&nbsp;
																</td>
															</c:otherwise>
														</c:choose>




													</tr>

													</c:forEach>


												</tbody>
      </table>
      <br>
    </div>


									

								</div>


								
							</div>

						</div>
					</div>
					
					<footer>
	<p>2021 © Monginis.</p>
</footer>

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


</body>
<script>
function disableFranchise(isEdit,frIdForSupp) {
	onFrIdChange(frIdForSupp);
	if(isEdit==1)
		{
		$("#fr_id option:not(:selected)").prop("disabled", true);
		}

}
</script>
<script type="text/javascript">
/* $(document).ready(function() { 
	$('#fr_id').change( */
			function onFrIdChange(frId) {
				$.getJSON('${findFranchiseeData}', {
					fr_id : frId,
					ajax : 'true'
				}, function(data) {
					var len = data.length;
					document.getElementById("pass1").value=data.frPassword;
				});
			}
/* }); */
</script>


<script type="text/javascript">
$("#sub_btn")
.on(
		"click",
		function() {
			
			var isError = false;
			var errMsg = "";

			
			if (!$("#fr_id").val().trim()) {
				isError = true;
				$("#err_fan").show();
			} else {
				$("#err_fan").hide();
			}
			
			if (!$("#pan_no").val().trim()) {
				isError = true;
				$("#err_pan").show();
			} else {
				$("#err_pan").hide();
			}
			
			
			

		
			return false;
		});
</script>
<!-- 
<script type="text/javascript">
$(document).ready(function () {
    $('#pest_control_date').datepicker();
    $('#remainder_date').datepicker();
});


function onPestControlDateChange() {
	//$('#remainder_date').datepicker({ dateFormat: 'dd-mm-yy' }).val();
	
    var tt = document.getElementById('pest_control_date').value;
    var numberOfDaysToAdd =document.getElementById("frequency").value;

    var date = new Date(tt);
    var newdate = new Date(date);

    newdate.setDate(newdate.getDate());
    
    var dd = newdate.getDate()+numberOfDaysToAdd;
    var mm = newdate.getMonth() + 1;
    var y = newdate.getFullYear();

    var someFormattedDate = mm + '-' + dd + '-' + y;
    document.getElementById('remainder_date').value = someFormattedDate;
}
</script> -->
</html>
