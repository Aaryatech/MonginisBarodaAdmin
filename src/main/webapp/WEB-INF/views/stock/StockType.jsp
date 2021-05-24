<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
/* Modal Content/Box */
.modal-content {
	background-color: #fefefe;
	margin: 5% auto 15% auto;
	/* 5% from the top, 15% from the bottom and centered */
	border: 1px solid #888;
	width: 80%; /* Could be more or less, depending on screen size */
}

/* The Close Button (x) */
.close {
	position: absolute;
	right: 25px;
	top: 0;
	color: #000;
	font-size: 35px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: red;
	cursor: pointer;
}


</style>
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>

<body>

	<jsp:include page="/WEB-INF/views/include/logout.jsp"></jsp:include>

	<c:url var="getDateForGateGvnHeader" value="/getDateForGateGvnHeader" />
	<c:url var="delMultiStock" value="/delMultiStock" ></c:url>
	<c:url var="getFrByStockTypeId" value="/getFrByStockTypeId"></c:url>

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
		
		<c:set var="isEdit" value="0">
			</c:set>

			<c:set var="isDelete" value="0">
			</c:set>

			<c:forEach items="${sessionScope.newModuleList}" var="modules">
				<c:forEach items="${modules.subModuleJsonList}" var="subModule">
					<c:choose>
						<c:when
							test="${subModule.subModuleMapping eq 'showStockType'}">

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

		<!-- BEGIN Content -->
		<div id="main-content">
			<!-- BEGIN Page Title -->
		 	<div class="page-title">
				<div>
					<!--<h1>
						<i class="fa fa-file-o"></i>GVN Header Dispatch
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
								<i class="fa fa-bars"></i>Stock Type Updation 
							</h3>
							<div class="box-tool">
								
						</div>
						</div>


						<div class="box-content box-content padd_zro">
							<form
								action="${pageContext.request.contextPath}/saveStockType" method="post"
								class="form-horizontal" id="validation-form">
								
								
									<div class="frm_Sec_one marg_zero">
										<div class="row">
											<div class="col-md-3 box_marg">
											<label class="control-label left">Stock Sequence No.</label>
									<div class="controls icon_add">
										<i class="fa fa-user frm_icon" aria-hidden="true"></i>
										<input class="form-control padd_left input" id="id" type="hidden" value="${st.id}"
											size="16" type="text" name="id" placeholder="Enter Reject Remark"/>
										<input type="text" name="stock_type_name" id="stock_type_name" required="required"
											placeholder="Stock Type Name" class="form-control padd_left" value="${st.stockTypeName}"
											/>
											
										
									</div>
										</div>
										
										<div class="col-md-3 box_marg">
											<label class="control-label left">Stock Type Description.</label>
									<div class="controls icon_add">
										<i class="fa fa-file-text frm_icon" aria-hidden="true"></i>
										<input type="text" name="stock_type_desc" id="stock_type_desc"
											placeholder="Stock Type Description" required="required" class="form-control padd_left" value="${st.stockTypeDesc}"
											/>
										
									</div>
										</div>
										
										<div class="col-md-3 box_marg">
											<label class="control-label left">Stock Type.</label>
									<div class="controls icon_add">
										<i class="fa fa-stack-exchange frm_icon" aria-hidden="true"></i>
										<input type="text" name="stock_type" id="stock_type" required="required"
											placeholder="Stock Type" class="form-control padd_left" value="${st.type}"
											 />
									</div>
										</div>
										
										<div class="col-md-3 box_marg">
											<div class="row three_buttons one_row padd_dic">
										<button type="submit" class="btn btn-primary" style="width: 70px">
										 Submit
										</button>
										<button style="display: none;" type="button" class="btn btn-primary">Cancel</button>
									</div>
										</div>
										
										
										</div>
									</div>
								


							<!-- <div class="form-group">
									<div class="row three_buttons padd_dic">
										<button type="submit" class="btn btn-primary" style="width: 70px">
										 Submit
										</button>
										<button type="button" class="btn btn-primary">Cancel</button>
									</div>
								</div> -->
								
								
								
								

		
							</form>

							
                 
                 
                 	
                 




					</div>
					
					<div class="box-content">
					<label for="search" style="float: right;" class="col-md-3 search_align" id="search">
    										<i class="fa fa-search" ></i>
									<input type="text"  id="myInput" onkeyup="myFunction()" placeholder="Search items by Name or Code" title="Type in a name">
										</label>
					<div class="tableFixHead">
      <table id="table_grid">  
        <thead>
          <thead style="background-color: #f3b5db;">
				<tr >
				    <th style="text-align: center; width: 70px;">#<input type="checkbox" name="selAll"
										id="selAllChk" /></th>
				    <th style="text-align: center;">Stock Type Name </th>
					<th style="text-align: center;">Stock Type Desc </th>
					<th style="text-align: center;">Stock Type  </th>															
					<th style="text-align: center; width: 70px;">Action</th>
				</tr>
			</thead>
        <tbody>
										<c:forEach items="${stock}" var="stock" varStatus="srno" >
										<c:set var="flag" value="0" ></c:set>
										<c:forEach var="inUse" items="${inUseStockList}">
										<c:if test="${stock.id==inUse}">
										<c:set var="flag" value="1" ></c:set>
										</c:if>
										</c:forEach>
										
										
											<tr>
											<c:choose>
												<c:when test="${flag==1}">
												<td style="text-align: center;">${srno.index+1}</td>
												</c:when>
												<c:otherwise>
												<td style="text-align: center;">${srno.index+1}<input type="checkbox" class="chk" name="select_to_print" id="${stock.id}"	value="${stock.id}"/></td>
												</c:otherwise>
											</c:choose>
											
											    												
											    
												<td style="text-align: left;"><a onclick="displayFrList(${stock.id})" >${stock.stockTypeName}</a></td>
												<td style="text-align: left;">${stock.stockTypeDesc}</td>
												<td style="text-align: right;">${stock.type}</td>

												<c:choose>
													<c:when test="${isEdit==1 and isDelete==1}">

														<td style="text-align: right;"><a
															href="${pageContext.request.contextPath}/updateStockType/${stock.id}">
																<i class="fa fa-pencil" aria-hidden="true"></i> <!-- <span class="glyphicon glyphicon-edit"></span> -->
														</a> <a
															href="${pageContext.request.contextPath}/deleteStockType/${stock.id}"
															onClick="return confirm('Are you sure want to delete this record');"><span
																class="glyphicon glyphicon-remove"></span></a></td>
													</c:when>

													<c:when test="${isEdit==1 and isDelete==0}">

														<td style="text-align: right;"><a
															href="${pageContext.request.contextPath}/updateStockType/${stock.id}">
																<i class="fa fa-pencil" aria-hidden="true"></i> <!-- <span class="glyphicon glyphicon-edit"></span> -->
														</a> <a
															href="${pageContext.request.contextPath}/deleteStockType/${stock.id}"
															class="disableClick"
															onClick="return confirm('Are you sure want to delete this record');"><span
																class="glyphicon glyphicon-remove"></span></a></td>
													</c:when>

													<c:when test="${isEdit==0 and isDelete==1}">

														<td style="text-align: right;"><a
														class="disableClick" 
															href="${pageContext.request.contextPath}/updateStockType/${stock.id}">
																<i class="fa fa-pencil" aria-hidden="true"></i> <!-- <span class="glyphicon glyphicon-edit"></span> -->
														</a> <a
															href="${pageContext.request.contextPath}/deleteStockType/${stock.id}"
															onClick="return confirm('Are you sure want to delete this record');"><span
																class="glyphicon glyphicon-remove"></span></a></td>
													</c:when>

													<c:otherwise>

														<td style="text-align: right;"><a class="disableClick" style="opacity: 0.5;"
															href="${pageContext.request.contextPath}/updateStockType/${stock.id}">
																<i class="fa fa-pencil" aria-hidden="true"></i> <!-- <span class="glyphicon glyphicon-edit"></span> -->
														</a> <a class="disableClick"
															href="${pageContext.request.contextPath}/deleteStockType/${stock.id}"
															onClick="return confirm('Are you sure want to delete this record');"><span
																class="glyphicon glyphicon-remove"></span></a></td>
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
						<i class="fa fa-table"></i> Franchisee List
					</h3>
				</div>

				<div class="box-content">
				
					<div class="clearfix">
					
					</div>
					<div class="table-responsive" style="border: 0">
					 <table id=model_table> 
        <thead style="background-color: #f3b5db;">
									<tr>
										<th style="width: 70px; text-align: center;">Sr.No.<input type="checkbox" id="selAllChkbx" name="selAllChkbx" ></th>
										<th style="text-align: center;">Franchisee Name.</th> 
									    

									</tr>
								</thead>
        <tbody>
						</tbody>
						</table>
					</div>
				</div>
				<div class="form-group"
					style="padding: 0 0 10px 0;display: none;">
					<input type="button" class="btn btn-primary" id="expExcel" onclick="getIdsReport(1)" value="Excel" /> 
					<input type="button" class="btn btn-primary" onclick="getIdsReport(2)" value="Pdf" />
				</div>
			</div>

		</div>

	</div>
      
    </div>
    <button style="margin-top: 15px;margin-left: 15px;" type="button" class="btn btn-primary" onclick="deleteMultiStock()" >Delete</button>
    </div>
    
    
					
					
						<%-- <table class="table table-bordered table-striped fill-head "
							style="width: 100%" id="table_grid">
							<thead style="background-color: #f3b5db;">
													
														<tr >
														    <th class="col-md-1">SELECT</th>
														    <th width="148" style="width: 18px" align="left">Stock Type Name </th>
															<th width="148" style="width: 18px" align="left">Stock Type Desc </th>
															<th width="148" style="width: 18px" align="left">Stock Type  </th>															
															<th width="198" style="text-align: center;">Action</th>
															</tr>
													</thead>
										<tbody>
										<c:forEach items="${stock}" var="stock" varStatus="srno" >
											<tr>
											    <td><input type="checkbox" class="chk" name="select_to_print" id="${stock.id}"	value="${stock.id}"/></td>												
												<td>${stock.stockTypeName}</td>
												<td>${stock.stockTypeDesc}</td>
												<td>${stock.type}</td>
                                                <td style="text-align: center;">
 
                                                    <a href="${pageContext.request.contextPath}/updateStockType/${stock.id}" ><span
														class="glyphicon glyphicon-edit"></span></a>
														  
													<a href="${pageContext.request.contextPath}/deleteStockType/${stock.id}"
													onClick="return confirm('Are you sure want to delete this record');"><span
														class="glyphicon glyphicon-remove"></span></a>
								            
 									            </td>
 									            
 									       	
											</tr>
										</c:forEach>

										</tbody>
									</table> --%>
					
					
					
					
					
					
					
					
					
					
					
				</div>
			</div>
			<!-- END Main Content -->
			<footer style="text-align: center;">
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

</script>
<script type="text/javascript">
function deleteMultiStock() {
	 var stckIds = [];										
		
		$(".chk:checkbox:checked").each(function() {
			stckIds.push($(this).val());
		}); 
		//alert(stckIds);
		
		$.getJSON('${delMultiStock}',

				{
			stckIds:JSON.stringify(stckIds),
					ajax : 'true'

				},
				function(data) {
				//alert(JSON.stringify(data))
				alert(data.message)
				window.location.reload();
					
				});
		
}
</script>
<script type="text/javascript">

	
	function displayFrList(val) {
		//alert("Hiii"+val)
		
		$.getJSON('${getFrByStockTypeId}',

				{
			stckId:val,
					ajax : 'true'

				},
				function(data) {
					
					//alert(JSON.stringify(data))
					
						$('#model_table td').remove();
							 
							if (data == "") {
								 
								alert("No Record");
							}  
						  $.each(data,function(key, itemList) { 
											 
							  				 
											var tr = $('<tr></tr>');  
										  	tr.append($('<td></td>').html(key+1)); 
										  	tr.append($('<td></td>').html(itemList.frName)); 
										  	/* tr.append($('<td></td>').html(itemList.rmName)); 
										  	tr.append($('<td></td>').html('  <a href="${pageContext.request.contextPath}/showRmRateVerificationDetailed/'+itemList.suppId+'/'+itemList.rmId+'" class="action_btn" ><abbr title="Details"><i class="fa fa-list"></i></abbr></a> ')); */
										  	
											$('#model_table tbody').append(tr);

											 openModel();

										})
					
					
				});
	}
	</script>


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
function myFunction() {
  var input, filter, table, tr, td,td1, i;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("table_grid");
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

</body>
</html>

