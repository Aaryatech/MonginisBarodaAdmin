<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

 	 <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/tableSearch.css">

<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<body>
	<jsp:include page="/WEB-INF/views/include/logout.jsp"></jsp:include>



	<c:url var="getItemsByBillNo" value="/getItemsByBillNo"></c:url>

	<c:url var="getBillForFr" value="/getBillForFr"></c:url>
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
				<h1>
					<i class="fa fa-file-o"></i>Manual Grn /GVN
				</h1>
				<!-- <h4>Franchise Manual Grn</h4> -->
			</div>
		</div>
		<!-- END Page Title -->

		<!-- BEGIN Breadcrumb -->
<%-- 		<div id="breadcrumbs">
			<ul class="breadcrumb">
				<li><i class="fa fa-home"></i> <a
					href="${pageContext.request.contextPath}/home">Home</a> <span
					class="divider"><i class="fa fa-angle-right"></i></span></li>
				<!-- 	<li class="active">Sell Transaction<span
					class="divider"><i class="fa fa-angle-right"></i></span></li>	
				<li class="active">Franchise Opening Stock</li> -->
			</ul>
		</div> --%>
		<!-- END Breadcrumb -->

		<!-- BEGIN Main Content -->
		<div class="box">
			<div class="box-title">
				<h3>
					<i class="fa fa-bars"></i>Menu
				</h3>

			</div>

			<div><!-- class="box-content" -->
				<div class="frm_Sec_one single">
					<div class="row">
						<div class="col-md-3 box_marg">
							<label class="control-label left">Select Franchise</label>
							<div class="controls icon_add">
							<i class="fa fa-road frm_icon" aria-hidden="true"></i>
							<select class="form-control padd_left chosen " tabindex="6" id="selectFr"
								name="selectFr" onchange="getBills()">
								<option value="-1">Select Franchisee</option>
								<c:forEach items="${frList}" var="fr" varStatus="count">
									<option value="${fr.frId}"><c:out value="${fr.frName}"/></option>
								</c:forEach>
							</select>
							</div>
					   </div>
					   
					   <div class="col-md-3 box_marg">
							<label class="control-label left">Select Bill</label>
							<div class="controls icon_add">
							<i class="fa fa-road frm_icon" aria-hidden="true"></i>
							<select data-placeholder="Choose Bill"
								class="form-control padd_left chosen" onchange="setRadio()" tabindex="6" id="selectMenu"
								name="selectMenu">
							</select>
							</div>
					   </div>

						<div class="col-md-3 box_marg">
							<label class="control-label left">Save Grn or GVN</label>
							<div class="controls icon_add">

								<input class="padd_right" id="saveGrn" value="1" checked
									type="radio" name="isSaveGrnGvn" /> GRN
								&nbsp;&nbsp;&nbsp;&nbsp; <input class="padd_right" id="saveGvn"
									value="0" type="radio" name="isSaveGrnGvn" /> GVN

							</div>
						</div>


						<div class="col-md-5 box_marg">
							<div class="three_buttons">
								<button class="btn btn-primary" onclick="getItems()">Search</button>
								<input type="button" class="btn btn-primary" value="Cancel"">
							</div>
						</div>


					</div>
				</div>	
			</div>		
			
			<!-- <div class="form-group">
			<div class="col-md-4 box_marg">
					<label class="control-label left">Save Grn or GVN</label>
					<div class="controls icon_add">
					 
					<input class="padd_right" id="saveGrn" value="1" checked
											type="radio" name="isSaveGrnGvn"/> GRN &nbsp;&nbsp;&nbsp;&nbsp;
											<input class="padd_right" id="saveGvn"  value="0"
											type="radio" name="isSaveGrnGvn"/> GVN
											
					</div>
			   </div>
			   <div class="col-md-4 box_marg">
				<div class="three_buttons">
					<button class="btn btn-primary" onclick="getItems()">Search</button>
					<input type="button" class="btn btn-primary" value="Cancel"">
				</div>					
		    </div>	</div> -->	
			
			
				<div class="box-content">
				<div class="row">
					<div class="col-md-9"></div> 
					<label for="search" class="col-md-3" id="search">
    				<i class="fa fa-search"></i>
					<input type="text"  style="border-radius:25px;" id="myInput" onkeyup="myFunction()" style="border-radius: 25px;" placeholder="Search by ItemName" >
					</label>  
				</div>
				</div>
				<div class="box-content">
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
			
		
			<div class="box-title">
				<h3>
					<i class="fa fa-list-alt"></i>Items For Manual Grn/GVN
				</h3>

			</div>

			<form id="openingStockForm"
				action="${pageContext.request.contextPath}/insertManGrn"
				method="post"  onsubmit="btnSubmit.disabled = true; return confirm('Do you want to save Grn /Gvn ?');">
				<input type="hidden" id="isSaveGrnGvn_N" name="isSaveGrnGvn_N" value="0">
				<div class=" box-content">
				
				<div class="tableFixHead">
	<table id="table_grid">        
	<thead style="background-color: #f3b5db;">
		<tr class="bgpink">
			<th style="text-align: center;" >SELECT</th>
			<th style="text-align: center;" >Invoice</th>
			<th style="text-align: center;" width="30%" >Item Name</th>
			<th style="text-align: center;" > Type</th>
			<th style="text-align: center;" >Pur Quantity</th>
			<th style="text-align: center;" >Rate</th>
			<th style="text-align: center;" >Qty</th>
			<th style="text-align: center;" >Tax %</th>
			<th style="text-align: center;" >Taxable Amt</th>
			<th style="text-align: center;" >Tax Amt</th>
			<th style="text-align: center;" >Amount</th>
			<th style="text-align: center;" >Remark</th>
		</tr>
	</thead>

	<tbody>
	</tbody>
	</table>
</div>
</div>
		<div class="frm_Sec_one single">
			<div class="row">
				<div class="col-md-4 box_marg">
					<label class="control-label left">Date</label>
					<div class="controls icon_add">
					<i class="fa fa-road frm_icon" aria-hidden="true"></i>
					<input class="form-control padd_left date-picker" id="date" size="19" placeholder="dd-mm-yyyy"
											type="text" name="date"  required/>
					</div>
			   </div>
			   
			   
			   
			</div>
		</div>	
		
		<div class="form-group">
			<div class="three_buttons">
				<input type="submit" class="btn btn-primary" value="Submit"  id="btnSubmit"   disabled="disabled">
				<input type="button" class="btn btn-primary" value="Cancel">
			</div>					
	    </div>		

				
			</form>
		</div>
	</div>
	<!-- END Main Content -->

	<footer>
		<p>2019 © Monginis.</p>
	</footer>

	<a id="btn-scrollup" class="btn btn-circle btn-lg" href="#"><i
		class="fa fa-chevron-up"></i></a>

	<script type="text/javascript">
	/* $('#selectMenu').change(function(){
		
		}); */
	function setRadio(){
		document.getElementById("saveGrn").disabled=false;
		   document.getElementById("saveGvn").disabled=false;
		   $('#table_grid td').remove();
	}
				function getBills() {
					var selectedFr = $("#selectFr").val();
					$('#table_grid td').remove();
					$('#loader').show();
					$.getJSON('${getBillForFr}', {
						fr_id: selectedFr,
						ajax : 'true'
					}, function(data) {
						
						var len = data.length;
						
						$('#selectMenu')
					    .find('option')
					    .remove()
					    .end()
					    
			
						 $("#selectMenu").append(
	                                $("<option></option>").attr(
	                                    "value",'-1').text('Select Bill')
	                            );		
								
						for ( var i = 0; i < len; i++) {
							
					          
	                        $("#selectMenu").append(
	                                $("<option></option>").attr(
	                                    "value", data[i].billNo).text(data[i].invoiceNo+ " [" +data[i].billDate+" ]")
	                            );
						}
					 
						   $("#selectMenu").trigger("chosen:updated");
						   document.getElementById("saveGrn").disabled=false;
						   document.getElementById("saveGvn").disabled=false;
						   $('#loader').hide();
					});
				}
			</script>


	<script type="text/javascript">
				function getItems() {
//alert($('#saveGvn').val());

$('#table_grid td').remove();
					var bill = $("#selectMenu").val();
					var isGrn=$('input[name="isSaveGrnGvn"]:checked').val();
					//alert(isGrn)
					document.getElementById("isSaveGrnGvn_N").value=isGrn;
					if(parseInt(isGrn)==0){
						document.getElementById("saveGrn").disabled=true;
						}else{
							document.getElementById("saveGvn").disabled=true;
						}
					//alert(bill);
					$('#loader').show();
					
					$.getJSON('${getItemsByBillNo}', {
						bill_no: bill,
						isGrn : isGrn,
						ajax : 'true'
					}, function(data) {
						//alert(data);
						
						if(data == null || data == ""){
							alert("No Record Found ")
							$('#loader').hide();
							$("#btnSubmit").attr("disabled", true);
							$('#table_grid td').remove();
						}
						var len = data.length;
						$('#btnSubmit').removeAttr("disabled");

						$('#table_grid td').remove();
						
						
						/* if (data == "" || data==null) {
							alert("No Items found !!");
							$('#submitStock').hide();
						}else{
							$.each(data,function(key, bill) { */
					
								$.each(data,function(key, bill) {
							//	alert(JSON.stringify(bill))
							var tr = $('<tr></tr>');

						  /* 	tr.append($('<td></td>').html(key+1)); */
														
						tr.append($('<td></td>').html("<input type=checkbox  id=check"+bill.billDetailNo+" name="+bill.billDetailNo+" value="+bill.billDetailNo+">"));
						  
						  						  	//tr.append($('<td></td>').html(bill.invoiceNo));


						  	tr.append($('<td></td>').html(bill.invoiceNo));

						  	tr.append($('<td></td>').html(bill.itemName));
						  	//var grnType;
						  	var grnType=bill.grnType;
						  //	alert("GRN TYPE " +bill.grnType);
						  	
						  	/* if(bill.grnType==0){
						  		 grnType="Grn 1";
						  	}
						  	else 	if(bill.grnType==1){
						  		 grnType="Grn 2";}
						  	else 	if(bill.grnType==2 || bill.grnType==4){
						  		 grnType="Grn 3";} */
						  		if(parseInt(isGrn)==0){
						  			tr.append($('<td></td>').html(100));
						  	}else{
						  		
						  		tr.append($('<td></td>').html(grnType));
						  		
						  	}
						  	
						  	tr.append($('<td></td>').html(bill.billQty));
						  	var calTaxAmt=bill.rate*bill.igstPer/100;
						  	var dispRate=bill.rate+calTaxAmt;
						  	tr.append($('<td></td>').html(Math.round(dispRate)));
						  	
						  //	tr.append($('<td></td>').html(bill.rate));

						 	tr.append($('<td></td>').html("<input type=text  onkeyup='return calcGrn("+bill.billQty+","+bill.grnType+","+bill.rate+","+bill.itemId+","+bill.sgstPer+","+bill.cgstPer+","+bill.cessPer+","+bill.billDetailNo+","+bill.discPer+","+parseInt(isGrn)+")' ondrop='return false;' onpaste='return false;' style='text-align: center;' class='form-control' min=0 id=qty"+bill.billDetailNo+" name=qty"+bill.billDetailNo+" Value="+0+" >"));
						  	tr.append($('<td></td>').html(bill.igstPer));
						  	tr.append($('<td id=taxable_amt'+bill.billDetailNo+'></td>').html(""));
						  	tr.append($('<td id=tax_amt'+bill.billDetailNo+'></td>').html(""));
						  	tr.append($('<td id=grn_amt'+bill.billDetailNo+'></td>').html(""));
						  	
						  	tr.append($('<td></td>').html(""));

						 	//tr.append($('<td></td>').html(' <a>   <span class="glyphicon glyphicon-edit" id="edit'+bill.billNo+'" onClick=editQty('+bill.billNo+');> </span> </a><a><span class="glyphicon glyphicon-remove" id="delete'+bill.billDetailNo+'" onClick=deleteOrder('+bill.billDetailNo+');> </span></a>'));
						 
							$('#table_grid tbody').append(tr);

						})
						$('#loader').hide();
					
		    });
					
		    
		}
			</script>





	<script type="text/javascript">
	
				function validate() {
				
					var selectedMenu = $("#selectMenu").val();

					var isValid = true;

					if (selectedFr == "-1" || selectedFr == null) {

						isValid = false;
						alert("Please select Franchise");

					} else if (selectedMenu == "" || selectedMenu == null) {

						isValid = false;
						alert("Please select Menu");

					}
					return isValid;

				}
				
				function calcGrn(billQty,grnType,rate,itemId,sgstPer,cgstPer,cessPer,dNo,discPer,isGrn) {
				
					document.getElementById("check"+dNo).checked = false;
				    var grnQty =document.getElementById("qty"+dNo).value;
				    if(isGrn==0){
				    	grnType=100;	
				    }
				    
				    if(parseInt(grnQty)>billQty){
						alert("Grn Quantity can not be greater than Purchase Quantity");
						
						document.getElementById("qty"+dNo).value=0;
						
						$("#grn_amt"+dNo).html(0.00);
						$("#taxable_amt"+dNo).html(0.00);
						$("#tax_amt"+dNo).html(0.00);
						
						document.getElementById("check"+dNo).checked = false;
						
					}else{
				    if(grnQty>0)
					{
					document.getElementById("check"+dNo).checked = true;
				
					}
					var baseRate=rate;
					
					var grnBaseRate;
					var grnRate;
					var grnRate=rate;
					grnBaseRate = baseRate * grnType / 100;
					 grnRate=(rate * grnType) / 100;
					 
					 if(grnType==0){
							 grnRate=rate;
							grnBaseRate = baseRate * 100 / 100;
							 grnRate=(rate * 100) / 100;
						}
					 
				    /* if(grnType==0){
						var grnRate=rate;
						grnBaseRate = baseRate * 85 / 100;
						 grnRate=(rate * 85) / 100;
					}
				 if(grnType==1){

						var grnRate=rate;
						grnBaseRate = baseRate * 75 / 100;
						grnRate=(rate * 75) / 100;
					
						}
				 
						if(grnType==2){
						var grnRate=rate;
						grnBaseRate=baseRate;
						grnRate=rate;
						
						}
						
						if(grnType==4){
							
							var grnRate=rate;
							grnBaseRate=baseRate;
							grnRate=rate;
							
							} */
						var totTaxPer=parseFloat(sgstPer)+parseFloat(cgstPer)+parseFloat(cessPer);
						var taxableAmt=grnBaseRate*grnQty;
						//alert("prev taxableAmt " +taxableAmt)

						var discAmt=(taxableAmt*discPer)/100;
						//alert("disc  " +discAmt)

						taxableAmt=taxableAmt-discAmt;
						//alert("new  taxableAmt " +taxableAmt)

						var totalTax=taxableAmt*(cgstPer+sgstPer+cessPer)/100;
						var grandTotal=taxableAmt+totalTax;
						//alert("taxable " +taxableAmt);
						//alert("totalTax " +totalTax);
						//alert("grandTotal " +grandTotal);
					$("#grn_amt"+dNo).html(grandTotal.toFixed(2));
					$("#tax_per"+dNo).html(totTaxPer.toFixed(2));
					$("#taxable_amt"+dNo).html(taxableAmt.toFixed(2));
					$("#tax_amt"+dNo).html(totalTax.toFixed(2));
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
</body>
</html>