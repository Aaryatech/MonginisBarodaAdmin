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
					<!-- <h1>
						<i class="fa fa-file-o"></i> Flavours
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
								<i class="fa fa-bars"></i> Edit Flavour 
							</h3>
							<div class="box-tool">
								<a href="${pageContext.request.contextPath}/flavoursList">Back to List</a> <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a>
							</div>
							<!-- <div class="box-tool">
								<a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a> <a data-action="close" href="#"><i
									class="fa fa-times"></i></a>
							</div> -->
						</div>


						<div ><!-- class="box-content" -->
							<form action="updateFlavourProcess" class="form-horizontal"
								id="validation-form" method="post">
								
								<div class="frm_Sec_one single">									
									<div class="row">
										
										<div class="col-md-3 box_marg">
											<label class="control-label left">Flavour Name</label>
												<div class="controls icon_add">
													<i class="fa fa-user frm_icon" aria-hidden="true"></i>
													<input type="text" name="spf_name" id="spf_name"
											value="${flavour.spfName }" placeholder="Flavour Name"
											class="form-control padd_left" data-rule-required="true" />
													</div>
										</div>
										
										<div class="col-md-3 box_marg">
											<label class="control-label left">Add on rate</label>
												<div class="controls icon_add">
													<i class="fa fa-inr frm_icon" aria-hidden="true"></i>
													<input type="text" name="spf_adon_rate" id="spf_adon_rate"
											value="${flavour.spfAdonRate}" placeholder="Add on rate"
											class="form-control padd_left" required value="0.00" required
											onKeyPress="return isNumberCommaDot(event)" data-rule-number="true"/>
													</div>
										</div>
										
										<div class="col-md-3 box_marg">
											<label class="control-label left">Type</label>
												<div class="controls icon_add">
													<label class="radio-inline"> <input type="radio" ${strSpType==2 ? 'checked' : ''}
													name="sp_type" id="optionsRadios2" 
													value="2"/>FC
												</label>
												<label class="radio-inline"> <input type="radio" ${strSpType==1 ? 'checked' : ''}
													name="sp_type" id="optionsRadios2" value="1"/>
													Chocolate
												</label>
													</div>
										</div>
										
										<div class="col-md-3 box_marg">
											<div class="row three_buttons one_row">
												<button type="submit" class="btn btn-primary"> Save</button>
												<button type="button" class="btn btn-primary">Cancel</button>
											</div>
										</div>
										
									</div>
								</div>	

								<div class="col-sm-9 col-lg-10 controls">
									<input type="hidden" name="spe_id" id="spe_id"
										value="${flavour.spfId}" />
								</div>
								
								<!-- <div class="form-group">
								<div class="row three_buttons">
									<button type="submit" class="btn btn-primary"> Save</button>
									<button type="button" class="btn btn-primary">Cancel</button>
										
									
						</div>
								</div> -->

								
							</form>

						</div>
					</div>
				</div>
			</div>

			<%-- <div class="box">
				<div class="box-title">
					<h3>
						<i class="fa fa-table"></i> Flavours List
					</h3>
					<div class="box-tool">
						<a data-action="collapse" href="#"><i class="fa fa-chevron-up"></i></a>
						<!--<a data-action="close" href="#"><i class="fa fa-times"></i></a>-->
					</div>
				</div>

				<div class="box-content">

					<div class="clearfix"></div>
					<div class="table-responsive" style="border: 0">
						<table width="100%" class="table table-advance" id="table1">
							<thead>
								<tr>
									<th width="17" style="width: 18px">#</th>
									<th width="348" align="left">Name</th>
									<th width="322" align="left">Add on rate</th>
									<th width="290" align="left">Type</th>
									<th width="80" align="left">Action</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${flavoursList}" var="flavoursList">
									<tr>
										<td>1</td>
										<td align="left"><c:out value="${flavoursList.spfName}" /></td>
										<td align="left"><c:out
												value="${flavoursList.spfAdonRate}" /></td>
										<td align="left"><c:out value="${flavoursList.spType}" /></td>
										<td align="left"><a
											href="updateFlavour/${flavoursList.spfId}"><span
												class="glyphicon glyphicon-edit"></span></a>&nbsp;&nbsp;&nbsp;&nbsp;

											<a href="deleteFlavour/${flavoursList.spfId}"
											onClick="return confirm('Are you sure want to delete this record');"><span
												class="glyphicon glyphicon-remove"></span></a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>

				</div>
			</div>

 --%>
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
</body>
</html>