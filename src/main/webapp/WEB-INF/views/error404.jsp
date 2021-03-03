<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<style type="text/css">
.error_bx{display: table; width: 100%; height: 100vh; vertical-align: middle;}
    .error_cont{display: table-cell;  vertical-align: middle;}
    .error_wrap{width: 1000px; margin: 0 auto; display: table;}
    .error_pic{display: table-cell; vertical-align: middle; width: 40%;}
    .error_txt{display: table-cell; vertical-align: middle; width: 60%;}
    .page_title{font-weight: 600; font-size: 30px; margin: 0 0 20px 0;}
    .page_txt{font-size: 20px; font-weight: 300; line-height: 28px; margin: 0 0 25px 0;}
    .visit_btn{background: #FFF; border: 1px solid #2b94e1; border-radius: 5px; padding: 6px 20px; color: #2b94e1; font-size: 16px; font-weight: 500; text-decoration: none; -webkit-transition: all ease 0.5s;-moz-transition: all ease 0.5s;-o-transition: all ease 0.5s;-ms-transition: all ease 0.5s;transition: all ease 0.5s;}
    .visit_btn:hover{color: #FFF; background: #2b94e1; border: 1px solid #2b94e1; -webkit-transition: all ease 0.5s;-moz-transition: all ease 0.5s;-o-transition: all ease 0.5s;-ms-transition: all ease 0.5s;transition: all ease 0.5s;}
    
    /*--------- responsive css ----------*/
    @media only screen and (max-width:1920px) {}
    @media only screen and (max-width:1680px) {}
    @media only screen and (max-width:1440px) {}
    @media only screen and (max-width:1366px) {}
    @media only screen and (max-width:1280px) {}
    @media only screen and (max-width:1024px) {
        .error_wrap{width: 96%;}        
    }
    @media only screen and (max-width:900px) {
        .error_pic{width: 50%;}
        .error_txt{width: 50%;}
        .page_title{font-size: 26px; margin: 0 0 15px 0;}
    }
    @media only screen and (max-width:800px) {}
    @media only screen and (max-width:700px) {
        .error_pic{width: 100%; display: block; margin: 0 auto 15px auto; text-align: center;}
        .error_txt{width: 100%; display: block;}
        .page_title{font-size: 22px;}
        .page_txt{font-size: 16px; line-height: 26px;}
    }
    @media only screen and (max-width:640px) {}
    @media only screen and (max-width:568px) {}
    @media only screen and (max-width:480px) {}
    @media only screen and (max-width:360px) {}
</style>
</head>

<body>

	<!-- Main navbar -->

	<!-- /main navbar -->


	<!-- Page content -->
	<div class="page-content">


		<!-- Main content -->
		<div class="content-wrapper">
			<div class="card">


				<%-- <div class="navbar-collapse1 collapse1 text-center w-100"
					id="navbar-footer1">
					<h1>
						<span class="navbar-text">${errorMsg} </span>
					</h1>
					<h5>
						<a href="${pageContext.request.contextPath}/dashboard">Home
							Page </a>
					</h5>

				</div> --%>
				<div class="error_bx">
    <div class="error_cont">
        <div class="error_wrap">
            <div class="error_pic"><img src="${pageContext.request.contextPath}/resources/img/error_pic.jpg" alt=""> </div>
            <div class="error_txt">
                <h2 class="page_title">${errorMsg}</h2>
                <p class="page_txt">We can't find the page you're looking for. <br>
                You can either return to the previous page, visit our home page or contact our support team.</p>
                <a href="${pageContext.request.contextPath}/home" class="visit_btn">Visit Homepage</a>
            </div>
            <div class="clr"></div>
        </div>    
    </div>
</div>



			</div>

			<!-- /footer -->

		</div>
		<!-- /main content -->

	</div>

</body>
</html>