<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<style>
	table{
  width:100%;
  border:1px solid #ddd;
}</style>
<body>

	<jsp:include page="/WEB-INF/views/include/logout.jsp"></jsp:include>

	<c:url var="getDateForStoreGvnHeader" value="/getDateForStoreGvnHeader" />

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
						<i class="fa fa-file-o"></i>GVN Header Sell ie Store 
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
								<i class="fa fa-bars"></i>GVN Approve For Sell
							</h3>
							<div class="box-tool">
								<a href="">Back to List</a> <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a>
							</div>
							<!-- <div class="box-tool">
								<a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a> <a data-action="close" href="#"><i
									class="fa fa-times"></i></a>
							</div> -->
						</div>


						<div ><!-- class="box-content" -->
							<form
								action="${pageContext.request.contextPath}/getGvnHeaderForStore"
								class="form-horizontal" method="get" id="validation-form">
								
								<div class="frm_Sec_one single">
									<div class="row">
										<div class="col-md-4 box_marg">
											<label class="control-label left">From Date</label>
											<div class="controls icon_add">
											<i class="fa fa-road frm_icon" aria-hidden="true"></i>
											<input class="form-control padd_left date-picker" id="from_date"
											size="16" type="text" name="from_date" value="${fromDate}"
											required onblur="getDate()" />
											</div>
										</div>
										
										<div class="col-md-4 box_marg">
											<label class="control-label left">To Date</label>
											<div class="controls icon_add">
											<i class="fa fa-road frm_icon" aria-hidden="true"></i>
											<input class="form-control padd_left date-picker" id="to_date" size="16"
											type="text" value="${toDate}" name="to_date" required
											onblur="getDate()" />
											</div>
										</div>
										
										<div class="col-md-4 box_marg">
											<label class="control-label left">Franchise</label>
											<div class="controls icon_add">
											<i class="fa fa-road frm_icon" aria-hidden="true"></i>
											<input type="text" style="display: none;" name="typeValue" id='typeValue' value="${type}">
											<select data-placeholder="Choose Franchisee"
											class="form-control padd_left chosen" multiple="multiple" tabindex="6"
											id="selectFr" name="selectFr" onchange="getDate()" required> 
											<option value="-1"><c:out value="All"/></option>
											<c:forEach items="${unSelectedFrList}" var="fr"
												varStatus="count2">
												<option value="${fr.frId}"><c:out value="${fr.frName}"/></option>
											</c:forEach>
										</select>
											</div>
										</div>
									</div>
									<input type="button" value="Submit" onclick="getDetails()" class="btn btn-primary">
								</div>	


							</form>


									<div class="box-content">
									
									<div class="tableFixHead">
	<table id="table1">        
	<thead style="background-color: #f3b5db;">
		<tr class="bgpink">
			<th style="text-align: center;">GvnSr No</th>
			<th style="text-align: left;">Franchisee Name</th>
			<th style="text-align: left;">Date</th>
			<th style="text-align: left;">Taxable Amt</th>
			<th style="text-align: left;">Tax Amt</th>
			<th style="text-align: left;">Amount</th>
			<th style="text-align: left;">Approved Amt</th>
			<th style="text-align: left;">Status</th>
			<th style="text-align: center;">Action</th>
		</tr>
	</thead>

	<tbody>
													<c:forEach items="${grnList}" var="grnList"
														varStatus="count">

														<tr>
														<tr>
															<td style="text-align: center;"><c:out
																	value="${grnList.grngvnSrno}" /> <input type="hidden"
																name="headerId" id="headerId"
																value="${grnList.grnGvnHeaderId}"></td>
																<td><c:forEach items="${unSelectedFrList}" var="fr"	varStatus="cnt">
												<c:choose>
												<c:when test="${grnList.frId==fr.frId}">
												${fr.frName}
												</c:when>
												<c:otherwise>
											
												</c:otherwise>
												</c:choose>
												</c:forEach></td>
																<%-- <td style="text-align: left;"><c:out
																	value="${grnList.grngvnDate}" /></td> --%>
															<td style="text-align: left;"><c:out
																	value="${grnList.grngvnDate}" /></td>
															<td class="col-md-1" style="text-align:right;"><c:out
																	value="${grnList.taxableAmt}" /></td>
															<td style="text-left;"><c:out
																	value="${grnList.taxAmt}" /></td>
															<td style="text-left;"><c:out
																	value="${grnList.totalAmt}" /></td>

															<td style="text-align:left;"><fmt:formatNumber type="number"
																	minFractionDigits="2" maxFractionDigits="2"
																	value="${grnList.apporvedAmt}" /> <%-- <c:out value="${grnList.taxableAmt}" /> --%></td>

															
															
															
															<c:set var="statusGVN" value="NA"></c:set>
												<c:forEach items="${gStatusLst}" var="gvnStatus">
												<c:if test="${gvnStatus.statusValue==grnList.grngvnStatus}">
												<c:set var="statusGVN" value="${gvnStatus.statusName}"></c:set>
												</c:if>
												</c:forEach>
													<td style="text-align: left;"><c:out value="${statusGVN}"></c:out></td>
															
															
<td style="text-align: center;"><a href="${pageContext.request.contextPath}/getStoreGvnDetail/${grnList.grnGvnHeaderId}"class="btn bnt-primary"> <i class="fa fa-list"></i></a></td>

														</tr>
													
													</c:forEach>
												</tbody>
	</table>
</div>


										<div class="clearfix"></div>


									</div>
								</div>

<!-- 							</form>
 -->						</div>
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

function getDate(){
	
	var fromDate=$("#from_date").val();
	var toDate=$("#to_date").val();
	var selectedFr = $("#selectFr").val();

	
	$.getJSON('${getDateForStoreGvnHeader}',
			{
			fromDate : fromDate,
			toDate:toDate,
			fr_id_list : JSON.stringify(selectedFr),
				ajax : 'true',

}
);

}

</script>
<script type="text/javascript">
	function validate() {
	
		var fromDate =$("#from_date").val();
		var toDate =$("#to_date").val();
		var selectFr =$("#selectFr").val();
		

		var isValid = true;

		if(fromDate==""||fromDate==null){
			isValid = false;
			alert("Please select From Date");
		}else if (toDate == "" || toDate == null) {

			isValid = false;
			alert("Please select To Date");
		}else if (selectFr == "" || selectFr == null) {

			isValid = false;
			alert("Please select Franchise");
		}
		return isValid;

	}
</script>

<script type="text/javascript">
function getDetails() {
	var isValid=validate();
	if(isValid==true){
	 var form = document.getElementById("validation-form");
	 var type = document.getElementById("typeValue").value;
//alert("type = "+type);
	  //  form.action ='${pageContext.request.contextPath}/getGvnHeaderForStore'+ '/'+type;
	   form.action ='${pageContext.request.contextPath}/getGvnHeaderForStore';
	    form.submit();
	}
	
}
</script>

</body>
</html>

