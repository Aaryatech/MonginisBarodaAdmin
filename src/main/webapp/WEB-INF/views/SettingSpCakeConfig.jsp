<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<body>

	<jsp:include page="/WEB-INF/views/include/logout.jsp"></jsp:include>

	<c:url var="getDateForGateGvnHeader" value="/getDateForGateGvnHeader" />

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
					<i class="fa fa-bars"></i>Select Sp For App
				</h1>
				<h4></h4> -->
			</div>

		</div>
		
		<!-- 	<div class="page-title">
				<div>
					<h1>
						<i class="fa fa-file-o"></i>GVN Header Dispatch
					</h1>

				</div>
			</div> -->
			<!-- END Page Title -->

			<!-- BEGIN Main Content -->
			<div class="row">
				<div class="col-md-12">
					<div class="box">
					
						<div class="box-title">
				<h3>
					<i class="fa fa-bars"></i>Select Sp For App
				</h3>

			</div>
			
						
							


						<div><!-- class="box-content" -->
							<form
								action="${pageContext.request.contextPath}/updateSpCake" method="post"
								class="form-horizontal" method="get" id="validation-form">
								
								<div class="frm_Sec_one single">
									<div class="row">
										<div class="col-md-12 box_marg">
										<label class="control-label left">Update SpCake </label>
										<div class="controls icon_add">
										<i class="fa fa-refresh frm_icon" aria-hidden="true"></i>
										<select data-placeholder="Choose SpCake"
											class="form-control padd_left chosen" multiple="multiple" 
											id="selectFr" name="selectFr"  required>
											 <c:forEach items="${specialCakeList}" var="fr"
												varStatus="count2">
												<c:set value="0" var="flag" ></c:set>
												<c:forEach  items="${selectedIds}" var="selectedId" >
												<c:if test="${selectedId==fr.spId}">
												<c:set value="1" var="flag" ></c:set>
												</c:if>
												</c:forEach>
												<c:choose>
													<c:when test="${flag==1}">
													<option value="${fr.spId}" selected="selected"  >${fr.spName}</option>
													</c:when>
													<c:otherwise>
													<option value="${fr.spId}">${fr.spName}</option>
													</c:otherwise>
												</c:choose>
										   </c:forEach>
									</select>
									
									
										</div>
							   		</div>
									</div>
								</div>	
								
								<div class="form-group">
					<div class="three_buttons">
						<input type="submit" value="Update" class="btn btn-primary" >
						<input type="button" class="btn btn-primary" value="Cancel">
					</div>					
			    </div>
			    
								
									
								
								
		
							</form>

						
                 
                 
                 	
                 




					</div>
					
					

					
					
					
					
					
					
					
					
					
					
				</div>
				
			</div>
			<!-- END Main Content -->
			


			<a id="btn-scrollup" class="btn btn-circle btn-lg" href="#"><i
				class="fa fa-chevron-up"></i></a>
		</div>
		<!-- END Content -->
		<footer>
				<p style="text-align: center">2018 © MONGINIS.</p>
			</footer>
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



</script>

</body>
</html>

