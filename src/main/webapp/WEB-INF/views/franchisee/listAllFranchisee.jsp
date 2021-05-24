<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<body>

	<jsp:include page="/WEB-INF/views/include/logout.jsp"></jsp:include>

	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/resources/css/tableSearch.css">


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

<c:url var="SearchByRouteIds" value="/SearchByRouteIds" ></c:url>
<c:url value="/getFrListDynamicPdfExcel" var="getFrListDynamicPdfExcel" ></c:url>
<c:url value="/delMultiFr" var="delMultiFr" ></c:url>
		<!-- BEGIN Content -->
		<div id="main-content">
			<!-- BEGIN Page Title -->
		 	<div class="page-title">
				<div>
					<!--<h1>
						<i class="fa fa-file-o"></i> Franchisee
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
							test="${subModule.subModuleMapping eq 'listAllFranchisee'}">

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
										<i class="fa fa-bars"></i> Franchisee List 
									</h3>
									<div class="box-tool">
										<a href="${pageContext.request.contextPath}/listAllFranchisee"></a> <a data-action="collapse" href="#"><i
											class="fa fa-chevron-up"></i></a>
									</div>
								</div>
								<div class="box-content">
									<%-- <form action="${pageContext.request.contextPath}/uploadFrByFile" class="form-horizontal"
							method="post" enctype="multipart/form-data">
							<div class="form-group">
						<div class="col-sm-9 col-sm-offset-3 col-lg-2 col-lg-offset-5">	<input type="button" id="expExcel1" class="btn btn-primary" value="Excel Import Format" onclick="exportToExcel1();">
						</div>		<label class="col-sm-1 col-lg-1 control-label">Select
									File</label>
								<div class="col-sm-3 col-lg-2 controls">
									<input type="file"  name="file" required/>
								</div>&nbsp;&nbsp;&nbsp;
								<div class="col-sm-2 col-lg-1">
									<input type="submit" class="btn btn-primary" value="Submit">
								</div>
								</div>
							
							</form> --%>
							<input type="hidden" id="rList" name="rList" value="${routeList}">
							
									<div class="col-md-9">
									<div class="col-md-9 box_marg">
											<label class="control-label left">Select Routes</label>
												<div class="controls icon_add">
													<i class="fa fa-road frm_icon" aria-hidden="true"></i>	
													<select data-placeholder="Select Routes" name="routeId"
													class="form-control padd_left chosen"  id="routeId" multiple="multiple"
													data-rule-required="true">		
													<c:forEach items="${routeList}" var="routeList">
													<c:set value="0" var="flag"/>
													<c:forEach items="${routeIds}" var="routeIds">
														<c:if test="${routeList.routeId==routeIds}">
															<c:set value="1" var="flag" />
														</c:if>
													</c:forEach>
													<c:choose>
														<c:when test="${flag==1}">
															<option selected="selected" value="${routeList.routeId}">${routeList.routeName}</option>
														</c:when>
														<c:otherwise>
															<option value="${routeList.routeId}">${routeList.routeName}</option>
														</c:otherwise>
													</c:choose>
											</c:forEach>
										</select>											
												</div>
										</div>
										<input type="button" class="btn btn-primary" style="margin-top: 25px;" value="SEARCH" onclick="searchByRoute()">
									
									</div>
									<label for="search" class="col-md-3" id="search"> <i
										class="fa fa-search"></i> <input
										type="text" id="myInput" onkeyup="myFunction()"
										placeholder="Search.." title="Type in a name">
									</label>
									<div class="clearfix"></div>
									
									
									<div class="tableFixHead">
      <table id="table2">
        <thead>
													<tr class="bgpink">
														<th style="text-align: center; width: 70px;">#<input type="checkbox" name="selAll"
										id="selAllChk" /></th>
														<th style="text-align: center;">Name</th>
														<th style="text-align: center;">Image</th>
														<th style="text-align: center;">Owner</th>
														<th style="text-align: center;">City</th>
														<th style="text-align: center;">Mobile No.</th>
														<th style="text-align: center;">Route</th>
														<th style="text-align: center;">Rating</th>
														<th style="text-align: center;">Stock</th>
														<th style="text-align: center;">Rate</th>
														<th style="text-align: center;">Satus</th>
														<th style="text-align: center;">Action</th>
													</tr>
												</thead>
        <tbody style="padding-top: 100px">


													<c:forEach items="${franchiseeList}" var="franchiseeList"
														varStatus="count">

														<tr>
															<td style="text-align: right: ;"><c:out value="${count.index+1}"></c:out><input type="checkbox" class="chkcls" name="chkcls" id="catCheck+${franchiseeList.frId}" value="${franchiseeList.frId}"></td>
															<td style="text-align: left;"><c:out
																	value="${franchiseeList.frCode}-${franchiseeList.frName}" /></td>
															<td  style="text-align: center;"><img
																src="${url}${franchiseeList.frImage}" height="80"
																width="80"
																onerror="this.src='${pageContext.request.contextPath}/resources/img/No_Image_Available.jpg';" />


															</td>
															<td style="text-align: left;"><c:out
																	value="${franchiseeList.frOwner}" /></td>
															<td style="text-align: left: ;"><c:out
																	value="${franchiseeList.frCity}" /></td>
															<td style="text-align: right: ;"><c:out
																	value="${franchiseeList.frMob}" /></td>
															<td style="text-align: left: ;"><c:forEach items="${routeList}"
																	var="routeList">

																	<c:choose>
																		<c:when
																			test="${routeList.routeId==franchiseeList.frRouteId}">
																			<c:out value="${routeList.routeName}" />
																		</c:when>

																		<c:otherwise></c:otherwise>
																	</c:choose>
																</c:forEach></td>
															

														
															<td style="text-align: right;"><c:choose>
																	<c:when test="${franchiseeList.frRate==0}">0.5</c:when>
																	<c:when test="${franchiseeList.frRate==1}">1</c:when>
																	<c:when test="${franchiseeList.frRate==2}">1.5</c:when>
																	<c:when test="${franchiseeList.frRate==3}">2</c:when>
																	<c:when test="${franchiseeList.frRate==4}">2.5</c:when>
																	<c:when test="${franchiseeList.frRate==5}">3</c:when>
																	<c:when test="${franchiseeList.frRate==6}">3.5</c:when>
																	<c:when test="${franchiseeList.frRate==7}">4</c:when>
																	<c:when test="${franchiseeList.frRate==8}">4.5</c:when>
																	<c:when test="${franchiseeList.frRate==9}">5</c:when>
																</c:choose></td>
																
																
																<td style="text-align: right;">
																<c:out value="${franchiseeList.frRmn1}"></c:out>
																</td>
																<td style="text-align: right;">
																<c:choose>
																	<c:when test="${franchiseeList.frRateCat==1}">
																	REGULAR MRP
																	</c:when>
																	<c:when test="${franchiseeList.frRateCat==2}">
																	OUTSTATION MRP
																	</c:when>
																	<c:when test="${franchiseeList.frRateCat==3}">
																	SPECIAL MRP
																	</c:when> 	 	
																</c:choose>
																
																</td>
																
																
																<td style="text-align: right;">
																<c:choose>
																	<c:when test="${franchiseeList.delStatus==0}">
																	ACTIVE
																	</c:when>
																	<c:when test="${franchiseeList.delStatus==1}">
																	INACTIVE
																	</c:when> 	
																</c:choose>
																
																</td>
															



															<c:choose>
																<c:when test="${isEdit==1 and isDelete==1}">

																	<td  style="text-align: center;"><a
																		href="updateFranchisee/${franchiseeList.frId}">
																		<!-- <span class="glyphicon glyphicon-edit"></span> -->
																		<i class="fa fa-pencil" aria-hidden="true"></i>
																		</a>&nbsp; <a style="display: none;"
																		href="deleteFranchisee/${franchiseeList.frId}"
																		onClick="return confirm('Are you sure want to delete this record');">
																		<!-- <span class="glyphicon glyphicon-remove"></span> -->
																			<i class="fa fa-times" aria-hidden="true"></i>
																			</a></td>
																</c:when>

																<c:when test="${isEdit==1 and isDelete==0}">

																	<td  style="text-align: center;"><a
																		href="updateFranchisee/${franchiseeList.frId}">
																		<!-- <span class="glyphicon glyphicon-edit"></span> -->
																		<i class="fa fa-pencil" aria-hidden="true"></i>
																		</a>&nbsp; <a
																		href="deleteFranchisee/${franchiseeList.frId}"
																		class="disableClick" style="opacity: 0.5;"
																		onClick="return confirm('Are you sure want to delete this record');">
																		<!-- <span class="glyphicon glyphicon-remove"></span> -->
																		<i class="fa fa-times" aria-hidden="true"></i>
																		</a></td>
																</c:when> 

																<c:when test="${isEdit==0 and isDelete==1}">

																	<td  style="text-align: center;"><a
																		href="updateFranchisee/${franchiseeList.frId}"
																		class="disableClick" style="opacity: 0.5;">
																		<!-- <span class="glyphicon glyphicon-edit"></span> -->
																		<i class="fa fa-pencil" aria-hidden="true"></i>
																		</a>&nbsp; <a
																		href="deleteFranchisee/${franchiseeList.frId}"
																		onClick="return confirm('Are you sure want to delete this record');">
																		<!-- <span class="glyphicon glyphicon-remove"></span> -->
																		<i class="fa fa-times" aria-hidden="true"></i>
																		</a></td>
																</c:when>
																
																<c:when test="${isEdit==0 and isDelete==0}">

																	<td  style="text-align: center;"><a
																		href="updateFranchisee/${franchiseeList.frId}"
																		class="disableClick" style="opacity: 0.5;">
																		<!-- <span class="glyphicon glyphicon-edit"></span> -->
																		<i class="fa fa-pencil" aria-hidden="true"></i>
																		</a>&nbsp; <a
																		href="deleteFranchisee/${franchiseeList.frId}" class="disableClick" style="opacity: 0.5;"
																		onClick="return confirm('Are you sure want to delete this record');">
																		<!-- <span class="glyphicon glyphicon-remove"></span> -->
																		<i class="fa fa-times" aria-hidden="true"></i>
																		</a></td>
																</c:when> 

																<c:otherwise>


																	<td  style="text-align: center;"><a
																		href="updateFranchisee/${franchiseeList.frId}"
																		class="disableClick" style="opacity: 0.5;">
																		<!-- <span class="glyphicon glyphicon-edit"></span> -->
																		<i class="fa fa-pencil" aria-hidden="true"></i>
																		</a>&nbsp; <a
																		href="deleteFranchisee/${franchiseeList.frId}"
																		class="disableClick"
																		onClick="return confirm('Are you sure want to delete this record');">
																		<i class="fa fa-times" aria-hidden="true"></i>
																		</a></td>

																</c:otherwise>
															</c:choose>

															
														</tr>

													</c:forEach>

												</tbody>
      </table>
      
      
      <div id="myModal" class="modal">

		<!-- Modal content -->
		<div class="modal-content" style="width: 40%" id="modal_theme_primary">
			<span class="close">&times;</span>
			<div class="box">
				<div class="box-title">
					<h3>
						<i class="fa fa-table"></i> Select Columns
					</h3>
				</div>

				<div class="box-content">
					<div class="clearfix"></div>
					<div class="table-responsive" style="border: 0">
						<table width="100%" class="table table-advance" id="modelTable">
							<thead style="background-color: #f3b5db;">
								<tr>
									<th width="15"><input type="checkbox" name="selAll"
										id="selAllChk" /></th>
									<th>Headers</th>
								</tr>
							</thead>
							<tbody>
							</tbody>
						</table>
						<span class="validation-invalid-label" id="error_modelchks"
							style="display: none;">Select Check Box.</span>
					</div>
				</div>
				<div class="form-group"
					style="padding: 0 0 10px 0;">
					<input type="button" class="btn btn-primary" id="expExcel" onclick="getIdsReport(1)" value="Excel" /> 
					<input type="button" class="btn btn-primary" onclick="getIdsReport(2)" value="Pdf" />
				</div>
			</div>

		</div>

	</div>
      
    </div>
									
									
									
									
							<div class="form-group" id="range">
											<div class="col-sm-12" style="text-align: right; margin-top:10px;">
									<button type="button" class="btn btn-primary" style="float: left;margin-left: 25px" onclick="multiActiveInactive()" >In-Active</button>
								<input type="button" id="expExcel" class="btn btn-primary" value="Export To Excel" onclick="exportToExcel();">
								<input type="button" id="btn_exl_pdf" class="btn btn-primary" onclick="getHeaders()"  value="Excel / Pdf" />
								<button type="button" class="btn btn-primary" onclick="window.location.reload()">Cancel</button> 
											</div>
										</div>
												

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
	$('#selAllChk').click(function(event) {   
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
				function getHeaders(){
					
					openModel();
					$('#modelTable td').remove();
				var thArray = [];
	
				$('#table2 > thead > tr > th').each(function(){
				    thArray.push($(this).text())
				})
				
					
				var seq = 0;
					for (var i = 0; i < thArray.length; i++) {
						seq=i+1;					
						var tr1 = $('<tr></tr>');
						tr1.append($('<td style="padding: 7px; line-height:0; border-top:0px;"></td>').html('<input type="checkbox" class="chkcls" name="chkcls'
								+ seq
								+ '" id="catCheck'
								+ seq
								+ '" value="'
								+ seq
								+ '">') );
						tr1.append($('<td style="padding: 7px; line-height:0; border-top:0px;"></td>').html(innerHTML=thArray[i]));
						$('#modelTable tbody').append(tr1);
					}
				}
				
				$(document).ready(

						function() {

							$("#selAllChk").click(
									function() {
										$('#modelTable tbody input[type="checkbox"]')
												.prop('checked', this.checked);

									});
						});
				
				  function getIdsReport(val) {
					  var isError = false;
						var checked = $("#modal_theme_primary input:checked").length > 0;
					
						if (!checked) {
							$("#error_modelchks").show()
							isError = true;
						} else {
							$("#error_modelchks").hide()
							isError = false;
						}

						if(!isError){
					  var elemntIds = [];										
								
								$(".chkcls:checkbox:checked").each(function() {
									elemntIds.push($(this).val());
								}); 
												
						$
						.getJSON(
								'${getFrListDynamicPdfExcel}',
								{
									elemntIds : JSON.stringify(elemntIds),
									val : val,
									ajax : 'true'
								},
								function(data) {
									if(data!=null){
										//$("document.getElementById("myModal");#modal_theme_primary").modal('hide');
										if(val==1){
											window.open("${pageContext.request.contextPath}/exportToExcelNew");
											//document.getElementById("expExcel").disabled = true;
										}else{		
											//alert("Gen PDF alert");
											 window.open('${pageContext.request.contextPath}/pdfForReport?url=pdf/getFranchiseeListPdf/'+elemntIds.join());
											 $('#selAllChk').prop('checked', false);
										}
									}
								});
						}
					}		
				</script>
	<script>
	function multiActiveInactive(){
		 var frIds = [];										
			
			$(".chkcls:checkbox:checked").each(function() {
				frIds.push($(this).val());
			}); 
			//alert(frIds.length);
			
			$.getJSON('${delMultiFr}',

					{
				frIds:JSON.stringify(frIds),
						ajax : 'true'

					},
					function(data) {
					//alert(JSON.stringify(data))
					alert(data.message)
					window.location.reload();
						
					});
			
			
			
	}
	</script>
	
	<script>
	function searchByRoute() {
		 var  RouteList=$('#rList').val();
		
		//alert(RouteList)
		var routeId=$('#routeId').val();
			
		//alert(routeId);
		$.getJSON('${SearchByRouteIds}',

				{
					routeId:JSON.stringify(routeId),
					ajax : 'true'

				},
				function(data) {
					//alert(data)
					
					$('#table2 td').remove();
					$.each(data, function(key, item) {
						 
						 
						var tr = $('<tr></tr>');

						tr
						 .append($(
										'<td style="text-align:left;"></td>')
										.html(
												key + 1+"<input type='checkbox' class='chkcls' name='chkcls' id="+item.frId+" value="+item.frId+"  >"));

						tr
						 .append($(
										'<td style="text-align:left;"></td>')
										.html(
												item.frName));													
						tr
						.append($(
								'<td style="text-align:right;"></td>')
								.html(item.frImage));
						
						tr
						.append($(
								'<td style="text-align:right;"></td>')
								.html(item.frOwner));
						
						tr
						.append($(
								'<td style="text-align:right;"></td>')
								.html(
										item.frCity));
						
						tr
						.append($(
								'<td style="text-align:right;"></td>')
								.html(
										item.frMob));
						
						tr
						.append($(
								'<td style="text-align:right;"></td>')
								.html(
										'Route Name'));
						
					/* 	for(var i=0;i<RouteList.length;i++){
							alert("In For"+RouteList[i].routeName)
							if(item.frRouteId==RouteList[i].routeId){
								alert("Match")
								tr
								.append($(
										'<td style="text-align:right;"></td>')
										.html(
												RouteList[i].routeName));
							}
						}  */
						
						
						var rating=0;
						if(item.frRate==0){
							rating=0.5;
						}
						if(item.frRate==1){
							rating=1;
						}
						if(item.frRate==2){
							rating=1.5
						}
						if(item.frRate==3){
							rating=2
						}
						if(item.frRate==4){
							rating=2.5
						}if(item.frRate==5){
							rating=3
						}
						if(item.frRate==6){
							rating=3.5
						}
						if(item.frRate==7){
							rating=4
						}
						if(item.frRate==8){
							rating=4.5
						}
						if(item.frRate==9){
							rating=5
						}
						tr
						.append($(
								'<td style="text-align:right;"></td>')
								.html(
										rating));
						tr
						.append($(
								'<td style="text-align:right;"></td>')
								.html(
										item.frRmn1));
						
						if(item.frRateCat==1){
							tr
							.append($(
									'<td style="text-align:right;"></td>')
									.html(
											"Regular MRP"));
						}
						if(item.frRateCat==2){
							tr
							.append($(
									'<td style="text-align:right;"></td>')
									.html(
											"Outstation MRP"));
						}if(item.frRateCat==3){
							tr
							.append($(
									'<td style="text-align:right;"></td>')
									.html(
											"Special MRP"));
							
						}
						if(item.delStatus==0){
							tr
							.append($(
									'<td style="text-align:right;"></td>')
									.html(
											"Active"));
							
						}else{
							tr
							.append($(
									'<td style="text-align:right;"></td>')
									.html(
											"In-Active"));
						}	
						
						
						
						//alert(${isEdit} +'\t'+ ${isDelete})
						if(${isEdit}==1 && ${isDelete}==1){
					
							tr
							.append($(
									'<td style="text-align:right;"></td>')
									.html(
											"<a href='#' class='action_btn' onclick=editItemDetail("+item.frId+")> <abbr title='edit'> <i class='fa fa-pencil' ></i></abbr> </a> <a href='#' class='action_btn'onclick=deleteItemDetail("+item.frId+ ")><abbr title='Delete'><i class='fa fa-times'></i></abbr></a>"));
						}
						if(${isEdit}==1 && ${isDelete}==0){
							
							tr
							.append($(
									'<td style="text-align:right;"></td>')
									.html(
											"<a href='#' class='action_btn' onclick=editItemDetail("+item.frId+")> <abbr title='edit'> <i class='fa fa-pencil' ></i></abbr> </a> "));
						}
						if(${isEdit}==0 && ${isDelete}==1){
							
							tr
							.append($(
									'<td style="text-align:right;"></td>')
									.html(
											" <a href='#' class='action_btn'onclick=deleteItemDetail("+item.frId+ ")><abbr title='Delete'><i class='fa fa-times'></i></abbr></a>"));
						}
						if(${isEdit}==0 && ${isDelete}==0){
							
							tr
							.append($(
									'<td style="text-align:right;"></td>')
									.html(
											""));
						}
						
						
						
						
					
						
						 
						
						$('#table2 tbody')
								.append(tr);
					});
					
					
				});
		
		
	}
	
	</script>
	
	<script>
	function editItemDetail(val) {
		
		window.location.href='${pageContext.request.contextPath}/updateFranchisee/'+val;
	}
	</script>
	<script>
	function deleteItemDetail(val) {
		window.location.href='${pageContext.request.contextPath}/deleteFranchisee/'+val;
	}
	</script>

<script>
function myFunction() {
	//alert("Hii")
  var input, filter, table, tr, td, i;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("table2");
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
//Get the modal
var modal = document.getElementById("myModal");
function openModel(){
	modal.style.display = "block";
}

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
  modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
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
	window.open("${pageContext.request.contextPath}/exportToExcelDummy");
			document.getElementById("expExcel1").disabled=true;
}
</script>

</html>