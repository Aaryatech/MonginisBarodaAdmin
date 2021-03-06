<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	 

	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
	<body>
	<c:url var="getUniqueEmail" value="/getUniqueEmail" />
	<c:url var="getUniqueContact" value="/getUniqueContact" />	
	<c:url var="getUniqueUser" value="/getUniqueUser" />
	
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
					<h1>
						<i class="fa fa-file-o"></i>Add New User 
					</h1>

				</div>
			</div>
			<!-- END Page Title -->

			<!-- BEGIN Main Content -->
			<div class="row">
				<div class="col-md-12">
					<div class="box">
						<div class="box-title">
							<h3>
								<i class="fa fa-bars"></i>User Details
							</h3>
							<div class="box-tool">
							
							<a href="${pageContext.request.contextPath}/showAssignRole"
												data-toggle="tooltip" title="All User List"> <span
													class='glyphicon glyphicon-user'>AllUsers</span>
								</a> <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a>
							</div>
						
						</div>

						<div><!-- class="box-content" -->
							<form action="${pageContext.request.contextPath}/addNewUser"  class="form-horizontal"
							 id="validation-form"
										enctype="multipart/form-data" method="post">
										
							<div class="frm_Sec_one single">
								<div class="row">
									<div class="col-md-4 box_marg">
										<label class="control-label left">User Name </label>
										<div class="controls icon_add">
										<i class="fa fa-user frm_icon" aria-hidden="true"></i>
										<input type="text" name="uname" id="uname" onchange="sameUser();" class="form-control padd_left" placeholder="User Name"  />
										</div>
										<input type="hidden" name="umo_id" id="umo_id" />
							   		</div>
							   		
							   		<div class="col-md-4 box_marg">
										<label class="control-label left">Password </label>
										<div class="controls icon_add">
										<i class="fa fa-key frm_icon" aria-hidden="true"></i>
										<input type="password" name="upass" id="upass" onkeyup="samePass();"  class="form-control padd_left" placeholder="Password"  />
										</div>
										<span class="span_err" id="pass" ></span>
							   		</div>
							   		
							   		<div class="col-md-4 box_marg">
										<label class="control-label left">Confirm Password </label>
										<div class="controls icon_add">
										<i class="fa fa-key frm_icon" aria-hidden="true"></i>
										<input type="password" name="confirmPass" id="confirmPass" onkeyup="samePass();matchPass()"  class="form-control padd_left" placeholder="Confirm Password" />
										</div>
										<span class="span_err" id="cpass" style="color:red;display:none" >Password & Confirm Password Must Be Same</span>
							   		</div>
							   		
							   		<div class="col-md-4 box_marg">
										<label class="control-label left">Select Department</label>
										<div class="controls icon_add">
										<i class="fa fa-list frm_icon" aria-hidden="true"></i>
										<select data-placeholder="Choose Department"
								class="form-control padd_left chosen" tabindex="6" id="dept_id"
								name="dept_id" >

								<option value=""><c:out value=""/></option>

								<c:forEach items="${departmentList}" var="departmentList"
									varStatus="count">
									<option value="${departmentList.deptId}"><c:out value="${departmentList.deptName}"/></option>
								</c:forEach>
							</select>
							</div>
							   		</div>
							   		
							   		<div class="col-md-4 box_marg">
										<label class="control-label left">Select User Type</label>
										<div class="controls icon_add">
										<i class="fa fa-user frm_icon" aria-hidden="true"></i>
										<select data-placeholder="Choose User Type"
								class="form-control padd_left chosen" tabindex="6" id="user_type"
								name="user_type" >

								<option value=""><c:out value=""/></option>

								<c:forEach items="${getUserTypeList}" var="getUserTypeList"
									varStatus="count">
									<option value="${getUserTypeList.typeId}"><c:out value="${getUserTypeList.typeName}"/></option>
								</c:forEach>
							</select>
							</div>

							   		</div>
							   		
							   		<div class="col-md-4 box_marg">
										<label class="control-label left">Email</label>
										<div class="controls icon_add">
										<i class="fa fa-envelope frm_icon" aria-hidden="true"></i>
										<input type="text"email" id="email" onchange="sameEmail()" class="form-control padd_left" placeholder="Email" />
									<span class="span_err">Mail will be send on this email id.</span>
							</div>

							   		</div>
							   		
							   		<div class="col-md-4 box_marg">
										<label class="control-label left">Contact</label>
										<div class="controls icon_add">
										<i class="fa fa-phone frm_icon" aria-hidden="true"></i>
										<input type="text" name="contact" id="contact" onkeyup="sameContact();" maxlength="10" class="form-control padd_left" placeholder="Contact" />
									<span class="span_err">OTP will be send on this number.</span>
							</div>

							   		</div>
								</div>
							</div>	
						
						
						<div class="form-group">
								<div class="three_buttons">
									<button type="button" class="btn btn-primary" id="submitbtn" onclick="submitUser()" disabled>Submit</button> 
									<input type="button" class="btn btn-primary" value="Cancel">
								</div>					
						    </div>
							
					
							
							
							

					
					</form>
							
				</div>

			</div>

		</div>
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
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/common.js"></script>

			<script type="text/javascript"
				src="${pageContext.request.contextPath}/resources/assets/jquery-validation/dist/jquery.validate.min.js"></script>
			<script type="text/javascript"
				src="${pageContext.request.contextPath}/resources/assets/jquery-validation/dist/additional-methods.min.js"></script>
	
	
<script>

$("#uname").keypress(function(e) {
	$("#error_sp_msg").remove();
	var k 			= e.keyCode,
			$return = ((k > 64 && k < 91) || (k > 96 && k < 123) || k == 8 || k == 32  || (k >= 48 && k <= 57));
      if(!$return) {
      	$("<span/>",{
        	"id" : "error_sp_msg",
         /*  "html" 	: "Special characters not allowed !!!!!" */
        }).insertAfter($(this));
      	return false;
      }
      
})

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
		//alert(contact);
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
	
	

function  sameUser(){
	var valid = true
		var uname = $("#uname").val();
		//alert(contact);
		$(document)
				.ready(
						function() {
							$
									.getJSON(
											'${getUniqueUser}',
											{
												uname : uname,
												ajax : 'true'
											},
											function(data) {
												//alert(JSON.stringify(data))
												if(data.error===false){
													alert("User Name Already Exist!")
													document.getElementById("uname").value="";
													document.getElementById("uname").focus();
												}

											});

						});

	}
</script>
	
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
	function matchPass()
	{
		 if(document.getElementById("upass").value==document.getElementById("confirmPass").value){
			 document.getElementById("cpass").style.display = "none";
		  }else{
			 // alert("Password & Confirm Password Must Be Same");
			  document.getElementById("cpass").style.display = "block";
		  }
	}
	
	function submitUser(){
	
		var valid=validate();
	 if(!valid)
		 {
		 
		// var pageContext=document.getElementById("pageContext").value;

	
		  document.getElementById("validation-form").submit();
		  //alert("submit");
		   // form.submit();
		    
		   
		   
		 }
	
	}
	
	function validate()
	{
		
		var flag=false;
		 
			var usertype = $("#user_type").val();
			var dept_id = $("#dept_id").val();
		 var uname=document.getElementById("uname").value;
		 if(uname=="" || uname==null)
			 {
			 flag=true;
			 alert("enter Username");
			 
			 
			 }
			 
			 
		
		 else if(dept_id=="" || dept_id==null)
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
	
</body>
</html>

