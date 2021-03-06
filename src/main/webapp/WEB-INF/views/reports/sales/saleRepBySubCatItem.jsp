<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<body>

	<jsp:include page="/WEB-INF/views/include/logout.jsp"></jsp:include>

	<c:url var="getBillList" value="/getSaleReportBySubCatAndFrItem"></c:url>
	<c:url var="getAllCatByAjax" value="/getAllCatByAjax"></c:url>
	<c:url var="getGroup2ByCatId" value="/getSubCatByCatIdForReport"></c:url>

	<c:url var="getAllFrListForSalesReportAjax2" value="/getAllFrListForSalesReportAjax2"></c:url>


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
				<!-- <h1>
					<i class="fa fa-file-o"></i>Franchise wise Sub Category wise Item
					wise Report
				</h1>
				<h4></h4> -->
			</div>
		</div>
		<!-- END Page Title -->

		<!-- BEGIN Breadcrumb -->
		<%-- <div id="breadcrumbs">
			<ul class="breadcrumb">
				<li><i class="fa fa-home"></i> <a
					href="${pageContext.request.contextPath}/home">Home</a> <span
					class="divider"><i class="fa fa-angle-right"></i></span></li>
				<li class="active">Bill Report</li>
			</ul>
		</div> --%>
		<!-- END Breadcrumb -->

		<!-- BEGIN Main Content -->
		<div class="box">
			<div class="box-title">
				<h3>
					<i class="fa fa-bars"></i>Franchise wise Sub Category wise Item
					wise Report
				</h3>

			</div>

			<div><!-- class="box-content" -->
				
				<div class="frm_Sec_one single">
					<div class="row">
						<div class="col-md-3 box_marg">
							<label class="control-label left">From Date</label>
							<div class="controls icon_add">
							<i class="fa fa-calendar frm_icon" aria-hidden="true"></i>
							<input class="form-control padd_left date-picker" id="fromDate"
								name="fromDate" size="30" type="text" value="${todaysDate}" />
							</div>
				   		</div>
				   		
				   		<div class="col-md-3 box_marg">
							<label class="control-label left">To Date</label>
							<div class="controls icon_add">
							<i class="fa fa-calendar frm_icon" aria-hidden="true"></i>
							<input class="form-control padd_left date-picker" id="toDate" name="toDate"
								size="30" type="text" value="${todaysDate}" />
							</div>
				   		</div>
				   		
				   		<div class="col-md-6 box_marg">
							<label class="control-label left">Select Category</label>
							<div class="controls icon_add">
							<i class="fa fa-list-ul frm_icon" aria-hidden="true"></i>
							<select data-placeholder="Select Group"
							class="form-control padd_left chosen" name="item_grp1" tabindex="-1"
							onchange="getSubCategoriesByCatId()" id="item_grp1"
							data-rule-required="true" multiple="multiple">
							<option value="-1">Select All</option>
							<c:forEach items="${mCategoryList}" var="mCategoryList">
								<option value="${mCategoryList.catId}"><c:out
										value="${mCategoryList.catName}"></c:out></option>
							</c:forEach>
						</select>
							</div>
				   		</div>
				   		
				   		<div class="col-md-6 box_marg">
							<label class="control-label left">Sub Category</label>
							<div class="controls icon_add">
							<i class="fa fa-list-ul frm_icon" aria-hidden="true"></i>
							<select data-placeholder="Select Sub Category" multiple="multiple"
							class="form-control padd_left chosen " name="item_grp2" id="item_grp2"
							tabindex="-1" data-rule-required="true"
							onchange="setAllSubSelected()">
						</select>
							</div>
				   		</div>
				   		
				   		<div class="col-md-6 box_marg">
							<label class="control-label left">Select Franchise</label>
							<div class="controls icon_add">
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
						<button class="btn btn-primary" onclick="searchReport()">Search</button>
						<button class="btn btn-primary" value="PDF" id="PDFButton" onclick="genPdf()">PDF</button>
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


		<div class="box">


			<div class=" box-content">
				<div class="tableFixHead">
					<table id="table_grid">        
					<thead style="background-color: #f3b5db;">
						<tr class="bgpink">
							<th style="text-align: center;">Sr.No.</th>
							<th style="text-align: left;">Item Name</th>
							<th style="text-align: right;">Sold Qty</th>
							<th style="text-align: right;">Sold Amt</th>
							<th style="text-align: right;">Var Qty</th>
							<th style="text-align: right;">Var Amt</th>
							<th style="text-align: right;">Ret Qty</th>
							<th style="text-align: right;">Ret Amt</th>
							<th style="text-align: right;">Net Qty</th>
							<th style="text-align: right;">Net Amt</th>
							<th style="text-align: right;">Ret Amt</th>
						</tr>
					</thead>
					
					<tbody>
					</tbody>
					</table>
				</div>
			
			</div>
			
			<div class="form-group" style="display: none;" id="range"><!--  -->
					<div class="three_buttons" style="padding: 0px 30px 10px 30px;">
						<input type="button" id="expExcel" class="btn btn-primary"
								value="Export To Excel" onclick="exportToExcel();"
								disabled="disabled">
						<input type="button" class="btn btn-primary" value="Cancel">
					</div>					
			    </div>
		</div>
		
		<footer>
		<p>2019 © Monginis.</p>
	</footer>
	</div>
	<!-- END Main Content -->

	

	<a id="btn-scrollup" class="btn btn-circle btn-lg" href="#"><i
		class="fa fa-chevron-up"></i></a>



	<script type="text/javascript">
		function searchReport() {
			//	var isValid = validate();

			var selectedFr = $("#selectFr").val();
			var selectedSubCat = $("#item_grp2").val();

			var from_date = $("#fromDate").val();
			var to_date = $("#toDate").val();

			$('#loader').show();

			$
					.getJSON(
							'${getBillList}',

							{
								fr_id_list : JSON.stringify(selectedFr),
								subCat_id_list : JSON.stringify(selectedSubCat),
								fromDate : from_date,
								toDate : to_date,
								ajax : 'true'

							},
							function(data) {

								//alert(JSON.stringify(data));

								$('#table_grid td').remove();
								$('#loader').hide();

								if (data == "") {
									alert("No records found !!");
									document.getElementById("expExcel").disabled = true;
								}

								var finalSoldQty = 0;
								var finalSoldAmt = 0;
								var finalVarQty = 0;
								var finalVarAmt = 0;
								var finalRetQty = 0;
								var finalRetAmt = 0;
								var finalNetQty = 0;
								var finalNetAmt = 0;
								var finalretAmtPer = 0;

								$
										.each(
												data.frList,
												function(key, fr) {

													var index = 0;
													var tr = $('<tr style="text-align:center;"></tr>');

													tr.append($('<td ></td>')
															.html(fr.frName));
													tr.append($('<td></td>')
															.html(""));
													tr.append($('<td></td>')
															.html(""));
													tr.append($('<td></td>')
															.html(""));
													tr.append($('<td></td>')
															.html(""));
													tr.append($('<td></td>')
															.html(""));
													tr.append($('<td></td>')
															.html(""));

													tr.append($('<td></td>')
															.html(""));
													tr.append($('<td></td>')
															.html(""));
													tr.append($('<td></td>')
															.html(""));
													tr.append($('<td></td>')
															.html(""));

													$('#table_grid tbody')
															.append(tr);

													var totalSoldQty = 0;
													var totalSoldAmt = 0;
													var totalVarQty = 0;
													var totalVarAmt = 0;
													var totalRetQty = 0;
													var totalRetAmt = 0;
													var totalNetQty = 0;
													var totalNetAmt = 0;
													var retAmtPer = 0;

													$
															.each(
																	data.subCatList,
																	function(
																			key,
																			subCat) {

																		var SoldQty = 0;
																		var SoldAmt = 0;
																		var VarQty = 0;
																		var VarAmt = 0;
																		var RetQty = 0;
																		var RetAmt = 0;
																		var NetQty = 0;
																		var NetAmt = 0;
																		var AmtPer = 0;

																		var tr = $('<tr></tr>');

																		tr
																				.append($(
																						'<td style="text-align:center;"></td>')
																						.html(
																								subCat.subCatName));
																		tr
																				.append($(
																						'<td></td>')
																						.html(
																								""));
																		tr
																				.append($(
																						'<td></td>')
																						.html(
																								""));
																		tr
																				.append($(
																						'<td></td>')
																						.html(
																								""));
																		tr
																				.append($(
																						'<td></td>')
																						.html(
																								""));
																		tr
																				.append($(
																						'<td></td>')
																						.html(
																								""));
																		tr
																				.append($(
																						'<td></td>')
																						.html(
																								""));

																		tr
																				.append($(
																						'<td></td>')
																						.html(
																								""));
																		tr
																				.append($(
																						'<td></td>')
																						.html(
																								""));
																		tr
																				.append($(
																						'<td></td>')
																						.html(
																								""));
																		tr
																				.append($(
																						'<td></td>')
																						.html(
																								""));

																		$(
																				'#table_grid tbody')
																				.append(
																						tr);

																		$
																				.each(
																						data.subCatItemReport,
																						function(
																								key1,
																								report) {
																							if (subCat.subCatId == report.subCatId) {

																								if (fr.frId == report.frId) {

																									SoldQty = SoldQty
																											+ report.soldQty;
																									SoldAmt = SoldAmt
																											+ report.soldAmt;
																									VarQty = VarQty
																											+ report.varQty;
																									VarAmt = VarAmt
																											+ report.varAmt;
																									RetQty = RetQty
																											+ report.retQty;
																									RetAmt = RetAmt
																											+ report.retAmt;
																									NetQty = NetQty
																											+ report.netQty;
																									NetAmt = NetAmt
																											+ report.netAmt;
																									AmtPer = AmtPer
																											+ report.retAmtPer;

																									totalSoldQty = totalSoldQty
																											+ report.soldQty;
																									totalSoldAmt = totalSoldAmt
																											+ report.soldAmt;
																									totalVarQty = totalVarQty
																											+ report.varQty;
																									totalVarAmt = totalVarAmt
																											+ report.varAmt;
																									totalRetQty = totalRetQty
																											+ report.retQty;
																									totalRetAmt = totalRetAmt
																											+ report.retAmt;
																									totalNetQty = totalNetQty
																											+ report.netQty;
																									totalNetAmt = totalNetAmt
																											+ report.netAmt;
																									retAmtPer = retAmtPer
																											+ report.retAmtPer;

																									document
																											.getElementById("expExcel").disabled = false;
																									document
																											.getElementById('range').style.display = 'block';
																									index = index + 1;
																									//var tr = "<tr>";

																									var tr = $('<tr></tr>');

																									tr
																											.append($(
																													'<td style="text-align:center;"></td>')
																													.html(
																															index));

																									tr
																											.append($(
																													'<td></td>')
																													.html(
																															report.itemName));

																									tr
																											.append($(
																													'<td style="text-align:right;"></td>')
																													.html(
																															addCommas(report.soldQty
																																	.toFixed(2))));

																									tr
																											.append($(
																													'<td style="text-align:right;"></td>')
																													.html(
																															addCommas(report.soldAmt
																																	.toFixed(2))));

																									tr
																											.append($(
																													'<td style="text-align:right;"></td>')
																													.html(
																															addCommas(report.varQty
																																	.toFixed(2))));

																									tr
																											.append($(
																													'<td style="text-align:right;"></td>')
																													.html(
																															addCommas(report.varAmt
																																	.toFixed(2))));

																									tr
																											.append($(
																													'<td style="text-align:right;"></td>')
																													.html(
																															addCommas(report.retQty
																																	.toFixed(2))));
																									tr
																											.append($(
																													'<td style="text-align:right;"></td>')
																													.html(
																															addCommas(report.retAmt
																																	.toFixed(2))));

																									tr
																											.append($(
																													'<td style="text-align:right;"></td>')
																													.html(
																															addCommas(report.netQty
																																	.toFixed(2))));
																									tr
																											.append($(
																													'<td style="text-align:right;"></td>')
																													.html(
																															addCommas(report.netAmt
																																	.toFixed(2))));
																									tr
																											.append($(
																													'<td style="text-align:right;"></td>')
																													.html(
																															addCommas(report.retAmtPer
																																	.toFixed(2))));

																									$(
																											'#table_grid tbody')
																											.append(
																													tr);

																								}
																							}

																						});

																		var tr = $('<tr></tr>');

																		tr
																				.append($(
																						'<td  ></td>')
																						.html(
																								" "));

																		tr
																				.append($(
																						'<td style="font-weight:bold;"></td>')
																						.html(
																								"Total"));
																		tr
																				.append($(
																						'<td style="text-align:right;"></td>')
																						.html(
																								addCommas(SoldQty
																										.toFixed(2))));
																		tr
																				.append($(
																						'<td style="text-align:right;"></td>')
																						.html(
																								addCommas(SoldAmt
																										.toFixed(2))));
																		tr
																				.append($(
																						'<td style="text-align:right;"></td>')
																						.html(
																								addCommas(VarQty
																										.toFixed(2))));
																		tr
																				.append($(
																						'<td style="text-align:right;"></td>')
																						.html(
																								addCommas(VarAmt
																										.toFixed(2))));
																		tr
																				.append($(
																						'<td style="text-align:right;"></td>')
																						.html(
																								addCommas(RetQty
																										.toFixed(2))));
																		tr
																				.append($(
																						'<td style="text-align:right;"></td>')
																						.html(
																								addCommas(RetAmt
																										.toFixed(2))));

																		tr
																				.append($(
																						'<td style="text-align:right;"></td>')
																						.html(
																								addCommas(NetQty
																										.toFixed(2))));
																		tr
																				.append($(
																						'<td style="text-align:right;"></td>')
																						.html(
																								addCommas(NetAmt
																										.toFixed(2))));

																		tr
																				.append($(
																						'<td style="text-align:right;"></td>')
																						.html(
																								addCommas(AmtPer
																										.toFixed(2))));

																		$(
																				'#table_grid tbody')
																				.append(
																						tr);

																	});

													finalSoldQty = finalSoldQty
															+ totalSoldQty;
													finalSoldAmt = finalSoldAmt
															+ totalSoldAmt;
													finalVarQty = finalVarQty
															+ totalVarQty;
													finalVarAmt = finalVarAmt
															+ totalVarAmt;
													finalRetQty = finalRetQty
															+ totalRetQty;
													finalRetAmt = finalRetAmt
															+ totalRetAmt;
													finalNetQty = finalNetQty
															+ totalNetQty;
													finalNetAmt = finalNetAmt
															+ totalNetAmt;
													finalretAmtPer = finalretAmtPer
															+ retAmtPer;

													var tr = $('<tr></tr>');

													tr.append($('<td  ></td>')
															.html(" "));

													tr
															.append($(
																	'<td style="font-weight:bold;"></td>')
																	.html(
																			"Franchisee Total"));
													tr
															.append($(
																	'<td style="text-align:right;"></td>')
																	.html(
																			addCommas(totalSoldQty
																					.toFixed(2))));
													tr
															.append($(
																	'<td style="text-align:right;"></td>')
																	.html(
																			addCommas(totalSoldAmt
																					.toFixed(2))));
													tr
															.append($(
																	'<td style="text-align:right;"></td>')
																	.html(
																			addCommas(totalVarQty
																					.toFixed(2))));
													tr
															.append($(
																	'<td style="text-align:right;"></td>')
																	.html(
																			addCommas(totalVarAmt
																					.toFixed(2))));
													tr
															.append($(
																	'<td style="text-align:right;"></td>')
																	.html(
																			addCommas(totalRetQty
																					.toFixed(2))));
													tr
															.append($(
																	'<td style="text-align:right;"></td>')
																	.html(
																			addCommas(totalRetAmt
																					.toFixed(2))));

													tr
															.append($(
																	'<td style="text-align:right;"></td>')
																	.html(
																			addCommas(totalNetQty
																					.toFixed(2))));
													tr
															.append($(
																	'<td style="text-align:right;"></td>')
																	.html(
																			addCommas(totalNetAmt
																					.toFixed(2))));

													tr
															.append($(
																	'<td style="text-align:right;"></td>')
																	.html(
																			addCommas(retAmtPer
																					.toFixed(2))));

													$('#table_grid tbody')
															.append(tr);

												})

								var tr = $('<tr></tr>');

								tr.append($('<td  ></td>').html(" "));

								tr.append($(
										'<td style="font-weight:bold;"></td>')
										.html("Final Total"));
								tr.append($(
										'<td style="text-align:right;"></td>')
										.html(
												addCommas(finalSoldQty
														.toFixed(2))));
								tr.append($(
										'<td style="text-align:right;"></td>')
										.html(
												addCommas(finalSoldAmt
														.toFixed(2))));
								tr
										.append($(
												'<td style="text-align:right;"></td>')
												.html(
														addCommas(finalVarQty
																.toFixed(2))));
								tr
										.append($(
												'<td style="text-align:right;"></td>')
												.html(
														addCommas(finalVarAmt
																.toFixed(2))));
								tr
										.append($(
												'<td style="text-align:right;"></td>')
												.html(
														addCommas(finalRetQty
																.toFixed(2))));
								tr
										.append($(
												'<td style="text-align:right;"></td>')
												.html(
														addCommas(finalRetAmt
																.toFixed(2))));

								tr
										.append($(
												'<td style="text-align:right;"></td>')
												.html(
														addCommas(finalNetQty
																.toFixed(2))));
								tr
										.append($(
												'<td style="text-align:right;"></td>')
												.html(
														addCommas(finalNetAmt
																.toFixed(2))));

								tr.append($(
										'<td style="text-align:right;"></td>')
										.html(
												addCommas(finalretAmtPer
														.toFixed(2))));

								$('#table_grid tbody').append(tr);

							});
		}
	</script>





	<!-- <script type="text/javascript">
		function searchReport() {
			//	var isValid = validate();

			var selectedFr = $("#selectFr").val();
			var selectedSubCat = $("#item_grp2").val();

			var from_date = $("#fromDate").val();
			var to_date = $("#toDate").val();

			$('#loader').show();

			$
					.getJSON(
							'${getBillList}',

							{
								fr_id_list : JSON.stringify(selectedFr),
								subCat_id_list : JSON.stringify(selectedSubCat),
								fromDate : from_date,
								toDate : to_date,
								ajax : 'true'

							},
							function(data) {
								
								alert(JSON.stringify(data));

								$('#table_grid td').remove();
								$('#loader').hide();

								if (data == "") {
									alert("No records found !!");
									document.getElementById("expExcel").disabled = true;
								}

								var finalSoldQty = 0;
								var finalSoldAmt = 0;
								var finalVarQty = 0;
								var finalVarAmt = 0;
								var finalRetQty = 0;
								var finalRetAmt = 0;
								var finalNetQty = 0;
								var finalNetAmt = 0;
								var finalretAmtPer = 0;

								$
										.each(
												data.frList,
												function(key, fr) {

													var index = 0;
													var tr = $('<tr></tr>');

													tr.append($('<td></td>')
															.html(fr.frName));
													tr.append($('<td></td>')
															.html(""));
													tr.append($('<td></td>')
															.html(""));
													tr.append($('<td></td>')
															.html(""));
													tr.append($('<td></td>')
															.html(""));
													tr.append($('<td></td>')
															.html(""));
													tr.append($('<td></td>')
															.html(""));

													tr.append($('<td></td>')
															.html(""));
													tr.append($('<td></td>')
															.html(""));
													tr.append($('<td></td>')
															.html(""));
													tr.append($('<td></td>')
															.html(""));

													$('#table_grid tbody')
															.append(tr);

													var totalSoldQty = 0;
													var totalSoldAmt = 0;
													var totalVarQty = 0;
													var totalVarAmt = 0;
													var totalRetQty = 0;
													var totalRetAmt = 0;
													var totalNetQty = 0;
													var totalNetAmt = 0;
													var retAmtPer = 0;

													$
															.each(
																	data.subCatList,
																	function(
																			key,
																			subCat) {

																		var SoldQty = 0;
																		var SoldAmt = 0;
																		var VarQty = 0;
																		var VarAmt = 0;
																		var RetQty = 0;
																		var RetAmt = 0;
																		var NetQty = 0;
																		var NetAmt = 0;
																		var AmtPer = 0;

																		var tr = $('<tr></tr>');

																		tr
																				.append($(
																						'<td></td>')
																						.html(
																								subCat.subCatName));
																		tr
																				.append($(
																						'<td></td>')
																						.html(
																								""));
																		tr
																				.append($(
																						'<td></td>')
																						.html(
																								""));
																		tr
																				.append($(
																						'<td></td>')
																						.html(
																								""));
																		tr
																				.append($(
																						'<td></td>')
																						.html(
																								""));
																		tr
																				.append($(
																						'<td></td>')
																						.html(
																								""));
																		tr
																				.append($(
																						'<td></td>')
																						.html(
																								""));

																		tr
																				.append($(
																						'<td></td>')
																						.html(
																								""));
																		tr
																				.append($(
																						'<td></td>')
																						.html(
																								""));
																		tr
																				.append($(
																						'<td></td>')
																						.html(
																								""));
																		tr
																				.append($(
																						'<td></td>')
																						.html(
																								""));

																		$(
																				'#table_grid tbody')
																				.append(
																						tr);

																		$
																				.each(
																						data.subCatItemReport,
																						function(
																								key1,
																								report) {
																							if (subCat.subCatId == report.subCatId) {

																								if (fr.frId == report.frId) {

																									SoldQty = SoldQty
																											+ report.soldQty;
																									SoldAmt = SoldAmt
																											+ report.soldAmt;
																									VarQty = VarQty
																											+ report.varQty;
																									VarAmt = VarAmt
																											+ report.varAmt;
																									RetQty = RetQty
																											+ report.retQty;
																									RetAmt = RetAmt
																											+ report.retAmt;
																									NetQty = NetQty
																											+ report.netQty;
																									NetAmt = NetAmt
																											+ report.netAmt;
																									AmtPer = AmtPer
																											+ report.retAmtPer;

																									totalSoldQty = totalSoldQty
																											+ report.soldQty;
																									totalSoldAmt = totalSoldAmt
																											+ report.soldAmt;
																									totalVarQty = totalVarQty
																											+ report.varQty;
																									totalVarAmt = totalVarAmt
																											+ report.varAmt;
																									totalRetQty = totalRetQty
																											+ report.retQty;
																									totalRetAmt = totalRetAmt
																											+ report.retAmt;
																									totalNetQty = totalNetQty
																											+ report.netQty;
																									totalNetAmt = totalNetAmt
																											+ report.netAmt;
																									retAmtPer = retAmtPer
																											+ report.retAmtPer;

																									document
																											.getElementById("expExcel").disabled = false;
																									document
																											.getElementById('range').style.display = 'block';
																									index = index + 1;
																									//var tr = "<tr>";

																									var tr = $('<tr></tr>');

																									tr
																											.append($(
																													'<td></td>')
																													.html(
																															index));

																									tr
																											.append($(
																													'<td></td>')
																													.html(
																															report.itemName));

																									tr
																											.append($(
																													'<td style="text-align:right;"></td>')
																													.html(
																															addCommas(report.soldQty
																																	.toFixed(2))));

																									tr
																											.append($(
																													'<td style="text-align:right;"></td>')
																													.html(
																															addCommas(report.soldAmt
																																	.toFixed(2))));

																									tr
																											.append($(
																													'<td style="text-align:right;"></td>')
																													.html(
																															addCommas(report.varQty
																																	.toFixed(2))));

																									tr
																											.append($(
																													'<td style="text-align:right;"></td>')
																													.html(
																															addCommas(report.varAmt
																																	.toFixed(2))));

																									tr
																											.append($(
																													'<td style="text-align:right;"></td>')
																													.html(
																															addCommas(report.retQty
																																	.toFixed(2))));
																									tr
																											.append($(
																													'<td style="text-align:right;"></td>')
																													.html(
																															addCommas(report.retAmt
																																	.toFixed(2))));

																									tr
																											.append($(
																													'<td style="text-align:right;"></td>')
																													.html(
																															addCommas(report.netQty
																																	.toFixed(2))));
																									tr
																											.append($(
																													'<td style="text-align:right;"></td>')
																													.html(
																															addCommas(report.netAmt
																																	.toFixed(2))));
																									tr
																											.append($(
																													'<td style="text-align:right;"></td>')
																													.html(
																															addCommas(report.retAmtPer
																																	.toFixed(2))));

																									$(
																											'#table_grid tbody')
																											.append(
																													tr);

																								}
																							}

																						});

																		var tr = $('<tr></tr>');

																		tr
																				.append($(
																						'<td  ></td>')
																						.html(
																								" "));

																		tr
																				.append($(
																						'<td style="font-weight:bold;"></td>')
																						.html(
																								"Total"));
																		tr
																				.append($(
																						'<td style="text-align:right;"></td>')
																						.html(
																								addCommas(SoldQty
																										.toFixed(2))));
																		tr
																				.append($(
																						'<td style="text-align:right;"></td>')
																						.html(
																								addCommas(SoldAmt
																										.toFixed(2))));
																		tr
																				.append($(
																						'<td style="text-align:right;"></td>')
																						.html(
																								addCommas(VarQty
																										.toFixed(2))));
																		tr
																				.append($(
																						'<td style="text-align:right;"></td>')
																						.html(
																								addCommas(VarAmt
																										.toFixed(2))));
																		tr
																				.append($(
																						'<td style="text-align:right;"></td>')
																						.html(
																								addCommas(RetQty
																										.toFixed(2))));
																		tr
																				.append($(
																						'<td style="text-align:right;"></td>')
																						.html(
																								addCommas(RetAmt
																										.toFixed(2))));

																		tr
																				.append($(
																						'<td style="text-align:right;"></td>')
																						.html(
																								addCommas(NetQty
																										.toFixed(2))));
																		tr
																				.append($(
																						'<td style="text-align:right;"></td>')
																						.html(
																								addCommas(NetAmt
																										.toFixed(2))));

																		tr
																				.append($(
																						'<td style="text-align:right;"></td>')
																						.html(
																								addCommas(AmtPer
																										.toFixed(2))));

																		$(
																				'#table_grid tbody')
																				.append(
																						tr);

																	});

													finalSoldQty = finalSoldQty
															+ totalSoldQty;
													finalSoldAmt = finalSoldAmt
															+ totalSoldAmt;
													finalVarQty = finalVarQty
															+ totalVarQty;
													finalVarAmt = finalVarAmt
															+ totalVarAmt;
													finalRetQty = finalRetQty
															+ totalRetQty;
													finalRetAmt = finalRetAmt
															+ totalRetAmt;
													finalNetQty = finalNetQty
															+ totalNetQty;
													finalNetAmt = finalNetAmt
															+ totalNetAmt;
													finalretAmtPer = finalretAmtPer
															+ retAmtPer;

													var tr = $('<tr></tr>');

													tr.append($('<td  ></td>')
															.html(" "));

													tr
															.append($(
																	'<td style="font-weight:bold;"></td>')
																	.html(
																			"Franchisee Total"));
													tr
															.append($(
																	'<td style="text-align:right;"></td>')
																	.html(
																			addCommas(totalSoldQty
																					.toFixed(2))));
													tr
															.append($(
																	'<td style="text-align:right;"></td>')
																	.html(
																			addCommas(totalSoldAmt
																					.toFixed(2))));
													tr
															.append($(
																	'<td style="text-align:right;"></td>')
																	.html(
																			addCommas(totalVarQty
																					.toFixed(2))));
													tr
															.append($(
																	'<td style="text-align:right;"></td>')
																	.html(
																			addCommas(totalVarAmt
																					.toFixed(2))));
													tr
															.append($(
																	'<td style="text-align:right;"></td>')
																	.html(
																			addCommas(totalRetQty
																					.toFixed(2))));
													tr
															.append($(
																	'<td style="text-align:right;"></td>')
																	.html(
																			addCommas(totalRetAmt
																					.toFixed(2))));

													tr
															.append($(
																	'<td style="text-align:right;"></td>')
																	.html(
																			addCommas(totalNetQty
																					.toFixed(2))));
													tr
															.append($(
																	'<td style="text-align:right;"></td>')
																	.html(
																			addCommas(totalNetAmt
																					.toFixed(2))));

													tr
															.append($(
																	'<td style="text-align:right;"></td>')
																	.html(
																			addCommas(retAmtPer
																					.toFixed(2))));

													$('#table_grid tbody')
															.append(tr);

												})

								var tr = $('<tr></tr>');

								tr.append($('<td  ></td>').html(" "));

								tr.append($(
										'<td style="font-weight:bold;"></td>')
										.html("Final Total"));
								tr.append($(
										'<td style="text-align:right;"></td>')
										.html(addCommas(finalSoldQty.toFixed(2))));
								tr.append($(
										'<td style="text-align:right;"></td>')
										.html(addCommas(finalSoldAmt.toFixed(2))));
								tr.append($(
										'<td style="text-align:right;"></td>')
										.html(addCommas(finalVarQty.toFixed(2))));
								tr.append($(
										'<td style="text-align:right;"></td>')
										.html(addCommas(finalVarAmt.toFixed(2))));
								tr.append($(
										'<td style="text-align:right;"></td>')
										.html(addCommas(finalRetQty.toFixed(2))));
								tr.append($(
										'<td style="text-align:right;"></td>')
										.html(addCommas(finalRetAmt.toFixed(2))));

								tr.append($(
										'<td style="text-align:right;"></td>')
										.html(addCommas(finalNetQty.toFixed(2))));
								tr.append($(
										'<td style="text-align:right;"></td>')
										.html(addCommas(finalNetAmt.toFixed(2))));

								tr.append($(
										'<td style="text-align:right;"></td>')
										.html(addCommas(finalretAmtPer.toFixed(2))));

								$('#table_grid tbody').append(tr);

							});
		}
	</script> -->



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
					.open('${pageContext.request.contextPath}/pdfForReport?url=pdf/showSummeryFrAndSubCatItemPdf/'
							+ from_date
							+ '/'
							+ to_date
							+ '/'
							+ selectedFr
							+ '/' + selectedSubCatIdList);

		}
	</script>


	<script type="text/javascript">
		function getSubCategoriesByCatId() {
			var catId = $("#item_grp1").val();

			$
					.getJSON(
							'${getGroup2ByCatId}',
							{
								catId : JSON.stringify(catId),
								ajax : 'true'
							},
							function(data) {
								var html = '<option multiple="multiple" value="">Sub Category</option>';

								var len = data.length;

								$('#item_grp2').find('option').remove().end()

								$("#item_grp2")
										.append(
												$("<option ></option>").attr(
														"value", "").text(
														"Select Sub Category"));
								$("#item_grp2").append(
										$("<option></option>")
												.attr("value", -1).text("ALL"));
								for (var i = 0; i < len; i++) {
									$("#item_grp2").append(
											$("<option></option>").attr(
													"value", data[i].subCatId)
													.text(data[i].subCatName));
								}
								$("#item_grp2").trigger("chosen:updated");
							});
		}
		function setAllSubSelected() {
			var catId = $("#item_grp1").val();
			var subCatId = $("#item_grp2").val();
			if (subCatId == -1) {
				$
						.getJSON(
								'${getGroup2ByCatId}',
								{
									catId : JSON.stringify(catId),
									ajax : 'true'
								},
								function(data) {
									var html = '<option multiple="multiple" value="">Sub Category</option>';

									var len = data.length;

									$('#item_grp2').find('option').remove()
											.end()

									$("#item_grp2").append(
											$("<option ></option>").attr(
													"value", "").text(
													"Select Sub Category"));
									$("#item_grp2").append(
											$("<option></option>").attr(
													"value", -1).text("ALL"));
									for (var i = 0; i < len; i++) {
										$("#item_grp2")
												.append(
														$(
																"<option selected></option>")
																.attr(
																		"value",
																		data[i].subCatId)
																.text(
																		data[i].subCatName));
									}
									$("#item_grp2").trigger("chosen:updated");
								});
			}
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

				$.getJSON('${getAllFrListForSalesReportAjax2}', {

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


	<script type="text/javascript">
		function addCommas(x) {

			x = String(x).toString();
			var afterPoint = '';
			if (x.indexOf('.') > 0)
				afterPoint = x.substring(x.indexOf('.'), x.length);
			x = Math.floor(x);
			x = x.toString();
			var lastThree = x.substring(x.length - 3);
			var otherNumbers = x.substring(0, x.length - 3);
			if (otherNumbers != '')
				lastThree = ',' + lastThree;
			return otherNumbers.replace(/\B(?=(\d{2})+(?!\d))/g, ",")
					+ lastThree + afterPoint;
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