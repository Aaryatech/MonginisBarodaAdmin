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
<c:url value="/GetAallFrIdName" var="GetAallFrIdName"></c:url>
<c:url value="/GetAallRouteIdName" var="GetAallRouteIdName"></c:url>
<c:url value="/getFrByRouteId" var="getFrByRouteId"></c:url>
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
				<!-- <h1>
						<i class="fa fa-file-o"></i> Messages
					</h1>-->

				</div>
			</div> 
			<!-- END Page Title -->




			<!-- BEGIN Main Content -->
			<div class="row">
				<div class="col-md-12">
					<div class="box">
						<div class="box-title">
							<h3>
								<i class="fa fa-bars"></i> ${title}
							</h3>
							<div class="box-tool">
								<a href="${pageContext.request.contextPath}/showRouteSectionList">Back to List</a> <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a>
							</div>
							<!-- <div class="box-tool">
								<a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a> <a data-action="close" href="#"><i
									class="fa fa-times"></i></a>
							</div> -->
						</div>
						
						<div class="box-content">
							<form action="${pageContext.request.contextPath}/submitNewRouteSection" class="form-horizontal" id="validation-form"
								 method="post" enctype="multipart/form-data">





								<input type="hidden" name="secId" id="secId"
									value="${section.sectionId }">
									<%
									Calendar cal=Calendar.getInstance();
									Date date=cal.getTime();
									pageContext.setAttribute("frdate", date);
									
									%>
								
								<div class="frm_Sec_one single">									
									<div class="row">
										<div class="col-md-3 box_marg">
											<label class="control-label left">Section Name</label>
												<div class="controls icon_add">
													<i class="fa fa-user frm_icon" aria-hidden="true"></i>	
													<input type="text" name="section_name" id="section_name" value="${section.sectionName}"
											placeholder="Enter Section Name" class="form-control padd_left" data-rule-required="true"  />													
												</div>
													<span class="span_err" id="err_sec" >Enter Section Name</span>
										</div>
										
									
										<div class="col-md-3 box_marg">
											<label class="control-label left">Select Routes</label>
												<div class="controls icon_add">
													<i class="fa fa-road frm_icon" aria-hidden="true"></i>	
													<select data-placeholder="Select Routes" name="section_mid"
													class="form-control padd_left chosen"  id="section_mid" multiple="multiple"
													data-rule-required="true">		
													<c:forEach items="${routeList}" var="routeList">
													<c:set value="0" var="flag"/>
													<c:forEach items="${routeIds}" var="routeIds">
														<c:if test="${routeList.routeId==routeIds}">
															<c:set value="1" var="flag" />
														</c:if>
													</c:forEach>
													<c:choose>
														<c:when test="${flag==1}">
															<option selected="selected" value="${routeList.routeId}">${routeList.routeName}</option>
														</c:when>
														<c:otherwise>
															<option value="${routeList.routeId}">${routeList.routeName}</option>
														</c:otherwise>
													</c:choose>
											</c:forEach>
										</select>											
												</div>
												<span class="span_err" id="err_route" >Select Routes</span>
										</div>
										
										<div class="col-md-3 box_marg">
											<label class="control-label left">Type</label>
												<div class="controls icon_add">
													<i class="fa fa-bars frm_icon" aria-hidden="true"></i>	
													<input type="text" name="section_type" id="section_type" value="${section.secType}"
											placeholder="Section Type" class="form-control padd_left" data-rule-required="true"  />												
												</div>
										</div>
										
										<div class="col-md-3 box_marg">
											<div class="row three_buttons one_row">
												<button type="submit" class="btn btn-primary" id="sub_btn">Submit </button>
												<button type="button" class="btn btn-primary">Cancel</button>
											</div>
										</div>

									</div>
								</div>		
								
								
								<!-- <div class="form-group">
								<div class="row three_buttons">
									<button type="submit" class="btn btn-primary">Submit </button>
										<button type="button" class="btn btn-primary">Cancel</button>
										
									
						</div>
								</div> -->

							</form>
						</div>
					</div>
				</div>
			</div>











<!-- 
	</form>
	</div>
	</div>
	</div>



 -->


  

	<!-- END Main Content -->
<script type="text/javascript">
/* function routeSelected(){
	var routeId=$("#routes").val();
	//alert(routeId)
	html=null;
	$('#franchise').html('');
	$("#franchise").trigger("chosen:updated");
	$.getJSON('${getFrByRouteId}',

			{
				routeId:JSON.stringify(routeId),
				ajax : 'true'

			},
			function(data) {
				//alert(JSON.stringify(data))
				if(data.length<=0){
					alert("No Record Found!!!!")
				}else{
					
					var len = data.length;
					for (var i = 0; i < len; i++) {
						 html += '<option class="active-result" selected value="' +data[i].frId+ '">'
								+data[i].frName + data[i].frRouteId
								+ '</option>'; 
							//	alert(data[i].frName)
					}
					
					
					$('#franchise').html(html);
					$("#franchise").trigger("chosen:updated"); 
					
				}
			});
} */
	
	
$("#sub_btn")
.on(
		"click",
		function() {
		
			var isError = false;
			var errMsg = "";
			
			if (!$("#section_mid").val()) {
				isError = true;
				$("#err_route").show();
			} else {
				$("#err_route").hide();
			}
			
			if (!$("#section_name").val()) {
				isError = true;
				$("#err_sec").show();
			} else {
				$("#err_sec").hide();
			}
			
		
			return false;
		});

	</script>
	<!--
<script type="text/javascript">
function changeoptionsRadios1(val) {
	//alert(document.getElementById("optionsRadios1").value)
	//alert(val)
	var opt=val;
	if(opt==1){
		document.getElementById("routeDiv").style.display = "none";
		//document.getElementById("frDiv").style.display = "block";
		//$('#franchise').html('');
		//$("#franchise").trigger("chosen:updated");
		var	html=null;
	 	$.getJSON('${GetAallFrIdName}',

				{
					ajax : 'true'

				}, function(data) {
					//alert(JSON.stringify(data))
					
					// var html = '<option value="" selected >Select Sub-Category</option>';

					var len = data.length;
					for (var i = 0; i < len; i++) {
						 html += '<option class="active-result"  value="' +data[i].frId+ '">'
								+data[i].frName
								+ '</option>'; 
							//	alert(data[i].frName)
					}
					
					
					$('#franchise').html(html);
					$("#franchise").trigger("chosen:updated"); 
					
				
					
				}); 
	}else if(opt==0){
		document.getElementById("routeDiv").style.display = "block";
		//document.getElementById("frDiv").style.display = "none";
		//$('#routes').html('');
		//$("#routes").trigger("chosen:updated");
		$('#franchise').html('');
		$("#franchise").trigger("chosen:updated"); 
	var	html=null;
		$.getJSON('${GetAallRouteIdName}',
				
				{
					ajax : 'true'

				}, function(data) {
					//alert(JSON.stringify(data))
					
					// var html = '<option value="" selected >Select Sub-Category</option>';

					var len = data.length;
					for (var i = 0; i < len; i++) {
						 html += '<option class="active-result"  value="' +data[i].routeId+ '">'
								+data[i].routeName
								+ '</option>'; 
							//	alert(data[i].frName)
					}
					
					
					$('#routes').html(html);
					$("#routes").trigger("chosen:updated"); 
					
				
					
				});  
	}
}


</script> -->


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
</body>
</html>
