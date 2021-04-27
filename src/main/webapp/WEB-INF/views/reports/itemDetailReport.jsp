<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/tableSearch.css">
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
						<i class="fa fa-file-o"></i>Product Order Detail report
					</h1>-->
				</div> 
			</div>
			<!-- END Page Title -->
			<c:set var="isAdd" value="0">
			</c:set>


			<c:set var="isEdit" value="0">
			</c:set>

			<c:set var="isDelete" value="0">
			</c:set>

			<c:forEach items="${sessionScope.newModuleList}" var="modules">
			<c:forEach items="${modules.subModuleJsonList}" var="subModule">


				</c:forEach>
			</c:forEach>




			<div class="row">
				<div class="col-md-12">

					<div class="box">
						<div class="box-title">
							<h3>
								<i class="fa fa-bars"></i>Product Order Detail Report
							</h3>
							<div class="box-tool"></div>
						</div>

						<div class="box-content">
							<div class="col-md-9"></div>
							<label for="search" class="col-md-3" id="search" style="margin:0 0 13px 00;"> <i
								class="fa fa-search" ></i> <input
								type="text" id="myInput" onkeyup="myFunction()"
								placeholder="Search for supplier names.." title="Type in a name">
							</label>
							<div class="clearfix"></div>
							
							<div class="tableFixHead">
	<table id="table1">         
	<thead style="background-color: #f3b5db;">
		<tr class="bgpink">
			<th style="text-align: center; width:70px;">Sr.No.</th>
			<th style="text-align: right;">Bill Date</th>
			<th style="text-align: right;">Bill No.</th>
			<th style="text-align: left;">Item Name</th>
			<th style="text-align: right;">Order Qty</th>
			<th style="text-align: right;">Bill Qty</th>
		</tr>
	</thead>
	
	<tbody>
										<%
											int count = 1;
										%>
										<c:set var="totalBillQty" value="0"></c:set>
										<c:set var="totalOrderQty" value="0"></c:set>
										<c:forEach items="${itemDetailList}" var="itemDetailList">
											<tr>
												<td style="text-align: center;"><%=count++%> <c:out value="${count}" /></td>
												<td  style="text-align: right;"><c:out
														value="${itemDetailList.billDate}" /></td>

												<td  style="text-align: right;"><c:out
														value="${itemDetailList.invoiceNo}" /></td>

												<td style="text-align: left;"><c:out
														value="${itemDetailList.itemName}" /></td>
												<c:set var="totalOrderQty"
													value="${totalOrderQty+itemDetailList.orderQty}"></c:set>




												<td style="text-align: right;"><c:out
														value="${itemDetailList.orderQty}" /></td>

												<td style="text-align: right;"><c:out
														value="${itemDetailList.billQty}" /></td>

												<c:set var="totalBillQty"
													value="${totalBillQty+itemDetailList.billQty}"></c:set>

											</tr>
										</c:forEach>
										<tr>
											<td></td>
											<td></td>
											<td></td>
											<td style="text-align: right;">Total</td>
											<td style="text-align: right;"><c:out value="${totalOrderQty}" /></td>
											<td style="text-align: right;"><c:out value="${totalBillQty}" /></td>

										</tr>

									</tbody>
	</table>
</div>

			<div class="form-group">
				<div class="row three_buttons" style="padding:19px 0 0 0;">										
					<input type="button" id="expExcel" class="btn btn-primary" value="Export To Excel" onclick="exportToExcel();">
					<button class="btn btn-primary" value="PDF" id="PDFButton" onclick="genPdf()">PDF</button>
					<button type="button" class="btn btn-primary">Cancel</button> 
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

		function exportToExcel() {

			window.open("${pageContext.request.contextPath}/exportToExcelNew");
			document.getElementById("expExcel").disabled = true;
		}
	</script>

	<script>
		function genPdf() {
			window
					.open("${pageContext.request.contextPath}/getItemDetailReportPdf");

		}
	</script>

</body>
</html>
