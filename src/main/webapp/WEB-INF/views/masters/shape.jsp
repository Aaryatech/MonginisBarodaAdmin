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
					<!--<h1>
						<i class="fa fa-file-o"></i> Route
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
							test="${subModule.subModuleMapping eq 'addShape'}">

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


						<div> <!-- class="box-content" -->
							<form action="${pageContext.request.contextPath}/addShapeProcess" class="form-horizontal"
								method="post" id="validation-form">


								<input type="hidden" value="${shape.shapeId}" name="shape_id" id="shape_id">
								
								<div class="frm_Sec_one single">									
									<div class="row">
										<div class="col-md-3 box_marg">
											<label class="control-label left">Shape Name</label>
												<div class="controls icon_add">
													<i class="fa fa-user frm_icon" aria-hidden="true"></i>
													<input type="text" name="shape_name" id="shape_name"
											placeholder="Shape Name" class="form-control padd_left"
											data-rule-required="true" value="${shape.shapeName}"  />
													</div>
													<span class="span_err" id="err_name" >Enter Shape Name</span>
										</div>
										
										<div class="col-md-6 box_marg">
											<label class="control-label left">Shape Description.</label>
												<div class="controls icon_add">
													<i class="fa fa-stack-exchange frm_icon" aria-hidden="true"></i>
													<input type="text" name="shape_desc" id="shape_desc"
											placeholder="Shape Description" class="form-control padd_left"
											data-rule-required="true" value="${shape.shapeDesc}" />
													</div>
													<span class="span_err" id="err_des" >Enter Shape Description</span>
										</div>
										
										<div class="col-md-3 box_marg">
											<div class="row three_buttons one_row">
												<button type="submit" class="btn btn-primary" style="width: 70px" id="sub_btn">Submit</button>
												<button type="button" class="btn btn-primary" onclick="window.location.reload()" >Cancel</button>
											
											</div>
										</div>
										
									</div>
								</div>	
								
								
								<!-- <div class="form-group">
								<div class="row three_buttons">
									<button type="submit" class="btn btn-primary" style="width: 70px">Submit</button>
										<button type="button" class="btn btn-primary">Cancel</button>
										
									
						</div>
								</div> -->
</form>
</div></div>


<!-- newly added /form to be tested -->

							<div class="box-content">
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
										
										<div class="tableFixHead">
      <table id="table1">
        <thead>
          <thead style="background-color: #f3b5db;">
				<tr>
					<th style="text-align: center; width: 70px;">#<input type="checkbox" id="selAllChkbx" name="selAllChkbx" ></th>
					<th style="text-align: center;">Shape Name</th>
					<th style="text-align: center;">Shape Discription Type</th>
					<th style="text-align: center; width:70px;">Action</th>
				</tr>
			</thead>
        <tbody>
													<c:forEach items="${shapeList}" var="shape" varStatus="count">
														<tr>
															<td style="text-align: center;"><c:out value="${count.index+1}"/><input type="checkbox" class="chk" name="select_to_print" id="${shape.shapeId}"	value="${shape.shapeId}"/></td>
															<td style="text-align: left;"><c:out value="${shape.shapeName}"></c:out></td>
															<td style="text-align: left;"><c:out value="${shape.shapeDesc}"></c:out></td>
															<c:set value="-" var="type"> </c:set>
															<c:choose>
																<c:when test="${isEdit==1 and isDelete==1}">
															<td style="text-align: center;"><a
																href="${pageContext.request.contextPath}/updateShape/${shape.shapeId}"><i class="fa fa-pencil" aria-hidden="true"></i></a>&nbsp;
																<a href="${pageContext.request.contextPath}/deleteShape/${shape.shapeId}"
																onClick="return confirm('Are you sure want to delete this record');"><span
																	class="glyphicon glyphicon-remove"></span></a></td>
																</c:when>

																<c:when test="${isEdit==1 and isDelete==0}">
																<td style="text-align: center;"><a
																href="${pageContext.request.contextPath}/updateShape/${shape.shapeId}"><i class="fa fa-pencil" aria-hidden="true"></i></a>&nbsp;

																<a href="${pageContext.request.contextPath}/deleteShape/${shape.shapeId}"
																class="disableClick" style="opacity: 0.5;"
																onClick="return confirm('Are you sure want to delete this record');"><span
																	class="glyphicon glyphicon-remove"></span></a></td>
																</c:when>

																<c:when test="${isEdit==0 and isDelete==1}">
																	<td style="text-align: center;"><a class="disableClick" 
																href="${pageContext.request.contextPath}/updateShape/${shape.shapeId}"><i class="fa fa-pencil" aria-hidden="true"></i></a>&nbsp;

																<a href="${pageContext.request.contextPath}/deleteShape/${shape.shapeId}"
																onClick="return confirm('Are you sure want to delete this record');"><span
																	class="glyphicon glyphicon-remove"></span></a></td>
																</c:when>

																<c:otherwise>
																	<td style="text-align: center;"><a class="disableClick"
																href="${pageContext.request.contextPath}/updateShape/${shape.shapeId}"><i class="fa fa-pencil" aria-hidden="true"></i></a>&nbsp;

																<a href="${pageContext.request.contextPath}/deleteShape/${shape.shapeId}" 
																class="disableClick" style="opacity: 0.5;"
																onClick="return confirm('Are you sure want to delete this record');"><span
																	class="glyphicon glyphicon-remove"></span></a></td>
																</c:otherwise>
															</c:choose>

															
														</tr>

													</c:forEach>
												</tbody>
      </table>
    </div>
										
										
										
										
										
									</div>
									<button type="button" class="btn btn-primary"onclick="exportToExcel1()" >Excell</button>
									<div  class="form-group" style="background-color: white; text-align: right; padding: 6px 10px 10px 0; display: none;
									" ><!-- -->
										<input type="button" id="btn_delete"
											class="btn btn-primary" onclick="deleteById()" 
											value="Delete" />
									</div>
								</div></div>
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
<script type="text/javascript">
function exportToExcel1()
{
	window.open("${pageContext.request.contextPath}/exportToExcelNew");
			document.getElementById("expExcel1").disabled=true;
}
</script>
<script type="text/javascript">
	$('#selAllChkbx').click(function(event) {   
		//alert("Hiii")
	   if(this.checked) {
	        // Iterate each checkbox
	        $(':checkbox').each(function() {
	            this.checked = true;                        
	        });
	    } else {
	        $(':checkbox').each(function() {
	            this.checked = false;                       
	        });
	    }
	});
	
	
	$("#sub_btn")
	.on(
			"click",
			function() {
				
				var isError = false;
				var errMsg = "";

				if (!$("#shape_name").val()) {
					isError = true;
					$("#err_name").show();
				} else {
					$("#err_name").hide();
				}
				
				if (!$("#shape_desc").val()) {
					isError = true;
					$("#err_des").show();
				} else {
					$("#err_des").hide();
				}
				
		
				return false;
			});
	
	</script>


</body>
</html>