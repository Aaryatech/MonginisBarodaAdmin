<%@page import="com.ats.adminpanel.model.franchisee.SubCategory"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page
	import="java.io.*, java.util.*, java.util.Enumeration, java.text.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<title>Configure Menu</title>
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

	<c:url var="setAllItemSelected" value="/setAllItemSelected" />

	<c:url var="findItemsByCatId" value="/getCommonByMenuId" />
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
										<i class="fa fa-bars"></i>Menu Configure 
									</h3>
									<div class="box-tool">
										<a href="${pageContext.request.contextPath}/configureFranchiseesList">Back to
											List</a> <a data-action="collapse" href="#"><i
											class="fa fa-chevron-up"></i></a>
									</div>
								</div>


								<c:set var="allFranchiseeAndMenuList"
									value="${allFranchiseeAndMenuList}" />
								<div ><!-- class="box-content" -->
									<form action="addFranchiseeProcess" class="form-horizontal"
										id="validation-form" method="post"  onSubmit="return confirm('Do you want to submit?') " >


										
										<div class="frm_Sec_one single">
											<div class="row">
												<div class="col-md-3 box_marg">
													<label class="control-label left" for="item_name">Menu</label>
														<div class="controls icon_add">
															<i class="fa fa-bars frm_icon" aria-hidden="true"></i>
															<select data-placeholder="Select Menu" name="menu"
													class="form-control padd_left chosen" onchange="getCatId()" tabindex="-1" id="menu"
													data-rule-required="true">
	                                                                                     
<option value="">Select Menu</option>
													
													
														<c:forEach
															items="${menuList}"
															var="menu">
															<option id="menu-cat${menu.menuId}" value="${menu.menuId}" data-catid="${menu.mainCatId}">${menu.menuTitle}</option>

														</c:forEach>
												</select>
												
															
															</div><span class="span_err" id="err_menu" >Select Menu</span>
												</div>
												
												
												
												
												<div class="col-md-3 box_marg">
													<label class="control-label left" for="item_name">Items</label>
														<div class="controls icon_add">
															<i class="fa fa-list-ul frm_icon" aria-hidden="true"></i>
															<select data-placeholder="Select Items" name="items[]"
													class="form-control padd_left chosen" tabindex="-1" id="items" multiple="multiple"
													data-rule-required="true">
                                                   
												</select>
															</div><span class="span_err" id="err_item" >Enter Items</span>
												</div>
												
												
												
												
												<div class="col-md-3 box_marg">
													<label class="control-label left" for="item_name">Order Frequency</label>
														<div class="controls icon_add">
															<i class="fa fa-random frm_icon" aria-hidden="true"></i>
															<select data-placeholder="Select Type" name="typeselector"
													class="form-control padd_left chosen" tabindex="-1" onchange="frequencyChange()"
													data-rule-required="true" id="typeselector">
													<option value=""> </option>
													<optgroup label="Types">
														<option value=""></option>
														<option value="1">Daily Basis</option>
														<option value="2">Date Basis</option>
														<option value="3">Day Basis</option>
													</optgroup>

												</select>
															</div><span class="span_err" id="err_fre" >Select Order Frequency</span>
												</div>
												
												
												
												<div class="col-md-3 box_marg">
													<label class="control-label left" for="item_name">Sequence No</label>
														<div class="controls icon_add">
															<i class="fa fa-list-ol frm_icon" aria-hidden="true"></i>
															<input type="text" name="seqNo" id="seqNo" maxlength="4"
													class="form-control padd_left numberOnly" value="1" required />
															</div>
												</div>
												
												
												
												
												
												<div class="col-md-3 box_marg" style="display: none" id="dateDiv">
													<label class="control-label left" for="item_name">Date</label>
														<div class="controls icon_add">
															<i class="fa fa-calendar frm_icon" aria-hidden="true"></i>
															<select class="form-control padd_left chosen" name="date[]" id="date" multiple="multiple">
													<option value="0">Select Date</option>
													 <c:forEach var = "i" begin = "1" end = "32">
       													<option value="${i}">${i}</option>
                                                     </c:forEach>
												</select>
												
															
															</div>
												</div>
												
												<div class="col-md-3 box_marg" style="display: none;"   id="numOfDayDiv" >
													<label class="control-label left" for="item_name">Day</label>
														<div class="controls icon_add">
															<i class="fa fa-calendar frm_icon" aria-hidden="true"></i>
															<select class="form-control padd_left chosen" name="day[]" id="day" multiple="multiple">
													<option value="">Select Day</option>
													<option value="1">Sunday</option>
													<option value="2">Monday</option>
													<option value="3">Tuesday</option>
													<option value="4">Wednesday</option>
													<option value="5">Thursday</option>
													<option value="6">Friday</option>
													<option value="7">Saturday</option>
												</select>
												
															
															</div>
												</div>
												
												<div class="col-md-3 box_marg">
													<label class="control-label left" for="item_name">From Time</label>
														<div class="controls icon_add">
															<i class="fa fa-clock-o frm_icon" aria-hidden="true"></i>
															<select data-placeholder="From Time" name="frm_time"
													class="form-control padd_left chosen" tabindex="-1" id="frm_time"
													data-rule-required="true">
													<option value=""> </option>
													<optgroup label="Select From Time">
														<option value=""></option>



														<%
	                     DateFormat tipe = new SimpleDateFormat("hh:mm a");

	                     Date date = new Date();                      // timestamp now
	                     Calendar cal = Calendar.getInstance();       // get calendar instance
	                     cal.setTime(date);                           // set cal to date
	                     cal.set(Calendar.HOUR_OF_DAY, 23);            // set hour to midnight
	                     cal.set(Calendar.MINUTE,45);                 // set minute in hour
	                     cal.set(Calendar.SECOND, 0);                 // set second in minute
                       	cal.set(Calendar.MILLISECOND, 0);  

                        %>
														<c:forEach var="i" begin="1" end="32">
															<c:set var="time" value="${i}" />
															<c:forEach var="j" begin="1" end="3">


																<% 
                                    cal.add(Calendar.MINUTE, 15);
                                   //out.print(tipe.format(cal.getTime()));
                                   String time=tipe.format(cal.getTime());
                           

                              %>
             			<option value="<%=time%>"><%=time%></option>

															</c:forEach>

														</c:forEach>
													</optgroup>

												</select>
												
															</div><span class="span_err" id="err_fromtime" >Select From Time</span>
												</div>
												
												<div class="col-md-3 box_marg">
													<label class="control-label left" for="item_name">To Time</label>
														<div class="controls icon_add">
															<i class="fa fa-clock-o frm_icon" aria-hidden="true"></i>
															<select data-placeholder="To Time" name="to_time"
													class="form-control padd_left chosen" tabindex="-1" id="to_time"
													data-rule-required="true">
													<optgroup label="Select To Time">
														<option value=""></option>

														<%
	                     DateFormat tipe1 = new SimpleDateFormat("hh:mm a");

	                     Date date1 = new Date();                      // timestamp now
	                     Calendar cal1 = Calendar.getInstance();       // get calendar instance
	                     cal.setTime(date1);                           // set cal to date
	                     cal.set(Calendar.HOUR_OF_DAY, 23);            // set hour to midnight
	                     cal.set(Calendar.MINUTE,45);                 // set minute in hour
	                     cal.set(Calendar.SECOND, 0);                 // set second in minute
                       	cal.set(Calendar.MILLISECOND, 0);  

                        %>
														<c:forEach var="i" begin="1" end="32">
															<c:set var="time" value="${i}" />
															<c:forEach var="j" begin="1" end="3">


																<% 
                                    cal.add(Calendar.MINUTE, 15);
                                   //out.print(tipe.format(cal.getTime()));
                                   String time=tipe.format(cal.getTime());
                           

                              %>




																<option value="<%=time%>"><%=time%></option>


															</c:forEach>

														</c:forEach>
													</optgroup>

												</select>
												
															
												
															</div><span class="span_err" id="err_totime" >Select To Time</span>
															
												</div>
												
												<div class="col-md-3 box_marg" style="display: none">
													<label class="control-label left" for="item_name">Rate Setting From</label>
														<div class="controls icon_add">
															<i class="fa fa-road frm_icon" aria-hidden="true"></i>
															<input type="radio" id="profi_per" name="rate_setting_from" value="0">Master
												<input type="radio" checked id="rate_type" name="rate_setting_from" value="1">Flavor Conf
												
															</div>
												</div>
												
												<div class="col-md-3 box_marg" id="type3" class="">
													<label class="control-label left" for="item_name">Rate Type</label>
														<div class="controls icon_add">
															<i class="fa fa-inr frm_icon" aria-hidden="true"></i>
															<select data-placeholder="Select Rate Type" name="rateTypeValue"
													class="form-control padd_left chosen" tabindex="-1"
													 id="rateTypeValue">
													<optgroup label="Rate Type Applicable">
														<option value=""></option>
														<option selected value="1">Regular Rate (MRP 1)</option>
														<option value="2">Special Rate (MRP 2)</option>
														<option value="3">Local Rate (MRP 3)</option>
													</optgroup>

												</select>
												
															
												
															</div>
												</div>
												
												
												<div class="col-md-3 box_marg" id="type3" >
													<label class="control-label left" for="item_name">Profit %</label>
														<div class="controls icon_add">
															<i class="fa fa-inr frm_icon" aria-hidden="true"></i>
															<input type="text" name="profit_per" id="profit_per"
													class="form-control padd_left" value="0"   onkeyup="this.value=this.value.replace(/[^\d]/,'')" required />
												
															</div>
												</div>
												
												<div class="col-md-3 box_marg" >
													<label class="control-label left" for="item_name">No of Days for Delivery Date</label>
														<div class="controls icon_add">
															<i class="fa fa-calendar frm_icon" aria-hidden="true"></i>
															<input type="text" name="del_date_days" id="del_date_days" maxlength="2"
													class="form-control padd_left numberOnly" value="1" required />
													
															
												
															</div>
												</div>
												
												<div class="col-md-3 box_marg"  >
													<label class="control-label left" for="item_name">No of Days for Production Date</label>
														<div class="controls icon_add">
															<i class="fa fa-calendar frm_icon" aria-hidden="true"></i>
															<input type="text" name="prod_date_days" id="prod_date_days" maxlength="2"
													class="form-control padd_left numberOnly" value="0" required />
															
												
															</div>
												</div>
												
												
												
												<div class="col-md-3 box_marg" style="display: none">
													<label class="control-label left" for="item_name">Discount %</label>
														<div class="controls icon_add">
															<i class="fa fa-road frm_icon" aria-hidden="true"></i>
															<input type="text" name="disc_per" id="disc_per" maxlength="5"
													class="form-control padd_left floatOnlyTwoDots" value="0" required />
													<span
												class="text-danger"
												id="error_disc_per" style="display: none;">Please enter value between 0 to 99.</span>
															
												
															</div>
												</div>
												
												<div class="col-md-3 box_marg">
													<label class="control-label left" for="item_name">GRN %</label>
														<div class="controls icon_add">
															<i class="fa fa-file-text frm_icon" aria-hidden="true"></i>
															<input type="text" name="grn_per" id="grn_per" maxlength="3"
													class="form-control padd_left numberOnly" value="0" required />
													 <span
												class="text-danger"
												id="error_grn_per" style="display: none;">Please enter value between 0 to 100.</span>
												
															
															
												
															</div>
												</div>
												
												
												
												
												<div class="col-md-3 box_marg">
													<label class="control-label left" for="item_name">Discount Applicable ?</label>
														<div class="controls icon_add">
															
															<label class="radio-inline"> <input type="radio" id="disc_yes" name="is_disc_app" value="1">
																Yes
															</label>
															
															<label class="radio-inline"> <input type="radio" checked id="disc_no" name="is_disc_app" value="0">
																No
															</label>
															
															
												
															
												
															</div>
												</div>
												
											</div>
									   </div>


										
										
										
										
										
										
									
										<div class="form-group">
								<div class="row three_buttons">
									<input type="submit" class="btn btn-primary" value="Submit" id="sub_btn">
									<button type="button" class="btn btn-primary"  onclick="window.location.reload()" >Cancel</button>
							</div>
								</div>
										
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
//Sachin 19-01-2021
jQuery('.floatOnlyTwoDots').keyup(function() {
	 this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');
	  var number = ($(this).val().split('.'));
	  if (parseInt(number[1].length) > 2)
	   {
	       var data = parseFloat($(this).val());
	       $(this).val(data.toFixed(2));
	   }
	});
jQuery('.numberOnly').keyup(function() {
	 this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');
	});
	
	
$(function() {
	/* $('.formgroup2').hide();
	$('#type1').show(); */
	
    /* $('input:radio[name="rate_setting_from"]').change(function() {
    	$('.formgroup2').hide();
    	$('#type' + $(this).val()).show();
    }); */
    
    $('input:radio[name="is_disc_app"]').change(function() {
    	$('.formgroup3').hide();
    	if($(this).val()==1){
    	$('#disc_app_div').show();
    	}else{
    		document.getElementById("disc_per").value=0;
    	}
    });
});
$(document)
.ready(
		function($) {
			$("#validation-form")
					.submit(
							function(e) {
								var isError = false;
								var errMsg = "";
								 if ($("#disc_per").val()>99.99) {
									isError = true;
									$("#error_disc_per")
											.show()
								} else {
									$("#error_disc_per")
											.hide()
								}
								if ($("#grn_per").val()>100) {
									isError = true;
									$("#error_grn_per")
											.show()
								} else {
									$("#error_grn_per")
											.hide()
								}
								if (!isError) {
									var x = false;
									return true;
								}//end of if !isError	
								return false;
							});
		});
//Sachin 19-01-2021 End Code.    
$(function() {
    $('#typeselector').change(function(){
        $('.formgroup').hide();
        $('#' + $(this).val()).show();
    });
});
</script>
<script>
$('#select_all').click(function() {
	//alert("alert");
    $('#items option').prop('selected', true);
    $('#items').chosen('destroy').val(["hola","mundo","cruel"]).chosen();
});
</script>
<script type="text/javascript">
function frequencyChange() {
	var frq=$('#typeselector').val();
	if(frq==2){
		//alert("Date Basis")
		document.getElementById("numOfDayDiv").style.display = "none";
		document.getElementById("dateDiv").style.display = "block";
	}else if(frq==3){
		//alert("Day Basis")
		document.getElementById("numOfDayDiv").style.display = "block";
		document.getElementById("dateDiv").style.display = "none";
	}else{
		//alert("Daily Basis")
		document.getElementById("numOfDayDiv").style.display = "none";
		document.getElementById("dateDiv").style.display = "none";
	}
	
	
	//alert(frq)
}
</script>

<script type="text/javascript">
$(document).ready(function() {
	
	
    $('#menu').change(
            function() {
            	$('#type1').hide();
            	var catId = $("#menu-cat"+$(this).val()).data("catid");
            if(parseInt(catId)==5){
            	$('#type1').show();
            }
                $.getJSON('${findItemsByCatId}', {
                    menuId : $(this).val(),
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

<script type="text/javascript">
$(document).ready(function() { // if all label selected set all items selected
$('#items').change(
		function () {
			 var selected=$('#items').val();
			 var menu=$('#menu').val();
        if(selected==-1){
			$.getJSON('${findItemsByCatId}', {
				 menuId : menu,
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
                               "value", data[i].id).text(datDatea[i].name)
                       );
				}
				   $("#items").trigger("chosen:updated");
			});
  }
});
});
</script>
<script type="text/javascript">
$("#sub_btn")
.on(
		"click",
		function() {
			
			var isError = false;
			var errMsg = "";

			if (!$("#menu").val()) {
				isError = true;
				$("#err_menu").show();
			} else {
				$("#err_menu").hide();
			}
			
			if (!$("#items").val()) {
				isError = true;
				$("#err_item").show();
			} else {
				$("#err_item").hide();
			}
			
			if (!$("#typeselector").val()) {
				isError = true;
				$("#err_fre").show();
			} else {
				$("#err_fre").hide();
			}
			
			if (!$("#frm_time").val()) {
				isError = true;
				$("#err_fromtime").show();
			} else {
				$("#err_fromtime").hide();
			}
			
			if (!$("#to_time").val()) {
				isError = true;
				$("#err_totime").show();
			} else {
				$("#err_totime").hide();
			}
			
			if(!isError){
				var form=document.getElementById("validation-form");
				form.submit();
			}
			
			return false;
		});
</script>
<script>
$( "#date" ).datepicker({ 
    stepMonths: 0,
});
</script>
</body>
</html>