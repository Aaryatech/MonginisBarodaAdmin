<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
  
 <jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
 <jsp:include page="/WEB-INF/views/include/logout.jsp"></jsp:include>
  	<style>
 table{
  width:100%;
 
  border:1px solid #ddd;
}
 </style>
<body>


 


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
							test="${subModule.subModuleMapping eq 'showProdHeader'}">

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
					<!--<h1>
						<i class="fa fa-file-o"></i>Production Header
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
								<i class="fa fa-bars"></i> Production List 
							</h3>
							<div class="box-tool">
								<a href=""></a> <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a>
							</div>
							
						</div>


						<div><!-- class="box-content" -->
							<form action="${pageContext.request.contextPath}/showProdHeader" class="form-horizontal"
								id="validation-form" method="get">

     <div class="frm_Sec_one single">
		<div class="row">
			<div class="col-md-3 box_marg">
				<label class="control-label left">From Date</label>
				<div class="controls icon_add">
				<i class="fa fa-calendar frm_icon" aria-hidden="true"></i>
				<input class="form-control padd_left date-picker" id="from_date" size="16" type="text" name="from_date" value="${fromDate}" required  />
				</div>
			</div>
			<div class="col-md-3 box_marg">
				<label class="control-label left">To Date</label>
				<div class="controls icon_add">
				<i class="fa fa-calendar frm_icon" aria-hidden="true"></i>
				<input class="form-control padd_left date-picker" id="to_date" size="16" type="text"  name="to_date" required value="${toDate}" />
				</div>
			</div>
			<div class="col-md-3 box_marg">
				<div class="three_buttons one_row">
					<input type="submit" value="Submit" class="btn btn-primary">			
					<button type="button" class="btn btn-primary">Cancel</button>
				</div>
			</div>
		</div>
	</div>					

			
			



		<div class="box-content">
			<div class="tableFixHead">
      <table id="table2">        
        <thead style="background-color: #f3b5db;">
		<tr class="bgpink">
			<th style="text-align: center; width:70px;">Sr.No</th>
			<th style="text-align: center;">Prod ID</th>
			<th style="text-align: center;">Production Date</th>
			<th style="text-align: center;">Category</th>
			<th style="text-align: center;">Status</th>
			<th style="text-align: center;">IsPlanned</th>
			<th style="text-align: center;">Action</th>
		</tr>
	</thead>
	
        <tbody>

											<c:forEach items="${planHeader}" var="planHeader" varStatus="count">

												<tr>
	                        	<td style="text-align: center;"><c:out value="${count.index+1}" /></td>
													<td style="text-align: center;"><c:out
															value="${planHeader.productionHeaderId}" /></td>
													<td style="text-align: left;"><c:out
															value="${planHeader.productionDate}" /></td>
													<td style="text-align: left; "><c:out value="${planHeader.catName}" /></td>

													<c:choose>
														<c:when test="${planHeader.productionStatus==1}">
															<td style="text-align: right; "><c:out value="Planning"></c:out></td>

														</c:when>
														<c:when test="${planHeader.productionStatus==2}">
															<td style="text-align: right;"><c:out value="Added From Order"></c:out></td>

														</c:when>
														<c:when test="${planHeader.productionStatus==3}">
															<td style="text-align: right;"><c:out value="Production Started"></c:out></td>

														</c:when>
														<c:when test="${planHeader.productionStatus==4}">
															<td style="text-align: right;"><c:out value="Production Completed"></c:out></td>

														</c:when>
														<c:when test="${planHeader.productionStatus==5}">
															<td style="text-align: right; "><c:out value="Closed"></c:out></td>

														</c:when>
														<c:otherwise>
															<td style="text-align: right; "><c:out value=""></c:out></td>
														</c:otherwise>
													</c:choose>


													<c:choose>
														<c:when test="${planHeader.isPlanned==1}">
															<td style="text-align: right;"><c:out value="Yes"></c:out></td>

														</c:when>
														<c:otherwise>
															<td style="text-align: right;"><c:out value="No"></c:out></td>

														</c:otherwise>

													</c:choose>


													<td style="text-align: right;"><a
														href="${pageContext.request.contextPath}/getProdDetail/${planHeader.productionHeaderId}"><span
															class="glyphicon glyphicon-info-sign" title="Production Details"></span></a>&nbsp;
                                              <c:choose>
														<c:when test="${planHeader.isPlanned==1 and planHeader.productionStatus!=4 and planHeader.productionStatus!=5}">


																	<c:choose>
																		<c:when test="${isDelete==1}">
																			<a
																				href="deletePlanHeader/${planHeader.productionHeaderId}/${fromDate}/${toDate}"
																				onClick="return confirm('Are you sure want to delete this record');"><span
																				class="glyphicon glyphicon-remove" title="Delete"></span></a>
																		</c:when>
																		<c:otherwise>
																			<a class="disableClick" 
																				href="deletePlanHeader/${planHeader.productionHeaderId}/${fromDate}/${toDate}"
																				onClick="return confirm('Are you sure want to delete this record');"><span
																				class="glyphicon glyphicon-remove" title="Delete"></span></a>
																		</c:otherwise>
																	</c:choose>
																	
																</c:when>
                                                 </c:choose>
													</td>
												</tr>
											</c:forEach>

										</tbody>
      </table>
    </div>
		</div>
							

								<div class="clearfix"></div>
										
							</form>
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
 $('.date-picker').datepicker({
     format: "dd-mm-yyyy",
     autoclose: true,
}).on('changeDate', function (ev) {
     $(this).datepicker('hide');
});
</script>
 </body>
</html>