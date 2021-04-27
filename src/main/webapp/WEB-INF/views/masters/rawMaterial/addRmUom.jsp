<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	 

	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
	<body>
	
	<jsp:include page="/WEB-INF/views/include/logout.jsp"></jsp:include>


<c:url var="getRmSubCategory" value="/getRmSubCategory" />
<c:url var="getRmCategory" value="/getRmCategory" />



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
					<!--<h1>
						<i class="fa fa-file-o"></i>Add RM Unit Of Measure Master
					</h1>-->

				</div>
			</div> 
			<!-- END Page Title -->
			
			<c:set var="isEdit" value="0">
			</c:set>

			<c:set var="isDelete" value="0">
			</c:set>

			<c:forEach items="${sessionScope.newModuleList}" var="modules">
				<c:forEach items="${modules.subModuleJsonList}" var="subModule">
					<c:choose>
						<c:when
							test="${subModule.subModuleMapping eq 'showAddRmUmo'}">

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

			<!-- BEGIN Main Content -->
			<div class="row">
				<div class="col-md-12">
					<div class="box">
					<div class="box-title">
							<h3>
								<i class="fa fa-bars"></i>Add RM Unit Of Measure Master
							</h3>
							<div class="box-tool">
								<a href=""></a> <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a>
							</div>
						
						</div> 

						
							<form action="${pageContext.request.contextPath}/addRmUom" method="post" class="form-horizontal" id=
									"validation-form"
										enctype="multipart/form-data" method="post">
										
								<div class="frm_Sec_one single">									
												<div class="row">
													
													
													<div class="col-md-10 box_marg">
											<label class="control-label left">Unit of Measure</label>
												<div class="controls icon_add">
													<i class="fa fa-list-ol frm_icon" aria-hidden="true"></i>
													<input type="text" name="uom" id="uom" class="form-control padd_left" placeholder="Tax Description"data-rule-required="true" value="${rmUom.uom}"/>
													<input type="hidden" name="umo_id" id="umo_id" value="${rmUom.uomId}"/>	
													</div>
										</div>
										
										<div class="col-md-2 box_marg">
											<div class=" three_buttons one_row">
									<button type="submit" class="btn btn-primary">Submit </button>
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
								</div>	 -->				
							

								
				
					</form>


						<div ><!-- class="box-content" -->
								<div class="box">
									<!-- <div class="box-title">
										<h3>
											<i class="fa fa-table"></i>Unit Of Measure List
										</h3>
										<div class="box-tool">
											<a data-action="collapse" href="#"><i
												class="fa fa-chevron-up"></i></a>
											<a data-action="close" href="#"><i class="fa fa-times"></i></a>
										</div>
									</div>
 -->
	<div class="box-content">
<jsp:include page="/WEB-INF/views/include/tableSearch.jsp"></jsp:include>

						<!-- 	<div class="clearfix"></div> -->
						
						<div class="tableFixHead">
      <table id="table2">
        <thead>
			<tr class="bgpink">
				<th style="text-align:left; width: 50px">Sr.No.</th>
				<th style="text-align: left;">Unit Of Measure</th>
				<th style="text-align: right; width: 50px">Action</th>
			</tr>
			</thead>
        <tbody>
												<c:forEach items="${rmUomList}" var="rmUomList"
													varStatus="count">

													<c:set value="0" var="flag" />
													<c:forEach items="${uomIds}" var="uomIds">
														<c:choose>
															<c:when test="${rmUomList.uomId==uomIds}">
																<c:set value="1" var="flag" />
															</c:when>
														</c:choose>
													</c:forEach>
													<tr>

														<td style="text-align: left;"><c:out
																value="${count.index+1}" /> &nbsp; <c:if
																test="${flag==0}">
																<input type="checkbox" class="chk"
																	name="select_to_print" id="${rmUomList.uomId}"
																	value="${rmUomList.uomId}" />
															</c:if></td>

														<td style="text-align: left;"><c:out
																value="${rmUomList.uom}"></c:out></td>


														<c:choose>
															<c:when test="${isEdit==1 and isDelete==1}">

																<td style="text-align: right;">
																<a href="deleteRmUom/${rmUomList.uomId}"
																			onClick="return confirm('Are you sure want to delete this record');">
																			<i class="fa fa-times" aria-hidden="true"></i>
																		</a>
																<a
																	href="updateRmUom/${rmUomList.uomId}"> <i
																		class="fa fa-pencil" aria-hidden="true"
																		onclick="edit(1)"></i></a>&nbsp; <c:if test="${flag==0}">
																		
																	</c:if></td>
															</c:when>

															<c:when test="${isEdit==1 and isDelete==0}">

																<td style="text-align: right;">
																<a href="deleteRmUom/${rmUomList.uomId}" class="disableClick"
																			onClick="return confirm('Are you sure want to delete this record');">
																			<i class="fa fa-times" aria-hidden="true"></i>
																		</a>
																<a
																	href="updateRmUom/${rmUomList.uomId}"> <i
																		class="fa fa-pencil" aria-hidden="true"
																		onclick="edit(1)"></i></a>&nbsp; <c:if test="${flag==0}">
																		
																	</c:if></td>
															</c:when>

															<c:when test="${isEdit==0 and isDelete==1}">

																<td style="text-align: right;">
																<a href="deleteRmUom/${rmUomList.uomId}"
																			onClick="return confirm('Are you sure want to delete this record');">
																			<i class="fa fa-times" aria-hidden="true"></i>
																		</a>
																<a class="disableClick"
																	href="updateRmUom/${rmUomList.uomId}"> <i
																		class="fa fa-pencil" aria-hidden="true"
																		onclick="edit(1)"></i></a>&nbsp; <c:if test="${flag==0}">
																		
																	</c:if></td>

															</c:when>

															<c:otherwise>

																<td style="text-align: right;">
																<a href="deleteRmUom/${rmUomList.uomId}" class="disableClick"
																			onClick="return confirm('Are you sure want to delete this record');">
																			<i class="fa fa-times" aria-hidden="true"></i>
																		</a>
																<a class="disableClick"
																	href="updateRmUom/${rmUomList.uomId}"> <i
																		class="fa fa-pencil" aria-hidden="true"
																		onclick="edit(1)"></i></a>&nbsp; <c:if test="${flag==0}">
																		
																	</c:if></td>
															</c:otherwise>
														</c:choose>
													</tr>
												</c:forEach>

											</tbody>
      </table>
    </div>
							
							
							
							
							
								
				
				<div class="form-group">
								<div class="row" style="text-align: left; padding: 15px 20px 0 20px;">
									<input type="button" id="btn_delete" class="btn btn-primary" onclick="deleteById()" value="Delete" />
											
									
										
									
						</div>
								</div>
				
				
				
						</div>
									<%-- <div class="box-content">

										<div class="clearfix"></div>
										<div class="table-responsive" style="border: 0">
											<table width="100%" class="table table-advance" id="table1">
												<thead>
													<tr>
														<th width="55" style="width: 18px">Sr.No.</th>
														<th width="360" align="center">Unit Of Measure</th>
														<th width="50" align="left">Action</th>
													</tr>
												</thead>
												<tbody>
													  <c:forEach items="${rmUomList}" var="rmUomList" varStatus="count">
														<tr>
														
															<td><c:out value="${count.index+1}"/></td>
															<td align="left"><c:out
																	value="${rmUomList.uom}"></c:out></td>
															
															<td align="left"><a href="updateRmUom/${rmUomList.uomId}"><span
														class="glyphicon glyphicon-edit"></span></a>&nbsp;
                                                        
                                                        <a href="deleteRmUom/${rmUomList.uomId}"
													    onClick="return confirm('Are you sure want to delete this record');"><span
														class="glyphicon glyphicon-remove"></span></a></td>	
														</tr>
												</c:forEach> 
										</tbody>
									</table>
								</div>
							</div> --%>
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
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/common.js"></script>

			<script type="text/javascript"
				src="${pageContext.request.contextPath}/resources/assets/jquery-validation/dist/jquery.validate.min.js"></script>
			<script type="text/javascript"
				src="${pageContext.request.contextPath}/resources/assets/jquery-validation/dist/additional-methods.min.js"></script>
	<script type="text/javascript">
function deleteById()
{
	
		var checkedVals = $('.chk:checkbox:checked').map(function() {
		    return this.value;
		}).get();
		checkedVals=checkedVals.join(",");
		
		if(checkedVals=="")
			{
			alert("Please Select UOMs")
			}
		else
			{
			var res = confirm('Are you sure want to delete this records');

			if(res){
				window.location.href='${pageContext.request.contextPath}/deleteSelUom/'+checkedVals;
			}
		}
	

}
</script>
</body>
</html>

