<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<body>

	<jsp:include page="/WEB-INF/views/include/logout.jsp"></jsp:include>

	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/resources/css/tableSearch.css">

<c:url value="/delMultiDisc" var="delMultiDisc" ></c:url>
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
						<i class="fa fa-file-o"></i> Franchisee
					</h1>
				</div>
			</div> -->
			<!-- END Page Title -->


			<c:set var="isEdit" value="0">
			</c:set>

			<c:set var="isDelete" value="0">
			</c:set>

			<c:forEach items="${sessionScope.newModuleList}" var="modules">
				<c:forEach items="${modules.subModuleJsonList}" var="subModule">
					<c:choose>
						<c:when
							test="${subModule.subModuleMapping eq 'addDiscount'}">

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
					<div class="row">
						<div class="col-md-12">
							<div class="box">
								<div class="box-title">
									<h3>
										<i class="fa fa-bars"></i> Discount List 
									</h3>
									<div class="box-tool">
										<a href="${pageContext.request.contextPath}/addDiscount">Add Discount</a> <a data-action="collapse" href="#"><i
											class="fa fa-chevron-up"></i> </a>
									</div>
								</div>
								<div class="box-content">
									
									<div class="col-md-9"></div>
									<label for="search" class="col-md-3" id="search"> <i
										class="fa fa-search"></i> <input
										type="text" id="myInput" style="border-radius: 25px;"  onkeyup="myFunction()"
										placeholder="Search.." title="Type in a name">
									</label>
									<div class="clearfix"></div>
									
									<div class="tableFixHead">
								      <table id="table2">
								        <thead>
								          <thead style="background-color: #f3b5db;">
												<tr class="bgpink">
													<th class="col-md-1" style="text-align: center;">#SR<input type="checkbox" id="selAllChkbx" name="selAllChkbx" ></th>
														<th class="col-md-2" style="text-align: center;">Franchises</th>
														<th class="col-md-2" style="text-align: center;">Category</th>
														<th class="col-md-3" style="text-align: center;">Items</th>
														<th class="col-md-1" style="text-align: center;">Discount %</th>
													    <th class="col-md-1" style="text-align: center;">Status</th> 
														<th class="col-md-1" width="90px" style="text-align: center;">Action</th>
													</tr>
											</thead>
								        <tbody style="padding-top: 100px">

													<c:forEach items="${discList}" var="discList"
														varStatus="count">

														<tr>
															<td><c:out value="${count.index+1}"></c:out><input type="checkbox" class="chk"
																	name="select_to_print" id="${discList.discId}"
																	value="${discList.discId}" /></td>
															<td style="text-align: left; padding-left: 2%;"><c:out
																	value="${discList.franchId}" /></td>
															<td style="text-align: left; padding-left: 2%;"><c:out
																	value="${discList.var3}" /></td>
															<td style="text-align: left; padding-left: 2%;"><c:out
																	value="${discList.itemId}" /></td>
															<td style="text-align: center;"><c:out
																	value="${discList.discPer}" /></td>
															
															<td style="text-align: center;"><c:choose><c:when test="${discList.isActive==1}">
															Active
															</c:when><c:otherwise>In-Active</c:otherwise> </c:choose> </td>

														<c:choose>
															<c:when test="${isEdit==1 and isDelete==1}">
																<td style="text-align: center;"><a
																	href="updateDiscount/${discList.discId}"><i
																		class="fa fa-pencil" aria-hidden="true"></i></a> <a
																	href="deleteDiscount/${discList.discId}"
																	onClick="return confirm('Are you sure want to delete this record');"><span
																		class="glyphicon glyphicon-remove"></span></a></td>
															</c:when>

															<c:when test="${isEdit==1 and isDelete==0}">
																<td style="text-align: center;"><a
																	href="updateDiscount/${discList.discId}"><i
																		class="fa fa-pencil" aria-hidden="true"></i></a> <a
																	href="deleteDiscount/${discList.discId}"
																	class="disableClick"
																	onClick="return confirm('Are you sure want to delete this record');"><span
																		class="glyphicon glyphicon-remove"></span></a></td>
															</c:when>

															<c:when test="${isEdit==0 and isDelete==1}">
																<td style="text-align: center;"><a
																	class="disableClick"
																	href="updateDiscount/${discList.discId}"><i
																		class="fa fa-pencil" aria-hidden="true"></i></a> <a
																	href="deleteDiscount/${discList.discId}"
																	onClick="return confirm('Are you sure want to delete this record');"><span
																		class="glyphicon glyphicon-remove"></span></a></td>

															</c:when>

															<c:otherwise>
																<td style="text-align: center;"><a
																	class="disableClick"
																	href="updateDiscount/${discList.discId}"><i
																		class="fa fa-pencil" aria-hidden="true"></i></a> <a
																	href="deleteDiscount/${discList.discId}"
																	class="disableClick"
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


							</div>
							<div class="form-group" id="range">



								<div class="col-sm-8  controls">
									<input type="button" id="expExcel" class="btn btn-primary"
										value="EXPORT TO Excel" onclick="exportToExcel1();">
										<input type="button" id="expExcel" class="btn btn-primary"
										value="Delete" onclick="deleteMultiDisc();">
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

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/jquery-validation/dist/jquery.validate.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/jquery-validation/dist/additional-methods.min.js"></script>



</body>


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
	
	

	
	</script>

<script>
function myFunction() {
  var input, filter, table, tr, td, i;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("table1");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[1];
    if (td) {
      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }       
  }
}
</script>
<script>
function deleteMultiDisc() {
	var checkedVals = $('.chk:checkbox:checked').map(function() {
	    return this.value;
	}).get();
	checkedVals=checkedVals.join(",");
	//alert("Hii"+checkedVals)
	$.getJSON('${delMultiDisc}', {
		checkedVals :JSON.stringify(checkedVals),
					ajax : 'true'
				}, function(data) {
					//alert(JSON.stringify(data))
					alert(data.message)
					window.location.reload();
				});
}
</script>

<script type="text/javascript">
function exportToExcel()
{
	window.open("${pageContext.request.contextPath}/exportToExcel");
			document.getElementById("expExcel").disabled=true;
}

function exportToExcel1()
{
	window.open("${pageContext.request.contextPath}/exportToExcelNew");
			document.getElementById("expExcel1").disabled=true;
}
</script>

</html>