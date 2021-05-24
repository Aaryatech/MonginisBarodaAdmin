<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	 

	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>

	<body>
	<style>
	.modal-content{
	    margin-top: 5%;
	    margin-left: 35%;
	    width: 30%;
	    height: 35%;
	}
	</style>
	<c:url value="/getProductsPrintIds" var="getProductsPrintIds"/>
	<c:url value="getGroup2ByCatId" var="getGroup2ByCatId" ></c:url>
	<c:url var="getItemBySubcatAjax" value="/getItemBySubcatAjax" ></c:url>
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
						<i class="fa fa-file-o"></i> Item Ledger
					</h1>-->
				</div>
			</div> 
			<!-- END Page Title -->
			
			
			<c:set var="isEdit" value="0">
					</c:set>
					<c:set var="isView" value="0">
					</c:set>
					<c:set var="isDelete" value="0">
					</c:set>

					<c:forEach items="${sessionScope.newModuleList}" var="modules">
						<c:forEach items="${modules.subModuleJsonList}" var="subModule">

							<c:choose>
								<c:when test="${subModule.subModuleMapping eq 'itemList'}">

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
			

			<div class="row hidden-xs">
				<div class="col-md-12">
					<div class="box box-pink" style="margin-bottom: 0;">
						<div class="box-title">
							<h3>
								<i class="fa fa-bars"></i> Product List
							</h3>
							<div class="box-tool">
								<a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a>
							</div>
						</div>
						
					</div>
				</div>
			</div>
			<!-- BEGIN Main Content -->
			<div class="row">
				<div class="col-md-12">

					<div class="box" >
						<!-- <div class="box-title">
							<h3>
								<i class="fa fa-table"></i> Items List
							</h3>
							<div class="box-tool">
								<a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a>
								<a data-action="close" href="#"><i class="fa fa-times"></i></a>
							</div>
						</div>
 -->
						<div class="box-content">
<div class="col-md-9" >


									<div class="col-md-4 box_marg">
											<label class="control-label left">Select Category</label>
												<div class="controls icon_add">
													<i class="fa fa-road frm_icon" aria-hidden="true"></i>	
													<select data-placeholder="Select Routes" name="routeId"
													class="form-control padd_left chosen"  id="routeId" 
													data-rule-required="true">	
													<option value="0">Select Category</option>	
													<c:forEach items="${mCategoryList}" var="cat">
													<c:set value="0" var="flag"/>
													<option value="${cat.catId}">${cat.catName}</option>
													
											</c:forEach>
										</select>											
												</div>
										</div>
										<div class="col-md-4 box_marg">
											<label class="control-label left">Select Subcategory</label>
												<div class="controls icon_add">
													<i class="fa fa-road frm_icon" aria-hidden="true"></i>	
													<select data-placeholder="Select Routes" name="item_grp2"
													class="form-control padd_left chosen"  id="item_grp2" multiple="multiple"
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
										<input type="button" class="btn btn-primary" style="margin-top: 25px;" value="SEARCH" onclick="searchItemBySubcat()">
									
								


</div> 
					<label for="search" class="col-md-3 search_align" id="search">
    <i class="fa fa-search" ></i>
									<input type="text"  id="myInput" onkeyup="myFunction()" placeholder="Search items by Name or Code" title="Type in a name">
										</label>  

							<div class="clearfix"></div>
							
							<div class="tableFixHead">
      <table id="table2">
        <thead>
          <thead style="background-color: #f3b5db;">
				<tr class="bgpink">
                    <th style="text-align: center; width:100px;">Sr No<input type="checkbox" name="selAllChkbx"
										id="selAllChkbx" /></th>
					<!-- <th style="text-align: left;">Item Id</th> -->
					<th style="text-align: center;">Item </th>
					<th style="text-align: center;">Rate</th>
					<th style="text-align: center;">MRP1</th>
					<th style="text-align: center;">MRP2</th>
					<th style="text-align: center;">MRP3</th>
					<th style="text-align: center;">Multiple Qty</th>
					<th style="text-align: center;">Max Qty.</th>
					<th style="text-align: center;">Shelf Life</th>
					<th style="text-align: center;">HSN</th>
					<th style="text-align: center;">Status</th>
					<th style="text-align: center; width:100px;">Action</th>
				</tr>
			</thead>
        <tbody>
										
								<c:forEach items="${itemsList}" var="itemsList" varStatus="count">
											<tr>
										<td style="text-align: left;"><c:out value="${count.index+1}" /> &nbsp; <input type="checkbox" class="chk" name="select_to_print" id="${itemsList.id}"	value="${itemsList.id}"/></td>

												
												<%-- <td style="text-align: left;">
													<c:out value="${itemsList.itemId}" /></td> --%>
												<td style="text-align: left;">
													<c:out value="${itemsList.itemId}-${itemsList.itemName}"/></td>
											
												<td style="text-align: right;">
													<c:out value="${itemsList.itemRate1}" /></td>
												<td style="text-align: right;">
												<c:out value="${itemsList.itemMrp1}" /></td>
												<td style="text-align: right;">
												<c:out value="${itemsList.itemMrp2}" /></td>
												<td style="text-align: right;">
												<c:out value="${itemsList.itemMrp3}" /></td>
												<td style="text-align: right;">
												<c:out value="${itemsList.minQty}" /></td>
												<td style="text-align: right;">
												<c:out value="${itemsList.itemGrp3}" /></td>
												<td style="text-align: right;">
												<c:out value="${itemsList.shelfLife}" /></td>
												<td style="text-align: right;">
												<c:out value="${itemsList.itemImage}" /></td>
												
												<td style="text-align: center;">
												<c:choose>
												<c:when test="${itemsList.itemIsUsed==1}">
													<c:out value="Active" />
												</c:when>
												<c:when test="${itemsList.itemIsUsed==2}"><c:out value="Special Days"/></c:when>
												<c:when test="${itemsList.itemIsUsed==3}"><c:out value="Sp Day Cake"/></c:when>
												<c:when test="${itemsList.itemIsUsed==4}"><c:out value="InActive"/></c:when>
												</c:choose>
											
												</td>
												
												
												<c:choose>
														<c:when test="${isEdit==1 and isDelete==1}">
													<td style="text-align: right;"><a href="updateItem/${itemsList.id}">
													<i class="fa fa-pencil" aria-hidden="true"></i></a>
                                             <a href="showItemDetail/${itemsList.id}"><i class="fa fa-bars" aria-hidden="true"></i></a>
													
													<a href="deleteItem/${itemsList.id}"
													onClick="return confirm('Are you sure want to delete this record');"><span
														class="glyphicon glyphicon-remove"></span></a></td>
														
																	</c:when>

																	<c:when test="${isEdit==1 and isDelete==0}">
																		<td style="text-align: right;"><a href="updateItem/${itemsList.id}">
																		<i class="fa fa-pencil" aria-hidden="true"></i></a>
                                             <a href="showItemDetail/${itemsList.id}"><i class="fa fa-bars" aria-hidden="true"></i></a>
													&nbsp;&nbsp;
													<a href="deleteItem/${itemsList.id}" class="disableClick"
													onClick="return confirm('Are you sure want to delete this record');"><span
														class="glyphicon glyphicon-remove"></span></a></td>
														
																	</c:when>

																	<c:when test="${isEdit==0 and isDelete==1}">
																		<td style="text-align: right;">
																		<a href="updateItem/${itemsList.id}" class="disableClick">
												<i class="fa fa-pencil" aria-hidden="true"></i></a>
                                             <a href="showItemDetail/${itemsList.id}"><i class="fa fa-bars" aria-hidden="true"></i></a>
													
													<a href="deleteItem/${itemsList.id}"
													onClick="return confirm('Are you sure want to delete this record');"><span
														class="glyphicon glyphicon-remove"></span></a></td>
														
																	</c:when>

																	<c:otherwise>

																		<td style="text-align: right;">
																		<a href="updateItem/${itemsList.id}" class="disableClick">
																		<i class="fa fa-pencil" aria-hidden="true"></i></a>
                                             <a href="${pageContext.request.contextPath}/showItemDetail/${itemsList.id}">
                                            <i class="fa fa-bars" aria-hidden="true"></i></a>
													
													<a href="${pageContext.request.contextPath}/deleteItem/${itemsList.id}" 
													onClick="return confirm('Are you sure want to delete this record');"  class="disableClick"><span
														class="glyphicon glyphicon-remove"></span></a></td>
														

																	</c:otherwise>
																</c:choose>
												
												
												
												
												
												
														
											</tr>

										</c:forEach>


							</tbody>
      </table>
    </div>
							
							
							
							
								
				
						</div>
						
						<div class="form-group">
								<div class="row" style="text-align: right; padding: 5px 29px 15px 29px;">
								
								<div class="left_btn">
									<input type="button" id="btn_delete" class="btn btn-primary" onclick="deleteById()" value="Delete" />
									<input type="button" id="btn_delete" class="btn btn-primary" onclick="inactiveById()" value="InActive" />
								</div>
								<div class="right_btn">
									<input type="button" id="expExcel" class="btn btn-primary" value="Export To Excel" onclick="exportToExcel();">
									<input type="button" id="btn_exl_pdf" class="btn btn-primary" onclick="getHeaders()" value="Excel / Pdf" />
								</div>
								<div class="clr"></div>
								
								
								
											
									
									
										
									
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
				<th>Product</th>
				<th>UOM</th>
				<th>Sub Category</th>
				<th>MRP1</th>
				<th>MRP2</th>
				<th>MRP3</th>
				<th>GST%</th>
				<th>HSN Code</th>
				<th>Shelf Life</th>
				<th>Sort No.</th>
				<th>Is Active</th>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
	
	<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content" id="modal_theme_primary">
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
									<th  ><input type="checkbox" name="selAll"
										id="selAllChk" />
									</th>
									<th style="text-align: center;">Headers</th>
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
  table = document.getElementById("table2");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[1];
    td1 = tr[i].getElementsByTagName("td")[2];
    if (td || td1) {
      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      }else if (td1.innerHTML.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      }  else {
        tr[i].style.display = "none";
      }
    }       
  }//end of for
  
 
  
}
</script>


<script type="text/javascript">
	$('#selAllChkbx').click(function(event) {   
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
	<script type="text/javascript">
$(document).ready(function() { 
	$('#routeId').change(
			function() {
			//	alert("Hiii")
				$.getJSON('${getGroup2ByCatId}', {
					catId : $('#routeId').val(),
					ajax : 'true'
				}, function(data) {
					//alert(JSON.stringify(data))
					var html = '<option multiple="multiple" value="">Sub Category</option>';

					var len = data.length;

					$('#item_grp2').find('option').remove().end()

					$("#item_grp2")
							.append(
									$("<option ></option>").attr(
											"value", "").text(
											"Select Sub Category"));
					/* $("#item_grp2").append(
							$("<option></option>")
									.attr("value", -1).text("ALL")); */
					for (var i = 0; i < len; i++) {
						$("#item_grp2").append(
								$("<option  selected ></option>").attr(
										"value", data[i].subCatId)
										.text(data[i].subCatName));
					}
					$("#item_grp2").trigger("chosen:updated");

				});
			});
});
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
<script type="text/javascript">
function deleteById()
{

var checkedVals = $('.chk:checkbox:checked').map(function() {
    return this.value;
}).get();
checkedVals=checkedVals.join(",");

if(checkedVals=="")
	{
	alert("Please Select Item")
	}
else
	{
	window.location.href='${pageContext.request.contextPath}/deleteItem/'+checkedVals;

	}

}
</script>
<script type="text/javascript">
function inactiveById()
{

var checkedVals = $('.chk:checkbox:checked').map(function() {
    return this.value;
}).get();
checkedVals=checkedVals.join(",");

if(checkedVals=="")
	{
	alert("Please Select Item")
	}
else
	{
	window.location.href='${pageContext.request.contextPath}/inactiveItem/'+checkedVals;

	}

}
</script>

<script>
function searchItemBySubcat() {
	var subcatIds=$('#item_grp2').val();
	//alert(subcatIds);
	
	$.getJSON('${getItemBySubcatAjax}', {
		subcatIds : JSON.stringify(subcatIds),
		ajax : 'true'
	}, function(data) {
		
		//alert(JSON.stringify(data))
		$('#table2 td').remove();
					$.each(data, function(key, item) {
						 
						 
						var tr = $('<tr></tr>');

						tr
						 .append($(
										'<td style="text-align:left;"></td>')
										.html(
												key + 1+"<input type='checkbox' class='chkcls' name='chkcls' id="+item.id+" value="+item.id+"  >"));

						tr
						 .append($(
										'<td style="text-align:left;"></td>')
										.html(
												item.itemName));	
						
						tr
						 .append($(
										'<td style="text-align:left;"></td>')
										.html(
												item.itemRate1));
						
						tr
						 .append($(
										'<td style="text-align:left;"></td>')
										.html(
												item.itemMrp1));
						tr
						 .append($(
										'<td style="text-align:left;"></td>')
										.html(
												item.itemMrp2));
						tr
						 .append($(
										'<td style="text-align:left;"></td>')
										.html(
												item.itemMrp3));
						
						tr
						 .append($(
										'<td style="text-align:left;"></td>')
										.html(
												item.minQty));
						
						tr
						 .append($(
										'<td style="text-align:left;"></td>')
										.html(
												item.itemGrp3));
						
						tr
						 .append($(
										'<td style="text-align:left;"></td>')
										.html(
												item.shelfLife));
						
						tr
						 .append($(
										'<td style="text-align:left;"></td>')
										.html(
												item.itemImage));
						var status="";
						if(item.itemIsUsed==1){
							status="ACTIVE";
						}
						if(item.itemIsUsed==2){
							status="SPECIAL DAY";
						}
						if(item.itemIsUsed==3){
							status="SP DAY Cake";
						}
						if(item.itemIsUsed==4){
							status="In-ACTIVE";
						}
						tr
						 .append($(
										'<td style="text-align:left;"></td>')
										.html(
												status));
						tr
						 .append($(
										'<td style="text-align:left;"></td>')
										.html(
												"<a href='${pageContext.request.contextPath}/updateItem/"+item.id+"' class='action_btn'> <abbr title='edit'> <i class='fa fa-pencil' ></i></abbr> <a href='${pageContext.request.contextPath}/showItemDetail/"+item.id+"' class='action_btn'> <abbr title='detailes'> <i class='fa fa-list' ></i></abbr> <a href='${pageContext.request.contextPath}/deleteItem/"+item.id+"' class='action_btn'> <abbr title='detailes'> <i class='glyphicon glyphicon-remove' ></i></abbr> "));
						
						  
						$('#table2 tbody')
						.append(tr);
			});
		
	});
	
	
	
	
}

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
						tr1.append($('<td style="padding:  7px; text-align:center; line-height:0; border-top:0px;"></td>').html('<input type="checkbox" class="chkcls" name="chkcls'
								+ seq
								+ '" id="catCheck'
								+ seq
								+ '" value="'
								+ seq
								+ '">') );
						tr1.append($('<td style="padding: 7px; text-align:center;  line-height:0; border-top:0px;"></td>').html(innerHTML=thArray[i]));
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
								'${getProductsPrintIds}',
								{
									elemntIds : JSON.stringify(elemntIds),
									val : val,
									ajax : 'true'
								},
								function(data) {
									// alert("Pdf")
									if(data!=null){
										//$("#modal_theme_primary").modal('hide');
										if(val==1){
											window.open("${pageContext.request.contextPath}/exportToExcelNew");
											//document.getElementById("expExcel").disabled = true;
										}else{			
											 window.open('${pageContext.request.contextPath}/pdfForReport?url=pdf/getProductListPdf/'+elemntIds.join());
											 $('#selAllChk').prop('checked', false);
										}
									}
								});
						}
					}		
				  
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
</html>