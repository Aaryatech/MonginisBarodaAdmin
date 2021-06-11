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

  <c:url var="setAllFrIdSelected"  value="/setAllFrIdSelected" />
<c:url var="SearchByRouteIdsForVeh" value="/SearchByRouteIdsForVeh" ></c:url>
<c:url value="/getSecByTypeAjax" var="getSecByTypeAjax" ></c:url>
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
										<i class="fa fa-bars"></i> Section Configuration  
									</h3>
									<div class="box-tool">
										<a href="${pageContext.request.contextPath}/showSectionConfig">Back
											to List</a> <a data-action="collapse" href="#"><i
											class="fa fa-chevron-up"></i></a>
									</div>
								</div>

								<div class="box-content padd_zro">
									<form action="${pageContext.request.contextPath}/sectionConfigProcess" class="form-horizontal"
										id="validation-form" 
										method="post">
										
										
										<div class="frm_Sec_one single">
									
									<div class="row">
									
									<div class="col-md-12 box_marg">
											<label class="control-label left">Section Type</label>
												<div class="controls icon_add">
													<i class="fa fa-road frm_icon" aria-hidden="true"></i>	
													<select data-placeholder="Select Section Type" name="routeId"
													class="form-control padd_left chosen"  id="routeId" multiple="multiple"
													data-rule-required="true" onchange="getSectionByType()" >		
													<c:forEach items="${sectionTypeList}" var="secType">
												<option value="${secType.id}">${secType.sectiontypeName}</option>
												

											</c:forEach>
										</select>											
												</div>
												<span class="span_err" id="err_route" >Select Section Type</span>
										</div>
									
									
										<div class="col-md-12 box_marg">
											<label class="control-label left">Select Section</label>
												<div class="controls icon_add">
													<i class="fa fa-home frm_icon" aria-hidden="true"></i>	
													<select data-placeholder="Select Section" name="secIds"
													class="form-control padd_left chosen" tabindex="-1" id="secIds" multiple="multiple"
													data-rule-required="true" >
													<option value=""> </option>
														<option value="">Select Franchise</option>
														<option value="-1">ALL</option>
															
												

												</select>			
													
												</div>
												<span class="span_err" id="err_fr" >Select Section</span>
										</div>
										
										<div class="col-md-4 box_marg">
											<label class="control-label left">Select Menu</label>
												<div class="controls icon_add">
													<i class="fa fa-home frm_icon" aria-hidden="true"></i>	
													<select data-placeholder="Select Franchisee" name="menuIds"
													class="form-control padd_left chosen" tabindex="-1" id="menuIds" multiple="multiple"
													data-rule-required="true">
													<option value=""> </option>
														<option value="">Select Franchise</option>
														<option value="-1">ALL</option>
														<c:forEach
															items="${menuList}"
															var="menu">
															<option value="${menu.menuId}">${menu.menuTitle}</option>

														</c:forEach>
												

												</select>			
													
												</div>
												<span class="span_err" id="err_fr" >Select Menu</span>
										</div>
										
										<div class="col-md-2 box_marg">
											<div class="row three_buttons one_row">
									<c:choose>
													<c:when test="${isAdd==1}">
														<input type="submit" class="btn btn-primary" id="sub_btn"
															value="Submit" >
													</c:when>
													<c:otherwise>
														<input type="submit" class="btn btn-primary" id="sub_btn"
															disabled="disabled" value="Submit" >
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
								
								<div class="box">
			 	<div class="box-title">
					<h3>
						<i class="fa fa-table"></i> Section List
					</h3>
					<div class="box-tool">
						<a data-action="collapse" href="#"><i class="fa fa-chevron-up"></i></a>
						 
					</div>
				</div>
               	<div class="box-content">
 
                 <jsp:include page="/WEB-INF/views/include/tableSearch.jsp"></jsp:include>

							<div class="clearfix"></div>
							
							<div class="tableFixHead">
							
      <table id="table1">
        <thead>
          <thead style="background-color: #f3b5db;">
				<tr class="bgpink">
					<th style="text-align: center; width: 80px;">Sr. No.<input type="checkbox" id="selAllChkbx" name="selAllChkbx" ></th> 
			        <th style="text-align: center; min-width:130px;">Section Name </th>
			        <th style="text-align: center; min-width:130px;">Section Type </th>
			        <th style="text-align: center;"> Menu Name </th>
			        <th style="text-align: center;"> Staus </th>
			        <th style="text-align: center; width: 70px;">Action</th>
				</tr>
			</thead>
        <tbody>
						  <c:set var="cnt" value="0"></c:set>
					           <c:forEach items="${sectionList}" var="sectionList" varStatus="count">
				            
									<tr>
										<td  style="text-align: center;"><c:out value="${cnt+1}" /><c:set var="cnt" value="${cnt+1}"></c:set><input type="checkbox" class="chkcls" name="chkcls" id="catCheck+${sectionList.sectionId}" value="${sectionList.sectionId}"></td>
										<td align="left"><c:out value="${sectionList.sectionName}" /></td>
										<td align="left"><c:out value="${sectionList.secTypeName}" /></td>
										
										
										
										<td align="left">
											 <c:forEach items="${sectionList.menuList}" var="menuList" >
												<c:out value="${menuList.menuTitle}" />,
											</c:forEach> 
										</td>
										
										<c:choose>
										<c:when test="${sectionList.isActive==0}">
										<td align="left">Active</td>
										</c:when>
										<c:otherwise>
										<td align="left">In-Active</td>
										</c:otherwise>
										</c:choose>

										<c:choose>
											<c:when test="${isEdit==1 and isDelete==1}">
												<td align="right"><a
													href="${pageContext.request.contextPath}/editSection/${sectionList.sectionId}">
														<i class="fa fa-pencil" aria-hidden="true"></i>
												</a>&nbsp; <a
													href="${pageContext.request.contextPath}/deleteSection/${sectionList.sectionId}"
													onClick="return confirm('Are you sure want to delete this record');"><span
														class="glyphicon glyphicon-remove"></span></a></td>
											</c:when>

											<c:when test="${isEdit==1 and isDelete==0}">
												<td align="right"><a
													href="${pageContext.request.contextPath}/editSection/${sectionList.sectionId}">
														<i class="fa fa-pencil" aria-hidden="true"></i>
												</a>&nbsp; <a class="disableClick"
													href="${pageContext.request.contextPath}/deleteSection/${sectionList.sectionId}"
													onClick="return confirm('Are you sure want to delete this record');"><span
														class="glyphicon glyphicon-remove"></span></a></td>
											</c:when>

											<c:when test="${isEdit==0 and isDelete==1}">
												<td align="right"><a class="disableClick"
													href="${pageContext.request.contextPath}/editSection/${sectionList.sectionId}">
														<i class="fa fa-pencil" aria-hidden="true"></i>
												</a>&nbsp; <a
													href="${pageContext.request.contextPath}/deleteSection/${sectionList.sectionId}"
													onClick="return confirm('Are you sure want to delete this record');"><span
														class="glyphicon glyphicon-remove"></span></a></td>

											</c:when>

											<c:otherwise>
												<td align="right"><a class="disableClick" 
													href="${pageContext.request.contextPath}/editSection/${sectionList.sectionId}">
														<i class="fa fa-pencil" aria-hidden="true"></i>
												</a>&nbsp; <a class="disableClick"
													href="${pageContext.request.contextPath}/deleteSection/${sectionList.sectionId}"
													onClick="return confirm('Are you sure want to delete this record');"><span
														class="glyphicon glyphicon-remove"></span></a></td>
											</c:otherwise>
										</c:choose>





									</tr> 
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
    
							
								
				</div>
				 <button type="button" style="margin-left: 10px;margin-bottom: 10px" class="btn btn-primary"  onclick="deleteMultiSection()" >Delete</button>
    <input style="margin-left: 10px;margin-bottom: 10px" type="submit" class="btn btn-primary" onclick="getHeaders()" value="Excel/Pdf">
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

<script type="text/javascript">
function getSectionByType() {
	var secType=$('#routeId').val();
	//alert(secType);
	
		$.getJSON('${getSecByTypeAjax}', {
			secType : JSON.stringify(secType),
					ajax : 'true'
				}, function(data) {
					//alert(JSON.stringify(data))
					var html = '<option value="">Select Franchise</option>';
					
					var len = data.length;
					
					$('#secIds')
				    .find('option')
				    .remove()
				    .end()
					 $("#secIds").append($("<option></option>").attr( "value",-1).text("ALL"));

					for ( var i = 0; i < len; i++) {
	    
	                   $("#secIds").append(
	                           $("<option selected></option>").attr(
	                               "value", data[i].sectionId).text(data[i].sectionName)
	                       );
					}
			
					   $("#secIds").trigger("chosen:updated");
				});
	
}


</script>

<script>
$(document).ready(function() { // if all label selected set all items selected
	
	$('#fr_id').change(
			function () {
				 var selected=$('#fr_id').val();
				// alert("All")
	        if(selected==-1){
				$.getJSON('${setAllFrIdSelected}', {
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




$("#sub_btn")
.on(
		"click",
		function() {
		
		//	alert("Hiii")
			var isError = false;
			var errMsg = "";

			
			if (!$("#routeId").val()) {
				isError = true;
				$("#err_route").show();
			} else {
				$("#err_route").hide();
			}
		
			if (!$("#secIds").val()) {
				isError = true;
				$("#err_fr").show();
			} else {
				$("#err_fr").hide();
			}
		if(!isError){
			var form = document.getElementById("validation-form")
		    form.action ="${pageContext.request.contextPath}/sectionConfigProcess";
		    form.submit()
		}

			return false;
		});
</script>

</body>
</html>