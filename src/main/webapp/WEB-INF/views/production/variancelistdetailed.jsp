<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 


 <jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
 <jsp:include page="/WEB-INF/views/include/logout.jsp"></jsp:include>
 
<body>
	<c:url var="varianceDetailedCalculation" value="/varianceDetailedCalculation"></c:url>	 
	<c:url var="getCalcVariatnWiseMenAjax" value="/getCalcVariatnWiseMenAjax"></c:url>

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
			<!-- 	<div>
					<h1>
						<i class="fa fa-file-o"></i>Variance Detailed
					</h1>
				</div>
			</div> -->
			<!-- END Page Title -->

			<div class="row">
				<div class="col-md-12">

					<div class="box">
						<div class="box-title">
							<h3>
								<i class="fa fa-table"></i>Variance Detailed
							</h3>


						</div>


						<div><!-- class="box-content" -->

							<form id="completproduction"
								action="${pageContext.request.contextPath}/varianceDetailedCalculation"
								method="post">
								
					<div class="frm_Sec_one single">
						<div class="row">
							<div class="col-md-6 box_marg">
							<label class="control-label left">Production Date</label>
							<div class="controls icon_add">
							<i class="fa fa-road frm_icon" aria-hidden="true"></i>
							<input type="text" id="productionDate" name="productionDate" value="${postProdPlanHeader.productionDate}"
							class="form-control padd_left" readonly>
							</div>
						</div>
						
						<input class="form-control"  id="time_slot" size="16" type="hidden" name="time_slot" value="${postProdPlanHeader.timeSlot}"/>
						
						<div class="col-md-6 box_marg">
							<label class="control-label left">Category</label>
							<div class="controls icon_add">
							<i class="fa fa-road frm_icon" aria-hidden="true"></i>
							<c:forEach items="${categoryList}" var="categoryList">
									 	<c:choose>
									 		<c:when test="${postProdPlanHeader.itemGrp1==categoryList.catId}">
									 			
									 			<input type="text" id="itemGrp1"
												name="itemGrp1" value="${categoryList.catName}"
												class="form-control padd_left" readonly>
									 		
									 		</c:when> 
										</c:choose>
									</c:forEach>
										<input type="hidden" id="itemGrp1"
											name="itemGrp1" value="${postProdPlanHeader.itemGrp1}"
											class="form-control" readonly>
							</div>
						</div>
						
						<div class="col-md-6 box_marg">
							<label class="control-label left">Section</label>
							<div class="controls icon_add">
							<i class="fa fa-road frm_icon" aria-hidden="true"></i>
							<select data-placeholder="Choose Section"
												class="form-control padd_left chosen" tabindex="6" id="section"
												name="section" onchange="getMenus(this.value)">
												<!-- <option value="-1">All</option> -->
												<option value="">Select Section</option>
												<c:forEach items="${section}" var="section"
													varStatus="count">
													<option value="${section.sectionId}"><c:out
															value="${section.sectionName}" /></option>
												</c:forEach>
											</select>
							</div>
						</div>
						
						<div class="col-md-6 box_marg">
							<label class="control-label left">Menu</label>
							<div class="controls icon_add">
							<i class="fa fa-road frm_icon" aria-hidden="true"></i>
							<select name="menu_id[]" id="menu_id" class="form-control padd_left chosen" tabindex="6" multiple="multiple" data-placeholder="Select Menu" >
											 <option  value="0">All</option> 
										</select>
							</div>
						</div>
						
						<div class="col-md-6 box_marg">
							<label class="control-label left">Select Franchisee</label>
							<div class="controls icon_add">
							<i class="fa fa-road frm_icon" aria-hidden="true"></i>
							<select name="fr_id[]" id="fr_id" class="form-control padd_left chosen" tabindex="6" multiple="multiple" data-placeholder="Select Franchisee" >
								 <option  value="0">All</option> 
								<c:forEach items="${allFrIdNameList}" var="allFrIdNameList"> 
									<option value="${allFrIdNameList.frId}"><c:out value="${allFrIdNameList.frName}"></c:out> </option>
								 </c:forEach>
							</select>
							</div>
						</div>
						
						<div class="col-md-6 box_marg">
							<label class="control-label left">Route</label>
							<div class="controls icon_add">
							<i class="fa fa-road frm_icon" aria-hidden="true"></i>
							<select name="rtid[]" id="rtid" class="form-control padd_left chosen" multiple="multiple" data-placeholder="Select Route" tabindex="6">
								<c:forEach items="${routeList}" var="routeList"> 
									<option value="${routeList.routeId}"><c:out value="${routeList.routeName}"></c:out> </option>
								 </c:forEach>
							</select>
							</div>
						</div>
						
						</div>
					</div>	
					
					<div class="form-group">
								<div class="three_buttons">
									<input type="submit" class="btn btn-primary" value="Calculate Variance" onclick="return ValidationEvent();">  			
									<button type="button" class="btn btn-primary">Cancel</button>
								</div>					
							</div>	
							
							
									
									 
								


								
									
									 
													
											 
											</form>
											
										</div>
				 
							
						</div> 
					</div> 
				</div> 
			</div>
				<jsp:include page="/WEB-INF/views/include/copyrightyear.jsp"></jsp:include>
		</div>
		<!-- END Main Content -->
		
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
		function ValidationEvent() { 
			 //alert("ala");
		var fr_id = $("#fr_id").val();
		var rtid = $("#rtid").val();
		var menu_id = $("#menu_id").val();
		//alert("fr_id"+fr_id);
		//alert("rtid"+rtid);
			if (fr_id ==null && rtid == null ) 
			{ 
				alert("Select Franchise Or Route");
				return false;
			} 
			else  if(menu_id == null)
				{
				alert("Select Menu");
				return false;
				}
			else
			{
				return true;
				
			}
		}
		
		
		</script>
		
		<script type="text/javascript">
function getMenus(sectionId) {
	$.getJSON('${getCalcVariatnWiseMenAjax}', {	
		sectionId : sectionId,
		ajax : 'true'
	}, function(data) {
		var len = data.length;
		
		$('#menu_id')
	    .find('option')
	    .remove()
	    .end()
		 $("#menu_id").append($("<option></option>").attr( "value",0).text("ALL")); 

		for ( var i = 0; i < len; i++) {

			$("#menu_id").append(
                       $("<option></option>").attr(
                           "value", data[i].menuId).text(data[i].menuTitle)
             );
		}

		   $("#menu_id").trigger("chosen:updated");
	});
}
</script>
</body>
</html>