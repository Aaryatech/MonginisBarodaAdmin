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

  <c:url var="setAllMenuSelectedfrStock"  value="/setAllMenuSelectedfrStock" />
<c:url var="SearchByRouteIdsForVeh" value="/SearchByRouteIdsForVeh" ></c:url>
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
						<i class="fa fa-file-o"></i> Franchisee
					</h1>-->
				</div> 
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

								<div class="box-content padd_zro">
									<form action="StockTypeMultiMapFranProcess" class="form-horizontal"
										id="validation-form" enctype="multipart/form-data"
										method="post">
										
										
										<div class="frm_Sec_one single">
									
									<div class="row">
									
									<%-- <div class="col-md-4 box_marg">
											<label class="control-label left">Select Routes</label>
												<div class="controls icon_add">
													<i class="fa fa-road frm_icon" aria-hidden="true"></i>	
													<select data-placeholder="Select Routes" name="routeId"
													class="form-control padd_left chosen" onchange="selectRoute()"  id="routeId" multiple="multiple"
													data-rule-required="true">		
													<c:forEach items="${routeList}" var="routeList">
													<c:set value="0" var="flag"/>
													<c:forEach items="${routeIds}" var="routeIds">
														<c:if test="${routeList.routeId==routeIds}">
															<c:set value="1" var="flag" />
														</c:if>
													</c:forEach>
													<c:choose>
														<c:when test="${flag==1}">
															<option selected="selected" value="${routeList.routeId}">${routeList.routeName}</option>
														</c:when>
														<c:otherwise>
															<option value="${routeList.routeId}">${routeList.routeName}</option>
														</c:otherwise>
													</c:choose>
											</c:forEach>
										</select>											
												</div>
										</div> --%>
									
									
										<div class="col-md-4 box_marg">
											<label class="control-label left">Franchisee</label>
												<div class="controls icon_add">
													<i class="fa fa-home frm_icon" aria-hidden="true"></i>	
													<select data-placeholder="Select Franchisee" name="fr_id"
													class="form-control padd_left chosen" tabindex="-1" id="fr_id" multiple="multiple"
													data-rule-required="true">
													<option value=""> </option>
														<option value="">Select Franchise</option>
														<option value="-1">ALL</option>
														<c:forEach
															items="${allFranchiseeAndMenuList.getAllFranchisee()}"
															var="franchiseeList">
															<option value="${franchiseeList.frId}">${franchiseeList.frName}</option>

														</c:forEach>
												

												</select>			
													
												</div>
										</div>
										
										<div class="col-md-4 box_marg">
											<label class="control-label left">Stock Type</label>
												<div class="controls icon_add">
													<i class="fa fa-file-text frm_icon" aria-hidden="true"></i>	
													<select class="form-control padd_left chosen" name="stId"
													id="stId" data-rule-required="true" required="required">
												<!-- 	<option value="-1" selected="selected" >Select Vehicle</option> -->
		
													<c:forEach items="${stockType}" var="stockType">
													<c:if test="">
													
													</c:if>
														<option value="${stockType.id}"><c:out value="${stockType.stockTypeName}"/></option>


													</c:forEach>


												</select>
													
													
												</div>
										</div>
										
										<div class="col-md-2 box_marg">
											<div class="row three_buttons one_row">
									<c:choose>
													<c:when test="${isAdd==1}">
														<input type="submit" class="btn btn-primary"
															value="Submit" onclick="validateFrm()">
													</c:when>
													<c:otherwise>
														<input type="submit" class="btn btn-primary"
															disabled="disabled" value="Submit">
													</c:otherwise>
												</c:choose>
								
								
								
										<input type="button" class="btn btn-primary" value="Cancel" id="cancel" onclick="window.location.reload()"> 
						</div>
										</div>
										<br><br>
										
										
									
									</div>
									
									
									
									
									
									</div>
									
									
									
									
									
									<%-- <div class="form-group">
								<div class="row three_buttons">
									<c:choose>
													<c:when test="${isAdd==1}">
														<input type="submit" class="btn btn-primary"
															value="Submit" onclick="validateFrm()">
													</c:when>
													<c:otherwise>
														<input type="submit" class="btn btn-primary"
															disabled="disabled" value="Submit">
													</c:otherwise>
												</c:choose>
								
								
								
										<input type="button" class="btn btn-primary" value="Cancel" id="cancel" onclick="cancel1()"> 
						</div>
								</div> --%>


										
											
									


									</form>
									
									
									
									
									
									
								</div>
								
								<div class="col-md-12 table-responsive">
							<table class="table table-bordered table-striped fill-head "
								style="width: 100%" id="table_grid1">
								<thead>
									<tr>
										<th style="text-align: center;">Sr.No.</th>
										<th style="text-align: center;width: 18%">Stock Type</th>
										<th style="text-align: center;" >Franchisee</th>
										
										
									</tr>
								</thead>
								
								<tbody>
							  <c:forEach items="${stockWithFr}" var="stocks"
													varStatus="count">

													<tr>
														<td style="text-align: center;" ><c:out value="${count.index+1}" /></td>

																<td align="left"><c:out
																value="${stocks.stockTypeName}" /></td>
														
															<td align="left"><c:out	
																value="${stocks.exVar2}" />
																</td>
													</tr>
												</c:forEach> 
										
									
								</tbody>
							</table>
						</div>
						<br>
						<br>
				
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


/* function  validateFrm(){
	alert("In Validate");
	alert(document.getElementById("fr_id").value)
	var frIds=document.getElementById("fr_id").value;
	var vehicleNo=document.getElementById("VehicleNo").value;
	var isError= false;
	if(vehicleNo==-1 || frIds==" "){
		//alert("empty v no");
		isError=true;
	}
	
	
	if(!isError){
		document.getElementById("validation-form").submit;
	}

} */
</script>
<script>
$(document).ready(function() { // if all label selected set all items selected
	
	$('#fr_id').change(
			function () {
				 var selected=$('#fr_id').val();
				// alert("All")
	        if(selected==-1){
				$.getJSON('${setAllMenuSelectedfrStock}', {
				//	selected : selected,
					ajax : 'true'
				}, function(data) {
					var html = '<option value="">Select Franchise</option>';
				
					var len = data.length;
					
					$('#fr_id')
				    .find('option')
				    .remove()
				    .end()
					 $("#fr_id").append($("<option></option>").attr( "value",-1).text("ALL"));

					for ( var i = 0; i < len; i++) {
	    
	                   $("#fr_id").append(
	                           $("<option selected></option>").attr(
	                               "value", data[i].frId).text(data[i].frName)
	                       );
					}
			
					   $("#fr_id").trigger("chosen:updated");
				});
	  }
	});
	});



</script>
<script type="text/javascript">
function selectRoute() {
	var routeId=$('#routeId').val();
	
	//alert(routeId);
	
	$.getJSON('${SearchByRouteIdsForVeh}',

				{
					routeId:JSON.stringify(routeId),
					ajax : 'true'

				},
				function(data) {
					//alert(JSON.stringify(data))
					var html = '<option value="">Select Franchise</option>';
					
					var len = data.length;
					
					$('#fr_id')
				    .find('option')
				    .remove()
				    .end()
					 $("#fr_id").append($("<option></option>").attr( "value",-1).text("ALL"));

					for ( var i = 0; i < len; i++) {
	    
	                   $("#fr_id").append(
	                           $("<option selected></option>").attr(
	                               "value", data[i].frId).text(data[i].frName)
	                       );
					}
			
					   $("#fr_id").trigger("chosen:updated");
					
				});
	
}
</script>

</body>
</html>