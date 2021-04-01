<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
	<body>
	
	<jsp:include page="/WEB-INF/views/include/logout.jsp"></jsp:include>

	<c:url var="getGroup2ByCatId" value="/getGroup2ByCatId" />

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
						<i class="fa fa-file-o"></i> Bill Details
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
								<i class="fa fa-bars"></i>View Bill Details
							</h3>
							<div class="box-tool">
								<a href="${pageContext.request.contextPath}/showBillList">Back to List</a> <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a>
							</div>
							<!-- <div class="box-tool">
								<a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a> <a data-action="close" href="#"><i
									class="fa fa-times"></i></a>
							</div> -->
						</div>



						<div><!-- class="box-content" -->
							<form action="" class="form-horizontal" method="post"
								id="validation-form">
								
								<div class="frm_Sec_one single">
									<div class="row">
										<div class="col-md-4 box_marg">
										<label class="control-label left">Bill No</label>
										<div class="controls icon_add">
										<i class="fa fa-road frm_icon" aria-hidden="true"></i>
										<input type="text" name="bill_no" id="bill_no"
											placeholder="Bill No" class="form-control padd_left" value="${billNo}"
											data-rule-required="true" readonly="readonly" />
										</div>
									</div>
									
									<div class="col-md-4 box_marg">
										<label class="control-label left">Bill date Name</label>
										<div class="controls icon_add">
										<i class="fa fa-road frm_icon" aria-hidden="true"></i>
										<input type="text" name="bill_date" id="bill_date"
											placeholder="Bill Date" class="form-control padd_left"
											value="${billDate}" data-rule-required="true"
											data-rule-minlength="3" readonly="readonly" />
										</div>
									</div>
									
									<div class="col-md-4 box_marg">
										<label class="control-label left">Franchise Name</label>
										<div class="controls icon_add">
										<i class="fa fa-road frm_icon" aria-hidden="true"></i>
										<input type="text" name="fr_name" id="fr_name"
											placeholder="Franchisee Name" class="form-control padd_left"
											data-rule-required="true" readonly="readonly"
											value="${frName}" />
										</div>
									</div>
									
									</div>
								</div>	
							</div>	


								


								<div class="box-content">
								
								<div class="tableFixHead">
									<table id="table1">        
									<thead style="background-color: #f3b5db;">
										<tr class="bgpink">
											<th style="text-align: center;">Sr No</th>
											<th>Group</th>
											<th>Item Name</th>
											<th>Ord Qty</th>
											<th>Bill Qty</th>
											<th>Rate</th>
											<th>Taxable Amt</th>
											<th>Sgst Rs</th>
											<th>Cgst Rs</th>
											<th>Igst Rs</th>
											<th>GST%</th>
											<th>Total</th>
										</tr>
									</thead>
								
									<tbody>
										<c:forEach items="${billDetails}" var="billDetails" varStatus="count">
											<tr>
												<td style="text-align: center;"><c:out value="${count.index+1}" /></td>
												<td><c:out value="${billDetails.catName}" /></td>
												<td><c:out value="${billDetails.itemName}" /></td>
												<td align="center"><c:out value="${billDetails.orderQty}" /></td>
												<td align="center"><c:out value="${billDetails.billQty}" /></td>
												<td><c:out value="${billDetails.baseRate}" /></td>
												<td><c:out value="${billDetails.taxableAmt}" /></td>
												<td><c:out value="${billDetails.sgstRs}" /></td>
												<td><c:out value="${billDetails.cgstRs}" /></td>
												<td><c:out value="${billDetails.igstRs}" /></td>
												<c:set var="sgstPer" value="${billDetails.sgstPer}" />
												<c:set var="cgstPer" value="${billDetails.cgstPer}" />
												<td><c:out value="${sgstPer + cgstPer}" /></td>
												<td><c:out value="${billDetails.grandTotal}" /></td>
											</tr>
										</c:forEach>
									</tbody>
									</table>
								</div>
								
									
								</div>








							</form>
						
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




</body>
</html>