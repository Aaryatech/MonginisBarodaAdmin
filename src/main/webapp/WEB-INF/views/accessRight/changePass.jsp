<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/tableSearch.css">
<body>

	<jsp:include page="/WEB-INF/views/include/logout.jsp"></jsp:include>


	<c:url var="getRmSubCategory" value="/getRmSubCategory" />
	<c:url var="getRmCategory" value="/getRmCategory" />



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
						<i class="fa fa-file-o"></i>Change your Password 
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
								<i class="fa fa-bars"></i>Password
							</h3>
							<div class="box-tool">
								<!-- <a href="">Back to List</a> <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a> -->
							</div>

						</div>

						<div><!-- class="box-content" -->
							<form action="${pageContext.request.contextPath}/changeUserPass" method="post"
								class="form-horizontal" id="validation-form" method="post">
								
						<div class="frm_Sec_one single">									
							<div class="row">
								<div class="col-md-3 box_marg">
									<label class="control-label left">User Name</label>
										<div class="controls icon_add">
											<i class="fa fa-user frm_icon" aria-hidden="true"></i>
											<input type="text" name="user_name"  id="user_name"
											class="form-control padd_left" value="${uname}"
											data-rule-required="true" readonly />
											</div>
								</div>
								
								<div class="col-md-3 box_marg">
									<label class="control-label left">Current Password</label>
										<div class="controls icon_add">
											<i class="fa fa-key frm_icon" aria-hidden="true"></i>
											<input type="password" name="cur_pass" id="cur_pass"
											class="form-control padd_left" placeholder="Existing Password"
											data-rule-required="true" />
											
											</div>
								</div>
								
								<div class="col-md-3 box_marg">
									<label class="control-label left">New Password</label>
										<div class="controls icon_add">
											<i class="fa fa-key frm_icon" aria-hidden="true"></i>
											<input type="password" name="new_pass1" id="new_pass1"
											class="form-control padd_left" placeholder="New  Password"
											data-rule-required="true" />
											
											</div>
								</div>
								
								<div class="col-md-3 box_marg">
									<label class="control-label left">Confirm Password</label>
										<div class="controls icon_add">
											<i class="fa fa-key frm_icon" aria-hidden="true"></i>
											<input type="password" name="new_pass2" id="new_pass2"
											class="form-control padd_left" placeholder="Repeat  Password"
											data-rule-required="true" />
											</div>
								</div>
							</div>
						</div>	
						
						<div class="form-group">
								<div class="row three_buttons">
									<input type="submit"class="btn btn-primary" value="Submit" >
									<button type="button" class="btn btn-primary">Cancel</button>
										
									
						</div>
								</div>	
							</form>
						</div>
					</div>
				</div>
			</div>
			<footer>
			<p>2017 © MONGINIS.</p>
		</footer>
		</div>
		<!-- END Main Content -->
		


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


	<script type="text/javascript">
		function validate() {
			alert("HI");
			var valid = true;

			
			var curEntered = document.getElementById("cur_pass").value;
			var newPass1 = document.getElementById("new_pass1").value;
			var newPass2 = document.getElementById("new_pass2").value;
			var dbPass=${curPass};
	alert("PWD---------"+curEntered);
			if(curEntered!=dbPass){
				alert("Current Password did not matched");
				valid = false;

			}else if(newPass1==newPass2){
				
			}else{
				alert("Please Enter Valid password")
				valid = false;

			}

			if (valid) {
				var form = document.getElementById("validation-form")
				form.action = "${pageContext.request.contextPath}/changeUserPass";
				form.submit();
			} 

		}
	</script>
</body>
</html>

