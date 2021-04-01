<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%-- <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
 --%><!-- <script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script> -->

<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<body>

	<jsp:include page="/WEB-INF/views/include/logout.jsp"></jsp:include>
<c:url var="routListByAbcType" value="/routListByAbcType"></c:url>

	<c:url var="getBillList" value="/getPDispatchReportByRoute"></c:url>
   	<c:url var="getFranchisees" value="/getFranchiseByRouteMul"></c:url>
   	<c:url var="getSubCatByCatId" value="/getSubCatByCatId"></c:url>
   	<c:url var="getAllMenusForDisp" value="/getAllMenusForDisp"></c:url>
   	<c:url var="getDispItemSectionAjax" value="/getDispItemSectionAjax"></c:url>
	<!-- BEGIN Sidebar -->
	<div id="sidebar" class="navbar-collapse collapse" >

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
					<i class="fa fa-file-o"></i>Dispatch Item Report
				</h1>
				<h4></h4>
			</div>
		</div> -->
		<!-- END Page Title -->

		<!-- BEGIN Breadcrumb -->
		<%-- <div id="breadcrumbs">
			<ul class="breadcrumb">
				<li><i class="fa fa-home"></i> <a
					href="${pageContext.request.contextPath}/home">Home</a> <span
					class="divider"><i class="fa fa-angle-right"></i></span></li>
				<li class="active">Dispatch Report</li>
			</ul>
		</div> --%>
		<!-- END Breadcrumb -->

		<!-- BEGIN Main Content -->
		<div class="box">
			<div class="box-title">
				<h3>
					<i class="fa fa-bars"></i>Dispatch Item Report 
				</h3>

			</div>

			<div ><!-- class="box-content" -->
				
				<div class="frm_Sec_one single">
					<div class="row">
						<div class="col-md-4 box_marg">
							<label class="control-label left">Delivery Date</label>
							<div class="controls icon_add">
							<i class="fa fa-road frm_icon" aria-hidden="true"></i>
							<input class="form-control padd_left date-picker" id="billDate"
								name="billDate" size="30" type="text" value="${todaysDate}" />
							</div>
						</div>
						
						<div class="col-md-4 box_marg">
							<label class="control-label left">ABC Type</label>
							<div class="controls icon_add">
							<i class="fa fa-road frm_icon" aria-hidden="true"></i>
							<select data-placeholder="Choose Category"
								class="form-control padd_left chosen" onchange="routListByAbcType()"
								id="abcType" name="abcType">
								<option value="">Sel Abc Type</option>
								<option value="0">All</option>
								<option value="1">A</option>
								<option value="2">B</option>
								<option value="3">C</option>
							</select>
							</div>
						</div>
						
						<div class="col-md-4 box_marg">
							<label class="control-label left">Route</label>
							<div class="controls icon_add">
							<i class="fa fa-road frm_icon" aria-hidden="true"></i>
							<select data-placeholder="Select Route" 
								class="form-control padd_left chosen" name="selectRoute" id="selectRoute"
								onchange="getFranchise(this.value)" >
								<option value="0">Select Route</option>
							</select>
							</div>
						</div>
						
						<div class="col-md-4 box_marg">
							<label class="control-label left">Select Section</label>
							<div class="controls icon_add">
							<i class="fa fa-road frm_icon" aria-hidden="true"></i>
							<select data-placeholder="Choose Section"
								class="form-control padd_left chosen" tabindex="6" id="section"
								name="section" onchange="getMenus(this.value)">		
								<!-- <option value="-1">All</option> -->	
								<option value="">Select Section</option>					
								 <c:forEach items="${section}" var="section"
									varStatus="count">
									<option value="${section.sectionId}"><c:out
											value="${section.sectionName}" /></option>
								</c:forEach> 
							</select>
							</div>
						</div>
						
						<div class="col-md-4 box_marg">
							<label class="control-label left">Select Menu</label>
							<div class="controls icon_add">
							<i class="fa fa-road frm_icon" aria-hidden="true"></i>
							<select data-placeholder="Select Menu "
								class="form-control padd_left chosen" 
								id="menuId" name="menuId" multiple="multiple" required onchange="onMenuChange(this.value)">
							</select>
							</div>
						</div>
						
						<div class="col-md-4 box_marg">
							<label class="control-label left">Select Category</label>
							<div class="controls icon_add">
							<i class="fa fa-road frm_icon" aria-hidden="true"></i>
							<select data-placeholder="Choose Category"
								class="form-control padd_left chosen"  tabindex="6" multiple="multiple" 
								id="selectCat" name="selectCat" onchange="getSubCategoriesByCatId()">
								<option value="-1"><c:out value="All"/></option>
								<c:forEach items="${catList}" var="cat" varStatus="count">
									<option value="${cat.catId}"><c:out value="${cat.catName}"/></option>
								</c:forEach>
							</select>
							</div>
						</div>
						
						<div class="col-md-4 box_marg">
							<label class="control-label left">Sub-Category</label>
							<div class="controls icon_add">
							<i class="fa fa-road frm_icon" aria-hidden="true"></i>
							<select data-placeholder="Choose Sub Category"
								class="form-control padd_left chosen" multiple="multiple" tabindex="6"
								id="selectSubCat" name="selectSubCat">
								<option value="-1"><c:out value="All"/></option>
							</select>
							</div>
						</div>
						
						<div class="col-md-4 box_marg">
							<label class="control-label left">Franchisee</label>
							<div class="controls icon_add">
							<i class="fa fa-road frm_icon" aria-hidden="true"></i>
							<select data-placeholder="Choose Franchise"
							tabindex="6" class="form-control padd_left chosen" multiple="multiple"
								id="fraId" name="fraId" onchange="onFrChange()">
								<option value="">Select Franchisee</option>
								<option value="-1"><c:out value="All"/></option>
							</select>
							</div>
						</div>
					</div>
				</div>					
			</div>
			
			<div class="form-group">
				<div class="three_buttons">
					<button class="btn btn-primary" value="PDF" id="PDFButton" onclick="genDispatchPdf()" style="display: none;">PDF</button> 
					<button class="btn btn-primary" value="PDF" id="PDFButton" onclick="genDispatchItextPdf()">PDF</button>
					<input type="button" class="btn btn-primary" value="Cancel" onclick="clearData();">
				</div>					
			</div> 

				<div class="row">
							
					<div align="center" id="loader" style="display: none">

						<span>
							<h4>
								<font color="#343690">Loading</font>
							</h4>
						</span> <span class="l-1"></span> <span class="l-2"></span> <span
							class="l-3"></span> <span class="l-4"></span> <span class="l-5"></span>
						<span class="l-6"></span>
					</div></div>
			


			<div class="box">
				<div class="box-title">
					<h3>
						<i class="fa fa-list-alt"></i>Dispatch Item List
					</h3>

				</div>
				<form id="submitBillForm"
					action="${pageContext.request.contextPath}/submitEditedQty"
					method="post">
					
				
					<div class="box-content" >
					
					
					<div class="tableFixHead" id="routeName">
	<table id="table_grid">        
	<thead style="background-color: #f3b5db;">
		<tr class="bgpink">
		</tr>
	</thead>

	<tbody>
	</tbody>
	</table>
</div>

</div>

<div class="form-group" style="display: none;" id="range">
	<div class="three_buttons">
		<input type="button" id="expExcel" class="btn btn-primary" value="EXPORT TO Excel" onclick="exportToExcel();" disabled="disabled">
		<input type="button" class="btn btn-primary" value="Cancel" onclick="clearData();">
	</div>					
</div> 


					<div id="chart_div" style="width: 100%; height: 700px; background-color: white;" ></div>
					<div id="PieChart_div" style="width: 100%; height: 700px;background-color: white;"></div>

				</form>
			</div>
		</div>
		<!-- END Main Content -->

		<footer>
			<p>2018 © Monginis.</p>
		</footer>

		<a id="btn-scrollup" class="btn btn-circle btn-lg" href="#"><i
			class="fa fa-chevron-up"></i></a>



<script type="text/javascript">

			function getFranchise(routeId) {
			
				$.getJSON('${getFranchisees}', {
					
					routeId :routeId ,
					ajax : 'true'
				}, function(data) {
				 	var html = '<option value="">Select Franchisee</option>';
				/*  	var html1 = '<option value="-1">All</option>'; */
				
					var len = data.length;
					
					$('#fraId')
				    .find('option')
				    .remove()
				    .end()
				    
				 $("#fraId").append(
                                $("<option></option>").attr(
                                    "value", 0).text("Select Franchisee")
                            );
					 $("#fraId").append(
                             $("<option></option>").attr(
                                 "value", -1).text("ALL")
                         );
						
					for ( var i = 0; i < len; i++) {
                        $("#fraId").append(
                                $("<option></option>").attr(
                                    "value", data[i].frId).text(data[i].frName)
                            );
					}
					   $("#fraId").trigger("chosen:updated");
				}); 
			}
</script>
<script type="text/javascript">

			function onFrChange() {
				var frId = $("#fraId").val();
				var routeId = $("#selectRoute").val();
				if(frId=='-1'){
				$.getJSON('${getFranchisees}', {
					
					routeId : routeId,
					ajax : 'true'
				}, function(data) {
				 	var html = '<option value="">Select Franchisee</option>';
				/*  	var html1 = '<option value="-1">All</option>'; */
				
					var len = data.length;
					
					$('#fraId')
				    .find('option')
				    .remove()
				    .end()
				    
				 $("#fraId").append(
                                $("<option></option>").attr(
                                    "value", 0).text("Select Franchisee")
                            );
					 $("#fraId").append(
                             $("<option></option>").attr(
                                 "value", -1).text("ALL")
                         );
						
					for ( var i = 0; i < len; i++) {
                        $("#fraId").append(
                                $("<option selected></option>").attr(
                                    "value", data[i].frId).text(data[i].frName)
                            );
					}
					   $("#fraId").trigger("chosen:updated");
				}); 
				}
			}
</script>
		<script type="text/javascript">
			function searchReport() {
					var isValid = validate();
				if(isValid==true){
				//document.getElementById('chart').style.display = "block";
				document.getElementById("PieChart_div").style = "display:none";
				document.getElementById("chart_div").style = "display:none";

				var routeId = $("#selectRoute").val();
				
				var routeName = $("#selectRoute option:selected").text();
				document.getElementById("routeName").innerText="Route: "+$("#selectRoute option:selected").text();
				document.getElementById("routeName").style.fontWeight="900";
				var isGraph = 0;

				var selectedCat = $("#selectSubCat").val();

				var billDate = $("#billDate").val();
				$('#loader').show();

				$
						.getJSON(
								'${getBillList}',

								{
									bill_date : billDate,
									route_id : routeId,
									cat_id_list : JSON.stringify(selectedCat),
									routeName : routeName,
									ajax : 'true'

								},
								function(data) {
									 document.getElementById("submit").disabled=true;
									$('#table_grid th').remove();

									$('#table_grid td').remove();
									
									$('#loader').hide();
                                    var frListLength=data.frList.length;
									if (data == "") {
										alert("No records found !!");
										  document.getElementById("expExcel").disabled=true;
										  document.getElementById("submit").disabled=true;
									}
									
									 var tr;
								        tr = document.getElementById('table_grid').tHead.children[0];
								        tr.insertCell(0).outerHTML = "<th align='left'>Sr.No.</th>"

								        tr.insertCell(1).outerHTML = "<th style='width=170px'>ItemName</th>"
								        	var i=0;var j=0;
								        	 $.each(data.frList, function(key,fr){  
								        	       i=key+2;
								                 tr.insertCell(i).outerHTML = "<th style='width=80px'>"+fr.frName+"</th>"
								         });//franchise for end    
/* 								         tr.insertCell(i+1).outerHTML = "<th style='font-weight:bold'>Total</th>"
 */								         
								         $.each(data.subCatList,
													function(key,subCat) {
								        		var tr = $('<tr></tr>');
								        		tr
												.append($(
														'<td></td>')
														.html(" "));
												tr
														.append($(
																'<td style="font-weight:bold"></td>')
																.html(subCat.subCatName));
												for(var i=0;i<=frListLength;i++)
													{
													tr
													.append($(
															'<td></td>')
															.html(" "));
													}
												
												$(
												'#table_grid tbody')
												.append(
														tr);
								        	 
								             	var srNo = 0;
													$.each(data.itemList,
																	function(key,item) {
														if(item.itemGrp2==subCat.subCatId)
															{
														srNo = srNo + 1;
														var tr = $('<tr></tr>');
														tr
																.append($(
																		'<td></td>')
																		.html(
																				srNo));
														tr
																.append($(
																		'<td></td>')
																		.html(
																				item.itemName));
														 $.each(data.frList, function(key,franchise){  
																//alert(franchise.frId)
																var orderId='o';
																var orderQty=0;
																var isBillGenerated=0;
                                                          $.each(data.dispatchReportList,
																		function(key,report) {
                                                        	  if(franchise.frId==report.frId && item.id==report.itemId){
                                                        		  orderId=report.orderId;
                                                        		  orderQty=report.orderQty;
                                                        		  isBillGenerated=report.isBillGenerated;
															 }
                                                        	  
                                                          });
                                                          if(isBillGenerated==2){
                                                          tr
															.append($(
																	'<td style="color:blue;"></td>')
																	.html("Qty: "+orderQty+" <input type=number style='text-align:right; width:60px' min=0 class=form-control name=itemQty"+franchise.frId+""+item.id+""+orderId+" id=itemQty"+franchise.frId+""+item.id+""+orderId+" value=0 disabled/>"));
                                                          }
                                                          else
                                                        	  {
                                                        	 if(orderId=='o'){
                                                        	  tr
  															.append($(
  																	'<td style="color:red;"></td>')
  																	.html("Qty: "+orderQty+" <input type=number style='text-align:right; width:60px' min=0 class=form-control name=itemQty"+franchise.frId+""+item.id+""+orderId+" id=itemQty"+franchise.frId+""+item.id+""+orderId+" value=0 disabled/>"));
                                                        	 }
                                                        	 else{
                                                        		  tr
        															.append($(
        																	'<td style="color:green;"></td>')
        																	.html("Qty: "+orderQty+" <input type=number style='text-align:right; width:60px' min=0 class=form-control name=itemQty"+franchise.frId+""+item.id+""+orderId+" id=itemQty"+franchise.frId+""+item.id+""+orderId+" value=0 />"));
                                                              	 
                                                        	 }
                                                        	  }
														 });
														/*  tr
															.append($(
																	'<td></td>')
																	.html("<input type=text style='text-align:right; width:60px' class=form-control name=total"+key+""+item.id+" id=total"+key+""+item.id+" value=0 disabled/>"));
												 */		$(
																'#table_grid tbody')
																.append(
																		tr);
															}//end if
													});//itemList for end
								         });//subCatList for end
													//	var srNo = 0;
														 $.each(data.dispatchReportList,
																		function(key,report) {
                                                                
													         document.getElementById('itemQty'+report.frId+''+report.itemId+''+report.orderId).value = report.editQty;

															       

																		});
														
														/* $.each(data.itemList,
																	function(key,item) {
																 var total=0;
													     		 $.each(data.frList, function(key,franchise){  	
													     			 var tot=parseFloat($("#itemQty"+franchise.frId+''+item.id).val());
													     			
													     			 total=total+tot;
													     			 
														     		
 
													     		 });
													     		  document.getElementById('total'+key+''+item.id).value =total;
													     	});	 */
																		 
																		
																
								        	 

								});
				}

			}
		</script>

	
		<script type="text/javascript">
			function showChart() {
			
				$("#PieChart_div").empty();
				$("#chart_div").empty();
				//document.getElementById('chart').style.display = "block";
				document.getElementById("table_grid").style = "display:none";
				document.getElementById("PieChart_div").style = "block";
				document.getElementById("chart_div").style = "block";

				var selectedFr = $("#selectFr").val();
				var routeId = $("#selectRoute").val();
				var selectedCat = $("#selectCat").val();
				var from_date = $("#fromDate").val();
				var to_date = $("#toDate").val();

				var isGraph = 1;
				$('#loader').show();

				$
						.getJSON(
								'${getBillList}',

								{
									fr_id_list : JSON.stringify(selectedFr),
									fromDate : from_date,
									toDate : to_date,
									route_id : routeId,
									cat_id_list : JSON.stringify(selectedCat),
									is_graph : isGraph,

									ajax : 'true'

								},
								function(data) {

									$('#loader').hide();
								
									if (data == "") {
										alert("No records found !!");

									}
									var i = 0;

									google.charts.load('current', {
										'packages' : [ 'corechart', 'bar' ]
									});
									google.charts.setOnLoadCallback(drawStuff);

									function drawStuff() {

										// alert("Inside DrawStuff");

										var chartDiv = document
												.getElementById('chart_div');
										document.getElementById("chart_div").style.border = "thin dotted red";

										var PiechartDiv = document
												.getElementById('PieChart_div');
										document.getElementById("PieChart_div").style.border = "thin dotted red";

										var dataTable = new google.visualization.DataTable();
										dataTable.addColumn('string',
												'Category'); // Implicit domain column.
										dataTable.addColumn('number', 'NetQty'); // Implicit data column.
										dataTable.addColumn('number',
												'NetValue');

										var piedataTable = new google.visualization.DataTable();
										piedataTable.addColumn('string',
												'Category'); // Implicit domain column.
										piedataTable.addColumn('number',
												'NetValue');

										$
												.each(
														data.categoryList,
														function(key, cat) {
															var netQty = 0;
															var netValue = 0;
															$
																	.each(
																			data.salesReportRoyalty,
																			function(
																					key,
																					report) {

																				if (cat.catId === report.catId) {
																					netQty = netQty
																							+ report.tBillQty
																							- (report.tGrnQty + report.tGvnQty);
																					//netQty=netQty.toFixed(2);
																					netValue = netValue
																							+ report.tBillTaxableAmt
																							- (report.tGrnTaxableAmt + report.tGvnTaxableAmt);
																					//netValue=netValue.toFixed(2);
																					var catName = report.cat_name;
																					//alert("CatName"+catName);

																					//alert("netValue"+netValue);
																					//alert("netQty"+netQty);

																					dataTable
																							.addRows([
																									[
																											catName,
																											netQty,
																											netValue ], ]);

																					piedataTable
																							.addRows([
																									[
																											catName,
																											netValue ], ]);
																				}
																			})

														})
										// Instantiate and draw the chart.

										var materialOptions = {

											width : 500,
											chart : {
												title : 'Date wise Tax Graph',
												subtitle : 'Total tax & Taxable Amount per day',

											},
											series : {
												0 : {
													axis : 'distance'
												}, // Bind series 0 to an axis named 'distance'.
												1 : {
													axis : 'brightness'
												}
											// Bind series 1 to an axis named 'brightness'.
											},
											axes : {
												y : {
													distance : {
														label : 'Total Tax'
													}, // Left y-axis.
													brightness : {
														side : 'right',
														label : 'Taxable Amount'
													}
												// Right y-axis.
												}
											}
										};

										function drawMaterialChart() {
											var materialChart = new google.charts.Bar(
													chartDiv);

											materialChart
													.draw(
															dataTable,
															google.charts.Bar
																	.convertOptions(materialOptions));

										}

										var chart = new google.visualization.ColumnChart(
												document
														.getElementById('chart_div'));

										var Piechart = new google.visualization.PieChart(
												document
														.getElementById('PieChart_div'));
										chart
												.draw(
														dataTable,
														{
															width : 1000,
															height : 600,
															title : 'Sales Summary Group By Month'
														});

										Piechart
												.draw(
														piedataTable,
														{
															width : 1000,
															height : 600,
															title : 'Sales Summary Group By Month',
															is3D : true
														});
										// drawMaterialChart();
									}
									;

								});

			}
		</script>


		<script type="text/javascript">
			function validate() {

				var selectCat = $("#selectCat").val();
				var selectedRoute = $("#selectRoute").val();

				var isValid = true;

				if (selectedRoute == "0" || selectedRoute == null) {
					
						alert("Please Select Route");
						isValid = false;
					
				} else if (selectCat == "" || selectCat == null) {

					isValid = false;
					alert("Please Select Category");

				}
				return isValid;

			}
		</script>

		<script type="text/javascript">
			function updateTotal(orderId, rate) {

				var newQty = $("#billQty" + orderId).val();

				var total = parseFloat(newQty) * parseFloat(rate);

				$('#billTotal' + orderId).html(total);
			}
		</script>

		<script>
			$('.datepicker').datepicker({
				format : {
					/*
					 * Say our UI should display a week ahead,
					 * but textbox should store the actual date.
					 * This is useful if we need UI to select local dates,
					 * but store in UTC
					 */
					format : 'mm/dd/yyyy',
					startDate : '-3d'
				}
			});
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
		</script>


		<script type="text/javascript">
			function genPdf() {
				var billDate = $("#billDate").val();
				var routeId = $("#selectRoute").val();
				var selectedCat = $("#selectSubCat").val();
				
				window.open('pdfForDisReport?url=pdf/getPDispatchReportPdf/'
						+ billDate + '/'+routeId+'/'+selectedCat);

			}
			function exportToExcel()
			{
				 
				window.open("${pageContext.request.contextPath}/exportToExcel");
						document.getElementById("expExcel").disabled=true;
			}
			function genPdfBill() {
				var billDate = $("#billDate").val();
				var routeId = $("#selectRoute").val();
				var selectedCat = $("#selectCat").val();
				var frId = $("#fraId").val();
				
				window.open('pdfForDisReport?url=pdf/getDispatchPReportPdfForBill/'
						+ billDate + '/'+routeId+'/'+selectedCat+'/'+frId);

			}
			</script>	
			<script type="text/javascript">
			function genDispatchPdf()
			{
				var billDate = $("#billDate").val();
				var routeId = $("#selectRoute").val();
				var menuId = $("#menuId").val();
				var selectedCat = $("#selectSubCat").val();//new for pune on 14 feb 19
				var frId = $("#fraId").val();
				
				  window.open('pdfForDisReport?url=pdf/getDispatchPReportPdfForDispatch/'
							+ billDate + '/'+menuId+'/'+routeId+'/'+selectedCat+'/'+frId);
			}
			/* var fld = document.getElementById('fraId');
			var values = [];
			for (var i = 0; i < fld.options.length; i++) {
			  if (fld.options[i].selected) {
				
				
			  }
			} */
			
			function genDispatchItextPdf()
			{
				var billDate = $("#billDate").val();
				var routeId = $("#selectRoute").val();
				var menuId = $("#menuId").val();
				var selectedCat = $("#selectSubCat").val();//new for pune on 14 feb 19
				var frId = $("#fraId").val();
				
				//alert("routeId"+routeId)
				//alert("menuId"+menuId)
				//alert("selectedCat"+selectedCat)
				//alert("frId"+frId)
				
				var isError=false;
				if(routeId==0){
					isError=true;
					alert("Please Select Route")
				}if(menuId==null){
					isError=true;
					alert("Please Select Menu")
				}if(selectedCat==null){
					isError=true;
					alert("Please Select Subcategory")
				}if(frId==null){
					isError=true;
					alert("Please Select Franchisee")
				}else{
					//isError=false;
				}
				
				
				
				if(isError==false){
					 window.open('getDispatchPdfForDispatch/'
								+ billDate + '/'+menuId+'/'+routeId+'/'+selectedCat+'/'+frId);
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
<script type="text/javascript">
function getSubCategoriesByCatId()
{
	var catId = $("#selectCat").val();

				$.getJSON('${getSubCatByCatId}', {
					catId : JSON.stringify(catId),
					ajax : 'true'
				}, function(data) {
					var html = '<option value="">Sub Category</option>';
				
					var len = data.length;
					
					$('#selectSubCat')
				    .find('option')
				    .remove()
				    .end()
				    
				 $("#selectSubCat").append(
                                $("<option></option>").attr(
                                    "value", "").text("Select Sub Category")
                            );
					 $("#selectSubCat").append(
                             $("<option></option>").attr(
                                 "value", -1).text("ALL")
                         );
					for ( var i = 0; i < len; i++) {
                        $("#selectSubCat").append(
                                $("<option></option>").attr(
                                    "value", data[i].subCatId).text(data[i].subCatName)
                            );
					}
					   $("#selectSubCat").trigger("chosen:updated");
				});
}
</script>
		
<script type="text/javascript">
$(document).ready(function() { // if all label selected set all items selected
	
$('#selectSubCat').change(
		function () {
			 var selected=$('#selectSubCat').val();
			 var catId = $("#selectCat").val();
			 
        if(selected==-1){
			$.getJSON('${getSubCatByCatId}', {
				catId : JSON.stringify(catId),
				ajax : 'true'
			}, function(data) {
				var html = '<option value="">Select Sub Category</option>';
				
				var len = data.length;
				
				$('#selectSubCat')
			    .find('option')
			    .remove()
			    .end()
			 $("#selectSubCat").append(
                             $("<option></option>").attr(
                                 "value", -1).text("ALL")
                         );
			
				for ( var i = 0; i < len; i++) {
    
                   $("#selectSubCat").append(
                           $("<option selected></option>").attr(
                               "value", data[i].subCatId).text(data[i].subCatName)
                       );
				}
		
				   $("#selectSubCat").trigger("chosen:updated");
			});
  }
});
});



</script>
<script type="text/javascript">
function onMenuChange(menuId)
{
	if(menuId==-1)
		{
		$.getJSON('${getAllMenusForDisp}', {
			ajax : 'true'
		}, function(data) {
			var html = '<option value="">Select Menus</option>';
			
			var len = data.length;
			
			$('#menuId')
		    .find('option')
		    .remove()
		    .end()
		 $("#menuId").append(
                         $("<option></option>").attr(
                             "value", -1).text("ALL")
                     );
		
			for ( var i = 0; i < len; i++) {

               $("#menuId").append(
                       $("<option selected></option>").attr(
                           "value", data[i].menuId).text(data[i].menuTitle)
                   );
			}
	
			   $("#menuId").trigger("chosen:updated");
		});
		}
	
}
</script>
<script type="text/javascript">

function routListByAbcType() {
	
	var abcType = $("#abcType").val();
	$('#fraId')
    .find('option')
    .remove()
    .end()
      $("#fraId").trigger("chosen:updated");
	
	if(true){
		 
				$.getJSON('${routListByAbcType}', {
					
					abcType : abcType,
					ajax : 'true'
				}, function(data) {
				 	var html = '<option value="">Select Route</option>';
				
					var len = data.length;
					
					$('#selectRoute')
				    .find('option')
				    .remove()
				    .end();
					var allSelected="";
				    	for ( var i = 0; i < len; i++) {
				    		allSelected=allSelected+""+data[i].routeId+",";
				    		}
				    	if(allSelected.length>0){
				    	allSelected = allSelected.substring(0, allSelected.length - 1);
				    	}
				    	$("#selectRoute").append(
				                 $("<option></option>").attr(
				                     "value", 0).text("Select Route"));
				$("#selectRoute").append(
                 $("<option></option>").attr(
                     "value", allSelected).text("All"));
					
					for ( var i = 0; i < len; i++) {
			            $("#selectRoute").append(
			                    $("<option></option>").attr(
			                        "value", data[i].routeId).text(data[i].routeName)
			                );
					}
					   $("#selectRoute").trigger("chosen:updated");
				}); 
	}
	else{
		$('#selectRoute')
	    .find('option')
	    .remove()
	    .end()
		 $("#selectRoute").append(
                 $("<option></option>").attr(
                     "value", 0).text("Select Route")
             );
		 $("#selectRoute").trigger("chosen:updated");
	}
}

</script>

<script type="text/javascript">
function getMenus(sectionId) {
	alert(sectionId)
	$.getJSON('${getDispItemSectionAjax}', {	
		sectionId : sectionId,
		ajax : 'true'
	}, function(data) {
		var len = data.length;
		
		$('#menuId')
	    .find('option')
	    .remove()
	    .end()
		 $("#menuId").append($("<option></option>").attr( "value",-1).text("ALL"));

		for ( var i = 0; i < len; i++) {

			$("#menuId").append(
                       $("<option></option>").attr(
                           "value", data[i].menuId).text(data[i].menuTitle)
             );
		}

		   $("#menuId").trigger("chosen:updated");
	});
}
</script>
</body>
</html>