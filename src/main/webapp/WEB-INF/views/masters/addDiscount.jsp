<%@page import="com.ats.adminpanel.model.franchisee.SubCategory"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page
	import="java.io.*, java.util.*, java.util.Enumeration, java.text.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html oncontextmenu="return false">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<title>Monginis</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!--base css styles-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/data-tables/bootstrap3/dataTables.bootstrap.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/assets/bootstrap-fileupload/bootstrap-fileupload.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/assets/chosen-bootstrap/chosen.min.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/assets/bootstrap-timepicker/compiled/timepicker.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/assets/clockface/css/clockface.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/assets/bootstrap-datepicker/css/datepicker.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/assets/bootstrap-daterangepicker/daterangepicker.css" />

<!--page specific css styles-->

<!--flaty css styles-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/flaty.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/flaty-responsive.css">

<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/img/favicon.png">

<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/common.js"></script>

<!--basic scripts-->

<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
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
<!-- http://forum.springsource.org/showthread.php?110258-dual-select-dropdown-lists -->
<!-- http://api.jquery.com/jQuery.getJSON/ -->

<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/assets/jquery-validation/dist/jquery.validate.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/assets/jquery-validation/dist/additional-methods.min.js"></script>
<jsp:include page="/WEB-INF/views/include/logout.jsp"></jsp:include>
<style type="text/css">
select {
    width: 180px;
    height: 30px;
}
</style>


</head>
<body>
  <c:url var="setAllFrIdSelected"  value="/setAllFrIdSelectedForDisc" />
	<c:url var="setAllItemSelected" value="/setAllItemSelected" />

	<c:url var="findItemsByCatId" value="/getItemsByCatagoryID" />
	<c:url var="findAllMenus" value="/getAllMenus" />
	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>


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
						<i class="fa fa-file-o"></i> Franchisee
					</h1>-->
				</div>
			</div> 
			<!-- END Page Title -->


			<!-- BEGIN Main Content -->
			<div class="row">
				<div class="col-md-12">
					<div class="row">
						<div class="col-md-12">
							<div class="box">
								<div class="box-title">
									<h3>
										<i class="fa fa-bars"></i> Add Discount 
									</h3>
									<div class="box-tool" >
										<a href="${pageContext.request.contextPath}/showDiscountList">Discount
											List</a> <a data-action="collapse" href="#"><i
											class="fa fa-chevron-up"></i></a>
									</div>
								</div>


								<c:set var="allFranchiseeAndMenuList"
									value="${allFranchiseeAndMenuList}" />
								<div >
									<form action="${pageContext.request.contextPath}/addDiscountProcess" class="form-horizontal"
										id="validation-form" method="post">
                                      
                    <input type="hidden" name="discId" id="discId"  value="${discount.discId}"/>
									<!-- <div class="form-group">
										<label class="col-sm-3 col-lg-2 control-label">Select Franchisee</label>
											<div class="col-sm-9 col-lg-10 controls">
												<select data-placeholder="Select Franchisee" name="fran[]"
													class="form-control chosen" tabindex="-1" id="fran" multiple="multiple"
													data-rule-required="true">
                                                </select>
										</div>
									</div>
 -->
 
 
 			<div class="frm_Sec_one single">									
				<div class="row">
					<div class="col-md-4 box_marg">
						<label class="control-label left">Franchisee</label>
							<div class="controls icon_add">
								<i class="fa fa-home frm_icon" aria-hidden="true"></i>
								<select data-placeholder="Select Franchisee" name="fr_id"
								class="form-control padd_left chosen" tabindex="-1" id="fr_id" multiple="multiple"
								data-rule-required="true">
								<option value="">Select Franchise</option>
								<option value="-1" >All</option>
									<c:choose>
									<c:when test="${isEdit==1}">
									
									<c:forEach	items="${selectedFr}"	var="frList">
										<option value="${frList.frId}" selected>${frList.frName}</option>
									</c:forEach>
									
									<c:forEach	items="${nonSelectedFr}"	var="frList">
										<option value="${frList.frId}" >${frList.frName}</option>
									</c:forEach>
									</c:when>
									<c:otherwise>
										<c:forEach
										items="${allFranchiseeAndMenuList.getAllFranchisee()}"
										var="franchiseeList">
										<option value="${franchiseeList.frId}">${franchiseeList.frName}</option>
	
									</c:forEach>
									</c:otherwise>
									</c:choose>
	
							</select>
							
							</div> <span class="span_err" id="err_fr" >Select Franchise</span>
					</div>
					
					
					<div class="col-md-4 box_marg">
						<label class="control-label left">Category</label>
							<div class="controls icon_add">
								<i class="fa fa-list-ul frm_icon" aria-hidden="true"></i>
								<select data-placeholder="Select Menu" name="catId"
													class="form-control padd_left chosen" tabindex="-1" id="catId"
													data-rule-required="true">                                           
													<option value="">Select Category</option>
													<!-- </optgroup> -->
														<c:forEach	items="${mCategoryList}" var="cat">
															<c:choose>
															<c:when test="${cat.catId==discount.categoryId}">
															<option value="${cat.catId}" selected>${cat.catName}</option>
															</c:when>
															<c:otherwise>
												     		<option value="${cat.catId}">${cat.catName}</option>
															</c:otherwise>
															</c:choose>

														</c:forEach>
														
												</select>
							
							</div> <span class="span_err" id="err_cat" >Select Category</span>
					</div>
					
					<div class="col-md-3 box_marg">
						<label class="control-label left" for="credit_days">Discount %</label>
							<div class="controls icon_add">
								<i class="fa fa-money frm_icon" aria-hidden="true"></i>
								<input type="text" name="disc_per" id="disc_per"
											placeholder="Discount %" class="form-control padd_left"
											data-rule-required="true" data-rule-number="true" value="${discount.discPer}"/>
								
							</div> <span class="span_err" id="err_dis" >Enter Discount</span>
					</div>
					
					
					<div class="clr"></div>
					<div class="col-md-4 box_marg">
						<label class="control-label left" for="credit_days">Status</label>
							<div class="controls icon_add">
								<c:choose>
													<c:when test="${discount.isActive==0}">

					<label class="radio-inline"> <input type="radio" name="is_active" id="optionsRadios1" value="1" /> Active </label>
                    <label class="radio-inline"> <input type="radio" name="is_active" id="optionsRadios1" value="0" checked/> In-Active</label>

													</c:when>
													<c:when test="${discount.isActive==1}">
													
														<label class="radio-inline"> <input type="radio"
															name="is_active" id="optionsRadios1" 
															value="1" checked/> Active
														</label>
														<label class="radio-inline"> <input type="radio"
															name="is_active" id="optionsRadios1" value="0" />
															In-Active
														</label>
													</c:when>
													<c:otherwise>
														<label class="radio-inline"> <input type="radio"
															name="is_active" id="optionsRadios1" 
															value="1" checked="checked"/> Active
														</label>
														<label class="radio-inline"> <input type="radio"
															name="is_active" id="optionsRadios1" value="0" />
															In-Active
														</label>
													</c:otherwise>

												</c:choose>
							</div>
					</div>
					
					<div class="col-md-7 box_marg">
						<label class="control-label left">Items</label>
							<div class="controls icon_add">
								<i class="fa fa-coffee frm_icon" aria-hidden="true"></i>
								<select data-placeholder="Select Items" name="items"
													class="form-control padd_left chosen" tabindex="-1" id="items" multiple="multiple"
													data-rule-required="true">
														<option value="">Select Items</option>
                                                   	<c:choose>
														<c:when test="${isEdit==1}">
															<option value="-1" >All</option>
														<c:forEach	items="${selectedItems}"	var="item">
															<option value="${item.id}" selected>${item.name}</option>
														</c:forEach>
														
														<c:forEach	items="${nonSelectedItems}"	var="item">
															<option value="${item.id}" >${item.name}</option>
														</c:forEach>
														</c:when>
														<c:otherwise>
																<c:forEach	items="${selectedItems}"	var="item">
															<option value="${item.id}" >${item.name}</option>
														</c:forEach>
														
														<c:forEach	items="${nonSelectedItems}"	var="item">
															<option value="${item.id}" >${item.name}</option>
														</c:forEach>
														</c:otherwise>
														</c:choose>
												</select>
												
								
							</div> <span class="span_err" id="err_item" >Select Items </span>
					</div>
					<div class="clr"></div>
					
					<div class="col-md-2 box_marg">
						<div class=" three_buttons one_row">
						
							<input type="submit" class="btn btn-primary" value="Submit" id="sub_btn">
                           	<button type="button" class="btn btn-primary" onclick="window.location.reload()" >Cancel</button>

						<div class="clr"></div>
						
					</div> 
					</div>
					
					<!-- <div class="col-md-2 box_marg">
											<div class=" three_buttons one_row">
									<input type="submit" class="btn btn-primary" value="Submit">
                           	<button type="button" class="btn btn-primary">Cancel</button>
									</div>
										
									
						</div> -->
					
					
				</div>
			</div>
							
										

										

											 <!-- <div class="row" style="text-align: right; padding: 15px 40px;">
						
							<input type="submit" class="btn btn-primary" value="Submit">
                           	<button type="button" class="btn btn-primary">Cancel</button>

						<div class="clr"></div>
						
					</div>  -->
										    
                            			

									</form>

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
 <script
	src="${pageContext.request.contextPath}/resources/assets/bootstrap/js/bootstrap.min.js"></script> 
<script>
$(function() {
    $('#typeselector').change(function(){
        $('.formgroup').hide();
        $('#' + $(this).val()).show();
    });
});
</script>
<!-- <script>
$('#select_all').click(function() {
	
    $('#items option').prop('selected', true);
    $('#items').chosen('destroy').val(["hola","mundo","cruel"]).chosen();
});
</script> -->

<script type="text/javascript">
$(document).ready(function() {
	
	
    $('#catId').change(
            function() {
            	
                $.getJSON('${findItemsByCatId}', {
                	cat_id : $(this).val(),
                    ajax : 'true'
                }, function(data) {
                	
                    var len = data.length;

					$('#items')
				    .find('option')
				    .remove()
				    .end()
				 $("#items").append($("<option></option>").attr( "value",-1).text("ALL"));
                    for ( var i = 0; i < len; i++) {
                            
                                
                        $("#items").append(
                                $("<option></option>").attr(
                                    "value", data[i].id).text(data[i].name)
                            );
                    }

                    $("#items").trigger("chosen:updated");
                });
            });
});
</script>
<!-- 

<script type="text/javascript">
$(document).ready(function() { 
	$('#fr_id').change(
			function() {
				$.getJSON('${findAllMenus}', {
					fr_id : $(this).val(),
					ajax : 'true'
				}, function(data) {
					
					var html = '<option value="">Menu</option>';
				
					var len = data.length;
					
					$('#menu')
				    .find('option')
				    .remove()
				    .end()
				    
				 $("#menu").append(
                                $("<option></option>").attr(
                                    "value", 0).text("Select Menu")
                            );
					
					for ( var i = 0; i < len; i++) {
                        $("#menu").append(
                                $("<option></option>").attr(
                                    "value", data[i].menuId).text(data[i].menuTitle)
                            );
					}
					   $("#menu").trigger("chosen:updated");
				});
			});
});
</script>
 -->
<script type="text/javascript">
$(document).ready(function() { // if all label selected set all items selected
	
$('#items').change(
		function () {
			 var selected=$('#items').val();
			 var catId=$('#catId').val();
			 
        if(selected==-1){
			$.getJSON('${findItemsByCatId}', {
				cat_id :catId,
				ajax : 'true'
			}, function(data) {
				var html = '<option value="">Items</option>';
			
				var len = data.length;
				
				$('#items')
			    .find('option')
			    .remove()
			    .end()
			
				for ( var i = 0; i < len; i++) {
    
                   $("#items").append(
                           $("<option selected></option>").attr(
                               "value", data[i].id).text(data[i].name)
                       );
				}
		
				   $("#items").trigger("chosen:updated");
			});
  }
});
});



</script>
<script type="text/javascript">
$(document).ready(function() { // if all label selected set all items selected
	
$('#fr_id').change(
		function () {
			 var selected=$('#fr_id').val();
	
        if(selected==-1){
			$.getJSON('${setAllFrIdSelected}', {
			//	selected : selected,
				ajax : 'true'
			}, function(data) {
				var html = '<option value="">Select Franchise</option>';
			
				var len = data.length;
				
				$('#fr_id')
			    .find('option')
			    .remove()
			    .end()
				 $("#fr_id").append($("<option></option>").attr( "value",-1).text("ALL"));

				for ( var i = 0; i < len; i++) {
    
                   $("#fr_id").append(
                           $("<option selected></option>").attr(
                               "value", data[i].frId).text(data[i].frName)
                       );
				}
		
				   $("#fr_id").trigger("chosen:updated");
			});
  }
});
});



</script>
<script>
$( "#date" ).datepicker({ 
    // Add this line

    stepMonths: 0,
});

$(document).keydown(function(e){
    if(e.which === 123){
 
       return false;
 
    }
 
});
</script>


<script type="text/javascript">

$("#sub_btn")
.on(
		"click",
		function() {
			
			var isError = false;
			var errMsg = "";

			if (!$("#fr_id").val()) {
				isError = true;
				$("#err_fr").show();
			} else {
				$("#err_fr").hide();
			}
			
			if (!$("#catId").val()) {
				isError = true;
				$("#err_cat").show();
			} else {
				$("#err_cat").hide();
			}
			
			if (!$("#disc_per").val()) {
				isError = true;
				$("#err_dis").show();
			} else {
				$("#err_dis").hide();
			}
			
			if (!$("#items").val()) {
				isError = true;
				$("#err_item").show();
			} else {
				$("#err_item").hide();
			}
			
			
			if(!isError){
				var form=document.getElementById("validation-form");
				form.submit();
			}
		
			return false;
		});
</script>
</body>
</html>