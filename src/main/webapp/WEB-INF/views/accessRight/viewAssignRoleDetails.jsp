<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 
<style>
@media only screen and (min-width: 1200px) {
	.franchisee_label, .menu_label {
		width: 22%;
	}
	.franchisee_select, .menu_select {
		width: 76%;
	}
	.date_label {
		width: 40%;
	}
	.date_select {
		width: 50%;
		padding-right: 0px;
	}
}
</style> 
 <jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
 <jsp:include page="/WEB-INF/views/include/logout.jsp"></jsp:include>
<body>



 


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
				<h1>
					<i class="fa fa-file-o"></i>Access Right 
				</h1>
				<!-- <h4>Bill for franchises</h4> -->
			</div>
		</div>
		<!-- END Page Title -->


		<!-- BEGIN Main Content -->
		<div class="box">
			<div class="box-title">
				<h3>
					<i class="fa fa-bars"></i>View Access Role
				</h3>

			</div>
			<div><!--  class=" box-content" -->
				 <form id="validation-form" action="${pageContext.request.contextPath}/submitCreateRole" class="form-horizontal" 
					enctype="multipart/form-data" method="post">

              <input type="hidden" name="roleId" id="roleId" value="${roleId}"/>
				<!-- <div class="form-group">
									<label class="col-sm-3 col-lg-2 control-label">Enter Role
										Name</label>
									<div class="col-sm-9 col-lg-10 controls">
										<input type="text" name="roleName" id="roleName"
											placeholder="Department Name" class="form-control"
											data-rule-required="true" />
									</div><br/>
								</div> -->
								
				<div class="frm_Sec_one single">
					<div class="row">
						<div class="col-md-6 box_marg">
							<label class="control-label left"> User Name</label>
							<div class="controls icon_add">
							<i class="fa fa-user frm_icon" aria-hidden="true"></i>
							<input type="text" name="userName" id="userName"
							placeholder="User Name" class="form-control padd_left"
							data-rule-required="true" value="${userName}" readonly/>
							</div>
				   		</div>
				   		
				   		<div class="col-md-6 box_marg">
							<label class="control-label left"> Role Name</label>
							<div class="controls icon_add">
							<i class="fa fa-user frm_icon" aria-hidden="true"></i>
							<input type="text" name="roleName" id="roleName"
							placeholder="Role Name" class="form-control padd_left"
							data-rule-required="true" value="${roleName}" readonly />
				   		</div>
					</div>
				</div>
			</div>						


			<div class=" box-content">
				<div class="tableFixHead">
	<table id="table_grid">         
	<thead style="background-color: #f3b5db;">
		<tr class="bgpink">
			<th width="50">Sr.No.</th>
			<th width="200">Modules</th>
			<th width="50">View</th>
			<th width="50">Add</th>
			<th width="50">Edit</th>
			<th width="50">Delete</th>
		</tr>
	</thead>
	
	<tbody>

								<c:set var="index" value="0" />

								<c:forEach items="${moduleJsonList}" var="moduleJsonList"
									varStatus="count">

									<c:set var="flag" value="0" />

									<c:forEach items="${moduleJsonList.subModuleJsonList}"
										var="subModuleJsonList">
										<%-- 	<c:set var="view" value="" />
											<c:set var="edit" value="" />
											<c:set var="delete" value="" />
											<c:set var="add" value="" /> --%>
										<c:choose>
											<c:when test="${subModuleJsonList.type==0}">
												<c:set var="flag" value="1" />
											</c:when>
										</c:choose>
									</c:forEach>


									<c:choose>
										<c:when test="${flag==1}">
											<tr>
												<!-- 	<td> &nbsp; </td>
											</tr><tr>  -->
											<c:set var="index" value="${index+1 }" />
												<td><c:out value="${index}" /> </td>

												<td><b><c:out value="${moduleJsonList.moduleName}" /></b></td>

											</tr>
										</c:when>
									</c:choose>
									<c:forEach items="${moduleJsonList.subModuleJsonList}"
										var="subModuleJsonList">
										<c:choose>
											<c:when test="${subModuleJsonList.type==0}">
												<tr>
													<td></td>

													<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<c:out
															value="${subModuleJsonList.subModulName}" /></td>
													<c:choose>
														<c:when test="${subModuleJsonList.view=='visible'}">

															<td><input type="checkbox"
																class="check${moduleJsonList.moduleId}"
																name="${subModuleJsonList.subModuleId}${subModuleJsonList.moduleId}"
																value="view"  checked></td>
														</c:when>
														<c:when test="${subModuleJsonList.view=='hidden'}">

															<td><input type="checkbox"
																class="check${moduleJsonList.moduleId}"
																name="${subModuleJsonList.subModuleId}${subModuleJsonList.moduleId}"
																value="view" ></td>


														</c:when>
													</c:choose>

													<c:choose>
														<c:when test="${subModuleJsonList.addApproveConfig=='visible'}">

															<td><input type="checkbox"
																class="check${moduleJsonList.moduleId}"
																name="${subModuleJsonList.subModuleId}${subModuleJsonList.moduleId}"
																value="add"  checked></td>
														</c:when>
														<c:when test="${subModuleJsonList.addApproveConfig=='hidden'}">

														<td><input type="checkbox"
																class="check${moduleJsonList.moduleId}"
																name="${subModuleJsonList.subModuleId}${subModuleJsonList.moduleId}"
																value="add"   ></td>


														</c:when>
													</c:choose>

													<c:choose>
														<c:when test="${subModuleJsonList.editReject=='visible'}">

															<td><input type="checkbox"
																class="check${moduleJsonList.moduleId}"
																name="${subModuleJsonList.subModuleId}${subModuleJsonList.moduleId}"
																value="edit"  checked></td>
														</c:when>
														<c:when test="${subModuleJsonList.editReject=='hidden'}">
															<td><input type="checkbox"
																class="check${moduleJsonList.moduleId}"
																name="${subModuleJsonList.subModuleId}${subModuleJsonList.moduleId}"
																value="edit"   ></td>
														</c:when>

													</c:choose>
													<c:choose>
														<c:when test="${subModuleJsonList.deleteRejectApprove=='visible'}">

															<td><input type="checkbox"
																class="check${moduleJsonList.moduleId}"
																name="${subModuleJsonList.subModuleId}${subModuleJsonList.moduleId}"
																value="delete"  checked></td>
														</c:when>
														<c:when test="${subModuleJsonList.deleteRejectApprove=='hidden'}">

															<td><input type="checkbox"
																class="check${moduleJsonList.moduleId}"
																name="${subModuleJsonList.subModuleId}${subModuleJsonList.moduleId}"
																value="delete"   ></td>


														</c:when>
													</c:choose>
												</tr>
											</c:when>
										</c:choose>


									</c:forEach>

								</c:forEach>
							</tbody>
	</table>
</div>
			</div>	
			
			
			
			<div class=" box-content">
				<div class="tableFixHead">
	<table id="table_grid">         
	<thead style="background-color: #f3b5db;">
		<tr class="bgpink">
			<th width="100">Sr.No.</th>
			<th width="500">Modules</th>
			<th width="100">View</th>
			<th width="100">Approve</th>
			<th width="100">Reject</th>
			<th width="100">Reject-Approve</th>
		</tr>
	</thead>
	
	<tbody>

								<c:forEach items="${moduleJsonList}" var="moduleJsonList"
									varStatus="count">

									<c:set var="flag" value="0" />

									<c:forEach items="${moduleJsonList.subModuleJsonList}"
										var="subModuleJsonList">
										<c:choose>
											<c:when test="${subModuleJsonList.type==1}">
												<c:set var="flag" value="1" />
											</c:when>
										</c:choose>
									</c:forEach>


									<c:choose>
										<c:when test="${flag==1}">
											<tr>
												<!-- 	<td> &nbsp; </td>
											</tr><tr>  -->
											<c:set var="index" value="${index+1 }" />
												<td><c:out value="${index}" /> </td>

												<td><b><c:out value="${moduleJsonList.moduleName}" /></b></td>

											</tr>
										</c:when>
									</c:choose>
									<c:forEach items="${moduleJsonList.subModuleJsonList}"
										var="subModuleJsonList">
										<c:choose>
											<c:when test="${subModuleJsonList.type==1}">
												<tr>
													<td></td>

													<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<c:out
															value="${subModuleJsonList.subModulName}" /></td>
													<c:choose>
														<c:when test="${subModuleJsonList.view=='visible'}">

															<td><input type="checkbox"
																name="${subModuleJsonList.subModuleId}${subModuleJsonList.moduleId}"
																id="select_to_assign" value="view"  checked></td>
														</c:when>
														<c:when test="${subModuleJsonList.view=='hidden'}">

															<td><input type="checkbox"
																name="${subModuleJsonList.subModuleId}${subModuleJsonList.moduleId}"
																id="select_to_assign" value="view"   ></td>


														</c:when>
													</c:choose>

													<c:choose>
														<c:when test="${subModuleJsonList.addApproveConfig=='visible'}">

															<td><input type="checkbox"
																name="${subModuleJsonList.subModuleId}${subModuleJsonList.moduleId}"
																id="select_to_assign" value="add"  checked></td>
														</c:when>
														<c:when test="${subModuleJsonList.addApproveConfig=='hidden'}">

															<td><input type="checkbox"
																name="${subModuleJsonList.subModuleId}${subModuleJsonList.moduleId}"
																id="select_to_assign" value="add"   ></td>


														</c:when>
													</c:choose>

													<c:choose>
														<c:when test="${subModuleJsonList.editReject=='visible'}">

															<td><input type="checkbox"
																name="${subModuleJsonList.subModuleId}${subModuleJsonList.moduleId}"
																id="select_to_assign" value="edit"  checked></td>
														</c:when>
														<c:when test="${subModuleJsonList.editReject=='hidden'}">
															<td><input type="checkbox"
																name="${subModuleJsonList.subModuleId}${subModuleJsonList.moduleId}"
																id="select_to_assign" value="edit"   ></td>
														</c:when>

													</c:choose>
													<c:choose>
														<c:when test="${subModuleJsonList.deleteRejectApprove=='visible'}">

															<td><input type="checkbox"
																name="${subModuleJsonList.subModuleId}${subModuleJsonList.moduleId}"
																id="select_to_assign" value="delete"  checked></td>
														</c:when>
														<c:when test="${subModuleJsonList.deleteRejectApprove=='hidden'}">

															<td><input type="checkbox"
																name="${subModuleJsonList.subModuleId}${subModuleJsonList.moduleId}"
																id="select_to_assign" value="delete"   ></td>


														</c:when>
													</c:choose>
												</tr>
											</c:when>
										</c:choose>


									</c:forEach>

								</c:forEach>
							</tbody>
	</table>
</div>
				
			</div>
			
			
			<div class=" box-content">
				<div class="tableFixHead">
	<table id="table_grid">         
	<thead style="background-color: #f3b5db;">
		<tr class="bgpink">
			<th width="100">Sr.No.</th>
			<th width="500">Modules</th>
			<th width="100">View</th>
			<th width="100">Configure</th>
			<th width="100">Edit</th>
			<th width="100">Delete</th>
		</tr>
	</thead>
	
	<tbody>

								<c:forEach items="${moduleJsonList}" var="moduleJsonList"
									varStatus="count">

									<c:set var="flag" value="0" />

									<c:forEach items="${moduleJsonList.subModuleJsonList}"
										var="subModuleJsonList">
										<c:choose>
											<c:when test="${subModuleJsonList.type==2}">
												<c:set var="flag" value="1" />
											</c:when>
										</c:choose>
									</c:forEach>


									<c:choose>
										<c:when test="${flag==1}">
											<tr>
												<!-- 	<td> &nbsp; </td>
											</tr><tr>  -->
											<c:set var="index" value="${index+1 }" />
												<td><c:out value="${index}" /> </td>

												<td><b><c:out value="${moduleJsonList.moduleName}" /></b></td>

											</tr>
										</c:when>
									</c:choose>
									<c:forEach items="${moduleJsonList.subModuleJsonList}"
										var="subModuleJsonList">
										<c:choose>
											<c:when test="${subModuleJsonList.type==2}">
												<tr>
													<td></td>

													<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<c:out
															value="${subModuleJsonList.subModulName}" /></td>
													<c:choose>
														<c:when test="${subModuleJsonList.view=='visible'}">

															<td><input type="checkbox"
																name="${subModuleJsonList.subModuleId}${subModuleJsonList.moduleId}"
																id="select_to_assign" value="view"  checked></td>
														</c:when>
														<c:when test="${subModuleJsonList.view=='hidden'}">

															<td><input type="checkbox"
																name="${subModuleJsonList.subModuleId}${subModuleJsonList.moduleId}"
																id="select_to_assign" value="view"   ></td>


														</c:when>
													</c:choose>

													<c:choose>
														<c:when test="${subModuleJsonList.addApproveConfig=='visible'}">

															<td><input type="checkbox"
																name="${subModuleJsonList.subModuleId}${subModuleJsonList.moduleId}"
																id="select_to_assign" value="add"  checked></td>
														</c:when>
														<c:when test="${subModuleJsonList.addApproveConfig=='hidden'}">

															<td><input type="checkbox"
																name="${subModuleJsonList.subModuleId}${subModuleJsonList.moduleId}"
																id="select_to_assign" value="add"   ></td>


														</c:when>
													</c:choose>

													<c:choose>
														<c:when test="${subModuleJsonList.editReject=='visible'}">

															<td><input type="checkbox"
																name="${subModuleJsonList.subModuleId}${subModuleJsonList.moduleId}"
																id="select_to_assign" value="edit"  checked></td>
														</c:when>
														<c:when test="${subModuleJsonList.editReject=='hidden'}">
															<td><input type="checkbox"
																name="${subModuleJsonList.subModuleId}${subModuleJsonList.moduleId}"
																id="select_to_assign" value="edit"   ></td>
														</c:when>

													</c:choose>
													<c:choose>
														<c:when test="${subModuleJsonList.deleteRejectApprove=='visible'}">

															<td><input type="checkbox"
																name="${subModuleJsonList.subModuleId}${subModuleJsonList.moduleId}"
																id="select_to_assign" value="delete"  checked></td>
														</c:when>
														<c:when test="${subModuleJsonList.deleteRejectApprove=='hidden'}">

															<td><input type="checkbox"
																name="${subModuleJsonList.subModuleId}${subModuleJsonList.moduleId}"
																id="select_to_assign" value="delete"   ></td>


														</c:when>
													</c:choose>
												</tr>
											</c:when>
										</c:choose>


									</c:forEach>

								</c:forEach>
							</tbody>
	</table>
</div>
			</div>
			<div class=" box-content">
				<div class="tableFixHead">
	<table id="table_grid">         
	<thead style="background-color: #f3b5db;">
		<tr class="bgpink">
			<th>Sr.No.</th>
			<th>Modules</th>
			<th>View</th>
			<th>End Day Process</th>
		</tr>
	</thead>
	
	<tbody>

								<c:forEach items="${moduleJsonList}" var="moduleJsonList"
									varStatus="count">

									<c:set var="flag" value="0" />

									<c:forEach items="${moduleJsonList.subModuleJsonList}"
										var="subModuleJsonList">
										<c:choose>
											<c:when test="${subModuleJsonList.type==3}">
												<c:set var="flag" value="1" />
											</c:when>
										</c:choose>
									</c:forEach>


									<c:choose>
										<c:when test="${flag==1}">
											<tr>
												<!-- 	<td> &nbsp; </td>
											</tr><tr>  -->
												 <c:set var="index" value="${index+1 }" />
												<td><c:out value="${index}" /> </td>

												<td><b><c:out value="${moduleJsonList.moduleName}" /></b></td>

											</tr>
										</c:when>
									</c:choose>
									<c:forEach items="${moduleJsonList.subModuleJsonList}"
										var="subModuleJsonList">
										<c:choose>
											<c:when test="${subModuleJsonList.type==3}">
												<tr>
													<td></td>

													<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<c:out
															value="${subModuleJsonList.subModulName}" /></td>
													<c:choose>
														<c:when test="${subModuleJsonList.view=='visible'}">

															<td><input type="checkbox"
																name="${subModuleJsonList.subModuleId}${subModuleJsonList.moduleId}"
																id="select_to_assign" value="view"  checked></td>
														</c:when>
														<c:when test="${subModuleJsonList.view=='hidden'}">

															<td><input type="checkbox"
																name="${subModuleJsonList.subModuleId}${subModuleJsonList.moduleId}"
																id="select_to_assign" value="view"   ></td>


														</c:when>
													</c:choose>

													<c:choose>
														<c:when test="${subModuleJsonList.addApproveConfig=='visible'}">

															<td><input type="checkbox"
																name="${subModuleJsonList.subModuleId}${subModuleJsonList.moduleId}"
																id="select_to_assign" value="add"  checked></td>
														</c:when>
														<c:when test="${subModuleJsonList.addApproveConfig=='hidden'}">

																<td><input type="checkbox"
																name="${subModuleJsonList.subModuleId}${subModuleJsonList.moduleId}"
																id="select_to_assign" value="add" ></td>


														</c:when>
													</c:choose>
												</tr>
											</c:when>
										</c:choose>


									</c:forEach>

								</c:forEach>
							</tbody>
	</table>
</div>
			</div>
			
			<div class="form-group">
				<div class="three_buttons">
					<input type="submit" class="btn btn-primary" value="Submit" >
					<input type="button" class="btn btn-primary" value="Cancel">
				</div>					
		    </div>
				

				 </form> 
			</div>



		</div>
	</div>
	<!-- END Main Content -->

	<footer>
	<p>2018 © Monginis.</p>
	</footer>

	<a id="btn-scrollup" class="btn btn-circle btn-lg" href="#"><i
		class="fa fa-chevron-up"></i></a>





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
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/chosen-bootstrap/chosen.jquery.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-inputmask/bootstrap-inputmask.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/jquery-tags-input/jquery.tagsinput.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/jquery-pwstrength/jquery.pwstrength.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-fileupload/bootstrap-fileupload.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-duallistbox/duallistbox/bootstrap-duallistbox.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/dropzone/downloads/dropzone.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-timepicker/js/bootstrap-timepicker.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/clockface/js/clockface.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-colorpicker/js/bootstrap-colorpicker.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-daterangepicker/date.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-daterangepicker/daterangepicker.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-switch/static/js/bootstrap-switch.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-wysihtml5/wysihtml5-0.3.0.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-wysihtml5/bootstrap-wysihtml5.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/ckeditor/ckeditor.js"></script>

	<!--flaty scripts-->
	<script src="${pageContext.request.contextPath}/resources/js/flaty.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/flaty-demo-codes.js"></script>

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/jquery-validation/dist/jquery.validate.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/jquery-validation/dist/additional-methods.min.js"></script>

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/jquery-validation/dist/jquery.validate.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/jquery-validation/dist/additional-methods.min.js"></script>