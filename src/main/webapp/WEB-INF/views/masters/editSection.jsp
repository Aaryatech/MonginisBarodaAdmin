<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	 

	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
	<body  onload="onLoadFunc()"  >
	<c:url value="/getMenuByType" var="getMenuByType" ></c:url>
	
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
						<i class="fa fa-file-o"></i>Sub Category
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
								<i class="fa fa-bars"></i>Update Section   
							</h3>
							<div class="box-tool">
								<a href="${pageContext.request.contextPath}/showSubCatList"></a> <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a>
							</div>
							
						</div>
						<div ><!-- class="box-content" -->
							<form action="${pageContext.request.contextPath}/insertSection"
								class="form-horizontal" method="post" id="validation-form">

								<input type="hidden" name="sectionId" id="sectionId"
									value="${editSection.sectionId}" />
									
								
								<div class="frm_Sec_one single">
									<div class="row">
										<div class="col-md-6 box_marg">
													<label class="control-label left" for="item_name">Section Name</label>
														<div class="controls icon_add">
															<i class="fa fa-road frm_icon" aria-hidden="true"></i>
															<input type="text" name="sectionName" id="sectionName"
											placeholder="Section Name" class="form-control padd_left"
											data-rule-required="true" value="${editSection.sectionName}" />
															
															</div>
												</div>
												
										<div class="col-md-6 box_marg">
													<label class="control-label left" for="item_name">Section Type</label>
														<div class="controls icon_add">
															<i class="fa fa-road frm_icon" aria-hidden="true"></i>
															<select class="form-control padd_left chosen" name="sec_type"
											id="sec_type" data-rule-required="true">

											<c:forEach items="${sectionTypeList}" var="secType">
											<c:choose>
												<c:when test="${editSection.sectionType==secType.id}">
												<option selected="selected" value="${secType.id}"><c:out
														value="${secType.sectiontypeName}" /></option>
												
												</c:when>
												<c:otherwise>
												<option value="${secType.id}"><c:out
														value="${secType.sectiontypeName}" /></option>
												</c:otherwise>
											
											</c:choose>
												

											</c:forEach>
										</select>
															
															</div>
												</div>
												
										<div class="col-md-6 box_marg">
													<label class="control-label left" for="item_name">Menu Type</label>
														<div class="controls icon_add">
															<i class="fa fa-road frm_icon" aria-hidden="true"></i>
															<select class="form-control padd_left input-sm"
											name="isSameDayAppicable" id="isSameDayAppicable"
											onchange="selectMenuType(this.value)">
											
											<c:choose>
											<c:when test="${editSection.menuType==-1 }">
											<option >Select Menu Type</option>
											<option selected="selected" value="-1">All</option>
											<option value="0">Regular</option>
											<option value="3">Regular cake As SP Order</option>
											<option value="2">Special Cake</option>
											
											</c:when>
											<c:when test="${editSection.menuType==0 }">
											<option >Select Menu Type</option>
											<option  value="-1">All</option>
											<option selected="selected" value="0">Regular</option>
											<option value="3">Regular cake As SP Order</option>
											<option value="2">Special Cake</option>
											
											</c:when>
											<c:when test="${editSection.menuType==3 }">
											<option >Select Menu Type</option>
											<option  value="-1">All</option>
											<option  value="0">Regular</option>
											<option selected="selected" value="3">Regular cake As SP Order</option>
											<option value="2">Special Cake</option>
											
											</c:when>
											<c:when test="${editSection.menuType==2 }">
											<option >Select Menu Type</option>
											<option  value="-1">All</option>
											<option  value="0">Regular</option>
											<option  value="3">Regular cake As SP Order</option>
											<option selected="selected" value="2">Special Cake</option>
											
											</c:when>
											<c:otherwise>
											<option >Select Menu Type</option>
											<option  value="-1">All</option>
											<option  value="0">Regular</option>
											<option  value="3">Regular cake As SP Order</option>
											<option selected="selected" value="2">Special Cake</option>
											
											</c:otherwise>
											
											
											</c:choose>
											

										</select>	
															
															</div>
												</div>	
												
										<div class="col-md-6 box_marg">
													<label class="control-label left" for="item_name">Status</label>
														<div class="controls icon_add">
															<c:choose>
												<c:when test="${editSection.isActive==1}">
												<label class="radio-inline"> <input type="radio"
													name="fr_status" id="optionsRadios1" value="0" >
													Active
												</label> <label class="radio-inline"> <input type="radio"
													name="fr_status" id="optionsRadios1" value="1" checked />
													In-active
												</label>
												
												</c:when>
												<c:otherwise>
												<label class="radio-inline"> <input type="radio"
													name="fr_status" id="optionsRadios1" value="0" checked >
													Active
												</label> <label class="radio-inline"> <input type="radio"
													name="fr_status" id="optionsRadios1" value="1"  />
													In-active
												</label>
												
												</c:otherwise>
											
											
											</c:choose>
										</select>
															
															</div>
												</div>			
												
										<div class="clr"></div>	
										
										<div class="col-md-12 box_marg">
													<label class="control-label left" for="item_name">Select Menu</label>
														<div class="controls icon_add">
															<i class="fa fa-road frm_icon" aria-hidden="true"></i>
											<select data-placeholder="Select Menu"
											class="form-control padd_left chosen" name="menuIds" id="menuIds"
											data-rule-required="true" multiple="multiple">

											


										</select>
															
															</div>
												</div>
												
												<div class="clr"></div>	
												
															
												
									</div>
								</div>		
									

								



								



								

								
								
							

							<div class="form-group">
								<div class="three_buttons">
									<input type="submit" class="btn btn-primary" value="Submit" onclick="return validate()">
									<button type="button" class="btn btn-primary">Cancel</button>
							</div>
								</div>




								<div class="form-group">
									<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2">
										
									</div>
								</div>
							</form>
						</div>
						
						
					</div>
				</div>
			</div>
				<div class="box">
			 	<!-- <div class="box-title">
					<h3>
						<i class="fa fa-table"></i> 
					</h3>
					<div class="box-tool">
						<a data-action="collapse" href="#"><i class="fa fa-chevron-up"></i></a>
						 
					</div>
				</div> -->
               	<%-- <div class="box-content">
 
                 <jsp:include page="/WEB-INF/views/include/tableSearch.jsp"></jsp:include>

							<div class="clearfix"></div>
							
							<div class="tableFixHead">
      
    </div>
    
    
							
								
				</div> --%>
         </div>
			
			<!-- END Main Content -->
			<footer>
			<p>2018 © MONGINIS.</p>
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
<script type="text/javascript">
function selectMenuType(val) {
	//alert("Hiiii")
	//alert(val)
	  $.post('${getMenuByType}', {
		  menuType :val,
	    ajax : 'true'
		}, function(data) {
			//alert(JSON.stringify(data))
			var html = '<option value="">Select Menu</option>';
			
			var len = data.length;
			
			$('#menuIds')
		    .find('option')
		    .remove()
		    .end()
		 /*  $("#menuIds").append($("<option></option>").attr( "value",-1).text("ALL"));  */

			for ( var i = 0; i < len; i++) {

               $("#menuIds").append(
                       $("<option selected></option>").attr(
                           "value", data[i].menuId).text(data[i].menuTitle)
                   );
			}
	
			   $("#menuIds").trigger("chosen:updated");
			
		});
	
	
	
}


</script>
<script type="text/javascript">
function onLoadFunc() {
	//alert("Hiii")
	var id=document.getElementById("isSameDayAppicable").value;
	//alert(id);
	selectMenuType(id);
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

</body>

</html>