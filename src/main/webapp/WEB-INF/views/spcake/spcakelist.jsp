<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
table {
	width: 100%;
	table-layout: fixed;
	border: 1px solid #ddd;
}
/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	/* padding-top: 100px; */ /* Location of the box */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
	background-color: #fefefe;
	margin: auto;
	padding: 10px;
	border: 1px solid #888;
	width: 16%;
}

/* The Close Button */
.close {
	color: #aaaaaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}

.col-modal-content {
	margin-left: 25%;
	width: 50%;
	height: 20%;
}
</style>

<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
	<body>
	<c:url value="/showSpCakeImage" var="showSpCakeImage"></c:url>
	<c:url value="/getSpCakePrintIds" var="getSpCakePrintIds"/>
	<c:url value="/getFilteredSp" var="getFilteredSp" ></c:url>
	
	<jsp:include page="/WEB-INF/views/include/logout.jsp"></jsp:include> 
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/tableSearch.css">


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
						<i class="fa fa-file-o"></i>Special Cake
					</h1>-->
				</div>
			</div> 
			<!-- END Page Title -->
			
			
			
			<!-- Access right not working because this page is access from 2 masters  -->
			<c:set var="isEdit" value="0">
					</c:set>
					<c:set var="isView" value="0">
					</c:set>
					<c:set var="isDelete" value="0">
					</c:set>

					<c:forEach items="${sessionScope.newModuleList}" var="modules">
						<c:forEach items="${modules.subModuleJsonList}" var="subModule">

							<c:choose>
								<c:when test="${subModule.subModuleMapping eq 'showSpecialCake'}">

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
										<c:when test="${subModule.view=='visible'}">
											<c:set var="isView" value="1">
											</c:set>
										</c:when>
										<c:otherwise>
											<c:set var="isView" value="0">
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
							<div ><!-- class="box" -->
                           	<div class="row" >
									<div class="col-md-12">

										<div class="box" >
											<div class="box-title">
												<h3>
													<i class="fa fa-table"></i> Special Cake List
												</h3>
												<div class="box-tool">
													<a data-action="collapse" href="#"><i
														class="fa fa-chevron-up"></i></a>
													<!--<a data-action="close" href="#"><i class="fa fa-times"></i></a>-->
												</div>
											</div>
											
											
						<div class="box-content">
						<%-- <form action="${pageContext.request.contextPath}/uploadSpByFile" class="form-horizontal"
							method="post" enctype="multipart/form-data">
							<div class="form-group">
						<div class="col-sm-9 col-sm-offset-3 col-lg-2 col-lg-offset-5">	<input type="button" id="expExcel1" class="btn btn-primary" value="Excel Import Format" onclick="exportToExcel1();">
						</div>		<label class="col-sm-1 col-lg-1 control-label">Select
									File</label>
								<div class="col-sm-3 col-lg-2 controls">
									<input type="file"  name="file" required/>
								</div>&nbsp;&nbsp;&nbsp;
								<div class="col-sm-2 col-lg-1">
									<input type="submit" class="btn btn-primary" value="Save">
								</div>
								</div>
							
							</form> --%>
<div class="col-md-9" >
<div class="col-md-3 box_marg">
													<label class="control-label left">Cake Type</label>
													<div class="controls icon_add">
														<i class="fa fa-coffee frm_icon" aria-hidden="true"></i> <select
															name="cake_type" id="cake_type"
															class="form-control padd_left chosen"
															data-rule-required="true">
															<c:forEach items="${cakeTypeList}" var="cakeTypeList">
																<option value="${cakeTypeList.cakeTypeId}">${cakeTypeList.typeName}</option>
															</c:forEach>
														</select>

													</div>
												</div>

												<div class="col-md-3 box_marg">
													<label class="control-label left">Flavour Type</label>
													<div class="controls icon_add">
														<i class="fa fa-th-large frm_icon" aria-hidden="true"></i>
														<select class="form-control padd_left chosen"
															name="flav_type" id="flav_type" data-rule-required="true">
															

															<option value="1">Chocolate</option>
															<option value="2">Frsh Cream</option>
															<option value="3">ChocoFresh</option>
															<option value="4">All</option>

														</select>

													</div>
												</div>
												<div class="col-md-2 box_marg">
													<label class="control-label left">Cust Choice?</label>
													<div class="controls icon_add">
														<i class="fa fa-th-large frm_icon" aria-hidden="true"></i>
														<select class="form-control padd_left chosen"
															name="cust_ch" id="cust_ch" data-rule-required="true">
															

															<option value="1">Yes</option>
															<option value="0">No </option>
														

														</select>

													</div>
												</div>
												<div class="col-md-2 box_marg">
													<label class="control-label left">Photo Allow?</label>
													<div class="controls icon_add">
														<i class="fa fa-th-large frm_icon" aria-hidden="true"></i>
														<select class="form-control padd_left chosen"
															name=pic_up id="pic_up" data-rule-required="true">
															<option value="1">Yes</option>
															<option value="0">No </option>
														</select>

													</div>
												</div>
												
												<button type="button" style="margin-top: 25px;" class="btn btn-primary" onclick="searchSp()" >Search</button>

</div>
												<label for="search" class="col-md-3" id="search"> <i
													class="fa fa-search"></i> <input type="text" id="myInput"
													onkeyup="myFunction()" style="margin-bottom: 10px;"
													placeholder="Search by code.." title="Type in a name">
												</label>

												<div class="clearfix"></div>
						
							<div class="tableFixHead">
      <table id="table2">
        <thead>
          <thead style="background-color: #f3b5db;">
				<tr class="bgpink">
					<th style="text-align: center; width:80px;">Sr. No.<input type="checkbox" id="selAllChkbx" name="selAllChkbx" ></th>
					<!-- <th >No</th> -->
					<th style="text-align: left;">Code</th>
					<th style="text-align: left;">Name</th>
					<th style="text-align: right;">Min Weight</th>
					<th style="text-align: right;">Max Weight</th>
					<th style="text-align: right;">MRP</th>
					<th style="text-align: right; width: 110px;">Action</th>
				</tr>
			</thead>
        <tbody>
																<c:forEach items="${specialCakeList}" var="specialCake"
																	varStatus="count">


																	<tr>
																		<td style="text-align: center;"><c:out value="${count.index+1}" /> &nbsp; <input type="checkbox" class="chk"
																			name="select_to_print" id="${specialCake.spId}"
																			value="${specialCake.spId}" /></td>

																		<%-- <td><c:out value="${count.index+1}" /></td> --%>
																		<%-- <td style="text-align: center;">
																			 <img src="${url}${specialCake.spImage}" width="70" height="70" 	
																			 onerror="this.src='resources/img/No_Image_Available.jpg';"/> 
																	</td> --%>
																		<td style="text-align: left;"><c:out value="${specialCake.spCode}"></c:out></td>
																		<td style="text-align: left;"><c:out value="${specialCake.spName}"></c:out></td>
																		<td style="text-align: right;"><c:out value="${specialCake.spMinwt}"></c:out></td>
																		<td style="text-align: right;"><c:out value="${specialCake.spMaxwt}"></c:out></td>																		
																		<td style="text-align: right;"><c:out value="${specialCake.mrpRate1}"></c:out></td>
																		<c:choose>
																			<c:when test="${isEdit==1 and isDelete==1}">
																				<td style="text-align: right;"><a
																					href="updateSpCake/${specialCake.spId}"
																					data-toggle="tooltip" title="Edit Special Cake">
																						<i class="fa fa-pencil" aria-hidden="true"></i>
																				</a> <a href="viewSpCakeDetailed/${specialCake.spId}"
																					class="action_btn" data-toggle="tooltip"
																					title="Sp Ingredients Details"> <i class="fa fa-bars" aria-hidden="true"></i> </a> <a
																					href="deleteSpecialCake/${specialCake.spId}"
																					onClick="return confirm('Are you sure want to delete this record');"
																					data-toggle="tooltip" title="Delete"><span
																						class="glyphicon glyphicon-remove"></span></a>
																				<a href="javascript:void(0);" data-toggle="tooltip" title="Image" onclick="openImg(${specialCake.spId})">
																		<span class="glyphicon glyphicon-picture"></span>
																	</a></td>

																			</c:when>

																			<c:when test="${isEdit==1 and isDelete==0}">
																				<td style="text-align: right;"><a
																					href="updateSpCake/${specialCake.spId}"
																					data-toggle="tooltip" title="Edit Special Cake"><i class="fa fa-pencil" aria-hidden="true"></i></a> <a
																					href="viewSpCakeDetailed/${specialCake.spId}"
																					class="action_btn" data-toggle="tooltip"
																					title="Sp Ingredients Details"> <i class="fa fa-bars" aria-hidden="true"></i> </a> <a
																					href="deleteSpecialCake/${specialCake.spId}"
																					class="disableClick" 
																					onClick="return confirm('Are you sure want to delete this record');"><span
																						class="glyphicon glyphicon-remove"></span></a></td>
																			</c:when>

																			<c:when test="${isEdit==0 and isDelete==1}">
																				<td style="text-align: right;"><a
																					href="updateSpCake/${specialCake.spId}"
																					class="disableClick" ><i class="fa fa-pencil" aria-hidden="true"></i></a> <a
																					href="viewSpCakeDetailed/${specialCake.spId}"
																					class="action_btn"> <i class="fa fa-bars" aria-hidden="true"></i> </a>
																					<a href="deleteSpecialCake/${specialCake.spId}"
																					onClick="return confirm('Are you sure want to delete this record');"><span
																						class="glyphicon glyphicon-remove"
																						data-toggle="tooltip" title="Delete"></span></a>
																				<a href="javascript:void(0);" data-toggle="tooltip" title="Image" onclick="openImg(${specialCake.spId})">
																				<span class="glyphicon glyphicon-picture"></span>
																			</a></td>
																			</c:when>

																			<c:otherwise>

																				<td style="text-align: right;"><a
																					href="updateSpCake/${specialCake.spId}"
																					class="disableClick" ><i class="fa fa-pencil" aria-hidden="true"></i></a>
																					
																					<a
																					href="viewSpCakeDetailed/${specialCake.spId}"
																					class="action_btn" data-toggle="tooltip"
																					title="Sp Ingredients Details"> <i class="fa fa-bars" aria-hidden="true"></i></a>
																					
																					<a
																					href="deleteSpecialCake/${specialCake.spId}"
																				class="disableClick" 
																					onClick="return confirm('Are you sure want to delete this record');"><span
																						class="glyphicon glyphicon-remove"></span></a>
																				
																				<a href="javascript:void(0);" data-toggle="tooltip" title="Image" onclick="openImg(${specialCake.spId})">
																		<span class="glyphicon glyphicon-picture"></span>
																	</a></td>


																			</c:otherwise>
																		</c:choose>



																	</tr>
																</c:forEach>


															</tbody>
      </table>
    </div>
    
    
							
							
					<div class="form-group">
						<div class="row three_buttons" style="padding: 15px 0 0 0 ;"> 
						<input type="button" id="expExcel" class="btn btn-primary" value="Export To Excel" onclick="exportToExcel();">
						<input type="button" style="float: left; margin-left: 30px;" id="btn_delete" class="btn btn-primary" onclick="deleteBySpId()" value="Delete" />
						<input type="button" id="btn_exl_pdf" class="btn btn-primary" onclick="getHeaders()" value="Excel / Pdf" />
						</div>
					</div>
											
										</div>
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
<table width="100%" class="table table-advance" id="printtable2" style="display: none;">
		<thead style="background-color: #f3b5db;" >
			<tr>
				<th>Name</th>
				<th>UOM</th>
				<th>GST%</th>
				<th>HSN Code</th>
				<th>Cake Type</th>
				<th>Cake Shape</th>
				<th>Flavour</th>
				<th>Event</th>
				<th>Book Before</th>
				<th>MAX Range</th>
				<th>MIN Range</th>
				<th>Increamented By</th>
				<th>MRP1</th>
				<th>MRP2</th>
				<th>MRP3</th>
				<th>Customer Choice</th>
				<th>Addon Appli</th>
				<th>Status</th>				
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>

	<div id="modal_exl_pdf" class="modal">

  <!-- Modal content -->
  <div class="col-modal-content" id="modal_theme_primary">
    
    <div class="box">
									<div class="box-title">
										<h3>
											<i class="fa fa-table"></i> Select Columns
										</h3>	
										<input type="button" class="btn btn-primary" style=" float: right;
						id="btn_close" onclick="clsFrModal()" value="Close" />	
						<div class="clr"></div>						
									</div>

				<div class="box-content">
					<div class="clearfix"></div>
					<div class="table-responsive" style="border: 0">
						<table width="100%" class="table table-advance" id="modelTable">
							<thead style="background-color: #f3b5db;">
								<tr>
									<th width="3"><input type="checkbox" name="selAll"
										id="selAllChk" />
									</th>
									<th width="3">Headers</th>
								</tr>
							</thead>
							<tbody>
							</tbody>
						</table>
						<span class="validation-invalid-label" id="error_modelchks"
										style="display: none;">Select Check Box.</span>
					</div>
				</div>
				<div class="form-group" style="background-color: white; padding:0 0 10px 0;">
									&nbsp;	&nbsp;	&nbsp;	&nbsp;
										<input type="button" margin-right: 5px;"
											class="btn btn-primary" id="expExcel" onclick="getIdsReport(1)" 
											value="Excel" />
									&nbsp;	&nbsp;	&nbsp;	&nbsp;
										<input type="button" margin-right: 5px;"
											class="btn btn-primary" onclick="getIdsReport(2)" 
											value="Pdf" />
									</div>
									</div>
								
  </div>

</div>
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
<script>
function myFunction() {
  var input, filter, table, tr, td,td1, i;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("table1");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[3];
    td1 = tr[i].getElementsByTagName("td")[4];

    if (td) {
      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      }else if (td1.innerHTML.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      }  else {
        tr[i].style.display = "none";
      }
    }       
  }
}
</script>
<script>
function searchSp() {
	var cakeType=$('#cake_type').val();
	var flavType=$('#flav_type').val();
	var custCh=$('#cust_ch').val();
	var picUp=$('#pic_up').val();
	//alert(cakeType+"\t"+flavType+"\t"+custCh+"\t"+picUp)
	
		$
						.getJSON(
								'${getFilteredSp}',
								{
									cakeType : cakeType,
									flavType:flavType,
									custCh:custCh,
									picUp:picUp,
									
									ajax : 'true'
								},
								function(data) {
									//alert(JSON.stringify(data))
									$('#table2 td').remove();
									$.each(data,function(key, item) {
				var tr = $('<tr ></tr>');
				//alert(JSON.stringify(item))
						tr.append($('<td ></td>').html(
								key+1));
						tr.append($('<td ></td>').html(
								item.spCode));
						tr.append($('<td ></td>').html(
								item.spName));
						
						tr.append($('<td ></td>').html(
								item.spMinwt));
						
						tr.append($('<td ></td>').html(
								item.spMaxwt));
						
			
						
						tr.append($('<td ></td>').html(
								item.mrpRate1));
						
					/* if(item.settingType==1){
							tr.append($('<td ></td>').html(
								"Daily"));
								
						}else if(item.settingType==2){
							tr.append($('<td ></td>').html(
							"Date"));
							
						}else if(item.settingType==3){
							tr.append($('<td ></td>').html(
							"Day"));
						}  */
						
						   
						tr.append($('<td><a  href="${pageContext.request.contextPath}/updateSpCake/'+item.spId+'" ><span class="fa fa-pencil"></span><a><a  href="${pageContext.request.contextPath}/viewSpCakeDetailed/'+item.spId+'"   ><span class="fa fa-bars"></span><a><a  href="${pageContext.request.contextPath}/deleteSpecialCake/'+item.spId+'" onClick="return confirm_delete()"  ><span class="glyphicon glyphicon-remove"></span><a></td> '));
						
						
						$('#table2 tbody').append(
								tr);
						
					})
									
								});
	
	
	
	    	
}

</script>

<script>
$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip();   
});
</script>
<script type="text/javascript">
function deleteBySpId()
{

var checkedVals = $('.chk:checkbox:checked').map(function() {
    return this.value;
}).get();
checkedVals=checkedVals.join(",");

if(checkedVals=="")
	{
	alert("Please Select Special Cake")
	}
else
	{
	window.location.href='${pageContext.request.contextPath}/deleteSpecialCake/'+checkedVals;

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

<script>
				function getHeaders(){
					
					openModel();
					$('#modelTable td').remove();
				var thArray = [];
	
				$('#printtable2 > thead > tr > th').each(function(){
				    thArray.push($(this).text())
				})
				
					
				var seq = 0;
					for (var i = 0; i < thArray.length; i++) {
						seq=i+1;					
						var tr1 = $('<tr></tr>');
						tr1.append($('<td ></td>').html('<input type="checkbox" class="chkcls" name="chkcls'
								+ seq
								+ '" id="catCheck'
								+ seq
								+ '" value="'
								+ seq
								+ '">') );
						tr1.append($('<td></td>').html(innerHTML=thArray[i]));
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
								'${getSpCakePrintIds}',
								{
									elemntIds : JSON.stringify(elemntIds),
									val : val,
									ajax : 'true'
								},
								function(data) {
									if(data!=null){
										//$("#modal_theme_primary").modal('hide');
										if(val==1){
											window.open("${pageContext.request.contextPath}/exportToExcelNew");
											//document.getElementById("expExcel").disabled = true;
										}else{			
											 window.open('${pageContext.request.contextPath}/pdfForReport?url=pdf/getSpCakeListPdf/'+elemntIds.join());
											 $('#selAllChk').prop('checked', false);
										}
									}
								});
						}
					}		
				</script>
<script>
//Get the modal
var frModal = document.getElementById("modal_exl_pdf");
function openModel(){
	frModal.style.display = "block";
}
function clsFrModal() {
	frModal.style.display = "none";
}
</script>

<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <span class="close">&times;</span>
     <img src="" width="170" height="170" id="spImg"
		onerror="this.src='resources/img/No_Image_Available.jpg';"/>
  </div>

</div>
<script>
//Get the modal
var modal = document.getElementById("myModal");
function openImg(spId){
	var image = new Image();
	$.getJSON('${showSpCakeImage}', {
					spId : spId,
					ajax : 'true',
				},  function(data) {
					document.getElementById("spImg").src = data.message;
					modal.style.display = "block";
				});
  
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
$('#selAllChkbx').click(function(event) {   
	//alert("Hiii")//chk
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
</html>