<%@page import="org.w3c.dom.Document"%>
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
<title>Configure Franchisee</title>
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

<jsp:include page="/WEB-INF/views/include/logout.jsp"></jsp:include>


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


</head>
<body onload="myFunction()">



	<c:url var="findItemsByCatId" value="/getItemsByCatID" />
	<c:url var="findAllMenus" value="/getAllMenu" />
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
					<!-- <h1>
						<i class="fa fa-file-o"></i> Franchisee
					</h1> -->
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
										<i class="fa fa-bars"></i> Update Configured Franchisee 
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
									<form action="updateFranchiseeProcess" class="form-horizontal"
										id="validation-form" method="post">

										<%-- <div class="form-group">
											<label class="col-sm-3 col-lg-2 control-label">Franchisee</label>
											<div class="col-sm-9 col-lg-10 controls">
												<input type="text" name="fr_id" id="fr_id" value="${frName}"
													placeholder="Franchisee Name" class="form-control"
													data-rule-required="true" readonly="readonly" /> 
											</div>
										</div> --%>

<input
													type="hidden" id="settingId" name="settingId"
													value="${franchiseeList.settingId}" />
													
										
									<div class="frm_Sec_one single">
										<div class="row">
											<div class="col-md-3 box_marg">
												<label class="control-label left">Menu</label>
													<div class="controls icon_add">
														<i class="fa fa-bars frm_icon" aria-hidden="true"></i>
														<input type="text" name="menu" id="menu" value="${menuName}"
													placeholder="Franchisee Name" class="form-control padd_left"
													data-rule-required="true" readonly="readonly" />								
													
														</div>
											</div>
											
											<div class="col-md-3 box_marg">
												<label class="control-label left">Sequence No</label>
													<div class="controls icon_add">
														<i class="fa fa-list-ol frm_icon" aria-hidden="true"></i>
														<input type="text" name="seqNo" id="seqNo" maxlength="4"
													class="form-control padd_left numberOnly" value="${franchiseeList.frId}" required />
													
														</div>
											</div>
											
											<div class="col-md-3 box_marg">
												<label class="control-label left">Order Frequency</label>
													<div class="controls icon_add">
														<i class="fa fa-random frm_icon" aria-hidden="true"></i>
														<select data-placeholder="Select Type" name="typeselector"
													class="form-control padd_left chosen" tabindex="-1"
													data-rule-required="true" id="typeselector" onselect="changeSettings()">
													<option value=""> </option>
													<optgroup label="Types">
														<option value=""></option>

														<c:choose>
															<c:when test="${settingType==1}">
																<option selected value="1">Daily</option>
																<option value="2">Date</option>
																<option value="3">Day</option>
															</c:when>

															<c:when test="${settingType==2}">
																<option value="1">Daily</option>
																<option selected value="2">Date</option>
																<option value="3">Day</option>
																
															</c:when>

															<c:when test="${settingType==3}">
																<option value="1">Daily</option>
																<option value="2">Date</option>
																<option selected value="3">Day</option>

																
															</c:when>

														</c:choose>

													</optgroup>

												</select>
												
														</div>
											</div>
											
											
											<div class="col-md-3 box_marg" style="display: none" id="2">
												<label class="control-label left">Date</label>
													<div class="controls icon_add">
														<i class="fa fa-calendar frm_icon" aria-hidden="true"></i>
														<c:set var="sel" value=""/>
												<select class="form-control padd_left chosen" name="date[]" id="date" multiple="multiple">
													<option value="0">Select Date</option>
													 <c:forEach items="${remDate}" var="remDate">
													 <c:set var="sel" value=""/>
													   <c:forEach items="${date}" var="date">
													   
       													<c:choose>
       													<c:when test="${remDate==date}">
       													 <c:set var="sel" value="selected"/>
       													
       													</c:when>
       												
       													</c:choose>
                                                     </c:forEach>
       													 <option value="${remDate}" <c:out value="${sel}"/>>${remDate}</option>
													
                                                     
                                                     </c:forEach>
                                                    
												</select>
												
														</div>
											</div>
											
											<div class="col-md-12 box_marg">
												<label class="control-label left">Items</label>
													<div class="controls icon_add">
														<i class="fa fa-list-ul frm_icon" aria-hidden="true"></i>
														<select data-placeholder="Select Items"
													class="form-control padd_left chosen" multiple="multiple"
													tabindex="6" name="items[]" id="items[]">
													<option value=""> </option>
													<optgroup label="ITEMS">
													</optgroup>
                                                    
                                                	 	<c:choose>
											 <c:when test="${catId==5}">
													
                                                       <c:forEach items="${selectedItems}" var="selectedItem">
															<option selected value="${selectedItem.spId}">${selectedItem.spCode}-${selectedItem.spName}</option>
														</c:forEach>

														<c:forEach items="${remItems}" var="remItem">

															<option value="${remItem.spId}"><c:out value="${remItem.spCode}-${remItem.spName}"></c:out></option>

														</c:forEach>

												</c:when>
												<c:otherwise>
												
												      <c:forEach items="${selectedItems}" var="selectedItem">
															<option selected value="${selectedItem.id}">${selectedItem.itemName}</option>
														</c:forEach>
														<c:forEach items="${remItems}" var="remItem">
															<option value="${remItem.id}"><c:out value="${remItem.itemName}"></c:out></option>
														</c:forEach>
												</c:otherwise> 
												      
											</c:choose>

												</select>
													
														</div>
											</div>
											
											
											
											<div class="col-md-3 box_marg" id="3" style="display: none">
												<label class="control-label left">Day</label>
													<div class="controls icon_add">
														<i class="fa fa-calendar frm_icon" aria-hidden="true"></i>
														<c:set var="sel1" value=""/>
											
												<select class="form-control padd_left chosen" name="day[]" id="day" multiple="multiple">

                                                       <c:forEach items="${allDays}" var="allDays">
													 <c:set var="sel1" value=""/>
                                                     <c:forEach items="${frDay}" var="day">
                                                         
                                                         <c:choose>
       													<c:when test="${allDays.key==day}">
       													 <c:set var="sel1" value="selected"/>
       													
       													</c:when>
       												
       													</c:choose>
                                                    </c:forEach>
                                                              <option value="${allDays.key}" <c:out value="${sel1}"/>>${allDays.value}</option>
                                                    
                                                     </c:forEach>
													 
												</select>
												
												
														</div>
											</div>
											
											<div class="col-md-3 box_marg">
												<label class="control-label left">From Time</label>
													<div class="controls icon_add">
														<i class="fa fa-clock-o frm_icon" aria-hidden="true"></i>
														<select data-placeholder="From Time" name="frm_time"
													class="form-control icon_add chosen" tabindex="-1" id="frm_time"
													data-rule-required="true">

													<optgroup label="Select From Time">

														<%
															DateFormat tipe = new SimpleDateFormat("hh:mm a");

															Date date = new Date(); // timestamp now
															Calendar cal = Calendar.getInstance(); // get calendar instance
															cal.setTime(date); // set cal to date
															cal.set(Calendar.HOUR_OF_DAY, 23); // set hour to midnight
															cal.set(Calendar.MINUTE, 45); // set minute in hour
															cal.set(Calendar.SECOND, 0); // set second in minute
															cal.set(Calendar.MILLISECOND, 0);
														%>
														<c:forEach var="i" begin="1" end="32">
															<c:set var="time" value="${i}" />
															<c:forEach var="j" begin="1" end="3">


																<%
																	cal.add(Calendar.MINUTE, 15);
																			//out.print(tipe.format(cal.getTime()));
																			String time = tipe.format(cal.getTime());
																%>

																<c:set var="fTime" value="${fromTime}">
																</c:set>
																<%
																	String strFTime = (String) pageContext.getAttribute("fTime");
																			if (strFTime.equalsIgnoreCase(time)) {
																%>

																<option selected value="${fromTime}">${fromTime}</option>

																<%
																	} else {
																%>


																<option value="<%=time%>"><%=time%></option>

																<%
																	}
																%>
															</c:forEach>

														</c:forEach>
													</optgroup>

												</select>
												
												
														</div>
											</div>
											
											<div class="col-md-3 box_marg">
												<label class="control-label left">To Time</label>
													<div class="controls icon_add">
														<i class="fa fa-clock-o frm_icon" aria-hidden="true"></i>
														<select data-placeholder="To Time" name="to_time"
													class="form-control icon_add chosen" tabindex="-1" id="to_time"
													data-rule-required="true">
													<optgroup label="Select To Time">
														<option value=""></option>

														<%
															DateFormat tipe1 = new SimpleDateFormat("hh:mm a");

															Date date1 = new Date(); // timestamp now
															Calendar cal1 = Calendar.getInstance(); // get calendar instance
															cal.setTime(date1); // set cal to date
															cal.set(Calendar.HOUR_OF_DAY, 23); // set hour to midnight
															cal.set(Calendar.MINUTE, 45); // set minute in hour
															cal.set(Calendar.SECOND, 0); // set second in minute
															cal.set(Calendar.MILLISECOND, 0);
														%>
														<c:forEach var="i" begin="1" end="32">
															<c:set var="time" value="${i}" />
															<c:forEach var="j" begin="1" end="3">


																<%
																	cal.add(Calendar.MINUTE, 15);
																			//out.print(tipe.format(cal.getTime()));
																			String time = tipe.format(cal.getTime());
																%>


																<c:set var="tTime" value="${toTime}">
																</c:set>
																<%
																	String strTTime = (String) pageContext.getAttribute("tTime");
																			if (strTTime.equalsIgnoreCase(time)) {
																%>

																<option selected value="${toTime}">${toTime}</option>

																<%
																	} else {
																%>


																<option value="<%=time%>"><%=time%></option>

																<%
																	}
																%>

																<%-- <option value="<%=time%>"><%=time%></option> --%>


															</c:forEach>

														</c:forEach>
													</optgroup>

												</select> 
												
												
														</div>
											</div>
											
											<div class="col-md-3 box_marg" id="type1" style="display: none">
												<label class="control-label left">Rate Setting From</label>
													<div class="controls icon_add">
														<!-- <i class="fa fa-road frm_icon" aria-hidden="true"></i> -->
														
														<input type="radio" ${franchiseeList.rateSettingFrom==0 ? 'checked' : ''} id="profi_per" name="rate_setting_from" value="0">Master
												<input type="radio" ${franchiseeList.rateSettingFrom==1 ? 'checked' : ''}  id="rate_type" name="rate_setting_from" value="1">Flavor Conf
														 
												
												
														</div>
											</div>
											
											<div class="col-md-3 box_marg" >
												<label class="control-label left">Rate Type</label>
													<div class="controls icon_add">
														<i class="fa fa-inr frm_icon" aria-hidden="true"></i>
														<select  name="rateTypeValue"
													class="form-control icon_add chosen" tabindex="-1"
													 id="rateTypeValue">
													
														<option value=""></option>
														
														<option ${franchiseeList.rateSettingType==1 ? 'selected' : ''}  value="1">Regular Rate (MRP 1)</option>
														<option ${franchiseeList.rateSettingType==2 ? 'selected' : ''} value="2">Special Rate (MRP 2)</option>
														<option ${franchiseeList.rateSettingType==3 ? 'selected' : ''} value="3">Local Rate (MRP 3)</option>
													

												</select>	
													</div>
											</div>
											
											<div class="col-md-3 box_marg" >
												<label class="control-label left">Profit %</label>
													<div class="controls icon_add">
													<i class="fa fa-inr frm_icon" aria-hidden="true"></i>
													<input type="text" name="profit_per" id="profit_per"
													class="form-control padd_left icon_add" value="${franchiseeList.profitPer}" required />
													
														
													</div>
											</div>
											
											<div class="col-md-3 box_marg" >
												<label class="control-label left">No of Days for Delivery Date</label>
													<div class="controls icon_add">
													<i class="fa fa-calendar frm_icon" aria-hidden="true"></i>
													<input type="text" name="del_date_days" id="del_date_days" maxlength="2"
													class="form-control padd_left numberOnly"  value="${franchiseeList.delDays}" required />
													
														
													</div>
											</div>
											
											<div class="col-md-3 box_marg" >
												<label class="control-label left">No of Days for Production Date</label>
													<div class="controls icon_add">
													<i class="fa fa-calendar frm_icon" aria-hidden="true"></i>
													<input type="text" name="prod_date_days" id="prod_date_days" maxlength="2"
													class="form-control padd_left numberOnly"  value="${franchiseeList.prodDays}" required />
														
													</div>
											</div>
											
											<div class="col-md-3 box_marg" >
												<label class="control-label left">Discount Applicable ?</label>
													<div class="controls icon_add">
													<label class="radio-inline"><input type="radio" ${franchiseeList.isDiscApp==1 ? 'checked' : ''} id="disc_yes" name="is_disc_app" value="1">
																Yes
															</label>
															
															<label class="radio-inline"><input type="radio" ${franchiseeList.isDiscApp==0 ? 'checked' : ''} id="disc_no" name="is_disc_app" value="0">
																No
															</label>
													
												
														
													</div>
											</div>
											
											
												<div class="col-md-3 box_marg" id="disc_app_div" style="display: none">
												<label class="control-label left">Discount %</label>
													<div class="controls icon_add">
													<i class="fa fa-money frm_icon" aria-hidden="true"></i>
													<input type="text" name="disc_per" id="disc_per" maxlength="5"
													class="form-control padd_left floatOnlyTwoDots" value="${franchiseeList.discPer}" required />
													<span
												class="text-danger"
												id="error_disc_per" style="display: none;">Please enter value between 0 to 99.</span>
														
													</div>
											</div>
											
											<div class="col-md-3 box_marg">
												<label class="control-label left">GRN %</label>
													<div class="controls icon_add">
													<i class="fa fa-file-text frm_icon" aria-hidden="true"></i>
													<input type="text" name="grn_per" id="grn_per" maxlength="3"
													class="form-control padd_left numberOnly" value="${franchiseeList.grnPer}" required />
													 <span
												class="text-danger"
												id="error_grn_per" style="display: none;">Please enter value between 0 to 100.</span>
												
												
														
													</div>
											</div>
											
										</div>
									</div>				


									<div class="form-group">
								<div class="row three_buttons">
									<input type="submit" class="btn btn-primary" value="Configure">
									<button type="button" class="btn btn-primary">Cancel</button>
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

			<footer>
					<p>2017 � MONGINIS.</p>
			</footer>

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
		var catId=${franchiseeList.catId};
		 if(parseInt(catId)==5){
		    	$('#type1').show();
		 }else{
		    	$('#type0').show();
		 }
	    /* $('input:radio[name="rate_setting_from"]').change(function() {
	    	$('.formgroup2').hide();
	    	$('#type' + $(this).val()).show();
	    }); */
	    var isDisc=${franchiseeList.isDiscApp};
	    if(parseInt(isDisc)==1){
	    	$('#disc_app_div').show();
	    }
	    $('input:radio[name="is_disc_app"]').change(function() {
	    	$('.formgroup3').hide();
	    	if($(this).val()==1){
	    	$('#disc_app_div').show();
	    	}else{
	    		//document.getElementById("disc_per").value=0;
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
									
									var rateType=$("#rateTypeValue").val()
									
									if(rateType==null || rateType==""){
										isError = true;
										alert("Please select rate type");
									}
									if (!isError) {
										var x = false;
										return true;
									}//end of if !isError	
									return false;
								});
			});
	//Sachin 21-01-2021 End Code.
		$(function() {
			$('#typeselector').change(function() {
				$('.formgroup').hide();
				$('#' + $(this).val()).show();
			});
		});
	</script>


<script>
		$(function myFunction() {
			
		var	type =document.forms[0].typeselector.value
		
				$('.formgroup').hide();
				$('#' + type).show();
		
		});
	</script>
	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							$('#menu')
									.change(
											function() {
												$
														.getJSON(
																'${findItemsByCatId}',
																{
																	mainCatId : $(
																			this)
																			.val(),
																	ajax : 'true'
																},
																function(data) {
																	var html = '<option value="">Items</option>';

																	var len = data.length;
																	for (var i = 0; i < len; i++) {
																		html += '<option value="' + data[i].itemId + '">'
																				+ data[i].itemName
																				+ '</option>';
																	}
																	html += '</option>';
																	$('#items')
																			.html(
																					html);
																	$('#items')
																			.formcontrol(
																					'refresh');

																});
											});
						});
	</script>



	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							$
									.getJSON(
											'${findAllMenus}',
											{
												ajax : 'true'
											},
											function(data) {
												var html = '<option value="">Menu</option>';
												var len = data.length;
												for (var i = 0; i < len; i++) {
													html += '<option value="' + data[i].mainCatId + '">'
															+ data[i].menuTitle
															+ '</option>';
												}
												html += '</option>';
												$('#menu').html(html);
												$('#menu').form
														- control('refresh');

											});

						});
	</script>


</body>
</html>