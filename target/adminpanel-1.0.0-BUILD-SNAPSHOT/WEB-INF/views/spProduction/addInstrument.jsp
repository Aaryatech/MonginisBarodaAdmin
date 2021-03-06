<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	 

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
					<h1>
						<i class="fa fa-file-o"></i>Instrument
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
								<i class="fa fa-bars"></i> Add Instrument
							</h3>
							<div class="box-tool">
								<a href="${pageContext.request.contextPath}/showAllInstrument">Back to List</a> <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a>
							</div>
							
						</div>




						<div class="box-content">
							<form action="${pageContext.request.contextPath}/addInstrumentProcess" class="form-horizontal"
								method="post" id="validation-form">


								<div class="form-group">
									<label class="col-sm-3 col-lg-2 control-label">Instrument
										Name</label>
									<div class="col-sm-9 col-lg-10 controls">
										<input type="text" name="instrument_name" id="instrument_name"
											placeholder="Instrument Name" class="form-control"
											data-rule-required="true" />
									</div>
								</div>
                         
                          <div class="form-group">
									<label class="col-sm-3 col-lg-2 control-label">Instrument Type</label>
									<div class="col-sm-9 col-lg-10 controls">
									<select name="inst_type" id="inst_type" class="form-control" placeholder="Instrument Type" data-rule-required="true">
											<option value="">Select Instrument Type</option>
											<c:forEach items="${typeList}" var="typeList">
										        <option value="${typeList.typeId}"><c:out value="${typeList.typeName}"></c:out></option>
										</c:forEach>
												
								</select>	
									</div>
								</div>
                              <div class="form-group">
									<label class="col-sm-3 col-lg-2 control-label">Instrument Optimum Qty</label>
									<div class="col-sm-9 col-lg-10 controls">
										<input type="text" name="instrument_opqty" id="instrument_opqty"
											placeholder="Instrument Optimum Qty" class="form-control"
											data-rule-required="true" data-rule-number="true"/>
									</div>
								</div>
                                 <div class="form-group">
									<label class="col-sm-3 col-lg-2 control-label">Instrument Clear Qty</label>
									<div class="col-sm-9 col-lg-10 controls">
										<input type="text" name="instrument_clqty" id="instrument_clqty"
											placeholder="Instrument Clear Qty" class="form-control"
											data-rule-required="true" data-rule-number="true"/>
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-sm-3 col-lg-2 control-label">Instrument Status</label>
									<div class="col-sm-9 col-lg-10 controls">
										<textarea name="instrument_status" id="instrument_status"
											placeholder="Instrument Status" class="form-control"
											data-rule-required="true"></textarea>
									</div>
							  </div>
							  
							  <div class="form-group">
									<label class="col-sm-3 col-lg-2 control-label">Stock Qty</label>
									<div class="col-sm-9 col-lg-10 controls">
										<input type="text" name="stock_qty" id="stock_qty"
											placeholder="Stock Qty" class="form-control"
											data-rule-required="true"  data-rule-number="true"/>
									</div>
							  </div>
							   <div class="form-group">
									<label class="col-sm-3 col-lg-2 control-label">Instrument Is Used?</label>
									<div class="col-sm-9 col-lg-10 controls">
												<label class="radio-inline"> <input type="radio"
													name="instrument_is_used" id="optionsRadios1" value="0" >
													No
												</label> <label class="radio-inline"> <input type="radio"
													name="instrument_is_used" id="optionsRadios1" value="1" checked/>
													Yes
												</label>
									</div>
							  </div>
								<div class="form-group">
									<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2">
										<input type="submit" class="btn btn-primary" value="Submit">
<!-- 										<button type="button" class="btn">Cancel</button>
 -->									</div>
								</div>
							</form>
					
							
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


</body>
</html>
