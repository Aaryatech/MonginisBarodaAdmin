<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/component.css" />

<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>

<body style="overflow-x:hidden ">
	<c:url var="getItemsByCatIdManOrder" value="/getItemsByMenuIdForBill" />
    <c:url var="insertItemForBill" value="/insertItemForBill" />
    <c:url var="deleteItemOfBillNewItem" value="/deleteItemOfBillNewItem" />
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
			<div class="page-title">
				<div>
					<!-- <h1>
						<i class="fa fa-file-o"></i> Bill Details
					</h1> -->

				</div>
			</div>
			<!-- END Page Title -->



			<!-- BEGIN Main Content -->
			<div class="row">
				<div class="col-md-12">
					<div class="box">
						<div class="box-title">
							<h3>
								<i class="fa fa-bars"></i>Update Bill Details
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



						<div><!-- class="box-content" -->
							<form
								action="${pageContext.request.contextPath}/updateBillDetailsProcess"
								class="form-horizontal" method="post" id="validation-form"
								enctype="multipart/form-data">
								
								<div class="frm_Sec_one single">
									<div class="row">
										<div class="col-md-3 box_marg">
										<label class="control-label left">Invoice No</label>
										<div class="controls icon_add">
										<i class="fa fa-file-text frm_icon" aria-hidden="true"></i>
										<input type="text" name="invoiceNo" id="invoiceNo"
											placeholder="Invoice No" class="form-control padd_left" value="${getBillHeader.invoiceNo}"
											data-rule-required="true"  />
											<input type="hidden" name="bill_no" id="bill_no"
											placeholder="Bill No" class="form-control padd_left" value="${billNo}"
											data-rule-required="true" readonly="readonly" />
										</div>
									</div>
									
									<div class="col-md-3 box_marg">
										<label class="control-label left">Bill date</label>
										<div class="controls icon_add">
										<i class="fa fa-calendar frm_icon" aria-hidden="true"></i>
										<input type="text" name="bill_date" id="bill_date"
											placeholder="Bill Date" class="form-control padd_left date-picker"
											value="${billDate}" data-rule-required="true"
											/>
										</div>
									</div>
									
									<input type="hidden" name="fr_name" id="fr_name"
									placeholder="Franchisee Name" class="form-control"
									data-rule-required="true" readonly="readonly" value="${frName}" />
									
									<div class="col-md-3 box_marg">
										<label class="control-label left">Franchisee Name</label>
										<div class="controls icon_add">
										<i class="fa fa-user frm_icon" aria-hidden="true"></i>
										<select name="frId" id="frId" class="form-control chosen"
											required>
											<c:forEach items="${frList}" var="frList">
												<c:choose>
													<c:when test="${frList.frId==getBillHeader.frId}">
														<option value="${frList.frId}" selected>${frList.frName}</option>
													</c:when>
													<c:otherwise>
														<option value="${frList.frId}">${frList.frName}</option>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</select>
										</div>
									</div>
									</div>
								</div>
								
								</div>


								

						

								<div class="box-content">

									<div class="clearfix"></div>
									
									<div class="tableFixHead">
										<table id="table1">        
										<thead style="background-color: #f3b5db;">
											<tr class="bgpink">
												<th style="text-align: center; width:80px;">Sr No</th>
												<th style="text-align: left;">Item Name</th>
												<th style="text-align: right;">Group</th>
												<th style="text-align: right;">Order Qty</th>
												<th style="text-align: right;">Billed Qty</th>
												<th style="text-align: right;">MRP</th>
												<th style="text-align: right;">Rate</th>
												<th style="text-align: right;">SGST %</th>
												<th style="text-align: right;">CGST %</th>
												<th style="text-align: right;">CESS %</th>
												<th style="text-align: right;">Disc %</th>
												<th style="text-align: right;">Disc Amt</th>
												<th style="text-align: right;">Taxable Amt</th>
												<th style="text-align: right;">Tax Amt</th>
												<th style="text-align: right;">Disc Amt</th>
												<th style="text-align: right;">Grand Total</th>
											</tr>
										</thead>
									
										<tbody>
											<tbody>

												<c:forEach items="${billDetails}" var="billDetails"
													varStatus="count">

													<tr>

														<td style="text-align: center;"><c:out value="${count.index+1}" /></td>

														<td style="text-align: left;"><c:out
																value="${billDetails.itemName}" /></td>


														<td style="text-align: right;"><c:out
																value="${billDetails.catName}" /></td>

														<td style="text-align: right;"><c:out
																value="${billDetails.orderQty}" /></td>

														<td style="text-align: right;"><input type="text"
															class="form-control" data-rule-number="true"
															name="billQty${billDetails.billDetailNo}"
															id="billQty${billDetails.billDetailNo}"
															style="width: 60px" value="${billDetails.billQty}"
															onkeyup="changeValues(${billDetails.billDetailNo})" /></td>

														<td style="text-align: right;"><c:out value="${billDetails.mrp}" /></td>

														<td style="text-align: right;"><input type="text"
															class="form-control" data-rule-number="true"
															name="billRate${billDetails.billDetailNo}"
															id="billRate${billDetails.billDetailNo}"
															style="width: 60px" value="${billDetails.rate}"
															onkeyup="changeValues(${billDetails.billDetailNo})" /></td>
													
														<td style="text-align: right;"><input type="text"
															class="form-control" data-rule-number="true"
															name="sgstPer${billDetails.billDetailNo}"
															id="sgstPer${billDetails.billDetailNo}"
															style="width: 60px" value="${billDetails.sgstPer}"
															onkeyup="changeValues(${billDetails.billDetailNo})" /></td>

														<td style="text-align: right;"><input type="text"
															class="form-control" data-rule-number="true"
															name="cgstPer${billDetails.billDetailNo}"
															id="cgstPer${billDetails.billDetailNo}"
															style="width: 60px" value="${billDetails.cgstPer}"
															onkeyup="changeValues(${billDetails.billDetailNo})" /></td>
                                                      
                                                        <td style="text-align: right;"><input type="text"
															class="form-control" data-rule-number="true"
															name="cessPer${billDetails.billDetailNo}"
															id="cessPer${billDetails.billDetailNo}"
															style="width: 60px" value="${billDetails.cessPer}"
															onkeyup="changeValues(${billDetails.billDetailNo})" /></td>
															
														<c:set var="billQty" value="${billDetails.billQty}" />
														<c:set var="rate" value="${billDetails.rate}" />
														<td style="text-align: right;">
														<input type="text"
															class="form-control" data-rule-number="true"
															name="discPer${billDetails.billDetailNo}"
															id="discPer${billDetails.billDetailNo}"
															style="width: 60px" value="${billDetails.discPer}"
															onkeyup="changeValues(${billDetails.billDetailNo})" />
														
														</td>
														<td style="text-align: right;" id="discAmt${billDetails.billDetailNo}">
															<c:out value="${billDetails.remark}" />
														</td>
														<td style="text-align: right;"
															id="taxableAmt${billDetails.billDetailNo}"><c:out
																value="${billDetails.taxableAmt}" /></td>

														<td style="text-align: right;" id="totalTax${billDetails.billDetailNo}"><c:out
																value="${billDetails.totalTax}" /></td>

														
														<td style="text-align: right;"><c:out value="${billDetails.remark}" /></td>
                                                        <td style="text-align: right;"
															id="grandTotal${billDetails.billDetailNo}"><c:out
																value="${billDetails.grandTotal}" /></td>

													</tr>

												</c:forEach>

											</tbody>
										</tbody>
										</table>
									</div>
								</div>

							
							<div class="form-group">
								<div class="row three_buttons" style="padding:5px 0 15px 0;">
									<button type="submit" class="btn btn-primary"> Update </button>
										<a href="" onclick="showDetailsForCp(${planHeader.productionHeaderId},'${planHeader.productionDate}')" class="btn btn-primary" data-toggle="modal" data-target="#elegantModalForm">Add New Item</a>&nbsp;&nbsp;
								</div>					
						    </div>
							</form>
						
					</div>
				</div>
			</div>
			<div class="modal fade" id="elegantModalForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true" >
  
  <!--SAVE LOADER-->
    <div id="overlay">
	<div class="clock"></div>
  </div>
  
  <div class="modal-dialog" role="document" style="width:80%;height:50%;">
    <!--Content-->
    <div class="modal-content form-elegant">
      <!--Header-->
       <div class="modal-header">
       
       <div class="page-title"  id="myModalLabel">
				<div>
					<h1>
						<i class="fa fa-file-o"></i> Add New Item In Bill
					</h1>

				</div>
			</div>
       
           
            <a href="#" class="close" data-dismiss="modal" aria-label="Close" id="closeHrefModel">
                <img src="${pageContext.request.contextPath}/resources/img/close.png" alt="X" class="imageclass"/>
            </a> 
         <div>
      </div> 
      <div><!-- class="modal-body mx-6" -->
      	<form name="modalfrm" id="modalfrm"  method="post"> 
      		
      		<div class="frm_Sec_one single">
      			<div class="row">
      				<div class="col-md-4 box_marg" style="color:#e20b31;">
						<label class="control-label left">Invoice No</label>
						<div class="controls icon_add">
						<span id="prodIdSpan">${getBillHeader.invoiceNo}</span>
						</div>
					</div>
					<div class="col-md-4 box_marg" style="color:#e20b31;">
						<label class="control-label left">Bill Date</label>
						<div class="controls icon_add">
						<span id="prodDateSpan">${billDate}</span>
						</div>
					</div>
					<div class="col-md-4 box_marg" style="color:blue;">
						<label class="control-label left">Party</label>
						<div class="controls icon_add">
						<span id="dep1">${getBillHeader.partyName}</span>
						</div>
					</div>
					
					 <input type="hidden" name="billHeaderId" id="billHeaderId" value="${getBillHeader.billNo}" />
					<div class="col-md-4 box_marg">
						<label class="control-label left">Menu</label>
						<div class="controls icon_add">
						<i class="fa fa-road frm_icon" aria-hidden="true"></i>
						<select data-placeholder="Select Menu" name="menu"
								class="form-control padd_left chosen" tabindex="-1" id="menu"
								data-rule-required="true"
								onchange="onCatIdChangeForManOrder(this.value)">
								<option value="0">Select Menu</option>
                                            <c:forEach items="${menuList}" var="menuList">
							<option value="${menuList.menuId}"
								style="text-align: left;">${menuList.menuTitle}</option>
					     	</c:forEach>
							</select>
						</div>
					</div>
					
					<div class="col-md-4 box_marg">
						<label class="control-label left">Item</label>
						<div class="controls icon_add">
						<i class="fa fa-road frm_icon" aria-hidden="true"></i>
						<select data-placeholder="Choose Item"
							class="form-control padd_left chosen" id="itemId" name="itemId">
							<option value="">Select Item</option>
						</select>
						</div>
					</div>
					
					<div class="col-md-4 box_marg">
						<label class="control-label left">Qty</label>
						<div class="controls icon_add">
						<i class="fa fa-road frm_icon" aria-hidden="true"></i>
						<input type="text" name="qty" value="0" id="qty" class="form-control padd_left" />
						</div>
					</div>
									
      			</div>
      		</div>
      		
      		<div class="form-group">
				<div class=" three_buttons">
					<input type="button" class="btn btn-primary" id="searchBtn" value="Add">
					<input type="button" class="btn btn-primary" value="Cancel"">
				</div>					
		    </div>
		    
		    <div class="tableFixHead">
	<table id="modeltable">        
	<thead style="background-color: #f3b5db;">
		<tr class="bgpink">
			<th width="17" style="width: 18px">Sr No</th>
			<th width="120" align="left">Item Name</th>
			<th width="100" align="left">Bill Qty</th>
			<th width="120" align="left">Mrp</th>
			<th width="120" align="left">Rate</th>
			<th width="100" align="left">Total</th>
			<th width="100" align="left">Action</th>
		</tr>
	</thead>

	<tbody>										
	</tbody>
	</table>
</div> 

	<div class="form-group">
				<div class=" three_buttons">
					<button type="button" class="btn btn-primary" id="sbtbtn" disabled="disabled">Submit</button>
					<input type="button" class="btn btn-primary" value="Cancel"">
				</div>					
		    </div>

				
		    
     			
								</form>	
						</div>			
      <!--Body-->
     
    </div>
    <!--/.Content-->
  </div>
</div></div>
			<!-- END Main Content -->
			<footer>
				<p>2017 © MONGINIS.</p>
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
		function changeValues(detailNo) { 
			
			var billQty=parseFloat($("#billQty"+detailNo).val()); 
			var billRate=parseFloat($("#billRate"+detailNo).val()); 
			var sgstPer=parseFloat($("#sgstPer"+detailNo).val()); 
			var cgstPer=parseFloat($("#cgstPer"+detailNo).val());  
			var cessPer=parseFloat($("#cessPer"+detailNo).val()); // new1
			var discPer=parseFloat($("#discPer"+detailNo).val());  
			
			var baseRate=((billRate*100)/(100+sgstPer+cgstPer+cessPer)).toFixed(2); 
			var taxableAmt=(billQty*baseRate)
			
			 var discAmt=((parseFloat(taxableAmt) * parseFloat(discPer)) /100);
          	  document.getElementById("discAmt" + detailNo).innerHTML=discAmt.toFixed(2);
          	 
          	  taxableAmt=parseFloat(taxableAmt) - parseFloat(discAmt);//alert(taxableAmt+"taxableAmt");
          	  
			var sgstRs=((taxableAmt*sgstPer)/100).toFixed(2); 
			var cgstRs=((taxableAmt*cgstPer)/100).toFixed(2); 
			var cessRs=((taxableAmt*cessPer)/100).toFixed(2); 

			var totalTax=parseFloat(sgstRs)+parseFloat(cgstRs)+parseFloat(cessRs); 
			var grandTotal=parseFloat(totalTax)+parseFloat(taxableAmt); 
			$("#taxableAmt"+detailNo).html(taxableAmt.toFixed(2));
			$("#totalTax"+detailNo).html(totalTax.toFixed(2)); 
			$("#grandTotal"+detailNo).html(grandTotal.toFixed(2));   
		}
	</script>
<script type="text/javascript">
function onCatIdChangeForManOrder(menuId) {

	$.getJSON('${getItemsByCatIdManOrder}', {
		menuId : menuId,
		ajax : 'true'
	}, function(data) {
		var len = data.length;
		$('#itemId').find('option').remove().end()

		$("#itemId").append(
				$("<option></option>").attr("value", "0").text(
						"Select Item"));

		for (var i = 0; i < len; i++) {
			$("#itemId").append(
					$("<option></option>").attr("value", data[i].id)
							.text(
									data[i].itemName + "--MinQty: "
											+ data[i].minQty));
		}
		$("#itemId").trigger("chosen:updated");

	});

}
</script>
<script type="text/javascript">
function validation() {
	
	var frId = $('#frId').val();
	var menuId = $('#menu').val();
	var itemId=$('#itemId').val();
	var qty=$("#qty").val();

	var isValid = true;
	if (frId == ""||frId==0) { 
		isValid = false;
		alert("Please Select Franchisee");
	} else if (menuId == ""||menuId ==0) {
		isValid = false;
		alert("Please Select Menu ");
	}else if (itemId == ""||itemId=='0' ) {
		isValid = false;
		alert("Please Select Item");
	}else if (qty == ""||isNaN(qty) || qty < 1) {
		isValid = false;
		alert("Please Enter Valid Item Qty.");
	}
	return isValid;
}
</script>
<script type="text/javascript">

$(document).ready(function() {
	$("#searchBtn").click(function() {
		document.getElementById("searchBtn").disabled = true;
	  var isValid = validation();
	if (isValid) {  
		
 	var frId = $('#frId option:selected').val();
	var menuId = $('#menu option:selected').val();
	var itemId=$('#itemId option:selected').val();
	var billDate=$('#bill_date').val();
	var qty=$("#qty").val();
//	 $('#loader').show();
	$.getJSON('${insertItemForBill}', {
		frId:frId,
		menuId:menuId,
		itemId:itemId,
		qty:qty,
		billDate:billDate,
		ajax: 'true',
		
	},  function(data) { 
 
		// $('#loader').hide();
		var len = data.length;
		document.getElementById("searchBtn").disabled = false;
		document.getElementById("sbtbtn").disabled = false;
		$('#modeltable td').remove();

		$.each(data,function(key, item) {

		var tr = $('<tr></tr>');

	  	tr.append($('<td></td>').html(key+1));

	  	tr.append($('<td></td>').html(item.itemName));

	  	tr.append($('<td style="text-align:right;"></td>').html(item.orderQty));
	  	
	  	tr.append($('<td style="text-align:right;"></td>').html(item.orderMrp));
	  	
	  	tr.append($('<td style="text-align:right;"></td>').html(item.orderRate.toFixed(2)));
	  	var total=item.orderQty*item.orderRate;
	  	tr.append($('<td style="text-align:right;"></td>').html(total.toFixed(2)));
	  	
	 	tr.append($('<td style="text-align:center;"></td>').html("<a href='#' class='action_btn' onclick=deleteItem("+key+")><i class='fa fa-trash-o  fa-lg'></i></a>"));
	  
		$('#modeltable tbody').append(tr);
	 
	 }); 
	
	});
	document.getElementById("frId").selectedIndex = "0";
	$("#frId").trigger("chosen:updated");
	document.getElementById("menu").selectedIndex = "0";
	
	$("#menu").trigger("chosen:updated");
	document.getElementById("itemId").selectedIndex = "0";
	$('#itemId')
    .find('option')
    .remove()
    .end()
	$("#itemId").trigger("chosen:updated");
	document.getElementById("qty").value =0;


	}
});

});


</script>
 <script type="text/javascript">
    $('#sbtbtn').click(function(){
		$("#overlay").fadeIn(300);
		
		$.ajax({
			    type: "POST",
	             url: "${pageContext.request.contextPath}/postOrderData",
	             data: $("#modalfrm").serialize(),
	             dataType: 'json',
			success: function(data){
				if(data.error==false)
					{
					$('#modeltable td').remove();
					alert("Item added successfully in Bill")
					$("#overlay").fadeOut(300);
					$("#closeHrefModel")[0].click();
					window.location.reload()
					}
			}
		}).done(function() {
			setTimeout(function(){
				$("#overlay").fadeOut(300);
			},500);
		});
	});	
    </script>
<script type="text/javascript">
		function deleteItem(key) {
			var isDel = confirm('Are you sure want to delete this record');
			if (isDel == true) {
				$
						.getJSON(
								'${deleteItemOfBillNewItem}',
								{
									key : key,
									ajax : 'true',
								},
								function(data) {

									var len = data.length;
									if (len == 0) {
										document.getElementById("sbtbtn").disabled = true;
									}else
										{
										document.getElementById("sbtbtn").disabled = false;
										}
									$('#modeltable td').remove();
									$.each(
													data,
													function(key, item) {

														var tr = $('<tr></tr>');

														tr
																.append($(
																		'<td></td>')
																		.html(
																				key + 1));

														tr
																.append($(
																		'<td></td>')
																		.html(
																				item.itemName));

														tr
																.append($(
																		'<td style="text-align:right;"></td>')
																		.html(
																				item.orderQty));

														tr
																.append($(
																		'<td style="text-align:right;"></td>')
																		.html(
																				item.orderMrp));

														tr
																.append($(
																		'<td style="text-align:right;"></td>')
																		.html(
																				item.orderRate.toFixed(2)));
														var total = item.orderQty
																* item.orderRate;
														tr
																.append($(
																		'<td style="text-align:right;"></td>')
																		.html(
																				total
																						.toFixed(2)));

														tr
																.append($(
																		'<td style="text-align:center;"></td>')
																		.html(
																				"<a href='#' class='action_btn' onclick=deleteItem("
																						+ key
																						+ ")><abbr title='Delete'><i class='fa fa-trash-o  fa-lg'></i></abbr></a>"));

														$('#modeltable tbody')
																.append(tr);

													});
								});
			}
		}
	</script>
</body>
</html>