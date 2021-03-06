<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.Date"%>
<style>
table {
	border: 1px solid #ddd;
}

.form-control1 {
	display: block;
	width: 100%;
	height: 34px;
	padding: 5px 5px;
	font-size: 14px;
	line-height: 1.428571429;
	color: #555;
	vertical-align: middle;
	background-color: #fff;
	background-image: none;
	border: 1px solid #ccc;
	border-radius: 4px;
	-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
	-webkit-transition: border-color ease-in-out .15s, box-shadow
		ease-in-out .15s;
	transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
}
</style>
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<body>
	<jsp:include page="/WEB-INF/views/include/logout.jsp"></jsp:include>
	<c:url var="getFinGoodStock" value="/getFinGoodStock"></c:url>



	<c:url var="finishedGoodDayEnd" value="/finishedGoodDayEnd"></c:url>


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
						<i class="fa fa-file-o"></i>Finished Goods Stock
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
								<i class="fa fa-bars"></i> Finished Goods Stock 
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
							<form class="form-horizontal" id="validation-form1">
							
	<div class="frm_Sec_one single">
		<div class="row">
			<div class="col-md-3 box_marg">
				<label class="control-label left">Category</label>
				<div class="controls icon_add">
				<i class="fa fa-list-ul frm_icon" aria-hidden="true"></i>
				<select class="form-control padd_left chosen" name="catId" id="catId" onclick="DayEndEnable()">
					<option value="-1">All</option>
					<c:forEach items="${catList}" var="catList">
						<option value="${catList.catId}">${catList.catName}
						</option>
					</c:forEach>
				</select>
				</div>
			</div>
			
			<div class="col-md-3 box_marg">
				<label class="control-label left">Select Option</label>
				<div class="controls icon_add">
				<i class="fa fa-dot-circle-o frm_icon" aria-hidden="true"></i>
				<select name="selectStock" class="form-control padd_left chosen" tabindex="6" id="selectStock" onchange="showDiv()" required>
					<option value="1" id="currentStock">Get Current
						Stock</option>
					<option value="3" id="dateStock">Get Stock Between Dates</option>
				</select>
				</div>
			</div>
			
			<div class="col-md-3 box_marg">
				<div class="three_buttons one_row">
					<input type="button" class="btn btn-primary" name="submit" value="Get Stock " onclick="searchItemsByCategory()" />
					<button type="button" class="btn btn-primary">Cancel</button>
				</div>
			</div>
			
		</div>
	</div>	
	
	<!-- <div class="form-group">
		<div class="three_buttons">
			<input type="button" class="btn btn-primary" name="submit" value="Get Stock " onclick="searchItemsByCategory()" />
			<button type="button" class="btn btn-primary">Cancel</button>
		</div>					
	</div> -->

	<div class="frm_Sec_one single" style="display: none" id="select_month_year">
		<div class="row">
			<div class="col-md-3 box_marg">
				<label class="control-label left">Select Month From</label>
				<div class="controls icon_add">
				<i class="fa fa-calendar frm_icon" aria-hidden="true"></i>
				<input type='text' placeholder="Select From Month" value="2017-12-12" name="from_stockdate" required class="form-control padd_left date-picker" />
				</div>
			</div>
			
			<div class="col-md-3 box_marg">
				<label class="control-label left">To</label>
				<div class="controls icon_add">
				<i class="fa fa-calendar frm_icon" aria-hidden="true"></i>
				<input type='text' placeholder="Select To Month" value="2017-12-12" name="to_stockdate" required class="form-control padd_left date-picker" />
				</div>
			</div>
		</div>
	</div>	
	
	<div class="frm_Sec_one single" style="display: none" id="select_date">
		<div class="row">
			<div class="col-md-3 box_marg">
				<label class="control-label left">From Date</label>
				<div class="controls icon_add">
				<i class="fa fa-calendar frm_icon" aria-hidden="true"></i>
				<input class="form-control padd_left date-picker" placeholder="From Date" name="from_datepicker" id="from_datepicker" type="text">
				</div>
			</div>
			
			<div class="col-md-3 box_marg">
				<label class="control-label left">To Date</label>
				<div class="controls icon_add">
				<i class="fa fa-calendar frm_icon" aria-hidden="true"></i>
				<input class="form-control padd_left date-picker" placeholder="To Date" name="to_datepicker" id="to_datepicker" type="text">
				</div>
			</div>
		</div>
	</div>	

							
							

								<div class="form-group">


									<div align="center" id="loader" style="display: none">

										<span>
											<h3>
												<font color="#343690">Loading</font>
											</h3>
										</span> <span class="l-1"></span> <span class="l-2"></span> <span
											class="l-3"></span> <span class="l-4"></span> <span
											class="l-5"></span> <span class="l-6"></span>
									</div>
								</div>
								<input type="hidden" id="selectedCatId" name="selectedCatId" />

							</form>
							
							
							
							
							<form method="post" id="validation-form">

								<div class="box" style="background-color: #ffffff;">
									<div style="background-color: #ffffff;">
									
										<!-- 										<input type="submit" class="btn btn-primary" value="Submit">
 -->									
 
 										<div style="display: inline-block; width:100%; text-align: center; padding:10px 0 0 0;">
										<input type="text" class="form-control" readonly value="" id="setDate" style="display:inline-block; width: 200px;" /> 
										<input type="button" style="display: inline-block; margin:0 0 0 15px;"
											class="btn btn-danger" value="Day End Process"
											id="dayEndButton" disabled="disabled" />
										</div>	

									

									<div class="box-content" >

										<div class="clearfix">
										
										<jsp:include page="/WEB-INF/views/include/tableSearch.jsp"></jsp:include>
										</div>
										
						<div class="tableFixHead">
					      <table id="table1">        
					        <thead style="background-color: #f3b5db;">
							<tr class="bgpink">
								<th style="text-align: center;">Sr. No.</th>
								<th style="text-align: left;">Item</th>
								<th style="text-align: right;">Op Tot</th>
								<th style="text-align: right;">Prod Qty</th>
								<th style="text-align: right;">Rej Qty</th>
								<th style="text-align: right;">Return Qty</th>
								<th style="text-align: right;">Bill Qty</th>
								<th style="text-align: right;">Total Clo</th>
							</tr>
						</thead>
						
					        <tbody>
							</tbody>
					      </table>
					    </div>	
					    </div>			
										
										
										
				<div class="frm_Sec_one single">
					<div class="row">
						<div class="col-md-12 box_marg">
							<label class="control-label left">Special Cake Count </label>
							<div class="controls icon_add">
							<i class="fa fa-road frm_icon" aria-hidden="true"></i>
							<input type="text" name="spCakeCount" readonly value="${bean.spCakeCount}" id="spCakeCount" placeholder="Special Cake Count" class="form-control padd_left"
													data-rule-required="true" />
					</div>
						</div>
					</div>
				</div>	
				
				<div class="form-group">
	<div class="three_buttons">
		<input type="button" id="expExcel" class="btn btn-primary" value="Export To Excel" onclick="exportToExcel();" disabled>
        <input type="button" class="btn btn-primary" value="Closing Qty PDF" id="PDFButtonClosing" onclick="genClosingQtyPdf()" disabled> 
		<input type="button" id="expExcelClosing" class="btn btn-primary" value="Export To Excel For Closing Qty" onclick="exportToExcel2();" disabled> 
		<input type="button" class="btn btn-primary" value="Summery PDF" id="PDFButtonSummery" onclick="genSummeryPdf()" disabled>
		<input type="button" id="expExcelSummery" class="btn btn-primary" value="Export To Excel Summery" onclick="exportToExcel1();" disabled>
	
		<button type="button" class="btn btn-primary">Cancel</button>
	</div>					
</div>
										
										

									



									

									 <div align="center" class="form-group" style="background-color: #ffffff; margin: 3% 0% 2% 0%; padding-bottom: 17px;">

									<!--	<div
											class="col-sm-25 col-sm-offset-3 col-lg-30 col-lg-offset-0">
																					<input type="submit" class="btn btn-primary" value="Submit">

											<input type="button" id="expExcel" class="btn btn-primary"
												value="EXPORT TO Excel" onclick="exportToExcel();" disabled>


										</div>-->

									
									
										</div> 
										</div>
										</div>
							</form>
						</div>


					</div>
					
				</div>
			</div>
			<jsp:include page="/WEB-INF/views/include/copyrightyear.jsp"></jsp:include>

		</div>


		<!-- END Main Content -->
		

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
		function searchItemsByCategory() {

			var catId = $("#catId").val();
			document.getElementById("selectedCatId").value = catId;
			//var to_datepicker = document.getElementById("to_datepicker").value ;
			//var from_datepicker= document.getElementById("from_datepicker").value ;

			var to_datepicker = $('#to_datepicker').val();

			var from_datepicker = $('#from_datepicker').val();

			var option = $("#selectStock").val();

			$('#loader').show();

			$
					.getJSON(
							'${getFinGoodStock}',
							{
								catId : catId,
								option : option,
								from_datepicker : from_datepicker,
								to_datepicker : to_datepicker,
								ajax : 'true',

							},
							function(data) {

								$('#table1 td').remove();

								$('#loader').hide();
								//alert("Day End " +data.isDayEndEnable);
								document.getElementById("setDate").value = data.stockDate;
								if (data.isDayEndEnable == 1) {
									if (option == 1 && catId == -1) {

										//alert("in if enable true");
										//$('#dayEndButton').removeAttr('disabled');
										document.getElementById("dayEndButton").disabled = false;

									} else if (data.isDayEndEnable == 0) {
										//alert("in else disable true");
										document.getElementById("dayEndButton").disabled = true;
									}
								}

								if (data == "") {
									alert("No records found !!");

								}

								$
										.each(
												data.stockDetail,
												function(key, stock) {

													document
															.getElementById("expExcel").disabled = false;
													document
															.getElementById("expExcelSummery").disabled = false;
													document
															.getElementById("expExcelClosing").disabled = false;

													document
															.getElementById("PDFButtonSummery").disabled = false;

													document
															.getElementById("PDFButtonClosing").disabled = false;

													document
															.getElementById("spCakeCount").value = data.spCakeCount;
													var index = key + 1;

													var tr = "<tr>";

													var index = "<td>" + index
															+ "</td>";

													var itemName = "<td>"
															+ stock.itemName
															+ "</td>";

											/* 		var t1 = "<td align=center ><input type=text size='4' class=form-control1 style='font-size:8pt; height:20px; text-align:right;'  value="+stock.opT1+" readonly ></td>";

													var t2 = "<td align=center ><input type=text size='4' class=form-control1 style='font-size:8pt;height:20px;text-align:right;' value="+stock.opT2+" readonly></td>";

													var t3 = "<td align=center ><input type=text size='4'  class=form-control1  style='font-size:8pt;height:20px;text-align:right;' value="+stock.opT3+" readonly></td>"; */

													var opTotal = "<td style='text-align:right;'>"+stock.opTotal
													+"<input type=hidden size='4'  class=form-control1 value="+stock.opTotal+" readonly></td>";

													var prodQty = "<td style='text-align:right;'>"+stock.prodQty
													+"<input type=hidden size='4'  class=form-control1 value="+stock.prodQty+" readonly ></td>";

													var rejQty = "<td style='text-align:right;'>"+stock.rejQty
													+"<input type=hidden size='4' class=form-control1 value="+stock.rejQty+"  readonly></td>";

													var gateSaleQty = "<td style='text-align:right;'>"+stock.gateSaleQty
													+"<input type=hidden size='4'  class=form-control1 value="+stock.gateSaleQty+" readonly ></td>";

													var billQty = "<td style='text-align:right;'>"+stock.frSaleQty
													+"<input type=hidden size='4'  class=form-control1 value="+stock.frSaleQty+"  readonly></td>";

													/* 
													
													var cloT1 = "<td align=center ><input type=text size='4'  class=form-control1 style='font-size:8pt;' value="+stock.cloT1+" readonly></td>";

													var cloT2 = "<td align=center ><input type=text size='4'  class=form-control1  style='font-size:8pt;' value="+stock.cloT2+" readonly></td>";

													var cloT3 = "<td align=center ><input type=text  size='4' class=form-control1 style='font-size:8pt;'  value="+stock.cloT3+" readonly></td>";

													
													var cloCurrent = "<td align=center ><input type=text  size='4' class=form-control1 style='font-size:8pt;'  value="+stock.cloCurrent+" readonly></td>";
													 */
													var totalClosing = "<td style='text-align:right;'>"+stock.totalCloStk
													+"<input type=hidden size='4' class=form-control1 value="+stock.totalCloStk+" readonly></td>";

													var trclosed = "</tr>";

													$('#table1 tbody').append(
															tr);
													$('#table1 tbody').append(
															index);
													$('#table1 tbody').append(
															itemName);
												/* 	$('#table1 tbody').append(
															t1);

													$('#table1 tbody').append(
															t2);

													$('#table1 tbody').append(
															t3); */

													$('#table1 tbody').append(
															opTotal);
													$('#table1 tbody').append(
															prodQty);

													$('#table1 tbody').append(
															rejQty);

													$('#table1 tbody').append(
															gateSaleQty);

													$('#table1 tbody').append(
															billQty);

													/* 
													


													 $('#table1 tbody').append(
													 cloCurrent);
													
													 $('#table1 tbody').append(
													 cloT1);
													
													 $('#table1 tbody').append(
													 cloT2);
													
													 $('#table1 tbody').append(
													 cloT3); */

													$('#table1 tbody').append(
															totalClosing);

													$('#table1 tbody').append(
															trclosed);

												})

							});
			/* if(stock.isDayEndEnable==1){
			$('#dayEndButton').removeAttr('disabled');
			} */
			document.getElementById("dayEndButton").disabled = true;

		}
	</script>

	<script type="text/javascript">
		$('#dayEndButton')
				.click(
						function() {

							var option = $("#selectStock").val();
							if (option == 1) {
								var dayEnd = confirm("Are you sure you want to Day End!");
								if (dayEnd == true) {
									var form = document
											.getElementById("validation-form")

									// alert(form);
									form.action = "${pageContext.request.contextPath}/finishedGoodDayEnd";
									form.submit();

								}

							}

							else {

								alert("Please Select Current Stock");

							}
						});
	</script>


	<script type="text/javascript">
		function genClosingQtyPdf() {

			window.open('${pageContext.request.contextPath}/closingQtyPdf');

		}

		function genSummeryPdf() {

			window.open('${pageContext.request.contextPath}/summeryPdf');

		}

		function exportToExcel1() {

			window.open("${pageContext.request.contextPath}/exportToExcel1");
			document.getElementById("expExcelSummery").disabled = true;
		}

		function exportToExcel2() {

			window.open("${pageContext.request.contextPath}/exportToExcel2");
			document.getElementById("expExcelClosing").disabled = true;
		}
	</script>

	<script>
		function showDiv() {
			var	elem=	$('#selectStock').val();
			//alert(elem)
			if (elem == 1) {
				document.getElementById('select_month_year').style = "display:none";
				document.getElementById('select_date').style = "display:none";

			} else if (elem == 2) {
				document.getElementById('select_month_year').style.display = "block";
				document.getElementById('select_date').style = "display:none";
			} else if (elem == 3) {
				//alert("In If")
				document.getElementById('select_date').style.display = "block";
				//alert("In 111")
				document.getElementById('select_month_year').style = "display:none";
				//alert("In 222")

			}

		}
		function exportToExcel() {

			window.open("${pageContext.request.contextPath}/exportToExcel");
			document.getElementById("expExcel").disabled = true;
		}
	</script>
</body>

</html>