<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<body>

	<jsp:include page="/WEB-INF/views/include/logout.jsp"></jsp:include>

	<c:url var="getBillList" value="/getFrSubCatItemYearlyReport"></c:url>

	<c:url var="getAllFrListForSalesReportYearly" value="/getAllFrListForSalesReportYearly"></c:url>
	<c:url var="getAllCatByAjax" value="/getAllCatByAjax"></c:url>

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
					<i class="fa fa-file-o"></i> Yearly Franchisee Wise SubCategory wise Item
					wise Report
				</h1>
				<h4></h4>-->
			</div>
		</div> 
		<!-- END Page Title -->

		<!-- BEGIN Breadcrumb -->
		<%-- <div id="breadcrumbs">
			<ul class="breadcrumb">
				<li><i class="fa fa-home"></i> <a
					href="${pageContext.request.contextPath}/home">Home</a> <span
					class="divider"><i class="fa fa-angle-right"></i></span></li>
				<li class="active">Report</li>
			</ul>
		</div> --%>
		<!-- END Breadcrumb -->

		<form id="submitBillForm"
			action="${pageContext.request.contextPath}/displayYearlyReport"
			method="get">
			<!-- BEGIN Main Content -->
			<div class="box">
				<div class="box-title">
					<h3>
						<i class="fa fa-bars"></i>  Yearly Franchisee Wise Sub Category wise Item
					wise Report 
					</h3>

				</div>

				<div><!-- class="box-content" -->
				
					<div class="frm_Sec_one single">
						<div class="row">
							<div class="col-md-3 box_marg">
							<label class="control-label left">From Date</label>
							<div class="controls icon_add date_select date_select">
							<i class="fa fa-calendar frm_icon" aria-hidden="true"></i>
							<input class="form-control padd_left date-picker" id="fromDate"
									name="fromDate" size="30" type="text" value="${yearStartDate}" />
							</div>
				   		</div>
				   		
				   		<div class="col-md-3 box_marg">
							<label class="control-label left">To Date</label>
							<div class="controls icon_add date_select date_select">
							<i class="fa fa-calendar frm_icon" aria-hidden="true"></i>
							<input class="form-control padd_left date-picker" id="toDate"
									name="toDate" size="30" type="text" value="${todaysDate}" />
							</div>
				   		</div>
				   		
				   		<div class="col-md-6 box_marg">
							<label class="control-label left">Select Category</label>
							<div class="controls icon_add ">
							<i class="fa fa-list-ul frm_icon" aria-hidden="true"></i>
							<select data-placeholder="Select Group"
								class="form-control padd_left chosen" name="item_grp1" tabindex="-1"
								onchange="getSubCategoriesByCatId(this.value)" id="item_grp1"
								data-rule-required="true" multiple="multiple">
								<option value="-1">Select All</option>
								<c:forEach items="${mCategoryList}" var="mCategoryList">
									<option value="${mCategoryList.catId}"><c:out
											value="${mCategoryList.catName}"></c:out></option>
								</c:forEach>
							</select>
							</div>
				   		</div>
				   		
				   		<div class="col-md-3 box_marg">
							<label class="control-label left">Report Type</label>
							<div class="controls icon_add date_select ">
							<i class="fa fa-file-text frm_icon" aria-hidden="true"></i>
							<select data-placeholder="Choose Type"
									class="form-control padd_left chosen" id="typeId" name="typeId">
									<option value="1">Consolidated</option>
									<option value="2">Quantity</option>
									<option value="3">Amount</option>
									<option value="4">Taxable Amount</option>
								</select>
							</div>
				   		</div>
				   		
				   		<div class="col-md-9 box_marg">
							<label class="control-label left"> Select Franchise</label>
							<div class="controls icon_add date_select">
							<i class="fa fa-user frm_icon" aria-hidden="true"></i>
							<select data-placeholder="Choose Franchisee"
								class="form-control padd_left chosen" multiple="multiple" tabindex="6"
								id="selectFr" name="selectFr"
								onchange="setAllFrSelected(this.value)">
								<option value="-1"><c:out value="All" /></option>
								<c:forEach items="${unSelectedFrList}" var="fr"
									varStatus="count">
									<option value="${fr.frId}"><c:out value="${fr.frName}" /></option>
								</c:forEach>
							</select>
							</div>
				   		</div>
				   		
						</div>
					</div>
					
					<div class="form-group">
					<div class="three_buttons">
						<input type="button" id="submit" class="btn btn-primary"
									value="Search" onclick="searchReport()">
						<input type="button" class="btn btn-primary" value="Cancel">
					</div>					
			    </div>
			    
					<div align="center" id="loader" style="display: none">
						<span>
							<h4>
								<font color="#343690">Loading</font>
							</h4>
						</span> <span class="l-1"></span> <span class="l-2"></span> <span
							class="l-3"></span> <span class="l-4"></span> <span class="l-5"></span>
						<span class="l-6"></span>
					</div>

				</div>
			</div>

		</form>
		<footer>
		<p>2017 © Monginis.</p>
	</footer>

	</div>
	<!-- END Main Content -->

	

	<a id="btn-scrollup" class="btn btn-circle btn-lg" href="#"><i
		class="fa fa-chevron-up"></i></a>






	<script type="text/javascript">
		function searchReport() {
			//	var isValid = validate();
			
			//alert("hi");

			var selectedFr = $("#selectFr").val();
			var selectedCat = $("#item_grp1").val();
			var selectedType = $("#typeId").val();
			var from_date = $("#fromDate").val();
			var to_date = $("#toDate").val();

			$('#loader').show();

			$.getJSON('${getBillList}',
			{
				fr_id_list : JSON.stringify(selectedFr),
				cat_id_list : JSON.stringify(selectedCat),
				fromDate : from_date,
				toDate : to_date,
				selectedType : selectedType,
				ajax : 'true'

			}, function(data) {
				$('#loader').hide();
				//alert("DATA ------------ " + JSON.stringify(data));
				exportToExcel();

			});
		}
		
		function getSubCategoriesByCatId(catId) {
			if (catId == -1) {
				$.getJSON('${getAllCatByAjax}', {
					ajax : 'true'
				}, function(data) {
					var len = data.length;
					$('#item_grp1').find('option').remove().end()

					$("#item_grp1").append(
							$("<option ></option>").attr("value", -1).text(
									"Select All"));

					for (var i = 0; i < len; i++) {

						$("#item_grp1").append(
								$("<option selected></option>").attr("value",
										data[i].catId).text(data[i].catName));
					}

					$("#item_grp1").trigger("chosen:updated");
				});
			}
		}
	</script>



	<script>
		$('.datepicker').datepicker({
			format : {

				format : 'mm/dd/yyyy',
				startDate : '-3d'
			}
		});

		function genPdf() {
			var selectedFr = $("#selectFr").val();
			var selectedSubCatIdList = $("#item_grp2").val();
			var from_date = $("#fromDate").val();
			var to_date = $("#toDate").val();

			window
					.open('${pageContext.request.contextPath}/pdfForReport?url=pdf/showSummeryFrAndSubCatPdf/'
							+ from_date
							+ '/'
							+ to_date
							+ '/'
							+ selectedFr
							+ '/' + selectedSubCatIdList);

		}
	</script>


	<script type="text/javascript">
		function disableFr() {

			//alert("Inside Disable Fr ");
			document.getElementById("selectFr").disabled = true;

		}

		function disableRoute() {

			//alert("Inside Disable route ");
			var x = document.getElementById("selectRoute")
			//alert(x.options.length);
			var i;
			for (i = 0; i < x; i++) {
				document.getElementById("selectRoute").options[i].disabled;
				//document.getElementById("pets").options[2].disabled = true;
			}
			//document.getElementById("selectRoute").disabled = true;

		}

		function exportToExcel() {

			window.open("${pageContext.request.contextPath}/exportToExcelNew");
			document.getElementById("expExcel").disabled = true;
		}
	</script>

	<script>
		function setAllFrSelected(frId) {
			//alert("hii")
			if (frId == -1) {

				$.getJSON('${getAllFrListForSalesReportYearly}', {

					ajax : 'true'
				},
						function(data) {

							var len = data.length;

							//alert(len);

							$('#selectFr').find('option').remove().end()
							$("#selectFr").append(
									$("<option value='-1'>All</option>"));
							for (var i = 0; i < len; i++) {
								$("#selectFr").append(
										$("<option selected ></option>").attr(
												"value", data[i].frId).text(
												data[i].frName));
							}
							$("#selectFr").trigger("chosen:updated");
						});
			}
		}
	</script>




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
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/chosen-bootstrap/chosen.jquery.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-inputmask/bootstrap-inputmask.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/jquery-tags-input/jquery.tagsinput.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/jquery-pwstrength/jquery.pwstrength.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-fileupload/bootstrap-fileupload.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-duallistbox/duallistbox/bootstrap-duallistbox.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/dropzone/downloads/dropzone.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-timepicker/js/bootstrap-timepicker.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/clockface/js/clockface.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-colorpicker/js/bootstrap-colorpicker.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-daterangepicker/date.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-daterangepicker/daterangepicker.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-switch/static/js/bootstrap-switch.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-wysihtml5/wysihtml5-0.3.0.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-wysihtml5/bootstrap-wysihtml5.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/ckeditor/ckeditor.js"></script>

	<!--flaty scripts-->
	<script src="${pageContext.request.contextPath}/resources/js/flaty.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/flaty-demo-codes.js"></script>
</body>
</html>