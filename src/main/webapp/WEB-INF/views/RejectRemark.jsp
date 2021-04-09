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
		
		<c:set var="isEdit" value="0">
			</c:set>

			<c:set var="isDelete" value="0">
			</c:set>

			<c:forEach items="${sessionScope.newModuleList}" var="modules">
				<c:forEach items="${modules.subModuleJsonList}" var="subModule">
					<c:choose>
						<c:when
							test="${subModule.subModuleMapping eq 'showRejectRemark'}">

							<c:choose>
								<c:when test="${subModule.editReject=='visible'}">
									<c:set var="isEdit" value="1">
									</c:set>
								</c:when>
								<c:otherwise>
									<c:set var="isEdit" value="0">
									</c:set>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${subModule.deleteRejectApprove=='visible'}">
									<c:set var="isDelete" value="1">
									</c:set>
								</c:when>
								<c:otherwise>
									<c:set var="isDelete" value="0">
									</c:set>
								</c:otherwise>
							</c:choose>
						</c:when>
					</c:choose>

				</c:forEach>
			</c:forEach>

		<!-- BEGIN Content -->
		<div id="main-content">
			<!-- BEGIN Page Title -->
			
			<div class="page-title">
			<div>
				<h1>
					<i class="fa fa-bars"></i>Add Rejected Remark
				</h1>
				<h4></h4>
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
					<i class="fa fa-bars"></i>Add Rejected Remark
				</h3>

			</div>
					
					
						
							
						

						<div><!-- class="box-content" -->
							<form
								action="${pageContext.request.contextPath}/RejectRemark" method="post"
								class="form-horizontal" method="get" id="validation-form">
								
								<div class="frm_Sec_one single">
									<div class="row">
										<div class="col-md-6 box_marg">
										<label class="control-label left">Reject Remark</label>
										<div class="controls icon_add">
										<i class="fa fa-pencil-square-o frm_icon" aria-hidden="true"></i>
										<input class="form-control padd_left input" id="reject_id" type="hidden" value="${rm.rejectId}"
											size="16" type="text" name="reject_id" />
										<input class="form-control padd_left input" id="reject_remark" value="${rm.rejectRemark}"
											size="16" type="text" required="required" name="reject_remark" placeholder="Enter Reject Remark"/>
										</div>
							   		</div>
							   		
							   		<div class="col-md-6 box_marg">
										<label class="control-label left">Reject Desc</label>
										<div class="controls icon_add">
										<i class="fa fa-pencil-square-o frm_icon" aria-hidden="true"></i>
										<input required="required" class="form-control padd_left input" id="reject_desc" size="16" value="${rm.rejectDesc}"
											type="text" placeholder="Enter Reject Desc" name="reject_desc"/>
										</div>
							   		</div>
									</div>
								</div>
								
								<div class="form-group">
					<div class="three_buttons">
						<input type="submit" value="Submit" class="btn btn-primary" >
						<input type="button" class="btn btn-primary" value="Cancel">
					</div>					
			    </div>
								
								

					
							</form>


                 
                 	
                 




					<div class="box-content">
						<div class="tableFixHead">
							<table id="table_grid">         
							<thead style="background-color: #f3b5db;">
								<tr class="bgpink">
									<th style="text-align: center;">SELECT</th>
								    <th style="text-align: left;">Rejected Id </th>
									<th style="text-align: left;">Rejected Remark </th>
									<th style="text-align: left;">Rejected Desc</th>
									<th style="text-align: center;">Action</th>
								</tr>
							</thead>
							
							<tbody>
										<c:forEach items="${stationList}" var="stationList" varStatus="srno" >
											<tr>
											    <td  style="text-align: center;"><input type="checkbox" class="chk" name="select_to_print" id="${stationList.rejectId}"	value="${stationList.rejectId}"/></td>
												<td  style="text-align: left;">${stationList.rejectId}</td>
												<td style="text-align: left;">${stationList.rejectRemark}</td>
												<td style="text-align: left;">${stationList.rejectDesc}</td>

													<c:choose>
														<c:when test="${isEdit==1 and isDelete==1}">
															<td style="text-align: center;"><a
																href="${pageContext.request.contextPath}/updateRemark/${stationList.rejectId}">
																	<i class="fa fa-pencil" aria-hidden="true"
																	onclick="edit(1)"></i>
															</a> <a
																href="${pageContext.request.contextPath}/deleteRemark/${stationList.rejectId}"
																onClick="return confirm('Are you sure want to delete this record');">
																	<i class="fa fa-times" aria-hidden="true"></i>
															</a></td>

														</c:when>

														<c:when test="${isEdit==1 and isDelete==0}">
															<td style="text-align: center;"><a 
																href="${pageContext.request.contextPath}/updateRemark/${stationList.rejectId}">
																	<i class="fa fa-pencil" aria-hidden="true"
																	onclick="edit(1)"></i>
															</a> <a class="disableClick"
																href="${pageContext.request.contextPath}/deleteRemark/${stationList.rejectId}"
																onClick="return confirm('Are you sure want to delete this record');">
																	<i class="fa fa-times" aria-hidden="true"></i>
															</a></td>
														</c:when>

														<c:when test="${isEdit==0 and isDelete==1}">
															<td style="text-align: center;"><a class="disableClick"
																href="${pageContext.request.contextPath}/updateRemark/${stationList.rejectId}">
																	<i class="fa fa-pencil" aria-hidden="true"
																	onclick="edit(1)"></i>
															</a> <a
																href="${pageContext.request.contextPath}/deleteRemark/${stationList.rejectId}"
																onClick="return confirm('Are you sure want to delete this record');">
																	<i class="fa fa-times" aria-hidden="true"></i>
															</a></td>

														</c:when>

														<c:otherwise>
															<td style="text-align: center;"><a class="disableClick"
																href="${pageContext.request.contextPath}/updateRemark/${stationList.rejectId}">
																	<i class="fa fa-pencil" aria-hidden="true"
																	onclick="edit(1)"></i>
															</a> <a class="disableClick"
																href="${pageContext.request.contextPath}/deleteRemark/${stationList.rejectId}"
																onClick="return confirm('Are you sure want to delete this record');">
																	<i class="fa fa-times" aria-hidden="true"></i>
															</a></td>
														</c:otherwise>
													</c:choose>


												</tr>
										</c:forEach>

										</tbody>
							</table>
						</div>
					</div>

					
					
					
					
					
					
					
					
					
					
				</div>
			</div>
			<!-- END Main Content -->
			<footer>
				<p style="text-align: center;">2018 © MONGINIS.</p>
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

