<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 
 <jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
 <jsp:include page="/WEB-INF/views/include/logout.jsp"></jsp:include>
 	<style>
 table{
  width:100%;
 
  border:1px solid #ddd;
}
 </style>
<body>
<script>
  $( function() {
    $( "#datepicker" ).datepicker({ dateFormat: 'dd-mm-yy' });
  } );
  $( function() {
    $( "#datepicker2" ).datepicker({ dateFormat: 'dd-mm-yy' });
  } );
  
  </script>
	<c:url var="getProductionOrderCurrentStock" value="/getProductionOrderCurrentStock" />
	<c:url var="getMenu" value="/getMenu" />	
	<c:url var="getProductionRegSpCakeOrder" value="/getProductionRegSpCakeOrder" />

	 


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
			
		 
				
						<div class="box">
			<div class="box-title">
				<h3>
					<i class="fa fa-bars"></i> Order Consultation 
				</h3>

			</div>

			<div ><!-- class="box-content" -->
			
				<div class="frm_Sec_one single">
					<div class="row">
						<div class="col-md-6 box_marg">
							<label class="control-label left">Category</label>
							<div class="controls icon_add">
							<i class="fa fa-road frm_icon" aria-hidden="true"></i>
							<select class="form-control padd_left chosen" onchange="getFgsMenues()"
									data-placeholder="Choose Category" name="selectCategory"
									id="selectCategory" tabindex="-1" data-rule-required="true">
									<option value="-1"><c:out value="" /></option>
									<c:forEach items="${unSelectedCatList}" var="unSelectedCat"
										varStatus="count">
										<c:choose>
											<c:when test="${unSelectedCat.catId==5}">
											
											</c:when>
											<c:otherwise>
												<option value="${unSelectedCat.catId}">
												<c:out value="${unSelectedCat.catName}" /></option>
											</c:otherwise>
										</c:choose>
									</c:forEach>

								</select>
							</div>
						</div>
						
						<div class="col-md-6 box_marg">
							<label class="control-label left">Section</label>
							<div class="controls icon_add">
							<i class="fa fa-road frm_icon" aria-hidden="true"></i>
							<select class="form-control padd_left chosen" onchange="getFgsMenues()"
									data-placeholder="Choose Category" name="sectionId"
									id="sectionId" tabindex="-1" data-rule-required="true">									
									<c:forEach items="${section}" var="section"
									varStatus="count">
									<option value="${section.sectionId}"><c:out
											value="${section.sectionName}" /></option>
								</c:forEach> 
								</select>
							</div>
						</div>
						
						<div class="col-md-6 box_marg">
							<label class="control-label left">Menu</label>
							<div class="controls icon_add">
							<i class="fa fa-road frm_icon" aria-hidden="true"></i>
							<select data-placeholder="Select Menu" multiple="multiple"
								class="form-control padd_left chosen-select chosen" name="selectMenu"
								tabindex="-1" id="selectMenu" data-rule-required="true">
							<option value="-1">ALL</option>
							</select>
							</div>
						</div>
						
						<div class="col-md-6 box_marg">
							<label class="control-label left">Production Date</label>
							<div class="controls icon_add">
							<i class="fa fa-road frm_icon" aria-hidden="true"></i>
							<input value="${todayDate}" class="form-control padd_left date-picker" id="datepicker" size="16"
											 type="text" name="production_date" required />
							</div>
						</div>
					</div>
				</div>	
			
			
				<div class="form-group">
					<div class="three_buttons">
						<input type="button" class="btn btn-primary" value="Search" id="callsearch" onclick="searchOrder()">						
						<button type="button" class="btn btn-primary">Cancel</button>
					</div>					
				</div>
				
				<div align="center" id="loader" style="display: none;background-color: white;">
						<span>
							<h4>
								<font color="#343690">Loading</font>
							</h4>
						</span> 
						<span class="l-1"></span> <span class="l-2"></span> <span
							class="l-3"></span> <span class="l-4"></span> 
					</div>
			
							
</div>
								 
								<div class="box">
								
								 <form action="submitProduction" method ="post">
						

									<div class="box-content">
									
									<div class="tableFixHead">
      <table id="table1">        
        <thead style="background-color: #f3b5db;">
		<tr class="bgpink">
			<th width="10" style="text-align: center;">Sr. No.</th>
			<th width="170" style="text-align: center;">Item Name</th>
			<th width="170" style="text-align: center;">Sub-Category</th>
			<th width="100" style="text-align: center;">Current Stock</th> 
			<th width="100" style="text-align: center;">Order Quantity</th>
			<th width="100" style="text-align: center;">P2</th>
		</tr>
	</thead>
	
        <tbody>
	   </tbody>
      </table>
    </div>
    </div>
    
    
    <div class="form-group">
    	<div class="frm_Sec_one single">
			<div class="row">
				<div class="col-md-6 box_marg">
					<label class="control-label left">Select</label>
					<div class="controls icon_add">
					<label class="radio-inline"> <input type="radio" name="orderType" class="order" value="0" id="or1" checked >
					 Add Order Qty
					</label>
					<label class="radio-inline"> <input type="radio" name="orderType" class="order" value="1" id="or2">
					 Add P2 Qty
					</label>
					</div>
				</div>
				
				<div class="col-md-6 box_marg">
					<label class="control-label left">Select Time Slot</label>
					<div class="controls icon_add">
						<i class="fa fa-road frm_icon" aria-hidden="true"></i>
						<select class="form-control padd_left chosen"
							data-placeholder="Choose Time Slot" name="selectTime"
							id="selectTime" tabindex="-1" data-rule-required="true">
							<c:forEach items="${productionTimeSlot}" var="productionTime"
								varStatus="count">
								<option value="${productionTime}"><c:out
										value="Time Slot ${productionTime}" /></option>
							</c:forEach>
						</select>
					</div>
				</div>
			</div>
		</div>			
    </div>
    
    <div class="form-group">
		<div class="three_buttons">
			<input type="submit" class="btn btn-primary" value="Submit" disabled id="callSubmit">
			<input type="button" id="expExcel" class="btn btn-primary" value="Export To Excel" onclick="exportToExcel();" disabled="disabled">
			<button type="button" class="btn btn-primary">Cancel</button>
		</div>					
	</div>
									
						
								
						</form>		
						</div>
						 
						<input type="hidden" id="p2val">
				 
			</div>
			<!-- END Main Content -->
			


			<a id="btn-scrollup" class="btn btn-circle btn-lg" href="#"><i
				class="fa fa-chevron-up"></i></a>
		</div>
		<!-- END Content -->
		
		<jsp:include page="/WEB-INF/views/include/copyrightyear.jsp"></jsp:include>
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

			function getFgsMenues() {
				$.getJSON('${getMenu}', {
					selectedCat : $("#selectCategory").val(),
					sectionId : $("#sectionId").val(),
					ajax : 'true'
				}, function(data) {
					
					var len = data.length;
					$('#selectMenu').find('option').remove().end()
					var html = '<option value="-1">ALL</option>';
					
					for ( var i = 0; i < len; i++) {

						html += '<option value="' +data[i].menuId+ '">'
						+ data[i].menuTitle + '</option>';

						/*  $("#selectMenu").append(

		                           $("<option ></option>").attr(

		                               "value", data[i].menuId).text(data[i].menuTitle)

		                       ); */

					} 
					html += '</option>';
					$("#selectMenu").html(html);

					$("#selectMenu").trigger("chosen:updated");

				});
			}

</script>
<script type="text/javascript">
	function searchOrder()
	{ 		
		$('#table1 td').remove();		
		
		var isValid = validate();
		
		if (isValid) {
			
			//document.getElementById("callsearch").disabled=true;
			var productionDate = document.getElementById("datepicker").value;
			var selectedMenu=$("#selectMenu").val();
			$('#loader').show();
			var calP2 = 0;
			var p2 = 0;
			var opStock=0;
			var sumP2=0;
			var sumbillQty = 0;
			var calCurrStk=0;
			var flag = false;
			$.getJSON('${getProductionOrderCurrentStock}',{
				
								selectedMenu_list : JSON.stringify(selectedMenu),
								productionDate : productionDate,
								ajax : 'true',

							},
							function(data) {						
								//$('#table_grid td').remove();
									var x=0;
								document.getElementById("callsearch").disabled=false;
								
								 if (data.fgsItemList=='') {
									$('#loader').hide();
									alert("No records found !");
									document.getElementById("callSubmit").disabled=true;
								} 
								  
								
								$.each(data.fgsItemList,function(key, order) {
									$('#loader').hide();
									if(order.openingStock>0){
										document.getElementById("callSubmit").disabled=false;
									}
								document.getElementById("expExcel").disabled=false;		
								
								calCurrStk = (order.openingStock+order.productionQty)-order.billQty;
								if(calCurrStk>0){
									opStock = calCurrStk
								}else{
									opStock = 0;
								}
								
								calP2 = order.orderQty-opStock;
								if(calP2>0){							
									p2 = calP2;
								}else{
									p2 = 0;
								}
								
								sumP2 = sumP2+p2;
								document.getElementById("p2val").value = sumP2;
								
								sumbillQty = sumbillQty+order.orderQty;								
								if(sumP2>0 || sumbillQty>0){
									document.getElementById("callSubmit").disabled=false;
								}else{
									document.getElementById("callSubmit").disabled=true;
								}
							
								if(order.orderQty>0){
								var tr = $('<tr></tr>');
									x=1;
							  	tr.append($('<td style="text-align: left;"></td>').html(key+1));	
								tr.append($('<td style="text-align: left; padding-left: 10%;"></td>').html(order.itemName+'-'+order.itemCode)); 
								tr.append($('<td style="text-align: left; padding-left: 10%;"></td>').html(order.subCatName)); 
								tr.append($('<td style="text-align:right; padding-right: 5%;"></td>').html(opStock));
								tr.append($('<td style="text-align: left; padding-left: 10%;"></td>').html(order.orderQty)); 
								tr.append($('<td style="text-align:right; padding-right: 5%;"></td>').html(p2));								 
								 
								$('#table1 tbody').append(tr);
								}
									
								});		
								if(parseInt(x)<1){
									alert("No records found !");
									document.getElementById("callSubmit").disabled=true;
								}
							});
		}
	}
	
	$('input[type=radio][name=orderType]').change(function() {
		   
	    var ordType = $('input[name="orderType"]:checked').val();	   
	    
	    if($("#p2val").val()==0 && ordType==1){
			document.getElementById("callSubmit").disabled=true;
		}else{
			document.getElementById("callSubmit").disabled=false;
		}
	    
	});
	</script>
	<script type="text/javascript">
		function validate() {
			var selectCategory= $("#selectCategory").val();
			var selectedMenu = $("#selectMenu").val();
			var selectOrderDate =$("#datepicker").val();
			

			var isValid = true;

			 if (selectCategory == "-1" || selectCategory == null) {

					isValid = false;
					alert("Please Select Category");

				}
				else

			 if (selectedMenu == "" || selectedMenu == null) {

				isValid = false;
				alert("Please Select Menu");

			}
			else if (selectOrderDate == "" || selectOrderDate == null) {

				isValid = false;
				alert("Please Select Order Date");
			}
			return isValid;

		}
		
		var specialKeys = new Array();
        specialKeys.push(8); //Backspace
        function IsNumeric(e) {
            var keyCode = e.which ? e.which : e.keyCode
            var ret = ((keyCode >= 48 && keyCode <= 57) || specialKeys.indexOf(keyCode) != -1);
            
            return ret;
        }
        
        function exportToExcel()
        {
        	 
        	window.open("${pageContext.request.contextPath}/exportToExcel");
        			document.getElementById("expExcel").disabled=true;
        }
	</script>


</body>
</html>