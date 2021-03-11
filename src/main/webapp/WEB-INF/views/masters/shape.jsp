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
			<!-- <div class="page-title">
				<div>
					<h1>
						<i class="fa fa-file-o"></i> Route
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
								<i class="fa fa-bars"></i> Add Shape
							</h3>
							<div class="box-tool">
								<a href=""></a> <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a>
							</div>
							<!-- <div class="box-tool">
								<a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a> <a data-action="close" href="#"><i
									class="fa fa-times"></i></a>
							</div> -->
						</div>


						<div class="box-content">
							<form action="${pageContext.request.contextPath}/addShapeProcess" class="form-horizontal"
								method="post" id="validation-form">


								<input type="hidden" value="${shape.shapeId}" name="shape_id" id="shape_id">
								<div class="form-group">
									<label class="col-sm-3 col-lg-2 control-label">Shape Name</label>
									<div class="col-sm-9 col-lg-10 controls">
										<input type="text" name="shape_name" id="shape_name"
											placeholder="Shape Name" class="form-control"
											data-rule-required="true" value="${shape.shapeName}"  />
									</div>
								</div>
								
							
								
								<div class="form-group">
									<label class="col-sm-3 col-lg-2 control-label">Shape Description.</label>
									<div class="col-sm-9 col-lg-10 controls">
										<input type="text" name="shape_desc" id="shape_desc"
											placeholder="Shape Description" class="form-control"
											data-rule-required="true" value="${shape.shapeDesc}" />
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



<!-- newly added /form to be tested -->


								<div class="box">
									<div class="box-title">
										<h3>
											<i class="fa fa-table"></i> Route List
										</h3>
										<div class="box-tool">
											<a data-action="collapse" href="#"><i
												class="fa fa-chevron-up"></i></a>
											<!--<a data-action="close" href="#"><i class="fa fa-times"></i></a>-->
										</div>
									</div>

									<div class="box-content">
									<c:if test="${shapeFlag==1}">
									<span style="color: red;" >Cant Delete Selected Shape As It Is In Use!!!</span>
									</c:if>
									
									<jsp:include page="/WEB-INF/views/include/tableSearch.jsp"></jsp:include>
										<div class="clearfix"></div>
										<div class="table-responsive" style="border: 0">
											<table width="100%" class="table table-advance" id="table1">
												<thead style="background-color: #2196F3;">
													<tr>
									
										
														<th style="text-align: center;">#</th>
														<th style="text-align: center;">Shape Name</th>
														<th style="text-align: center;">Shape Discription Type</th>
														<th style="text-align: center;">Action</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${shapeList}" var="shape" varStatus="count">
														<tr>
								
														
															<td style="text-align: center;"><c:out value="${count.index+1}"/></td>
															<td style="text-align: center;"><c:out
																	value="${shape.shapeName}"></c:out></td>
															<td style="text-align: center;"><c:out
																	value="${shape.shapeDesc}"></c:out></td>
																	<c:set value="-" var="type"> </c:set>
															<td style="text-align: center;"><a
																href="${pageContext.request.contextPath}/updateShape/${shape.shapeId}"><span
																	class="glyphicon glyphicon-edit"></span></a>&nbsp;&nbsp;&nbsp;&nbsp;

																<a href="${pageContext.request.contextPath}/deleteShape/${shape.shapeId}"
																onClick="return confirm('Are you sure want to delete this record');"><span
																	class="glyphicon glyphicon-remove"></span></a></td>
														</tr>

													</c:forEach>
												</tbody>
											</table>
										</div>
									</div>
									<div  class="form-group" style="background-color: white;display: none;">
									&nbsp;	&nbsp;	&nbsp;	&nbsp;
										<input type="button" margin-right: 5px;" id="btn_delete"
											class="btn btn-primary" onclick="deleteById()" 
											value="Delete" />
									</div>
								</div>
						</div>
						
					</div>
				</div>
			</div>
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
function deleteById()
{

var checkedVals = $('.chk:checkbox:checked').map(function() {
    return this.value;
}).get();
checkedVals=checkedVals.join(",");

if(checkedVals=="")
	{
	alert("Please Select Route")
	}
else
	{
	window.location.href='${pageContext.request.contextPath}/deleteRoute/'+checkedVals;

	}

}
</script>
</body>
</html>