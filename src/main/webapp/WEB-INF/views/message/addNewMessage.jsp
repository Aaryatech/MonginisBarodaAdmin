<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
 
 <!---------------Script For Translate Special Instructions------->   
    <script type="text/javascript">
      // Load the Google Transliterate API
      google.load("elements", "1", {
            packages: "transliteration"
          });

      function onLoad() {
        var options = {
            sourceLanguage:
                google.elements.transliteration.LanguageCode.ENGLISH,
            destinationLanguage:
                [google.elements.transliteration.LanguageCode.MARATHI],
            shortcutKey: 'ctrl+g',
            transliterationEnabled: true
        };

        // Create an instance on TransliterationControl with the required
        // options.
        var control =
            new google.elements.transliteration.TransliterationControl(options);

        // Enable transliteration in the textbox with id
        // 'transliterateTextarea'.
        control.makeTransliteratable(['transliterateTextarea']);
        control.makeTransliteratable(['transliterateTextarea1']);
      }
      google.setOnLoadCallback(onLoad);
    </script>
 <!--------------------------------END------------------------------------>   
	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
	<body>
	<jsp:include page="/WEB-INF/views/include/logout.jsp"></jsp:include>

<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.Date" %>
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
						<i class="fa fa-file-o"></i> Messages
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
								<i class="fa fa-bars"></i> Add Home Page Message 
							</h3>
							<div class="box-tool">
								<a href="${pageContext.request.contextPath}/showMessages">Back to List</a> <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a>
							</div>
							<!-- <div class="box-tool">
								<a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a> <a data-action="close" href="#"><i
									class="fa fa-times"></i></a>
							</div> -->
						</div>
						<div ><!-- class="box-content" -->
							<form action="addMessageProcess" class="form-horizontal" id="validation-form"
								 method="post" enctype="multipart/form-data">





								<input type="hidden" name="mode_add" id="mode_add"
									value="add_att">
									<%
									Calendar cal=Calendar.getInstance();
									Date date=cal.getTime();
									pageContext.setAttribute("frdate", date);
									
									%>
									
								<div class="frm_Sec_one single">
									<div class="row">
										<div class="col-md-3 box_marg">
													<label class="control-label left">From Date</label>
														<div class="controls icon_add">
															<i class="fa fa-calendar frm_icon" aria-hidden="true"></i>
															<input class="form-control padd_left date-picker" id="dp1" size="16"
											type="text" name="msg_frdt" placeholder="From Date" data-rule-required="true"  />
															
															</div> <span class="span_err" id="err_fromdate" >Enter From Date</span>
												</div>
												
											<div class="col-md-3 box_marg">
													<label class="control-label left">To Date</label>
														<div class="controls icon_add">
															<i class="fa fa-calendar frm_icon" aria-hidden="true"></i>
															<input class="form-control padd_left date-picker" id="dp2" size="16"
											type="text" name="msg_todt" placeholder="To Date" data-rule-required="true"  />
															
															</div> <span class="span_err" id="err_todate" >Enter To Date</span>
												</div>
												
												<div class="col-md-3 box_marg">
													<label class="control-label left">Msg Header</label>
														<div class="controls icon_add">
															<i class="fa fa-road frm_icon" aria-hidden="true"></i>
															<input type="text" name="msg_header" id="transliterateTextarea"
											placeholder="Message Header" class="form-control padd_left" data-rule-required="true"  />
															
															</div> <span class="span_err" id="err_head" >Enter Msg Header</span>
												</div>
												
											<div class="col-md-3 box_marg">
													<label class="control-label left">Status</label>
														<div class="controls icon_add">
															<i class="fa fa-dot-circle-o frm_icon" aria-hidden="true"></i>
															<select class="form-control padd_left " name="is_active"
											id="is_active">
											<option value="1">Active</option>
											<option value="0">In Active</option>

										</select>
															
															</div>
												</div>
												
											<div class="col-md-3 box_marg">
													<label class="control-label left">Image</label>
														<div class="controls icon_add">
															<div class="fileupload fileupload-new"
											data-provides="fileupload">
											<div class="fileupload-new img-thumbnail"
												style="width: 80%; height: auto;">
												<img
													src="http://www.placehold.it/200x150/EFEFEF/AAAAAA&amp;text=no+image"
													alt="" style="width:100%;" />

											</div>
											<div
												class="fileupload-preview fileupload-exists img-thumbnail"
												style="max-width: 100%; max-height: auto; line-height: 20px;"></div>
											<div>
												<span class="btn btn-default btn-file"><span
													class="fileupload-new">Select image</span> <span
													class="fileupload-exists">Change</span> <input type="file"
													class="file-input" name="msg_image" id="msg_image" /></span> <a
													href="#" class="btn btn-default fileupload-exists"
													data-dismiss="fileupload">Remove</a>
											</div>
										</div>
															
															</div>
												</div>	
												
										
											
											
											
										<div class="col-md-9 box_marg">
													<label class="control-label left">Msg Details</label>
														<div class="controls icon_add">
															<i class="fa fa-stack-exchange frm_icon" aria-hidden="true"></i>
															<input type="text" name="msg_details" id="msg_details"
											class="form-control padd_left" data-rule-required="true"  />
															
														
															
															</div>
															<span class="span_err" id="err_msg" >Enter Msg Details</span>
												</div>				
												
													
									</div>
								</div>				

								

								


							<div class="form-group">
								<div class="row three_buttons">
									<button type="submit" class="btn btn-primary" id="sub_btn">Submit</button>
										<button type="button" class="btn btn-primary" onclick="window.location.reload()" >Cancel</button>
										
									
						</div>
								</div>
							
							</form>
						</div>
					</div>
				</div>
			</div>
<!-- 
		</div>
	</div>

 -->










<!-- 
	</form>
	</div>
	</div>
	</div>



 -->



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

$("#sub_btn")
.on(
		"click",
		function() {
			
			var isError = false;
			var errMsg = "";

			if (!$("#dp1").val()) {
				isError = true;
				$("#err_fromdate").show();
			} else {
				$("#err_fromdate").hide();
			}
			
			if (!$("#dp2").val()) {
				isError = true;
				$("#err_todate").show();
			} else {
				$("#err_todate").hide();
			}
			
			if (!$("#transliterateTextarea").val()) {
				isError = true;
				$("#err_head").show();
			} else {
				$("#err_head").hide();
			}
			
			if (!$('#msg_details').val()) {
				isError = true;
				$("#err_msg").show();
			} else {
				$("#err_msg").hide();
			}
			
			if(!isError){
				var form=document.getElementById("validation-form");
				form.submit();
			}
		
			
			return false;
		});
</script>
</body>
</html>
