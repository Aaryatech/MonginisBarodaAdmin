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
						<i class="fa fa-file-o"></i> Latest News
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
								<i class="fa fa-bars"></i> Add News 
							</h3>
							<div class="box-tool">
								<a href="${pageContext.request.contextPath}/showAllLatestNews">Back to List</a> <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a>
							</div>
							<!-- <div class="box-tool">
								<a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a> <a data-action="close" href="#"><i
									class="fa fa-times"></i></a>
							</div> -->
						</div>


						<div ><!-- class="box-content" -->
							<form action="addLatestNews" class="form-horizontal"
								id="validation-form" method="post">




								<input type="hidden" name="mode_add" id="mode_add"
									value="add_att">
									
								<div class="frm_Sec_one single">
									<div class="row">
										<div class="col-md-3 box_marg">
							<label class="control-label left">Message From Date</label>
								<div class="controls icon_add">
									<i class="fa fa-calendar frm_icon" aria-hidden="true"></i>
									<input class="form-control padd_left date-picker" id="dp1" size="16"
											type="text" name="sch_date" value="" placeholder="Message From Date" required />
									</div> <span class="span_err" id="err_fromdate" >Enter Message From Date</span>
						</div>
						
						<div class="col-md-3 box_marg">
							<label class="control-label left">Message To Date</label>
								<div class="controls icon_add">
									<i class="fa fa-calendar frm_icon" aria-hidden="true"></i>
									<input class="form-control padd_left date-picker" id="dp1" size="16"
											type="text" name="sch_to_date" required placeholder="Message To Date"/>
									</div>
						</div>
						
						<div class="col-md-3 box_marg">
							<label class="control-label left">Occasion Name</label>
								<div class="controls icon_add">
									<i class="fa fa-user frm_icon" aria-hidden="true"></i>
									<input type="text" name="sch_occasion_name"
											id="transliterateTextarea" placeholder="Occasion Name"
											class="form-control padd_left" required />
									</div> <span class="span_err" id="err_name" >Enter Occasion Name</span>
						</div>
						
						<div class="col-md-3 box_marg">
							<label class="control-label left">Status</label>
								<div class="controls icon_add">
									<i class="fa fa-dot-circle-o frm_icon" aria-hidden="true"></i>
									<select class="form-control padd_left chosen" name="is_active"
											id="is_active">
											<option selected  value="1">Active</option>
											<option value="0">In-Active</option>

										</select>
									</div>
						</div>
						
						<div class="col-md-10 box_marg">
							<label class="control-label left">Message</label>
								<div class="controls icon_add">
									<i class="fa fa-stack-exchange frm_icon" aria-hidden="true"></i>
									<input type="text" name="sch_message" id="transliterateTextarea1"
											placeholder="Message" class="form-control padd_left" required />
									</div> <span class="span_err" id="err_msg" >Enter Message</span>
						</div>
						
						<div class="col-md-2 box_marg">
							<div class=" three_buttons one_row">
								<button type="submit" class="btn btn-primary" id="sub_btn">Submit</button>
								<button type="button" class="btn btn-primary">Cancel</button>
						   </div>
						</div>
						
									</div>
								</div>		

								

								
								
							
								<!-- <div class="form-group">
								<div class=" three_buttons">
									<button type="submit" class="btn btn-primary"><i class="fa fa-check"></i> Submit</button>
									<button type="button" class="btn btn-primary">Cancel</button>
										
									
						</div>
								</div> -->
										
							</form>
						</div>
					</div>
					
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
					
					if (!$("#transliterateTextarea").val()) {
						isError = true;
						$("#err_name").show();
					} else {
						$("#err_name").hide();
					}
					
					if (!$("#transliterateTextarea1").val()) {
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