<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Baroda Admin</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/resources/img/MongiFavicon.png"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/animate/animate.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/css-hamburgers/hamburgers.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/animsition/css/animsition.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/select2/select2.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/daterangepicker/daterangepicker.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/util.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main.css">
<style type="text/css">
.bg-overlay {
    background: url("${pageContext.request.contextPath}/resources/img/lgn_bg.jpg");
   background-repeat: no-repeat;
    background-size: cover;
    background-position: center center;
    color: #fff;
    height:auto;
    width:auto;
    padding-top: 0px;
}
.power_logo {
    position: absolute;
    right: 20px;
    bottom: 20px;
}
</style>
</head>
<body class="container bg-overlay">
<c:url value="/reGenOtp1" var="reGenOtp1"></c:url>

<div class="power_logo"><a href="https://aaryatechindia.in/" target="_blank">
		<img src="${pageContext.request.contextPath}/resources/img/powerd_logo.png" alt="monginis">
	</a> </div>


	<div class="row">
		<div class="col-md-2">&nbsp;</div>
		<div class="col-md-8">		
			<div class="login_bx">
				<div class="row">
					<div class="col-md-6">
						<div class="login_left">
							<form class="login100-form validate-form" id="form-login" action="OTPVerification" method="post">
				
			     
					<h2 class="login_head">Verify OTP</h2>
					

					<div class="wrap-input100 validate-input" data-validate="Valid mobile is required">
						<input class="input100" type="text" placeholder="OTP" id="otp" name="otp" maxlength="6" autocomplete="off">
						<span class="focus-input100-1"></span>
						<span class="focus-input100-2"></span>
					</div> 
					<div class="container-login100-form-btn m-t-20">
						<button class="login100-form-btn">
							Verify OTP
						</button>
					</div>

					

					
				<br>	
<div class="form-group">
				<p class="clearfix">
				<input
							type="button" class="btn btn-accent btn-block"
							onclick="reGenOtp()" value="Re Generate OTP" />
			</p>
			</div>
<div class="text-right">
					
						<p class="clearfix">
				<a href="${pageContext.request.contextPath}/login" class="goto-login pull-left">Back to Login</a>
			</p>

						<a href="#" class="txt2 hov1">
							<!-- Username / Password? -->
						</a>
					</div>

					<div class="text-center">
						<span class="txt1">
							<!-- Create an account? -->
						</span>

						<a href="#" class="txt2 hov1">
							<!-- Sign up -->
						</a>
					</div>
				</form>
						</div>
					</div>
					<div class="col-md-6">
						<div class="login_right">
						<img src="${pageContext.request.contextPath}/resources/img/monginislogo.png">
						<h2 class="welcome">Welcome to Monginis</h2>
						<p class="welcome_txt">	Lets make Monginis a part of everybody’s celebration!!</p>
							
						</div>
					</div>
				</div>
			</div>
			
			
			
		</div>
		<div class="col-md-2">&nbsp;</div>
	</div>	


	<!-- <div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-50">
				
			</div>
		</div>
	</div> -->

<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/resources/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/popper.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/resources/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/resources/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/resources/js/mains.js"></script>
<script type="text/javascript">
function reGenOtp() {
	//alert("Hi");

	var form = document.getElementById("form-forgot");
	
	form.setAttribute("method", "post");

	form.action = ("reGenOtp1");

	form.submit();

			 var username = document.getElementById("username").value;
			// alert(username);
			
			$
					.getJSON(
							'${reGenOtp1}',
							{
								username : username,
							
								ajax : 'true',

							},
							function(data) {

									alert("Data  " +JSON.stringify(data));
							location.reload(true);
								
							});

		}


}
</script>
</body>
</html>
