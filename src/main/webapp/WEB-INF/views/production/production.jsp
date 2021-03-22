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
			<!-- BEGIN Page Title -->
		<!-- 	<div class="page-title">
				<div>
					<h1>
						<i class="fa fa-file-o"></i>Production
					</h1>

				</div>
			</div> -->
			<!-- END Page Title -->



			<!-- BEGIN Main Content -->
		 
				
						<div class="box">
			<div class="box-title">
				<h3>
					<i class="fa fa-bars"></i> Order Consultation
				</h3>

			</div>

			<div class="box-content">
				<div class="row">	 
				<!-- 		<div class="box-title">
							<h3>
								<i class="fa fa-bars"></i> Search Production Order
							</h3>
							<div class="box-tool">
								<a href="">Back to List</a> <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a>
							</div>
							<div class="box-tool">
								<a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a> <a data-action="close" href="#"><i
									class="fa fa-times"></i></a>
							</div>
						</div>

			<div class="box-content">
						<div class="row" > -->
						
					<div class="form-group">
						<label class="col-md-2 control-label menu_label">Category
							</label>
							<div class="col-md-4 controls">

								<select class="form-control chosen" onchange="getFgsMenues()"
									data-placeholder="Choose Category" name="selectCategory"
									id="selectCategory" tabindex="-1" data-rule-required="true">

									<option value="-1"><c:out value="" /></option>

									<c:forEach items="${unSelectedCatList}" var="unSelectedCat"
										varStatus="count">
										<c:choose>

											<c:when test="${unSelectedCat.catId==5}">
											</c:when>
											<c:otherwise>
												<option value="${unSelectedCat.catId}"><c:out
														value="${unSelectedCat.catName}" /></option>
											</c:otherwise>
										</c:choose>
									</c:forEach>

								</select>
							</div>
							
							<label class="col-md-2 control-label menu_label">Section
							</label>
							<div class="col-md-4 controls">

								<select class="form-control chosen" onchange="getFgsMenues()"
									data-placeholder="Choose Category" name="sectionId"
									id="sectionId" tabindex="-1" data-rule-required="true">

									<option value="-1"><c:out value="" /></option>
									<c:forEach items="${section}" var="section"
									varStatus="count">
									<option value="${section.sectionId}"><c:out
											value="${section.sectionName}" /></option>
								</c:forEach> 
								</select>
							</div>
					</div>	<br><br>					
						
						
					<div class="form-group">

							

							<label class="col-md-2 control-label menu_label">Menu</label>
									<div class="col-md-4 controls">
										<select data-placeholder="Select Menu" multiple="multiple"
											class="form-control chosen-select chosen" name="selectMenu"
											tabindex="-1" id="selectMenu" data-rule-required="true">
										<option value="-1">ALL</option>
										</select>
									</div>


								<!-- </div><br></br>

								<div class="form-group"><div class="col-md-1"></div> -->
				<label class=" col-md-1 control-label menu_label">Production
										Date</label>
									<div class="col-md-2 controls">
										<input value="${todayDate}" class="form-control date-picker" id="datepicker" size="16"
											 type="text" name="production_date" required />
									</div>





							
	<!-- </div>
								<div class="row" align="center">
									<div
										class="col-md-12"> -->
										<input type="button" class="btn btn-primary" value="Search" id="callsearch"
											onclick="searchOrder()">

									<!-- </div> -->
								</div>	</div>

</div>
								<div align="center" id="loader" style="display: none;background-color: white;">

									<span>
										<h4>
											<font color="#343690">Loading</font>
										</h4>
									</span> <span class="l-1"></span> <span class="l-2"></span> <span
										class="l-3"></span> <span class="l-4"></span> <span
										class="l-5"></span> <span class="l-6"></span>
								</div>
</div>
								 
								<div class="box">
								<!-- 	<div class="box-title">
										<h3>
											<i class="fa fa-table"></i>  Production List
										</h3>
										<div class="box-tool">
											<a data-action="collapse" href="#"><i
												class="fa fa-chevron-up"></i></a>
											<a data-action="close" href="#"><i class="fa fa-times"></i></a>
										</div>
									</div>
									 -->
									
								 <form action="submitProduction" method ="post">
						

									<div class="box-content">
<div id="table-scroll" class="table-scroll">
							 
									<!-- <div id="faux-table" class="faux-table" aria="hidden">
									<table id="table2" class="table table-advance" border="1">
											<thead>
												<tr class="bgpink">
	                                                 	<th width="60" style="width: 50px">Sr No</th>
														<th width="100">Item Id</th>
														<th width="170">Item Name</th> 
														<th width="100">Current Opening Qty</th>
														<th width="100">Order Quantity</th>
												</thead>
												</table>
									
									</div> -->
									
									
							<div class="table-wrap">

								<table id="table1" class="table table-advance">
									<thead>
										<tr class="bgpink">
											<th width="10" style="text-align: center;">Sr. No.</th>
											<!-- <th width="100" style="text-align: center;">Item Id</th> -->
											<th width="170" style="text-align: center;">Item Name</th>
											<th width="170" style="text-align: center;">Sub-Category</th>
											<th width="100" style="text-align: center;">Current Stock</th> 
											<th width="100" style="text-align: center;">Order
												Quantity</th>
											<th width="100" style="text-align: center;">P2</th>
										</tr>
									</thead>

									<!-- <div class="col-md-12 table-responsive" >
										 
											<table width="60%" class="table table-advance " id="table1" name="table1" align="left">
												<thead>
													<tr>
														<th width="18" style="width: 18px">Sr No</th>
														<th width="50">Item Id</th>
														<th width="100">Item Name</th> 
														<th width="100">Current Opening Qty</th>
														<th width="100">Order Quantity</th>
													</tr>
												</thead> -->
									<tbody>

									</tbody>

								</table>
							</div>
							<br/>
							<div class="form-group">
											<label class="col-sm-3 col-lg-2 control-label">Select
												</label> 
										<label class="col-sm-3 col-lg-2 control-label">
												<input type="radio" name="orderType" class="order" value="0"
												id="or1" checked > <label
												for="or1"> Add Order Qty</label>
											</label>
									 <label class="col-sm-3 col-lg-2 control-label"> <input
												type="radio" name="orderType" class="order" value="1"
												id="or2"> <label
												for="or2"> Add P2 Qty</label>
											</label> 
										</div>
							
							<!-- <div class="table-wrap">

								<table id="table2" class="table table-advance">
									<thead>
										<tr class="bgpink">
											<th width="10" style="text-align: center;">Sr. No.</th>		
											<th width="170" style="text-align: center;">Sub-Category</th>
											<th width="100" style="text-align: center;">Current Stock</th> 
											<th width="100" style="text-align: center;">Order
												Quantity</th>
											<th width="100" style="text-align: center;">P2</th>
										</tr>
									</thead>								
									<tbody>
									</tbody>
								</table>
							</div> -->




<br/><br/>
							<div class="form-group col-md-8" align="left" style="display: none;">
								<label class=" col-md-3   "></label> <label class=" col-md-3   ">Select
									Time Slot </label>
								<div class="col-md-6 controls">

									<select class="form-control chosen"
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
							<br/>
							<div class="row" align="center">
									<div
										class="col-md-12">
								<input type="submit" class="btn btn-primary"
								  value="Submit" disabled id="callSubmit">
								   <input type="button" id="expExcel" class="btn btn-primary" value="Export To Excel" onclick="exportToExcel();" disabled="disabled">
						 </div>
</div>


<%-- 
									<div align="center" class="form-group">
								<div class="col-sm-5 " align="center">

										Select Time Slot <select class="form-control" data-placeholder=" Choose Time Slot"
											tabindex="-1" name="selectTime" id="selectTime" data-rule-required="true">

										
											<c:forEach items="${productionTimeSlot}" var="productionTime"
													varStatus="count">
												<option value="${productionTime}"><c:out value="Time Slot ${productionTime}"/></option>
												</c:forEach>
										
										
										</select>
										</div>
									<div
										class="col-sm-25 col-sm-offset-3 col-lg-30 col-lg-offset-0">
										<input type="submit" class="btn btn-primary" value="Submit" id="callSubmit">


									</div>--%>
								</div> 
								</div>
						</form>		
						</div>
						 
						<input type="hidden" id="p2val">
				 
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
								
								var tr = $('<tr></tr>');

							  	tr.append($('<td style="text-align: left;"></td>').html(key+1));	
								tr.append($('<td style="text-align: left; padding-left: 10%;"></td>').html(order.itemName+'-'+order.itemCode)); 
								tr.append($('<td style="text-align: left; padding-left: 10%;"></td>').html(order.subCatName)); 
								tr.append($('<td style="text-align:right; padding-right: 5%;"></td>').html(opStock));
								tr.append($('<td style="text-align: left; padding-left: 10%;"></td>').html(order.orderQty)); 
								tr.append($('<td style="text-align:right; padding-right: 5%;"></td>').html(p2));								 
								 
								$('#table1 tbody').append(tr);
									
								});		
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