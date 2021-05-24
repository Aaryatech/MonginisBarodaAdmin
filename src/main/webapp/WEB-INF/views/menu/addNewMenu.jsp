<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>

<!---------------Script For Translate Special Instructions------->
<script type="text/javascript">
	// Load the Google Transliterate API
	google.load("elements", "1", {
		packages : "transliteration"
	});

	function onLoad() {
		var options = {
			sourceLanguage : google.elements.transliteration.LanguageCode.ENGLISH,
			destinationLanguage : [ google.elements.transliteration.LanguageCode.MARATHI ],
			shortcutKey : 'ctrl+g',
			transliterationEnabled : true
		};

		// Create an instance on TransliterationControl with the required
		// options.
		var control = new google.elements.transliteration.TransliterationControl(
				options);

		// Enable transliteration in the textbox with id
		// 'transliterateTextarea'.
		control.makeTransliteratable([ 'transliterateTextarea' ]);
		control.makeTransliteratable([ 'transliterateTextarea1' ]);
	}
	google.setOnLoadCallback(onLoad);
</script>
<!--------------------------------END------------------------------------>
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<body>
<c:url value="/getSubcatForSecType" var="getSubcatForSecType"></c:url>
	<jsp:include page="/WEB-INF/views/include/logout.jsp"></jsp:include>

	<%@ page import="java.util.Calendar"%>
	<%@ page import="java.util.Date"%>
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
						<i class="fa fa-file-o"></i> Menu
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
								<i class="fa fa-bars"></i> Add Menu 
							</h3>
							<div class="box-tool">
								<a href="${pageContext.request.contextPath}/showMenus">Back
									to List</a> <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a>
							</div>

						</div>
						<div ><!-- class="box-content" -->
							<form action="addMenuShowProcess" class="form-horizontal"
								id="validation-form" method="post" enctype="multipart/form-data">



								<input type="hidden" name="mode_add" id="mode_add"
									value="add_att">
								<%
									Calendar cal = Calendar.getInstance();
									Date date = cal.getTime();
									pageContext.setAttribute("frdate", date);
								%>
								
								
								<div class="frm_Sec_one single">
									<div class="row">
										<div class="col-md-4 box_marg">
													<label class="control-label left">Type</label>
														<div class="controls icon_add">
															<i class="fa fa-adjust frm_icon" aria-hidden="true"></i>
															<select class="form-control padd_left"
											name="isSameDayAppicable" id="isSameDayAppicable"  onchange="selectMenuType(this.value)" >
											
											<c:forEach var="menuType" items="${menuTypeList}">
											<option value="${menuType.menuType}">${menuType.menuTypeDesc}</option>
											
											</c:forEach>
											<!-- <option value="-1">Select Menu Type</option>
											<option value="0">Regular</option>
											<option value="1">Same Day Regular</option>
											<option value="2">Regular with limit</option>
											<option value="3">Regular cake As SP Order</option>
											<option value="4">Delivery And Production Date</option>
											<option value="5">Special Cake</option> -->

										</select>
															
															</div>
												</div>
												
										<div class="col-md-4 box_marg">
													<label class="control-label left">Select Category</label>
														<div class="controls icon_add">
															<i class="fa fa-list-ul frm_icon" aria-hidden="true"></i>
															<select name="catId" id="catId" class="form-control padd_left chosen"
												placeholder="Select Category  " data-rule-required="true">
												<option value="">Select Special Cake</option>
												<%-- <c:forEach items="${catList}" var="catList"
													varStatus="count">
													<c:choose>
														<c:when test="${catList.catId==catList.catId}">
															<option value="${catList.catId}" selected><c:out
																	value="${catList.catName}" /></option>
														</c:when>
														<c:otherwise>
															<option value="${catList.catId}"><c:out
																	value="${catList.catName}" /></option>
														</c:otherwise>
													</c:choose>
												</c:forEach> --%>
											</select>
															
															</div>
												</div>
												
										<div class="col-md-4 box_marg">
													<label class="control-label left">Menu Title</label>
														<div class="controls icon_add">
															<i class="fa fa-leaf frm_icon" aria-hidden="true"></i>
															<input type="text" name="menuTitle" id="menuTitle"
											placeholder="Menu title" class="form-control padd_left"
											data-rule-required="true" />
											
															
															
															</div>
												</div>
												
										<div class="clr"></div>
										
										<div class="col-md-10 box_marg">
													<label class="control-label left">Description Details</label>
														<div class="controls icon_add">
														<i class="fa fa-stack-exchange frm_icon" aria-hidden="true"></i>
															<input type="text" name="menuDesc" id="transliterateTextarea1"
											 class="form-control padd_left"
											data-rule-required="true"/>
											
															
															
															</div>
												</div>
												
									<div class="col-md-2 box_marg">
										<div class="three_buttons one_row">
											<button type="submit" class="btn btn-primary"> Save </button>
											<button type="button" class="btn btn-primary">Cancel</button>
										</div>
									</div>			
										
																
									</div>
								</div>	

								

							
								</div>
								
								
								<div class="form-group">
								
								</div>

								


							</form>
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


<script type="text/javascript">
function selectMenuType(val) {
	//alert("Hiiii")
	//alert(val)
	  $.post('${getSubcatForSecType}', {
		  secId :val,
	    ajax : 'true'
		}, function(data) {
			//alert(JSON.stringify(data))
			var html = '<option value="">Select Sub-Category</option>';
			
			var len = data.length;
			
			$('#catId')
		    .find('option')
		    .remove()
		    .end()
			/*  $("#catId").append($("<option></option>").attr( "value",-1).text("ALL")); */

			for ( var i = 0; i < len; i++) {

               $("#catId").append(
                       $("<option ></option>").attr(
                           "value", data[i].catId).text(data[i].catName)
                   );
			}
	
			   $("#catId").trigger("chosen:updated");
			
		});
	
	
	
}


</script>



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
