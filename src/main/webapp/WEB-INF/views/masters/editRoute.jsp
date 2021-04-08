<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	 

	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
	<body>
	<c:url value="/chkUnqRoutePrefix" var="chkUnqRoutePrefix"></c:url>
	<c:url value="/chkUnqRouteShortName" var="chkUnqRouteShortName"></c:url>
	
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
			<!-- <div class="page-title">
				<div>
					<h1>
						<i class="fa fa-file-o"></i> Route
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
							test="${subModule.subModuleMapping eq 'addroute'}">

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
								<i class="fa fa-bars"></i> Edit Route
							</h3>
							<div class="box-tool">
								<a href="${pageContext.request.contextPath}/addroute">Back to List</a> <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a>
							</div>
							<!-- <div class="box-tool">
								<a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a> <a data-action="close" href="#"><i
									class="fa fa-times"></i></a>
							</div> -->
						</div>


						
							<form action="editRouteProcess" method="post"
								class="form-horizontal" id="validation-form">
<input type="hidden" name="route_id" id="route_id"
											value="${route.routeId}" />
											
											
											<div class="frm_Sec_one single">									
												<div class="row">
													<div class="col-md-6 box_marg">
											<label class="control-label left">Route</label>
												<div class="controls icon_add">
													<i class="fa fa-road frm_icon" aria-hidden="true"></i>	
													<input type="text" name="route_name" id="route_name"
											placeholder="Route" class="form-control padd_left"
											data-rule-required="true" value="${route.routeName}"/>												
												</div>
										</div>
										
										
										<div class="col-md-6 box_marg">
											<label class="control-label left">Prefix</label>
												<div class="controls icon_add">
													<i class="fa fa-road frm_icon" aria-hidden="true"></i>	
													<input type="text" name="prefix" id="prefix"
											placeholder="Route" class="form-control padd_left"
											data-rule-required="true" value="${route.routePrefix}"/>
											<span for="prefix" id="unq_prefix" style="display: none; color: #b94a48;">Prefix already exits</span>
											
																						
												</div>
										</div>
										
										<div class="col-md-6 box_marg">
											<label class="control-label left">Short Name</label>
												<div class="controls icon_add">
													<i class="fa fa-road frm_icon" aria-hidden="true"></i>	
													<input type="text" name="short_name" id="short_name"
											placeholder="Route Short Name" class="form-control padd_left"
											data-rule-required="true" value="${route.shortName}"/>
											<span for="short_name" id="unq_short_name" style="display: none; color: #b94a48;">Short Name already exits</span>
																						
												</div>
										</div>
										
										<div class="col-md-6 box_marg">
											<label class="control-label left">Min Km</label>
												<div class="controls icon_add">
													<i class="fa fa-road frm_icon" aria-hidden="true"></i>	
													<input type="text" name="min_km" id="min_km"
											placeholder="Min Km" class="form-control padd_left"
											data-rule-required="true" value="${route.minKm}"/>
												</div>
										</div>
										
										<div class="col-md-4 box_marg">
											<label class="control-label left">Max Km</label>
												<div class="controls icon_add">
													<i class="fa fa-road frm_icon" aria-hidden="true"></i>	
													<input type="text" name="max_km" id="max_km"
											placeholder="Max Km" class="form-control padd_left"
											data-rule-required="true" value="${route.maxKm}"/>
												</div>
										</div>
										
										<div class="col-md-4 box_marg">
											<label class="control-label left">ABC Type</label>
												<div class="controls icon_add">
													<i class="fa fa-road frm_icon" aria-hidden="true"></i>	
													<select   class="form-control padd_left chosen" name="acbType" id="acbType"  >
											 <c:forEach items="${valList}" var="list">
											 	<c:choose>
											 		<c:when test="${list.abcId==route.abcType}">
											 			<option selected="selected"   value="${list.abcId}">${list.abcVal}</option>
											 		</c:when>
											 		<c:otherwise>											 		
											 			<option   value="${list.abcId}">${list.abcVal}</option>
											 		</c:otherwise>
											 	</c:choose>
											 	
											 </c:forEach>										 
										</select>
												</div>
										</div>
										
										
										<div class="col-md-4 box_marg">
											<label class="control-label left">Sequence No.</label>
												<div class="controls icon_add">
													<i class="fa fa-road frm_icon" aria-hidden="true"></i>	
													<input type="number" name="seqNo" id="seqNo"
											placeholder="0" class="form-control padd_left"
											data-rule-required="true" value="${route.seqNo}"/>
												</div>
										</div>
										
										
												</div>
											</div>


								
								
								<div class="form-group">
								<div class="row three_buttons">
									<button type="submit" class="btn btn-primary">Save and Next </button>
									<button type="submit" class="btn btn-primary">Save </button>
									<button type="button" class="btn btn-primary">Cancel</button>
										
									
						</div>
								</div>
								
								
								
								
								
								
								
								
								
								
								


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

										<div class="clearfix"></div>
										<div class="table-responsive" style="border: 0">
											<table width="100%" class="table table-advance" id="table1">
												<thead style="background-color: #f3b5db;">
													<tr>																						
														<th style="text-align: center;">Sr. No.</th>
														<th style="text-align: center;">Name</th>
														<th style="text-align: center;">Sequence No</th>
														<th style="text-align: center;">ABC Type</th>
														<th style="text-align: center;">Action</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${routeList}" var="routeList" varStatus="count">
													
													<c:set value="0" var="flag" />
															<c:forEach items="${routeIds}" var="routeIds">
																<c:choose>
																	<c:when test="${routeList.routeId==routeIds}">
																		<c:set value="1" var="flag" />
																	</c:when>

																</c:choose>

															</c:forEach>
															
														<tr>
															<td>${count.index+1}</td>
															<td align="left"><c:out
																	value="${routeList.routeName}"></c:out></td>
															<td align="center"><c:out
																	value="${routeList.seqNo}"></c:out></td>
																	<c:set value="-" var="type"> </c:set>
															<c:choose>
																<c:when test="${routeList.abcType==1}">
																	<c:set value="A" var="type"> </c:set>
																</c:when>
																<c:when test="${routeList.abcType==2}">
																	<c:set value="B" var="type"> </c:set>
																</c:when>
																<c:when test="${routeList.abcType==3}">
																	<c:set value="C" var="type"> </c:set>
																</c:when>
															</c:choose>
															
															<td align="center"><c:out
																	value="${type}"></c:out></td>
															<%-- <td align="left"><a
																href="${pageContext.request.contextPath}/updateRoute/${routeList.routeId}"><span
																	class="glyphicon glyphicon-edit"></span></a>&nbsp;&nbsp;&nbsp;&nbsp;

																<c:if test="${flag==0}"><a href="${pageContext.request.contextPath}/deleteRoute/${routeList.routeId}"
																onClick="return confirm('Are you sure want to delete this record');"><span
																	class="glyphicon glyphicon-remove"></span></a></c:if></td> --%>
																	<c:choose>
															<c:when test="${isEdit==1 and isDelete==1}">
																<td style="text-align: center;">															
															<a
																href="${pageContext.request.contextPath}/updateRoute/${routeList.routeId}">
																<!-- <span class="glyphicon glyphicon-edit"></span> -->
																<i class="fa fa-pencil" aria-hidden="true"></i>
																</a>
																<c:if test="${flag==0}">
																<a href="${pageContext.request.contextPath}/deleteRoute/${routeList.routeId}"
																onClick="return confirm('Are you sure want to delete this record');">
																<!-- <span class="glyphicon glyphicon-remove"></span> -->
																<i class="fa fa-times" aria-hidden="true"></i>
																
																</a></c:if></td>

															</c:when>

															<c:when test="${isEdit==1 and isDelete==0}">
																<td style="text-align: center;">															
															<a
																href="${pageContext.request.contextPath}/updateRoute/${routeList.routeId}">
																<!-- <span class="glyphicon glyphicon-edit"></span> -->
																<i class="fa fa-pencil" aria-hidden="true"></i>
																</a>
																<c:if test="${flag==0}">
																<a href="${pageContext.request.contextPath}/deleteRoute/${routeList.routeId}"
																onClick="return confirm('Are you sure want to delete this record');" class="disableClick" style=" opacity: 0.5;">
																<!-- <span class="glyphicon glyphicon-remove"></span> -->
																<i class="fa fa-times" aria-hidden="true"></i>
																
																</a></c:if></td>
															</c:when>

															<c:when test="${isEdit==0 and isDelete==1}">
															<td style="text-align: center;">															
															<a
																href="${pageContext.request.contextPath}/updateRoute/${routeList.routeId}" class="disableClick" style=" opacity: 0.5;">
																<!-- <span class="glyphicon glyphicon-edit"></span> -->
																<i class="fa fa-pencil" aria-hidden="true"></i>
																</a>
																<c:if test="${flag==0}">
																<a href="${pageContext.request.contextPath}/deleteRoute/${routeList.routeId}"
																onClick="return confirm('Are you sure want to delete this record');">
																<!-- <span class="glyphicon glyphicon-remove"></span> -->
																<i class="fa fa-times" aria-hidden="true"></i>
																
																</a></c:if></td>
															</c:when>
															
															<c:when test="${isEdit==0 and isDelete==0}">
															<td style="text-align: center;">															
															<a
																href="${pageContext.request.contextPath}/updateRoute/${routeList.routeId}"
																class="disableClick" style=" opacity: 0.5;">
																<!-- <span class="glyphicon glyphicon-edit"></span> -->
																<i class="fa fa-pencil" aria-hidden="true"></i>
																</a>
																<c:if test="${flag==0}">
																<a href="${pageContext.request.contextPath}/deleteRoute/${routeList.routeId}"
																onClick="return confirm('Are you sure want to delete this record');"
																class="disableClick" style=" opacity: 0.5;">
																<!-- <span class="glyphicon glyphicon-remove"></span> -->
																<i class="fa fa-times" aria-hidden="true"></i>
																
																</a></c:if></td>
															</c:when>

															<c:otherwise>
																<td style="text-align: center;">															
															<a
																href="${pageContext.request.contextPath}/updateRoute/${routeList.routeId}">
																<!-- <span class="glyphicon glyphicon-edit"></span> -->
																<i class="fa fa-pencil" aria-hidden="true"></i>
																</a>
																<c:if test="${flag==0}">
																<a href="${pageContext.request.contextPath}/deleteRoute/${routeList.routeId}"
																onClick="return confirm('Are you sure want to delete this record');">
																<!-- <span class="glyphicon glyphicon-remove"></span> -->
																<i class="fa fa-times" aria-hidden="true"></i>
																
																</a></c:if></td>
															</c:otherwise>
														</c:choose>		
														</tr>

													</c:forEach>
												</tbody>
											</table>
										</div>
									</div>
								</div></form>
						</div>

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
	<!-- <script type="text/javascript"
		src="resources/assets/jquery-validation/dist/jquery.validate.min.js"></script>
	<script type="text/javascript"
		src="resources/assets/jquery-validation/dist/additional-methods.min.js"></script>

 -->
	<!--flaty scripts-->
	<script src="${pageContext.request.contextPath}/resources/js/flaty.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/flaty-demo-codes.js"></script>
	<!--page specific plugin scripts-->


	<script
		src="${pageContext.request.contextPath}/resources/assets/jquery-validation/dist/additional-methods.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/jquery-validation/dist/jquery.validate.min.js"></script>


	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/chosen-bootstrap/chosen.jquery.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/clockface/js/clockface.js"></script>

	<%-- <spring:url value="/resources/assets/jquery-validation/dist/jquery.validate.min.js" var="jqueryJs" />
		    <script src="${jqueryJs}"></script>
		
			<spring:url value="/resources/assets/jquery-validation/dist/additional-methods.min.js" var="jqueryAdd" />
		    <script src="${jqueryAdd}"></script> --%>
<script>
$( "#prefix" ).change(function() {
	var routePrefix = $("#prefix").val();
	var routeId = 0;	
	$
			.getJSON(
					'${chkUnqRoutePrefix}',
					{
						routePrefix : routePrefix,								
						routeId : routeId,
						ajax : 'true'
					},
					function(data) {						
						if(data.error){
							$( "#unq_prefix" ).show();
							$( "#prefix" ).val('');
						}else{
							$( "#unq_prefix" ).hide();
						}
					});
	});
	
$( "#short_name" ).change(function() {
	var shortName = $("#short_name").val();
	var routeId = 0;	
	$
			.getJSON(
					'${chkUnqRouteShortName}',
					{
						shortName : shortName,								
						routeId : routeId,
						ajax : 'true'
					},
					function(data) {						
						if(data.error){
							$( "#unq_short_name" ).show();
							$( "#short_name" ).val('');
						}else{
							$( "#unq_short_name" ).hide();
						}
					});
	});
	
var modalFr = document.getElementById("frModal");
	function showFranchise(routeId, routeName){	
		$('#frtable_grid td').remove();
		document.getElementById( "route_title" ).innerHTML=routeName; 
		$
		.getJSON(
				'${getFranchiseByRoutIds}',
				{							
					routeId : routeId,
					ajax : 'true'
				},
				function(data) {	
					if(data==""){
						alert("No Franchise Found");
					}else{
						modalFr.style.display = "block";						
					}
					$.each(data, function(key, fr) {
						
						var index = key + 1;	
						var tr = $('<tr></tr>');
						tr.append($('<td></td>').html(index));
						
						tr.append($('<td style="text-align:left;"></td>').html(
								fr.frName));
						
						tr.append($('<td style="text-align:center;"></td>').html(
								fr.frCode));
						
						tr.append($('<td style="text-align:left;"></td>').html(
								fr.frCity));
						
						tr.append($('<td style="text-align:left;"></td>').html(
								fr.frOwner));
						
						tr.append($('<td style="text-align:center;"></td>').html(
								fr.frTarget));
						
						$('#frtable_grid tbody').append(tr);

					})
				});
	}	
	function clsFrModal() {
		modalFr.style.display = "none";
	}
		
</script>
</body>
</html>