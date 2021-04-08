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
					<i class="fa fa-bars"></i>Assign Access Role
				</h3>
				<div class="box-tool" style="text-align: right;">
				<a href="${pageContext.request.contextPath}/showRoleList">Role List</a> <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a>
              </div>							
			</div>
			
			<div><!-- class=" box-content" -->
				<form id="validation-form" action="submitAssignedRole" method="post">
				
				<div class="frm_Sec_one single">
					<div class="row">
						<div class="col-md-6 box_marg">
							<label class="control-label left">Employee Name</label>
							<div class="controls icon_add">
							<i class="fa fa-user frm_icon" aria-hidden="true"></i>
							<input type="text" name="empName" id="empName"
								class="form-control padd_left" required data-rule-required="true" readonly>
							</div>
							<input type="hidden" id="empId" name="empId">
				   		</div>
				   		
				   		<div class="col-md-6 box_marg">
							<label class="control-label left">Role</label>
							<div class="controls icon_add">
							<i class="fa fa-user frm_icon" aria-hidden="true"></i>
							<select name="role" id="role" class="form-control padd_left" tabindex="6"
								placeholder="Selete Role" required data-rule-required="true">
								<option value="" disabled selected>Select Role</option>
								<c:forEach items="${createdRoleList}" var="createdRoleList"
									varStatus="count">
									<option value="${createdRoleList.roleId}"><c:out value="${createdRoleList.roleName}"/></option>
								</c:forEach>

							</select>
							</div>
							
				   		</div>
					</div>
				</div>
				
				<div class="form-group">
					<div class="three_buttons">
						<input type="submit" value="Submit" class="btn btn-primary">
						<input type="button" class="btn btn-primary" value="Cancel">
					</div>					
			    </div>	
			    
			    
			    <div class=" box-content">
			    	<div class="tableFixHead">
	<table id="table_grid">         
	<thead style="background-color: #f3b5db;">
		<tr class="bgpink">
			<th style="text-align: center">Sr.No.</th>
			<th style="text-align: left">Users Name</th>
			<th style="text-align: left">Assigned Role</th>
			<th style="text-align: center">Add/Edit/View</th>
		</tr>
	</thead>
	
	<tbody>
									<c:forEach items="${userList}" var="userList" varStatus="count">
										<tr>
                                            <c:set var="rId" value=""/>
											<c:set var="empRoll" value="" />
											<c:set var="btnClass" value="glyphicon glyphicon-plus" />
											<c:set var="detail" value="" />
											<c:set var="add" value="Assign" />
											<td style="text-align: center"><c:out value="${count.index+1}" /></td>

											<td style="text-align: left"><c:out value="${userList.username}" /></td>



											<c:forEach items="${createdRoleList}" var="createdRoleList" varStatus="count">
												<c:choose>
													<c:when test="${createdRoleList.roleId==userList.roleId}">
														<c:set var="empRoll" value="${createdRoleList.roleName}" />
														<c:set var="rId" value="${createdRoleList.roleId}" />

														<c:set var="btnClass" value="fa fa-pencil" />
														<c:set var="detail" value="fa fa-bars" />
														<c:set var="add" value="Edit" />
													</c:when>
												</c:choose>
											</c:forEach>

											<td style="text-align: left"><c:out value="${empRoll}" /></td>





											<td  style="text-align: center"><span class='<c:out value="${btnClass}" />'
												data-toggle="tooltip" title='<c:out value="${add}" />'
						  						onclick="editRole('${userList.username}', ${userList.id})"></span>
												<a
												href="${pageContext.request.contextPath}/showAssignUserDetail/<c:out value="${userList.id}" />/${rId}/<c:out value="${userList.username}" />/${empRoll}"
												data-toggle="tooltip" title="Access Detail"> <span
													class='<c:out value="${detail}" />'></span>
											</a></td>
										</tr>

									</c:forEach>
								</tbody>
	</table>
</div>
			    </div>

				</form>
			</div>



		</div>
	</div>
	<!-- END Main Content -->

	<footer>
	<p>2017 © Monginis.</p>
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



	<script>
		function editRole(empName, empId)
		{
			
			//alert(empId);
			document.getElementById("empId").value=empId;
			document.getElementById("empName").value=empName;
			
			 
		}
		</script>



</body>
</html>