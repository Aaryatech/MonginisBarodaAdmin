<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<body>
<c:url var="getUniqueEmail" value="/getUniqueEmail" />
	<c:url var="getUniqueContact" value="/getUniqueContact" />	
	
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
					<!-- <h1>
						<i class="fa fa-file-o"></i>update User
					</h1> -->

				</div>
			</div>
			<!-- END Page Title -->

			<!-- BEGIN Main Content -->
			<div class="row">
				<div class="col-md-12">
					<div class="box">
						<div class="box-title">
							<h3>
								<i class="fa fa-bars"></i> User Details Name - <b style="color: red;">${user.username}</b> Role- <b style="color: orange;">${user.roleName}</b>
							</h3>
							<div class="box-tool">
								<%-- 	
							<a href="${pageContext.request.contextPath}/showAssignRole"
												data-toggle="tooltip" title="All User List"> <span
													class='glyphicon glyphicon-user'>AllUsers</span>
								<a href=""></a> <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a> --%>
							</div>

						</div>

						<div><!-- class="box-content" -->
							<form action="${pageContext.request.contextPath}/editUserProcess"
								class="form-horizontal" id="validation-form" method="post">

								<div class="frm_Sec_one single">
									<div class="row">
										<div class="col-md-3 box_marg">
										<label class="control-label left">Password</label>
										<div class="controls icon_add">
										<i class="fa fa-key frm_icon" aria-hidden="true"></i>
										<input type="text" name="upass" id="upass"
											value="${user.password}" onkeyup="samePass();"
											class="form-control padd_left" placeholder="Password"
											data-rule-required="true" />
										</div>
										<span class="" id="pass"></span>
							   		</div>
							   		
							   		<div class="col-md-3 box_marg">
										<label class="control-label left">Confirm Password</label>
										<div class="controls icon_add">
										<i class="fa fa-key frm_icon" aria-hidden="true"></i>
										<input type="password" name="confirmPass"
											value="${user.password}" id="confirmPass"
											onkeyup="samePass();" class="form-control padd_left"
											placeholder="Confirm Password" data-rule-required="true" />
										</div>
										<span class="" id="cpass"></span>
							   		</div>
							   		
							   		<div class="col-md-3 box_marg">
										<label class="control-label left">Email</label>
										<div class="controls icon_add">
										<i class="fa fa-envelope frm_icon" aria-hidden="true"></i>
										<input type="text" name="email" id="email" value="${user.email}" 
											class="form-control padd_left" placeholder="Email"
											data-rule-required="true" />
										</div>
										<span class="" id="pass"></span>
							   		</div>
							   		
							   		<div class="col-md-3 box_marg">
										<label class="control-label left">Contact</label>
										<div class="controls icon_add">
										<i class="fa fa-phone frm_icon" aria-hidden="true"></i>
										<input type="text" name="contact" maxlength="10"
											value="${user.contact}" id="contact"
											 class="form-control padd_left"
											placeholder="Contact" data-rule-required="true" />
										</div>
										<span class="" id="cpass"></span>
							   		</div>
							   		
							   		<div class="col-md-3 box_marg">
										<label class="control-label left">Select Department</label>
										<div class="controls icon_add">
										<i class="fa fa-user frm_icon" aria-hidden="true"></i>
										<select data-placeholder="Choose Department"
											class="form-control padd_left chosen" tabindex="6" id="dept_id"
											name="dept_id">
											<option value=""><c:out value=""/></option>
											<c:forEach items="${departmentList}" var="departmentList"
												varStatus="count">
												<c:choose>
													<c:when test="${user.deptId eq departmentList.deptId}">
														<option selected value="${departmentList.deptId}"><c:out value="${departmentList.deptName}"/></option>
													</c:when>
													<c:otherwise>
														<option value="${departmentList.deptId}"><c:out value="${departmentList.deptName}"/></option>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</select>
							   		</div>
							   		</div>
							   		
							   		<div class="col-md-3 box_marg">
										<label class="control-label left">Select User Type</label>
										<div class="controls icon_add">
										<i class="fa fa-user frm_icon" aria-hidden="true"></i>
										<select data-placeholder="Choose User Type"
											class="form-control padd_left chosen" tabindex="6" id="user_type"
											name="user_type">

											<option value=""><c:out value=""/></option>

											<c:forEach items="${getUserTypeList}" var="getUserTypeList"
												varStatus="count">
												<c:choose>
													<c:when test="${user.usertype eq getUserTypeList.typeId}">
														<option selected value="${getUserTypeList.typeId}"><c:out value="${getUserTypeList.typeName}"/></option>
													</c:when>
													<c:otherwise>
														<option value="${getUserTypeList.typeId}"><c:out value="${getUserTypeList.typeName}"/></option>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</select>
							   		</div>
							   		</div>
							   		
							   		<div class="col-md-3 box_marg">
										<label class="control-label left">&nbsp;</label>
										<div class="three_buttons" style="text-align: left; padding:0;">
									<c:choose>
										<c:when test="${submit eq 1 }">
										<button type="button" class="btn btn-primary" id="submitbtn" onclick="submitUser()" >Submit</button>
										</c:when>
										<c:otherwise>								
										<button type="button" class="btn btn-primary" id="submitbtn" onclick="submitUser()" disabled>Submit</button>
										</c:otherwise>
									</c:choose>
									<input type="button" class="btn btn-primary" value="Cancel">
								</div>
									</div>	
							   		
							   			
							   			
									</div>
								</div>


								<%-- <div class="form-group">
								<div class="three_buttons">
									<c:choose>
								<c:when test="${submit eq 1 }">
								<button type="button" class="btn btn-primary" id="submitbtn" onclick="submitUser()" >Submit</button>
									
								
								</c:when>
								<c:otherwise>								
								<button type="button" class="btn btn-primary" id="submitbtn" onclick="submitUser()" disabled>Submit</button>
								</c:otherwise>
									</c:choose>
									
									<input type="button" class="btn btn-primary" value="Cancel">
								</div>					
						    </div> --%>

								
								
								
							</form>
							
							<div class="clearfix"></div>
							
							<div class="box-content">
								<div class="tableFixHead">
									<table id="table1">         
									<thead style="background-color: #f3b5db;">
										<tr class="bgpink">
											<th style="text-align: center; width:80px;">Sr No</th>
											<th style="text-align: center;">User Name</th>											
											<th style="text-align: center;">Email</th>
											<th style="text-align: center;">Contact</th>
											<th style="text-align: center;">User Type</th>
											<th style="text-align: center;">Department</th>
											<th style="text-align: center;">Role</th>
											<th style="text-align: center;">Action</th>
										</tr>
									</thead>
									
									<tbody>
										<c:forEach items="${userList}" var="user" varStatus="count">

											<tr>
												<td style="text-align: center;" width="3%"><c:out value="${count.index+1}"></c:out></td>
												<td style="text-align: left;"><c:out value="${user.username}"></c:out></td>
												<td style="text-align: left;"><c:out value="${user.email}"></c:out></td>
												<td style="text-align: right;"><c:out value="${user.contact}"></c:out></td>
												<td style="text-align: left;"><c:out value="${user.typeName}"></c:out>
												<td style="text-align: left;"><c:out value="${user.deptName}"></c:out>
												<td style="text-align: left;"><c:out value="${user.roleName}"></c:out>
												<td style="text-align: right;"><a
													href="${pageContext.request.contextPath}/editUser/${user.id}"
													><i class="fa fa-pencil" aria-hidden="true"></i></a> &nbsp; <a
													href="${pageContext.request.contextPath}/deleteUser/${user.id}"
													
													onClick="return confirm('Are you sure want to delete this record');">
													<i class="fa fa-times" aria-hidden="true"></i></a></td>
											</tr>
										</c:forEach>
									</tbody>
									</table>
								</div>
							</div>
							

						</div>

					</div>

				</div>
			</div>
			<!-- END Main Content -->
			<footer>
				<p>2017 © MONGINIS.</p>
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
		src="${pageContext.request.contextPath}/resources/js/common.js"></script>

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/jquery-validation/dist/jquery.validate.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/jquery-validation/dist/additional-methods.min.js"></script>


	<script>
	
	function samePass(){
	
		  if(document.getElementById("upass").value==document.getElementById("confirmPass").value && document.getElementById("upass").value!=null && document.getElementById("upass").value!="")
			{
			   
			  $("#pass").addClass("glyphicon glyphicon-ok");
				 $("#cpass").addClass("glyphicon glyphicon-ok");
				// flag=false;
				 
					  document.getElementById("submitbtn").disabled=false;
			} 
			  
		  else{
			  
			  $("#pass").removeClass("glyphicon glyphicon-ok");
			  $("#cpass").removeClass("glyphicon glyphicon-ok");
			  document.getElementById("submitbtn").disabled=true;
		  }
	}
	
	function submitUser(){
	///alert("in fun");
		var valid=validate();
	 if(!valid)
		 {
		// alert("in If");
		 var form= document.getElementById("validation-form");
		/*  alert("form = " +form); */
		 form.action='${pageContext.request.contextPath}/editUserProcess';
		 form.submit();
		
		 }
	
	}
	
	function validate()
	{
		
		var flag=false;
		 
			var usertype = $("#user_type").val();
			var dept_id = $("#dept_id").val();
		 if(dept_id=="" || dept_id==null)
			 {
			 flag=true;
				alert("Please Select  Deptartment");
			 }
		 else if(usertype=="" || usertype==null ){
				flag=true;
				alert("Please Select User Type");
				
			}
	
		return flag;
	}
	</script>
<script>
function validateEmail(email) {
    
	var eml = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;

	if (eml.test($.trim(email)) == false) {


	return false;

	}

	return true;

}
function  sameEmail(){
	var valid = true
		var email = $("#email").val();
		//alert(email);
		$(document)
				.ready(
						function() {
							$
									.getJSON(
											'${getUniqueEmail}',
											{
												email : email,
												ajax : 'true'
											},
											function(data) {
												//alert(JSON.stringify(data))
												if(data.error===false){
													alert("Email Id Already Exist!")
													document.getElementById("email").value="";
												}

											});

						});

	}

function  sameContact(){
	var valid = true
		var contact = $("#contact").val();
	//	alert(contact);
		$(document)
				.ready(
						function() {
							$
									.getJSON(
											'${getUniqueContact}',
											{
												contact : contact,
												ajax : 'true'
											},
											function(data) {
												//alert(JSON.stringify(data))
												if(data.error===false){
													alert("Contact No Already Exist!")
													document.getElementById("contact").value="";
												}

											});

						});

	}
</script>
</body>
</html>

