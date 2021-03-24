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
								<i class="fa fa-bars"></i>Stock Type Updation
							</h3>
							<div class="box-tool">
								
						</div>


						<div class="box-content">
							<form
								action="${pageContext.request.contextPath}/saveStockType" method="post"
								class="form-horizontal" id="validation-form">

							
								<div class="form-group">
									<label class="col-sm-3 col-lg-2 control-label">Stock Type Name</label>
									<div class="col-sm-9 col-lg-10 controls">
								
										<input class="form-control input" id="reject_remark" type="hidden" value="${st.id}"
											size="16" type="text" name="id" placeholder="Enter Reject Remark"/>
										<input type="text" name="stock_type_name" id="shape_name"
											placeholder="Shape Name" class="form-control" value="${st.stockTypeName}"
											/>
									</div>
								</div>
								
							
								
								<div class="form-group">
									<label class="col-sm-3 col-lg-2 control-label">Stock Type Description.</label>
									<div class="col-sm-9 col-lg-10 controls">
									
								
										<input type="text" name="stock_type_desc" id="shape_desc"
											placeholder="Shape Description" class="form-control" value="${st.stockTypeDesc}"
											/>
									</div>
								</div>


								<div class="form-group">
									<label class="col-sm-3 col-lg-2 control-label">Stock Type.</label>
									<div class="col-sm-9 col-lg-10 controls">
										<input type="text" name="stock_type" id="shape_desc"
											placeholder="Stock Type" class="form-control" value="${st.type}"
											 />
									</div>
								</div>
								
								
								<div class="form-group">
									<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2">
										<button type="submit" class="btn btn-primary" style="width: 70px">
										 Submit
										</button>
										<!--<button type="button" class="btn">Cancel</button>-->
									</div>
								</div>

		
							</form>

							<!-- <form action="" class="form-horizontal" method="post"
								id="validation-form">
 -->
								

<!-- 							</form>  -->
                 
                 
                 	
                 




					</div>
					
					
						<table class="table table-bordered table-striped fill-head "
							style="width: 100%" id="table_grid">
							<thead style="background-color: #f3b5db;">
													
														<tr >
														    <th class="col-md-1">SELECT</th>
														    <th width="148" style="width: 18px" align="left">Stock Type Name </th>
															<th width="148" style="width: 18px" align="left">Stock Type Desc </th>
															<th width="148" style="width: 18px" align="left">Stock Type  </th>															
															<th width="198" style="text-align: center;">Action</th>
															</tr>
													</thead>
										<tbody>
										<c:forEach items="${stock}" var="stock" varStatus="srno" >
											<tr>
											    <td><input type="checkbox" class="chk" name="select_to_print" id="${stock.id}"	value="${stock.id}"/></td>												
												<td>${stock.stockTypeName}</td>
												<td>${stock.stockTypeDesc}</td>
												<td>${stock.type}</td>
                                                <td style="text-align: center;">
 
                                                    <a href="${pageContext.request.contextPath}/updateStockType/${stock.id}" ><span
														class="glyphicon glyphicon-edit"></span></a>
														  
													<a href="${pageContext.request.contextPath}/deleteStockType/${stock.id}"
													onClick="return confirm('Are you sure want to delete this record');"><span
														class="glyphicon glyphicon-remove"></span></a>
								            
 									            </td>
 									            
 									       	
											</tr>
										</c:forEach>

										</tbody>
									</table>
					
					
					
					
					
					
					
					
					
					
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



</script>

</body>
</html>
