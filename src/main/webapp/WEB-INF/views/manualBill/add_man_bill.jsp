<%@ page contentType="text/html;charset=UTF-8"%>
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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Monginis Admin</title>
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
<%-- <script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/assets/bootstrap-daterangepicker/date.js"></script> --%>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/assets/bootstrap-daterangepicker/daterangepicker.js"></script>
<!-- http://forum.springsource.org/showthread.php?110258-dual-select-dropdown-lists -->
<!-- http://api.jquery.com/jQuery.getJSON/ -->

<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/assets/jquery-validation/dist/jquery.validate.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/assets/jquery-validation/dist/additional-methods.min.js"></script>
<script type="text/javascript" src="https://www.google.com/jsapi">
    </script>
<script type="text/javascript">

      // Load the Google Transliterate API
      google.load("elements", "1", {
            packages: "transliteration"
          });

      function onLoad(frId) {
        var options = {
            sourceLanguage:
                google.elements.transliteration.LanguageCode.ENGLISH,
            destinationLanguage:
                [google.elements.transliteration.LanguageCode.HINDI],
        //shortcutKey: 'ctrl+g',
            transliterationEnabled: true
        };

        // Create an instance on TransliterationControl with the required
        // options.
        var control =
            new google.elements.transliteration.TransliterationControl(options);

        // Enable transliteration in the textbox with id
        // 'transliterateTextarea'.
        control.makeTransliteratable(['transliterateTextarea']);   showCtype();
      }
   
     // google.setOnLoadCallback(onLoad);
    </script>
<jsp:include page="/WEB-INF/views/include/logout.jsp"></jsp:include>
<style type="text/css">
select {
	width: 180px;
	height: 30px;
}
</style>


</head>
<body onload="findFranchiseeData(${billNo})">

	<c:url var="getFlavourBySpfId" value="/getFlavourBySpfId" />
	<c:url var="findAddOnRate" value="/getAddOnRate" />
	<c:url var="findFranchiseeData" value="/findFranchiseeData" />
	<c:url value="/getMnlBillMenusSectionAjax" var="getMnlBillMenusSectionAjax"></c:url>

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

			<div class="row">
				<div class="col-md-12">
					<div class="row">
						<div class="col-md-12">
							<div class="box">
								<div class="box-title">
									<h3>
										<i class="fa fa-bars"></i>SP Manual Bill 
									</h3>
									<p align="center" style="color: red;" id="saveResIdTop"></p>
								</div>

<div align="center" id="loader" style="display: none;background-color: white;">

					<span>
						<h4>
							<font color="#343690">Loading</font>
						</h4>
					</span> <span class="l-1"></span> <span class="l-2"></span> <span
						class="l-3"></span> <span class="l-4"></span> <span class="l-5"></span>
					<span class="l-6"></span>
				</div>

								<c:set var="allFranchiseeAndMenuList"
									value="${allFranchiseeAndMenuList}" />
								<div ><!-- class="box-content" -->
									<form
										action="${pageContext.request.contextPath}/getSpCakeForManBill"
										class="form-horizontal" id="validation-form" method="post">
									<input type="hidden" value="${selectedMenu}" id="selectedMenu" >	
									<input type="hidden" value="${spCode}" id="selectedSp" >
									<c:if test="${isEdit==1}">
									<c:set var="dispStyle" value="style=display:none"></c:set>
									</c:if>	
				<div class="frm_Sec_one single">
					<div class="row">
						<div class="col-md-3 box_marg" ${dispStyle}>
							<label class="control-label left">Section</label>
							<div class="controls icon_add">
							<i class="fa fa-square frm_icon" aria-hidden="true"></i>
							<select data-placeholder="Choose Section"  onchange="getMenus(this.value)"
								class="form-control padd_left chosen" id="sectionId" name="sectionId">
								<option value="0">Select Section</option>
								<c:forEach items="${section}" var="sectionList">
																<c:choose>
																	<c:when
																		test="${sectionList.sectionId==selectedSection}">
																		<option selected="selected"
																			value="${sectionList.sectionId}"><c:out
																				value="${sectionList.sectionName}" /></option>

																	</c:when>
																	<c:otherwise>
																		<option value="${sectionList.sectionId}"><c:out
																				value="${sectionList.sectionName}" /></option>
																	</c:otherwise>

																</c:choose>
															</c:forEach>
														</select>
							</div>
						</div>
						
						<div class="col-md-3 box_marg" ${dispStyle}>
							<label class="control-label left">Menu<span style="color:red;">*</span></label>
							<div class="controls icon_add">
							<i class="fa fa-bars frm_icon" aria-hidden="true"></i>
							<select name="spMenuId" class="form-control padd_left chosen"
								data-placeholder="Menu" id="spMenuId" required>
								<option value="">Select Menu</option>
								<c:if test="${isEdit==1}">
								<option selected value="${spCakeOrder.menuId}">Edit Menu</option>
								</c:if>
								
							</select>
							</div>
							<span id="menu_alert" class="span_err">Please select menu</span>
						</div>
						<div class="col-md-3 box_marg" ${dispStyle}>
							<label class="control-label left">Franchise<span style="color:red;">*</span></label>
							<div class="controls icon_add">
							<i class="fa fa-user frm_icon" aria-hidden="true"></i>
							<select data-placeholder="Select Franchisee" name="fr_id"
								class="form-control padd_left chosen" tabindex="-1" id="fr_id"
								data-rule-required="true" onchange="findFranchiseeData(0)">
								<option value=""></option>
								<!-- <optgroup label="All Franchisee"> -->
								<option value="">Select Franchise</option>
								<c:forEach items="${unSelectedFrList}" var="franchiseeList">
									<c:choose>
										<c:when test="${frId==franchiseeList.frId}">
											<option selected value="${franchiseeList.frId}">${franchiseeList.frName}</option>
										</c:when>
										<c:otherwise>
											<option value="${franchiseeList.frId}">${franchiseeList.frName}</option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</select>
							</div>
							<span id="fr_alert" class="span_err">Please select franchise</span>
						</div>
						
						
						
						<div class="col-md-3 box_marg" ${dispStyle}>
							<label class="control-label left">Type</label>
							<div class="controls icon_add">
							<c:choose>
							<c:when test="${billBy==0}">
								<label class="radio-inline"> <input type="radio" name="sel_rate" id="sel_rate" value="1">
								By Rate
								</label>
								<label class="radio-inline"> <input type="radio" name="sel_rate" id="sel_rate" checked value="0">
								By MRP 
								</label>
							</c:when>
							<c:otherwise>
							<label class="radio-inline"> <input type="radio" name="sel_rate" id="sel_rate" checked value="1">
								By Rate
								</label>
							<label class="radio-inline"> <input type="radio" name="sel_rate" id="sel_rate" value="0">
								By MRP
								</label>
							</c:otherwise>
							</c:choose>
							</div>
						</div>
						<div class="clr"></div>
						<div class="col-md-3 box_marg" ${dispStyle}>
							<label class="control-label left">Special Cake</label>
							<div class="controls icon_add">
							<i class="fa fa-coffee frm_icon" aria-hidden="true"></i>
							<select data-placeholder="Select Menu" name="sp_cake_id"
								class="form-control padd_left chosen" tabindex="-1" id="sp_cake_id"
								data-rule-required="true">
								<option   value=" ">Select Special Cake</option>
									<c:if test="${isEdit==1}">
								<option selected value="${spCakeOrder.spId}">${spCakeOrder.spId}</option>
								</c:if>
							</select>
							</div>
															<span id="sp_cd_alert" class="span_err">Please select SP cake</span>
							
						</div>
						
						<div class="col-md-3 box_marg">
							<label class="control-label left">Cake Name</label>
							<div class="controls icon_add" id="spDesc">
								-${specialCake.spName} ${specialCake.spCode}
							</div>
						  </div>
						  
						  <div class="col-md-3 box_marg">
							<label class="control-label left">Min Weight</label>
							<div class="controls icon_add" id="spDesc">
								${specialCake.spMinwt} Kg
							</div>
						  </div>
						  
						  <div class="col-md-3 box_marg">
							<label class="control-label left">Max Weight</label>
							<div class="controls icon_add" id="spDesc">
								${specialCake.spMaxwt} Kg 
							</div>
						  </div>
						
					</div>
				</div>
			</form>
			
			
			
			
			
			<form action="${pageContext.request.contextPath}/insertManualSpBill" method="post" class="form-horizontal" name="from_ord"
			id="validation-form1" enctype="multipart/form-data">
			<input type="hidden" id="fr_id_selected" name="fr_id" value="${spCakeOrder.frId}"> 
			<input type="hidden" name="billBy" value="${billBy}"> 
			<input type="hidden" name="menu_title" value="${menuTitle}">
			<input type="hidden" name="mode_add" id="mode_add" value="add_book"> 
			<input type="hidden" name="sp_id" id="sp_id" value="${specialCake.spId}"> 
			<input type="hidden" name="sp_min_weight" id="sp_min_weight" value="${specialCake.spMinwt}"> 
			<input type="hidden" name="sp_max_weight" id="sp_max_weight" value="${specialCake.spMaxwt}"> 
			<input type="hidden" name="sp_est_del_date" id="sp_est_del_date" value="${convDate}"> 
			<input type="hidden" name="sp_pro_time" id="sp_pro_time" value="${specialCake.spBookb4}"> 
			<input type="hidden" name="production_time" id="production_time" value="${specialCake.spBookb4}"> 
			<input type="hidden" name="sp_code" id="sp_code" value="${specialCake.spCode}"> 
			<input type="hidden" name="sp_name" id="sp_name" value="${specialCake.spName}">
			<input type="hidden" name="fr_code" id="fr_code" value="4">
			<input type="hidden" name="spPhoUpload" id="spPhoUpload" value="${specialCake.spPhoupload}"> 
			<input type="hidden" name="isCustCh" id="isCustCh" value="${specialCake.isCustChoiceCk}"> 
			<input type="hidden" name="prevImage" id="prevImage" value="${specialCake.spImage}"> 
			<input type="hidden" name="isCustChoiceCk" id="isCustChoiceCk" value="${specialCake.isCustChoiceCk}"> 
			<input type="hidden" name="spPhoUpload" id="spPhoUpload" value="${specialCake.spPhoupload}"> 
			<input type="hidden" name="isSlotUsed" id="isSlotUsed" value="${specialCake.isSlotUsed}">
			
				<input type="hidden" name="spOrderId" id="spOrderId" value="${spCakeOrder.spOrderNo}">
			<input type="hidden" name="isEdit" id="isEdit" value="${isEdit}">
			<input type="hidden" name="editSlipNo" id="editSlipNo" value="${spCakeOrder.slipNo}">
			
			<div class="frm_Sec_one single">
				
							<%-- <div class="col-md-4 box_marg">
							<label class="control-label left">Cake Name</label>
							<div class="controls icon_add" id="spDesc">
								-${specialCake.spName} ${specialCake.spCode}
							</div>
						  </div>
						  
						  <div class="col-md-4 box_marg">
							<label class="control-label left">Min Weight</label>
							<div class="controls icon_add" id="spDesc">
								${specialCake.spMinwt} Kg
							</div>
						  </div>
						  
						  <div class="col-md-4 box_marg">
							<label class="control-label left">Max Weight</label>
							<div class="controls icon_add" id="spDesc">
								${specialCake.spMaxwt} Kg 
							</div>
						  </div> --%>
						
						  <c:if test="${isEdit==1}">
						  <script type="text/javascript">
						  $(document).ready(function() { 
						  $(function () {
							    //$("select#spFlavour").change();
							   
							});
						  })
						  $(window).load(function(){
							  $("select#spFlavour").change();
							 // findFranchiseeData(0);
							  
	 })
						  </script>
						  </c:if>
						  <input type="hidden" name="sptype" id="sptype" value="1" />
						    <div class="row">
					<div class="col-md-9">
						<div class="row">
						  <div class="clr"></div>
						  <div class="col-md-6 box_marg">
							<label class="control-label left">Flavour <span style="color:red;">*</span></label>
							<div class="controls icon_add">
								<i class="fa fa-bars frm_icon" aria-hidden="true"></i>
								<select data-placeholder="Select Flavour" name="spFlavour" class="form-control padd_left chosen" tabindex="-1"
									id="spFlavour">
									<option   value="">Select Flavour</option>
									<c:forEach items="${filterFlavoursList}" var="flavoursList">
										<%-- <option value="${flavoursList.spfId}">${flavoursList.spfName}</option> --%>
										
										
										<c:choose>
              <c:when test="${spCakeOrder.spFlavourId==flavoursList.spfId}">
                         <option value="${flavoursList.spfId}" selected>${flavoursList.spfName}</option>
              </c:when>
              <c:otherwise>
                         <option value="${flavoursList.spfId}">${flavoursList.spfName}</option>
              </c:otherwise>
              </c:choose>
										
									</c:forEach>

								</select>
							</div>
								<span id="flavor_alert" class="span_err">Please select flavor</span>
						  </div>
						  
						  <%-- <div class="col-md-6 box_marg" style="display: none;" >
							<label class="control-label left">Flavour <span style="color:red;">*</span></label>
							<div class="controls icon_add">
								<i class="fa fa-road frm_icon" aria-hidden="true"></i>
								<select data-placeholder="Select Flavour" name="spFlavour" required class="form-control padd_left chosen" tabindex="-1"
									id="spFlavour">
									<option value="">Select Flavour</option>
									<c:forEach items="${filterFlavoursList}" var="flavoursList">
										<option value="${flavoursList.spfId}">${flavoursList.spfName}</option>
									</c:forEach>

								</select>
							</div>
						  </div> --%>
						  
						  <div class="col-md-6 box_marg">
							<label class="control-label left">Weight <span style="color:red;">*</span></label>
							<div class="controls icon_add">
								<i class="fa fa-bars frm_icon" aria-hidden="true"></i>
								<input type="hidden" name="dbRate" id="dbRate" value="0">
									<select name="spwt" id="spwt" class="form-control padd_left" style="width: 48%; float: left;"
										onchange="onChange()">
										<%-- '${sprRate}' --%>
										 <option value="">Select Weight</option>
										<c:forEach items="${weightList}" var="weightList">
											<%-- <option value="${weightList}">${weightList}</option> --%>
											
											  <c:choose>
              <c:when test="${spCakeOrder.spSelectedWeight eq weightList}">
                            <option value="${weightList}" selected>${weightList}</option>
              
              </c:when>
              <c:otherwise>
                         <option value="${weightList}">${weightList}</option>
              
              </c:otherwise>
              </c:choose>
										</c:forEach>
									</select>
									<div style="width: 48% !important; float: right !important;">
										<select name="sp_event" id="sp_event" class="form-control padd_left chosen" 
										data-placeholder="Select Message" required>
										<c:forEach items="${eventList}" var="eventList" >
<%-- 											<option value="${eventList.spMsgText}"><c:out value="${eventList.spMsgText}" /></option>
 --%>
 <c:choose>
              <c:when test="${spCakeOrder.spEvents eq eventList.spMsgText}">
                            <option value="${eventList.spMsgText}" selected><c:out value="${eventList.spMsgText}" /></option>
              
              </c:when>
              <c:otherwise>
                            <option value="${eventList.spMsgText}"><c:out value="${eventList.spMsgText}" /></option>
              
              </c:otherwise>
              </c:choose>
 										</c:forEach>
									</select>
									</div>
									
							</div>
							<span id="wt_alert" class="span_err">Please select weight</span>
						  </div>
						  
						  <div class="clr"></div>
						  
						  <div class="col-md-4 box_marg">
							<label class="control-label left">Name</label>
							<div class="controls icon_add">
								<i class="fa fa-user frm_icon" aria-hidden="true"></i>
								<c:set var="ev_name" value="Factory End Order"></c:set>
								<c:if test="${isEdit==1}">
								<c:set var="ev_name" value="${spCakeOrder.spEventsName}"></c:set>
								</c:if>
								<input class="form-control padd_left" placeholder="Name" value="${ev_name}"  name="event_name" type="text" id="event_name" required>
							</div>
						  </div>
						 
						  <div class="col-md-4 box_marg">
							<label class="control-label left">Delivery Date<span style="color:red;">*</span></label>
							<div class="controls icon_add">
								<i class="fa fa-calendar frm_icon" aria-hidden="true"></i>

								<input id="datepicker" class="form-control padd_left date-picker" data-date-start-date="+${specialCake.spBookb4}d"  data-date-format="dd-mm-yyyy"
											autocomplete="off"  value="${date}" required
											name="datepicker" type="text">
								<%-- <c:choose>
									<c:when test="${menuId==46}">
										<input id="date" class="form-control padd_left date-picker"
											value="${currentDate}" name="datepicker" type="text"
											readonly>
										<input id="datepicker" class="form-control padd_left"
											value="${currentDate}" name="datepicker" type="hidden" />

									</c:when>
									<c:otherwise>
										<input id="datepicker" class="form-control padd_left date-picker"
											autocomplete="off" value="${date}" required
											name="datepicker" type="text" required>
									</c:otherwise>
								</c:choose> --%>
							</div>
						  </div>
						  
						  <div class="col-md-4 box_marg">
							<label class="control-label left">Prod Date: <span style="color:red;">*</span></label>
							<div class="controls icon_add">
								<i class="fa fa-calendar frm_icon" aria-hidden="true"></i>
								<input id="spProdDate"  value="${prod_date}" data-date-start-date="0d" data-date-format="dd-mm-yyyy"
								autocomplete="off" readonly class="form-control date-picker padd_left" placeholder="" name="spProdDate" type="text" required>
							</div>
						  </div>
						    <c:set value="-" var="cname"></c:set>
						  <c:if test="${isEdit==1}">
						  <c:set value="${spCakeOrder.spCustName}" var="cname"></c:set>
						  </c:if>
						  <input class="form-control" placeholder="Customer Name"  value="${cname}" required name="sp_cust_name" type="hidden" id="sp_cust_name"
												required>
						  <input id="datepicker4" data-date-format="dd-mm-yyyy" required autocomplete="off" class="form-control date-picker"
							placeholder="" name="datepicker4" type="hidden" value="${currentDate}" required>						
						<div class="col-md-4 box_marg">
							<label class="control-label left">Franchise Name</label>
							<div class="controls icon_add">
								<i class="fa fa-user frm_icon" aria-hidden="true"></i>
								<input name="fr_name" id="fr_name" value="${spCakeOrder.frCode}" class="form-control padd_left" type="text">
							</div>
						  </div>
						  
						  <div class="col-md-4 box_marg">
							<label class="control-label left">GST No</label>
							<div class="controls icon_add">
								<i class="fa fa-road frm_icon" aria-hidden="true"></i>
								<input name="gst_no" id="gst_no" class="form-control padd_left" type="text" value="-">
							</div>
						  </div>	
						  
						  <div class="col-md-4 box_marg" id="englishDiv" style="display: none;">
							<label class="control-label left">GST No</label>
							<div class="controls icon_add">
								<i class="fa fa-road frm_icon" aria-hidden="true"></i>
								<textarea id="textarea" class="form-control padd_left" name="sp_inst2" cols="" rows=""
								style="visibility: hidden; width: 240px; height: 50px" maxlength="300">-</textarea>
							</div>
						  </div>
						  
						  <div class="col-md-4 box_marg">
							<label class="control-label left">Order No:</label>
							<div class="controls icon_add">
							 <c:set value="${spNo}" var="spdp"></c:set>
						  <c:if test="${isEdit==1}">
						  <c:set value="${spCakeOrder.spDeliveryPlace}" var="spdp"></c:set>
						  </c:if>
								<i class="fa fa-road frm_icon" aria-hidden="true"></i>
								<input class="form-control padd_left" placeholder="Order No"
													name="sp_place" id="sp_place" type="text" value="${spdp}"
													readonly>
							</div>
						  </div>
						  
						  <div class="clr"></div>
						  
						  
						  <c:choose>
							<c:when test="${specialCake.isCustChoiceCk=='1'}">
								<div class="col-md-4 box_marg">
							<label class="control-label left">Photo Cake1</label>
							<div class="controls icon_add">
							<div class="fileupload fileupload-new"
										data-provides="fileupload">
								<div class="fileupload-new img-thumbnail"
									style="width: 120px; height: 40px;">
									<img
										src="http://www.placehold.it/200x150/EFEFEF/AAAAAA&amp;text=no+image"
										alt="" />
								</div>
								<div
									class="fileupload-preview fileupload-exists img-thumbnail"
									style="max-width: 85px; max-height: 40px; line-height: 20px;"></div>
								<div>
									<span class="btn btn-default btn-file"><span
										class="fileupload-new">Select image</span> <span
										class="fileupload-exists">Change</span> <input
										type="file" class="file-input" id="order_photo"
										name="order_photo" /></span> <a href="#"
										class="btn btn-default fileupload-exists"
										data-dismiss="fileupload">Remove</a>
								</div>
							</div>
							</div>
						  </div>
						  
						  
						  <div class="col-md-4 box_marg">
							<label class="control-label left">Photo Cake2</label>
							<div class="controls icon_add">
							<div class="fileupload fileupload-new"
										data-provides="fileupload">
										<div class="fileupload-new img-thumbnail"
											style="width: 120px; height: 40px;">
											<img
												src="http://www.placehold.it/200x150/EFEFEF/AAAAAA&amp;text=no+image"
												alt="" />
										</div>
										<div
											class="fileupload-preview fileupload-exists img-thumbnail"
											style="max-width: 85px; max-height: 40px; line-height: 20px;"></div>
										<div>
											<span class="btn btn-default btn-file"><span
												class="fileupload-new">Select image</span> <span
												class="fileupload-exists">Change</span> <input
												type="file" class="file-input" id="cust_choice_ck"
												name="cust_choice_ck" /></span> <a href="#"
												class="btn btn-default fileupload-exists"
												data-dismiss="fileupload">Remove</a>
										</div>
									</div>
							</div>
						  </div>
						
	
	
	
							</c:when>
							<c:when test="${specialCake.spPhoupload=='1'}">
								<div class="col-md-4 box_marg">
							<label class="control-label left">Photo Cake</label>
							<div class="controls icon_add">
							<div class="fileupload fileupload-new"
										data-provides="fileupload">
										<div class="fileupload-new img-thumbnail"
											style="width: 100px; height: 50px;">
											<img
												src="http://www.placehold.it/200x150/EFEFEF/AAAAAA&amp;text=no+image"
												alt="" />
										</div>
										<div
											class="fileupload-preview fileupload-exists img-thumbnail"
											style="max-width: 85px; max-height: 40px; line-height: 20px;"></div>
										<div>
											<span class="btn btn-default btn-file"><span
												class="fileupload-new">Select image</span> <span
												class="fileupload-exists">Change</span> <input
												type="file" class="file-input" id="order_photo"
												name="order_photo" /></span> <a href="#"
												class="btn btn-default fileupload-exists"
												data-dismiss="fileupload">Remove</a>
										</div>
									</div>
							</div>
						  </div>
							
							</c:when>
												
											</c:choose>
						  
						
						  
						</div>
					</div>
					
					<!-- right-side-area -->
					<div class="col-md-3">
					
						<div class="bill_bx">
							
							<c:set var="dbRate" scope="session" value="${sprRate}" />
						<input type="hidden" name="spBackendRate" id="spBackendRate" value="0">
						<%-- ${spBackendRate} --%>
						<!-----------------------1-------------------------------->
						<div class="rupees_one">
						<h4 class="inrbox" id="INR" style="font-weight: bold;">
							<span style="padding: 5px; font-weight: bold;">INR -
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span> &nbsp;&nbsp;0
							<%-- ${(sprRate*specialCake.spMinwt)} --%>
						</h4>
						<input type="hidden" name="sp_grand" id="sp_grand" value="0">
						</div>
						<%-- ${(sprRate*specialCake.spMinwt)} --%>
						<!-----------------------1---End-------------------------->
						
						<!--------------------------2------------------------------->
						<div class="box_one">
							<div class="box_l">Type</div>
							<div class="box_r" style="color: #ec268f;">Premium</div>
							<div class="clr"></div>
						</div>
						<!--------------------------2- End-------------------------->
						
						<!--------------------------3------------------------------->
						<div class="box_one">
							<div class="box_l">Price</div>
							<div class="box_r" id="price" >0</div>
							<div class="clr"></div>
							<input name="sp_calc_price" id="sp_calc_price" value="0" type="hidden">
						</div>
						<!--------------------------3- End-------------------------->
						
						<!--------------------------4------------------------------->
						<div class="box_one">
							<div class="box_l">Add Rate</div>
							<div class="box_r" id="rate" >00</div>
							<div class="clr"></div>
							<input name="sp_add_rate" id="sp_add_rate" type="hidden" value="0">
						</div>
						<!--------------------------4- End-------------------------->
						
						<!--------------------------5------------------------------->
						 <c:set value="0" var="ex_ch"></c:set>
						  <c:if test="${isEdit==1}">
						  <c:set value="${spCakeOrder.extraCharges}" var="ex_ch"></c:set>
						  </c:if>
						<div class="box_one">
							<div class="box_l">E.Charges</div>
							<div class="box_r">
								<input name="sp_ex_charges" required id="sp_ex_charges"
								type="text"   oninput="chChange()" value="${ex_ch}"
								style="width: 80px; border-radius: 10px; text-align: center; height: 27px;">
							</div>
							<div class="clr"></div>
						</div>
						<!--------------------------5- End-------------------------->
						
						<!--------------------------6------------------------------->
						<c:set value="0" var="dis_p"></c:set>
						  <c:if test="${isEdit==1}">
						  <c:set value="${spCakeOrder.disc}" var="dis_p"></c:set>
						  </c:if>
						<div class="box_one">
							<div class="box_l">Discount(%)</div>
							<div class="box_r">
								<input name="sp_disc" id="sp_disc" required type="text"
								 value="${dis_p}" oninput="chChange()"
								style="width: 80px; border-radius: 10px; text-align: center; height: 27px;">
							</div>
							<div class="clr"></div>
						</div>
						<!--------------------------6- End-------------------------->
						
						<!--------------------------7------------------------------->
						<div class="box_one">
							<div class="box_l">Sub Total</div>
							<div class="box_r" id="subtotal">
								0
							</div>
							<input name="sp_sub_total" id="sp_sub_total" type="hidden" value="0">
							<div class="clr"></div>
						</div>
						<!--------------------------7- End-------------------------->
						
						<!--------------------------8------------------------------->
						<div class="box_one">
							<div class="box_l">GST (%)</div>
							<div class="box_r" id="taxPer3">
								${specialCake.spTax1+specialCake.spTax2}
							</div>
							<input type="hidden" id="tax3" name="tax3" value="${specialCake.spTax1+specialCake.spTax2}">
							<div class="clr"></div>
						</div>
						<!--------------------------8- End-------------------------->
						
						<!--------------------------9------------------------------->
						<div class="box_one">
							<div class="box_l">GST RS.</div>
							<c:set var="varGstRs"
							value="${(((sprRate*specialCake.spMinwt)*100)/((specialCake.spTax1+specialCake.spTax2)+100))*(specialCake.spTax1+specialCake.spTax2)/100}" />
						<fmt:formatNumber var="fGstRs" minFractionDigits="2"
							maxFractionDigits="2" type="number" value="${varGstRs}" />
							
							<div class="box_r" id="gstrs">
								0
							</div>
							<input type="hidden" id="gst_rs" name="gst_rs" value="0">
							<div class="clr"></div>
						</div>
						<!--------------------------9- End-------------------------->
						
						<!--------------------------10------------------------------->
						<c:set var="varMgstamt"
							value="${(((sprRate*specialCake.spMinwt)*100)/((specialCake.spTax1+specialCake.spTax2)+100))}" />
						<fmt:formatNumber var="fMgstamt" minFractionDigits="2"
							maxFractionDigits="2" type="number" value="${varMgstamt}" />
						<div class="box_one" >
							<div class="box_l">AMT-</div>
							
							<div class="box_r"  id="mgstamt">
								0
							</div>
							<input type="hidden" name="m_gst_amt" id="m_gst_amt" type="hidden" value="0" />
							<div class="clr"></div>
						</div>
						<!--------------------------10- End-------------------------->
						
						<!--------------------------11------------------------------->
						
						<div class="box_one last" id="tot">
							<div class="box_l">TOTAL -</div>
							
							<div class="box_r"  id="mgstamt">
								0
							</div>
<!-- 							<input type="hidden" name="total_amt" id="total_amt" value="0">
 -->							<div class="clr"></div>
						</div>
						<!--------------------------11- End-------------------------->
						
							
						</div>
					</div>
				</div>
			</div>		
									

									
										

										
									

										

										

					<div class="form-group">
						<div class="three_buttons">
							<input name="cust_email" id="cust_email" class="form-control" type="hidden" value="-">
							<input name="cust_mobile" id="cust_mobile" class="form-control" type="hidden" value="-">
					</div>
					
					<div class="form-group">
					<div align="center" id="loader2" style="display: none;background-color: white;">

					<span>
						<h4>
							<font color="#343690">Loading</font>
						</h4>
					</span> <span class="l-1"></span> <span class="l-2"></span> <span
						class="l-3"></span> <span class="l-4"></span> <span class="l-5"></span>
					<span class="l-6"></span>
				</div>
					<p align="center" style="color: red;" id="saveResId"></p>
						<div class="row three_buttons">
							<input type="hidden" name="hdnbt" id="hdnbt" value="0" /> 
<!-- 							<input class="btn btn-primary" value="Order" onclick="callSubmit()" type="button" id="click" name=orderClick> 
 -->
 							<input class="btn btn-primary" value="Order"  type="submit"> 
 
<!--  							<input name="billClick" type="button" class="btn btn-primary" onclick="callBillSubmit()" value="Order&Bill" id="billClick">
 -->
 
  							<input name="billClick" type="submit" class="btn btn-primary" onclick="callBillSubmit()" value="Order&Bill" id="billClick">
 							<button type="button" class="btn btn-primary" onClick="window.location.reload();">Cancel</button>
						</div>
					</div>	
					
					
												
											
						
											
											
										
											
										</div>
										
										<div class="form-group">

											
											
											<div class="col-md-4" style="text-align: center;"></div>
											
											<input type="hidden" id="tax1" name="tax1"
												value="${specialCake.spTax1}"> <input type="hidden"
												id="tax2" name="tax2" value="${specialCake.spTax2}">

											<%-- <c:if
												test="${specialCake.spTax1==0 or specialCake.spTax1==0.00}">
												<input type="hidden" id="t1amt" name="t1amt" value="0.0">
											</c:if> --%>
	<input type="hidden" id="t1amt" name="t1amt" value="0">
		<input type="hidden" id="t2amt" name="t2amt" value="0.0">
											<c:if
												test="${specialCake.spTax1!=0 or specialCake.spTax1!=0.00}">
											
												<%-- ${(sprRate*specialCake.spMinwt)*(specialCake.spTax1)/100} --%>
											</c:if>
											<c:if
												test="${specialCake.spTax2==0 or specialCake.spTax2!=0.00}">
											
											</c:if>
											<%-- <c:if
												test="${specialCake.spTax2!=0 or specialCake.spTax2!=0.00}">
												<input type="hidden" id="t2amt" name="t2amt" value="0">
												 ${(sprRate*specialCake.spMinwt)*(specialCake.spTax2)/100}
											</c:if> --%>
											<input type="hidden" id="dbAdonRate" name="dbAdonRate">
											<input type="hidden" id="dbPrice" name="dbPrice" value="0">
											<%--  ${sprRate} --%>
											<input type="hidden" id="sp_id" name="sp_id"
												value="${specialCake.spId}">
																			<input type="hidden" name="total_amt" id="total_amt" value="0">
												
												<input type="hidden" id="spBackEndRateNew" name="spBackEndRateNew"
								value="0">
								<input type="hidden" id="flvAdRate" name="flvAdRate"
								value="0">
								<input type="hidden" id="mrp" name="mrp"
								value="0">
								<input type="hidden" id="profPer" name="profPer"
								value="0">
										</div>
										<div class="form-group">
											<div id="ctype1">
												<div class="col-md-2" id="cktype">
													<!-- Cake Type -->
												</div>
												<div class="col-md-2">
													<input class="form-control" name="ctype" type="hidden"
														id="ctype" value="">
												</div>
											</div>
											<input class="texboxitemcode" name="temp" type="hidden"
												id="temp" value="${cutSec}">
											<!-- <div class="col-md-1">Cust GST</div>
						<div class="col-md-2">-->
											<input name="cust_gst_no" id="cust_gst_no"
												class="form-control" type="hidden" value="-">
											<!-- </div> -->
										</div>
										<textarea id="transliterateTextarea" name="sp_inst1" cols=""
											rows=""
											style="visibility: hidden; width: 240px; height: 50px"
											maxlength="300">-</textarea>


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
		<script type="text/javascript">
		$(document).ready(function (e) {
			 $("#validation-form1").on('submit',(function(e) {
				 //alert("OK1")
				 try{
				 	  e.preventDefault();
				 var isValid=validate();
				//var spFlavour=document.getElementById("spFlavour").value;
				//alert(spFlavour)
				 if(isValid){
				var isInsert=confirm("Do you want to save your ORDER     !");
	             if(isInsert==true)	{
	            	  $('#loader2').show();
	            	  $('#loader').show();
			  $.ajax({
			         url: "${pageContext.request.contextPath}/insertManualSpBill",
			   type: "POST",
			   data:  new FormData(this),
			   contentType: false,
			         cache: false,
			   processData:false,
			   beforeSend : function()
			   {
				   //alert(document.getElementById("spFlavour").value)
			    //$("#preview").fadeOut();
			   // $("#err").fadeOut();
			   },
			   success: function(data)
			      {
			    if(data=='invalid')
			    {
			     // invalid file format.
			    // $("#err").html("Invalid File !").fadeIn();
			    	  $('#loader2').hide();
			    	  $('#loader').hide();
			    }
			    else
			    {
			    	//alert("OK2")
			    	
			    	$("#saveResId").html(data);
			    	$("#saveResIdTop").html(data);
	                $("#spFlavour").prop("selectedIndex", 0).val();
	                $("select#spFlavour").change();
	                $("#spFlavour").trigger("chosen:updated");
	                $('#loader2').hide();
	                $('#loader').hide();
	                document.getElementById("hdnbt").value=0;
	                
	                
				    
				    $("#fr_id").prop("selectedIndex", 0).val();
				    $("#spwt").prop("selectedIndex", 0).val();
				    $("#sp_event").prop("selectedIndex", 0).val();

				    $("#fr_id").trigger("chosen:updated");
				    $("#spwt").trigger("chosen:updated");
				    $("#sp_event").trigger("chosen:updated");
				    
				    document.getElementById("sp_cust_name").value="-";
				    document.getElementById("gst_no").value="";

	                
			     // view uploaded file.
			    // $("#preview").html(data).fadeIn();
			    // $("#form")[0].reset(); 
			    }
			      },
			     error: function(e) 
			      {
			   // $("#err").html(e).fadeIn();
			    	  $('#loader2').hide();
			    	  $('#loader').hide();
			      }          
			    });
	             }
			}
			 }catch (e) {
				alert(e);
				$('#loader').hide();
				  $('#loader').hide();
				  document.getElementById("hdnbt").value=0;
			}
			 }));
			 document.getElementById("hdnbt").value=0;
			});
		function wait(ms){
			alert("In WT")
			   var start = new Date().getTime();
			   var end = start;
			   while(end < start + ms) {
			     end = new Date().getTime();
			  }
			}
		</script>
	<script type="text/javascript">
		function callSubmit() {
			var isValid=validate();
			if(isValid){
				var isInsert=confirm("Do you want to save your ORDER     !");
	             if(isInsert)	{
			document.getElementById("hdnbt").value=0;
			var form=document.getElementById("validation-form1");
			form.submit();
	             }
			}
		}
		function callBillSubmit() {
			var isValid=validate();
			if(isValid){
				 var isInsert=confirm("Do you want to save your ORDER &  BILL     !");
             if(isInsert==true)	{
			document.getElementById("hdnbt").value=1;
			//var form=document.getElementById("validation-form1");
			//form.submit();
             }
			}
		}
		</script>
	<script type="text/javascript">

			function spTypeChange(spType) {

				findFranchiseeData(0);
				$.getJSON('${getFlavourBySpfId}', {
					spType : spType,
					ajax : 'true'
				}, function(data) {
					var html = '<option value="">Select Flavour</option>';
					//alert(JSON.stringify(data));
					var len = data.length;
					
					for ( var i = 0; i < len; i++) {
						html += '<option value="' + data[i].spfId + '">'
								+ data[i].spfName + '</option>';
					}
					html += '</option>';
					$('#spFlavour').html(html);
				    $("#spFlavour").trigger("chosen:updated");

				});
			}
</script>
	<script type="text/javascript">
			function setData(flavourAdonRate,mrp,profitPer) {
				/*Sachin 08-02-2021*/
				try{
					$('#loader').show();
				var wt = $('#spwt').find(":selected").text();
				//alert(wt)
				if(wt==null || wt=="" || isNaN(wt)){
					wt=0;
					$('#wt_alert').show();
					$('#loader').hide();
				}
				//1
				var spTotAddonRate=flavourAdonRate*wt;
				//console.log("spTotAddonRate",spTotAddonRate)
				var tax3 = parseFloat($("#tax3").val());
				var tax1 = parseFloat($("#tax1").val());
				var tax2 = parseFloat($("#tax2").val());
				
				var sp_ex_charges = parseFloat($("#sp_ex_charges").val());
				var sp_disc = parseFloat($("#sp_disc").val());

				var advAmt=0;//document.getElementById("adv").value;
				var spPrice=mrp*wt;
				//console.log("spPrice",spPrice)
				var spSubTotal=(spTotAddonRate+spPrice+sp_ex_charges);
				//console.log("spSubTotal",spSubTotal)
				var spBackEndRate=(spSubTotal-(spSubTotal*profitPer)/100);
			//	console.log("spBackEndRate",spBackEndRate);
				var discAmt=spSubTotal*(sp_disc/100);
				var spGrandTot=(spTotAddonRate+spPrice+sp_ex_charges)-discAmt;
				var taxableAmt=(spGrandTot*100)/100+tax3;

			//	var mrpBaseRate = parseFloat((spSubTotal * 100) / (tax3 + 100));
var spSubTotalTemp=parseFloat(spSubTotal)-discAmt
	var mrpBaseRate = parseFloat((spSubTotalTemp * 100) / (tax3 + 100));
				var gstInRs = 0;
				var taxPerPerc1 = 0;
				var taxPerPerc2 = 0;
				var tax1Amt = 0;
				var tax2Amt = 0;
				if (tax3 == 0) {
					gstInRs = 0;

				} else {
					gstInRs = (mrpBaseRate * tax3) / 100;

					if (tax1 == 0) {
						taxPerPerc1 = 0;
					} else {
						taxPerPerc1 = parseFloat((tax1 * 100) / tax3);
						tax1Amt = parseFloat((gstInRs * taxPerPerc1) / 100);
					}
					if (tax2 == 0) {
						taxPerPerc2 = 0;
					} else {
						taxPerPerc2 = parseFloat((tax2 * 100) / tax3);
						tax2Amt = parseFloat((gstInRs * taxPerPerc2) / 100);
					}
				}
				
				$('#gstrs').html(gstInRs.toFixed(2));
				document.getElementById("gst_rs").setAttribute('value',
						taxableAmt.toFixed(2));

				var mGstAmt = mrpBaseRate;
				$('#mgstamt').html('AMT-' + mGstAmt.toFixed(2));
				document.getElementById("m_gst_amt").setAttribute('value',
						mGstAmt.toFixed(2));
				
				$('#price').html(spPrice.toFixed(2));
				document.getElementById("sp_calc_price").value = spPrice;
				$('#rate').html(spTotAddonRate.toFixed(2));
				
				document.getElementById("sp_add_rate").setAttribute('value',
						spTotAddonRate);
				
				$('#subtotal').html(spSubTotal.toFixed(2));
				document.getElementById("sp_sub_total").setAttribute('value',
						spSubTotal);
				
				$('#INR').html('INR-' + (spGrandTot).toFixed(2));
				document.getElementById("sp_grand").setAttribute('value',
						spGrandTot);
				// alert("OK0")
				$('#tot').html('TOTAL-' + (spSubTotal).toFixed(2));
				// alert("OK1" +tax1Amt)
				document.getElementById("total_amt").setAttribute('value',
						spSubTotal);
				}catch (e) {
					//alert(e)
					$('#loader').hide();	
				}
				//alert("AF")
				
				/* $('#rmAmt').html((spGrandTot-advAmt).toFixed(2));
				document.getElementById("rm_amount").setAttribute('value',
						(spGrandTot-advAmt).toFixed(2));
 */

				document.getElementById("t1amt").setAttribute('value',
						tax1Amt.toFixed(2));

				document.getElementById("t2amt").setAttribute('value',
						tax2Amt.toFixed(2));
 //alert("OK2")
				document.getElementById("spBackEndRateNew").setAttribute('value',
						spBackEndRate.toFixed(2));
 //alert("OK3")
				
				$('#loader').hide();
			}
		</script>
		
	<script type="text/javascript">
$(document).ready(function() { 
	$('#spFlavour').change(
			function() {
				var spId=document.getElementById("sp_id").value;
				$('#loader').show();
				$.getJSON('${findAddOnRate}', {
					spId:spId,
					spfId : $(this).val(),
					ajax : 'true'
				}, function(data) {
					//console.log("data",JSON.stringify(data));
					document .getElementById("flvAdRate").value=data.sprAddOnRate
					document .getElementById("mrp").value=data.sprRateMrp;
					document .getElementById("profPer").value=data.profitPer;
					
					var flavourAdonRate=$("#flvAdRate").val();
					var mrp=$("#mrp").val();
					var profitPer=$("#profPer").val();
					setData(flavourAdonRate,mrp,profitPer);
					$('#loader').hide();
					if(1==2){
						
					 $('#rate').empty();	
					 $("#dbAdonRate").val(0);//data.spfAdonRate
					$("#rate").html(data.mrp);//data.spfAdonRate
					document.getElementById("dbPrice").value=data.mrp;//new
					document.getElementById("dbRate").value=data.mrp;//new
					document.getElementById("spBackendRate").value=data.rate;//new
					document.getElementById("sp_add_rate").setAttribute('value',0);//data.spfAdonRate
					var flavourAdonRate=0;//data.spfAdonRate;
					
					//Sac code
					 $('#rate').empty();	
					 $("#dbAdonRate").val(0);//data.spfAdonRate
					$("#rate").html(data.mrp);//data.spfAdonRate
					document.getElementById("dbPrice").value=data.sprRateMrp;//new
					document.getElementById("dbRate").value=data.spBackendRate;//new
					document.getElementById("spBackendRate").value=data.spBackendRate;//new
					document.getElementById("sp_add_rate").setAttribute('value',0);//data.spfAdonRate
					var flavourAdonRate=data.sprAddOnRate;
					//Sac code 
					var wt = $('#spwt').find(":selected").text();
					var tax3 = parseFloat($("#tax3").val());
					var tax1 = parseFloat($("#tax1").val());
					var tax2 = parseFloat($("#tax2").val());
					var sp_ex_charges= parseFloat($("#sp_ex_charges").val());
					//alert("sp_ex_charges"+sp_ex_charges);
					var sp_disc=parseFloat($("#sp_disc").val());
					//alert("sp_disc"+sp_disc);
					var price =data.sprRateMrp;// $("#dbPrice").val();
				
					var totalFlavourAddonRate= wt*flavourAdonRate;
					var billBy=${billBy};
					//alert("Bill by " +billBy);
					
					if(billBy==1){
						totalFlavourAddonRate= wt*(flavourAdonRate*0.8);
					}	totalFlavourAddonRate.toFixed(2);
					//alert("spFlavour .chnge " +totalFlavourAddonRate)
					
					//totalFlavourAddonRate.toFixed(2);

					 var totalCakeRate= wt*price;
					 var totalAmount=parseFloat(totalCakeRate+totalFlavourAddonRate)+sp_ex_charges;
					 var disc_amt=(totalAmount*sp_disc)/100;
					 totalAmount=totalAmount-disc_amt;
					 
					 var mrpBaseRate=parseFloat((totalAmount*100)/(tax3+100));
				    /*  var gstInRs=parseFloat((mrpBaseRate*tax3)/100);
				     
				        var taxPerPerc1=parseFloat((tax1*100)/tax3);
						var taxPerPerc2=parseFloat((tax2*100)/tax3);
			         
						var tax1Amt=parseFloat((gstInRs*taxPerPerc1)/100);
						var tax2Amt=parseFloat((gstInRs*taxPerPerc2)/100); */
						var gstInRs=0;
						var taxPerPerc1=0;
						var taxPerPerc2=0;
						var tax1Amt=0;
						var tax2Amt=0;
						if(tax3==0)
							{
							    gstInRs=0;
							
							}
					    else
						{
						   gstInRs=(mrpBaseRate*tax3)/100;
							
						   if(tax1==0)
							{
							   taxPerPerc1=0;
							}
						   else
							{
							    taxPerPerc1=parseFloat((tax1*100)/tax3);
							    tax1Amt=parseFloat((gstInRs*taxPerPerc1)/100);

							}
						   if(tax2==0)
							{
							   taxPerPerc2=0;
							}
						   else
							{
								taxPerPerc2=parseFloat((tax2*100)/tax3);
								tax2Amt=parseFloat((gstInRs*taxPerPerc2)/100);

							}
						}
						
					  var grandTotal=parseFloat(totalCakeRate+totalFlavourAddonRate);
					  
					    $('#price').html(totalCakeRate);$('#sp_calc_price').html(totalCakeRate);
						$('#rate').html(totalFlavourAddonRate);$('#sp_add_rate').html(totalFlavourAddonRate);
						document.getElementById("sp_add_rate").setAttribute('value',totalFlavourAddonRate);
						$('#subtotal').html(totalAmount);
						
						document.getElementById("sp_sub_total").setAttribute('value',totalAmount);
						$('#INR').html('INR-'+totalAmount);
						document.getElementById("sp_grand").setAttribute('value',totalAmount);
						$('#tot').html('TOTAL-'+totalAmount);
						document.getElementById("total_amt").setAttribute('value',totalAmount);
						//$('#rmAmt').html(grandTotal);
						//document.getElementById("rm_amount").setAttribute('value',totalAmount);
						
						document.getElementById("t1amt").setAttribute('value',tax1Amt.toFixed(2));
						
						document.getElementById("t2amt").setAttribute('value',tax2Amt.toFixed(2));
						
						$('#gstrs').html(gstInRs.toFixed(2)); 
						document.getElementById("gst_rs").setAttribute('value',gstInRs.toFixed(2));
						$('#mgstamt').html('AMT-'+mrpBaseRate.toFixed(2)); 
						document.getElementById("m_gst_amt").setAttribute('value',mrpBaseRate.toFixed(2));
				}	
				});
			});
});
</script>

	<script type="text/javascript">
		function onChange() {
			
			var flavourAdonRate=$("#flvAdRate").val();
			var mrp=$("#mrp").val();
			var profitPer=$("#profPer").val();
			setData(flavourAdonRate,mrp,profitPer);
			$("#wt_alert").hide();
			if(1==2){
			var dbRate=$("#dbRate").val();

			var wt = $('#spwt').find(":selected").text();
			var flavourAdonRate =$("#dbAdonRate").val();
					
			var tax3 = parseFloat($("#tax3").val());
			var tax1 = parseFloat($("#tax1").val());
			var tax2 = parseFloat($("#tax2").val());
			//alert("tax1:"+tax1+"tax2"+tax2+"tax3"+tax3);
			var sp_ex_charges= parseFloat($("#sp_ex_charges").val());
			var sp_disc=parseFloat($("#sp_disc").val());
			//document.getElementById("adv").value=0;
					
			var totalCakeRate = wt*dbRate;
				
			var billBy=${billBy};
			//alert("Bill by " +billBy);
			var totalFlavourAddonRate = wt*flavourAdonRate;
			//alert("totalFlavourAddonRate by " +totalFlavourAddonRate);
			if(billBy==1){
				totalFlavourAddonRate= wt*(flavourAdonRate*0.8);
				//alert("totalFlavourAddonRate in if by =1 " +totalFlavourAddonRate);
			}	
			//alert("spFlavour .chnge " +totalFlavourAddonRate)
			totalFlavourAddonRate.toFixed(2);
		    var add=parseFloat(totalCakeRate+totalFlavourAddonRate);
		    var grandTotal=parseFloat(add);
			var spSubtotal=add+sp_ex_charges;
			var disc_amt=(spSubtotal*sp_disc)/100;
			
			spSubtotal=spSubtotal-disc_amt;
			var mrpBaseRate=parseFloat((spSubtotal*100)/(tax3+100));
			
			var gstInRs=0;
			var taxPerPerc1=0;
			var taxPerPerc2=0;
			var tax1Amt=0;
			var tax2Amt=0;
			if(tax3==0)
				{
				    gstInRs=0;
				
				}
		    else
			{
			   gstInRs=(mrpBaseRate*tax3)/100;
				
			   if(tax1==0)
				{
				   taxPerPerc1=0;
				}
			   else
				{
				    taxPerPerc1=parseFloat((tax1*100)/tax3);
				    tax1Amt=parseFloat((gstInRs*taxPerPerc1)/100);

				}
			   if(tax2==0)
				{
				   taxPerPerc2=0;
				}
			   else
				{
					taxPerPerc2=parseFloat((tax2*100)/tax3);
					tax2Amt=parseFloat((gstInRs*taxPerPerc2)/100);

				}
			}
			
         

			$('#gstrs').html(gstInRs.toFixed(2));  
			document.getElementById("gst_rs").setAttribute('value',gstInRs.toFixed(2));

			var mGstAmt=mrpBaseRate;
			$('#mgstamt').html('AMT-'+mGstAmt.toFixed(2)); 
			document.getElementById("m_gst_amt").setAttribute('value',mGstAmt.toFixed(2));
			
			$('#price').html(wt*dbRate);
			$('sp_calc_price').html(wt*dbRate);
			//$('#rate').html(wt*flavourAdonRate);	
			//document.getElementById("sp_add_rate").setAttribute('value',wt*flavourAdonRate);
			
			$('#rate').html(totalFlavourAddonRate);$('#sp_add_rate').html(totalFlavourAddonRate);
			document.getElementById("sp_add_rate").setAttribute('value',totalFlavourAddonRate);
			$('#subtotal').html(spSubtotal);	
			document.getElementById("sp_sub_total").setAttribute('value',spSubtotal);
			
			$('#INR').html('INR-'+spSubtotal);
			document.getElementById("sp_grand").setAttribute('value',spSubtotal);
			$('#tot').html('TOTAL-'+spSubtotal);
			document.getElementById("total_amt").setAttribute('value',spSubtotal);
			//$('#rmAmt').html(spSubtotal);
		//	document.getElementById("rm_amount").setAttribute('value',spSubtotal);
			
			document.getElementById("t1amt").setAttribute('value',tax1Amt.toFixed(2));
			
			document.getElementById("t2amt").setAttribute('value',tax2Amt.toFixed(2));
			}
	}</script>

	<script type="text/javascript">
		$(document)
				.ready(
						function() { // if all label selected set all items selected

							$('#fr_id')
									.change(
											function() {
												var selected = $('#fr_id')
														.val();
												 $('#loader').show();
												if (selected == -1) {
													$
															.getJSON(
																	'${setAllFrIdSelected}',
																	{
																		//	selected : selected,
																		ajax : 'true'
																	},
																	function(
																			data) {
																		var html = '<option value="">Select Franchise</option>';

																		var len = data.length;

																		$(
																				'#fr_id')
																				.find(
																						'option')
																				.remove()
																				.end()
																		$(
																				"#fr_id")
																				.append(
																						$(
																								"<option></option>")
																								.attr(
																										"value",
																										-1)
																								.text(
																										"ALL"));

																		for (var i = 0; i < len; i++) {

																			$(
																					"#fr_id")
																					.append(
																							$(
																									"<option selected></option>")
																									.attr(
																											"value",
																											data[i].frId)
																									.text(
																											data[i].frName));
																		}

																		$(
																				"#fr_id")
																				.trigger(
																						"chosen:updated");
																		 $('#loader').hide();
																	});
												}
											});
						});
	</script>
	<script type="text/javascript">
		$(document)
				.ready(
						function() { // if all label selected set all items selected

							$('#menu')
									.change(
											function() {
												var selected = $('#menu').val();
												 $('#loader').show();
												if (selected == -1) {
													$
															.getJSON(
																	'${setAllMenuSelected}',
																	{
																		//	selected : selected,
																		ajax : 'true'
																	},
																	function(
																			data) {
																		var html = '<option value="">Select Menus</option>';

																		var len = data.length;

																		$(
																				'#menu')
																				.find(
																						'option')
																				.remove()
																				.end()
																		$(
																				"#menu")
																				.append(
																						$(
																								"<option></option>")
																								.attr(
																										"value",
																										-1)
																								.text(
																										"ALL"));

																		for (var i = 0; i < len; i++) {

																			$(
																					"#menu")
																					.append(
																							$(
																									"<option selected></option>")
																									.attr(
																											"value",
																											data[i].settingId)
																									.text(
																											data[i].menuTitle));
																		}

																		$(
																				"#menu")
																				.trigger(
																						"chosen:updated");
																		 $('#loader').hide();
																	});
												}
											});
						});
	</script>
	
	<script type="text/javascript">
$( document ).ready(function() {
   // alert("onload2"+$('#sectionId').val())
    var isEditOrder=${isEdit};
    if(parseInt(isEditOrder)==0){
    var sec=$('#sectionId').val();
    getMenus(sec);
    var selectedMenuId=$("#selectedMenu").val();
   // alert("hhhhh " +selectedMenuId);
	afterReload(selectedMenuId);
    }
});
</script>
<script type="text/javascript">
function afterReload(menuId) {	
var	spCode=document.getElementById("selectedSp").value;
	 var frId =document.getElementById("fr_id").value;
	 //alert("afterReloadspCode"+spCode)
	//alert("menuIndex"+ JSON.stringify($("#menuIndex"+menuId).data))
	  $('#loader').show();
	var fd = new FormData();
	fd.append('menuId',menuId);
	var abc=document.getElementById("spMenuId").selectedIndex;
	//alert("sel Index-->"+abc)
	//var menuIndex = $("#menuIndex"+menuId).data("menuindex");
	fd.append('menuIndex', abc);
	//alert("afterReloadmenuIndex"+menuIndex)
	
	//$('#txtPlaces').val(cityname + " ");
	// var menuIndex = $("#menuIndex" + $('option:selected', this).val()).data("menuIndex");
	$
	.ajax({
	url : '${pageContext.request.contextPath}/getAllFrIdNameByMenuId',
	type : 'post',
	dataType : 'json',
	data : fd,
	contentType : false,
	processData : false,
	success : function(resData) {
		var html = '<option value="-1"></option>';
		var len = resData.length;
		if(len==0 && frId==null ){
			 $('#loader').hide();
			 alert("No Assigned Franchise found with selected menu");
		}
		 $('#fr_id')
		.find('option')
	    .remove()
	    .end();
		 
			$("#fr_id").append(
                    $("<option  ></option>").attr(
                        "value", 0).text("Select Franchisee")
                );
		 
		 
		 
		for ( var i = 0; i < len; i++) {
			if(frId==resData[i].frId){
				$("#fr_id").append(
	                     $("<option selected ></option>").attr(
	                         "value", resData[i].frId).text(resData[i].frName)
	                 );
				
			}else{
				$("#fr_id").append(
	                     $("<option ></option>").attr(
	                         "value", resData[i].frId).text(resData[i].frName)
	                 );
			}
		} 
		$("#fr_id").trigger("chosen:updated");
		  $('#loader').hide();
	},
	});
	  $('#loader').show();
	$
	.ajax({
	url : '${pageContext.request.contextPath}/getSPCodesByMenuId',
	type : 'post',
	dataType : 'json',
	data : fd,
	contentType : false,
	processData : false,
	success : function(resData) {
		var html = '<option value="-1"></option>';
		var len = resData.length;
		//alert(len)
		if(len==0 && spCode==null){
			 $('#loader').hide();
			alert("No Assigned Franchise found with selected menu");
		}
		 $('#sp_cake_id')
		.find('option')
	    .remove()
	    .end();
		 $("#sp_cake_id").append(
               $("<option ></option>").attr(
                   "value", "").text("Select Special Cake")
           );
		
		
		for ( var i = 0; i < len; i++) {
			
			
			if(spCode==resData[i]){
				$("#sp_cake_id").append(
	                     $("<option selected ></option>").attr(
	                         "value", resData[i]).text(resData[i])
	                 );
			}else{
				
				$("#sp_cake_id").append(
	                     $("<option ></option>").attr(
	                         "value", resData[i]).text(resData[i])
	                 );
			}
		} 
		
		
		$("#sp_cake_id").trigger("chosen:updated");
		
		  $('#loader').hide();
	},
	});
}



</script>

	

	<script>

function chChange() {
	
	var flavourAdonRate=$("#flvAdRate").val();
	var mrp=$("#mrp").val();
	var profitPer=$("#profPer").val();
	setData(flavourAdonRate,mrp,profitPer);
	
	if(1==2){
	var wt = $('#spwt').find(":selected").text();
	var flavourAdonRate =$("#dbAdonRate").val();
	var tax3 = parseFloat($("#tax3").val());
	var tax1 = parseFloat($("#tax1").val());
	var tax2 = parseFloat($("#tax2").val());
	//document.getElementById("adv").value=0;
	var sp_ex_charges= parseFloat($("#sp_ex_charges").val());
	var sp_disc=parseFloat($("#sp_disc").val());
	//alert("sp_disc"+sp_disc);
	var dbRate = $("#dbPrice").val();//dbRate
	//alert("tax1:"+tax1+"tax2"+tax2+"tax3"+tax3);
	var billBy=${billBy};
	
	var totalCakeRate = wt*dbRate;
	var totalFlavourAddonRate = wt*flavourAdonRate;
	if(billBy==1){
		totalFlavourAddonRate= wt*(flavourAdonRate*0.8);
		//alert("totalFlavourAddonRate in if by =1 " +totalFlavourAddonRate);
	}	
    var add=parseFloat(totalCakeRate+totalFlavourAddonRate);
    var grandTotal=parseFloat(add);
    //alert("without sp_ex_charges"+add);
	var spSubtotal=add+sp_ex_charges;
	//alert("with sp_ex_charges"+spSubtotal);
	//document.getElementById("adv").value=0;
	
	var disc_amt=(spSubtotal*sp_disc)/100;
	//alert("disc_amt"+disc_amt);
	
	spSubtotal=spSubtotal-disc_amt;
	
	
	//alert("final "+spSubtotal);
	
	
	//var mrpBaseRate=parseFloat((spSubtotal*100)/(tax3+100));
	
	var spSubTotalTemp=parseFloat(spSubTotal)-discAmt
	var mrpBaseRate = parseFloat((spSubTotalTemp * 100) / (tax3 + 100));
	
	var gstInRs=0;
	var taxPerPerc1=0;
	var taxPerPerc2=0;
	var tax1Amt=0;
	var tax2Amt=0;
	if(tax3==0)
		{
		    gstInRs=0;
		
		}
    else
	{
	   gstInRs=(mrpBaseRate*tax3)/100;
		
	   if(tax1==0)
		{
		   taxPerPerc1=0;
		}
	   else
		{
		    taxPerPerc1=parseFloat((tax1*100)/tax3);
		    tax1Amt=parseFloat((gstInRs*taxPerPerc1)/100);

		}
	   if(tax2==0)
		{
		   taxPerPerc2=0;
		}
	   else
		{
			taxPerPerc2=parseFloat((tax2*100)/tax3);
			tax2Amt=parseFloat((gstInRs*taxPerPerc2)/100);

		}
	}
	
 

	$('#gstrs').html(gstInRs.toFixed(2));  document.getElementById("gst_rs").setAttribute('value',gstInRs.toFixed(2));

	var mGstAmt=mrpBaseRate;
	$('#mgstamt').html('AMT-'+mGstAmt.toFixed(2));  document.getElementById("m_gst_amt").setAttribute('value',mGstAmt.toFixed(2));
	
	$('#price').html(wt*dbRate);
	document.getElementById("sp_calc_price").value=wt*dbRate;
	$('#rate').html(wt*flavourAdonRate);	
	document.getElementById("sp_add_rate").setAttribute('value',wt*flavourAdonRate);
	//$('#subtotal').html(grandTotal);	
	
	$('#subtotal').html(spSubtotal);	
	/* document.getElementById("sp_sub_total").setAttribute('value',add); */
	document.getElementById("sp_sub_total").setAttribute('value',spSubtotal);
	
	$('#INR').html('INR-'+spSubtotal);
	document.getElementById("sp_grand").setAttribute('value',spSubtotal);
	$('#tot').html('TOTAL-'+spSubtotal);
	document.getElementById("total_amt").setAttribute('value',spSubtotal);
	//$('#rmAmt').html(spSubtotal);
	//document.getElementById("rm_amount").setAttribute('value',spSubtotal);
	
	document.getElementById("t1amt").setAttribute('value',tax1Amt.toFixed(2));
	
	document.getElementById("t2amt").setAttribute('value',tax2Amt.toFixed(2));
	}
}


</script>

	<script>
function showDiv(elem){
   if(elem.value == 1)
	   {
         document.getElementById('marathiDiv').style.display= "block";
         document.getElementById('transliterateTextarea').value = '';
         document.getElementById('englishDiv').style="display:none";
	   }
   else if(elem.value == 2)
   {
	   document.getElementById('englishDiv').style.display = "block";
	   document.getElementById('textarea').value = '';
	   document.getElementById('marathiDiv').style="display:none";
   }
 
}
</script>

	<script type="text/javascript">
function showCtype(){
var temp=document.getElementById('temp').value;
	/* if(temp==0)
		{
		document.getElementById('cktype').innerHTML = 'Alphabetical';

		}else if(temp==1)
		{
			document.getElementById('cktype').innerHTML = 'Numerical';
		}else
	if (temp == 2 ) { */  ///regular
		document.getElementById("ctype1").style = "display:none" //hide numeric
/* 	}
 */	
}

</script>
	<!------------------------------BLANK VALIDATION FOR SPCODE------------------------------------------>

	<script type="text/javascript">
function validateForm() {
    var spCode = document.forms["form"]["sp_code"].value;
    if (spCode == "") {
        //alert("Special Cake Code must be filled out");
        document.getElementById('sp_code').focus();
        return true;
    }
}
</script>
	<!-------------------------------------------ALL VALIDATIONS----------------------------------------->
	<script type="text/javascript">
function validate() {
	//alert("ok")
	try{
	 var phoneNo = /^\d{10}$/;  
	
     var eventName,spId,spCustName,spPlace,spCustMob,spType,spFlavour,spCode,spWt,deliveryDate,spProdDate,custDob,frName,gstNo,custEmail,spMenuId,custGstNo,sectionId;
     try{
    	 
     eventName = document.getElementById("event_name").value;
     //spCustName=document.getElementById("sp_cust_name").value;
   //  spCustMob=document.getElementById("cust_mobile").value; 
     spType=document.getElementById("sptype").value; 
     spCode=document.getElementById("sp_cake_id").value;
     spFlavour=document.getElementById("spFlavour").value;
     deliveryDate=document.getElementById("datepicker").value;
     spProdDate=document.getElementById("spProdDate").value;
     custDob=document.getElementById("datepicker4").value;
     frName=document.getElementById("fr_name").value;
   //  gstNo=document.getElementById("gst_no").value;
   //  custEmail=document.getElementById("cust_email").value;
     spMenuId=document.getElementById("spMenuId").value;
     }catch (e) {
		//alert("ee"+e)
	}
   //  custGstNo=document.getElementById("cust_gst_no").value;
   //  sectionId=document.getElementById("sectionId").value;
     spWt=document.getElementById("spwt").value;
    var isValid=true; 
    $("#flavor_alert").hide();
    $("#fr_alert").hide();
	$("#menu_alert").hide();
	 $("#wt_alert").hide();
	 $("#sp_cd_alert").hide();  
	 //alert(spCode)
    if (spCode == ""||spCode==null) {
    	  isValid= false;
       $("#fr_alert").show();  
       $("#menu_alert").show();
    }else if (parseInt(spCode)<1){
    	// alert("Special Cake Code must be filled out");
    	 $("#sp_cd_alert").show();  
        isValid= false;
    }else  
    if (spType == "") {
        alert("Please Select Flavour Type");
      
        isValid= false;
    }else if (spFlavour == ""||spFlavour==null ||isNaN(spFlavour)) {
       //alert("Please Select Flavour");
         $("#flavor_alert").show();
        isValid=false;
    }else  if (spWt == ""||spWt==null ||isNaN(spWt)) {
       //alert("Please Select Special Cake Weight");
        $("#wt_alert").show();
        isValid= false;
    }/* else  if (eventName == "") {
        alert("Please Enter Message/Name");
        document.getElementById('event_name').focus();
        
        isValid=false;
    } */else  if (deliveryDate == "") {
        alert("Please Select Date of Delivery");
        document.getElementById('datepicker').focus();
        
        isValid=false;
    }else  if (spProdDate == "") {
        alert("Please Select Date of Production");
        document.getElementById('spProdDate').focus();
       
        isValid=false;
    }  else if (spCustName == "") {
        alert("Please Enter Customer Name");
        document.getElementById('sp_cust_name').focus();

        isValid= false;
    }
    else if (custDob== "") {
        alert("Please Select Customer DOB");
        document.getElementById('datepicker4').focus();

        isValid= false;
    }
    else if (frName== "") {
    //	alert("Please Select Franchise Name");
   $("#fr_alert").show();    
   //document.getElementById('fr_name').focus();
        isValid= false;
    }
    else if (gstNo== "") {
    	alert("Please Enter GST No.");
       // document.getElementById('gst_no').focus();
        isValid= false;
    }
    else if (custEmail== "") {
    	alert("Please Enter Email Of Customer");
       // document.getElementById('cust_email').focus();
        isValid= false;
    }
   /*  else  if(!spCustMob.match(phoneNo))  
	  {  
    	 alert("Not a valid Mobile Number");  
	     document.getElementById('cust_mobile').value="";
	     document.getElementById('cust_mobile').focus();
	     return false;  
	  }   */
	  else   if (spMenuId== ""||spMenuId==null) {
	 
		  //alert("Please Select Menu");
			$("#menu_alert").show();
	       // document.getElementById('cust_email').focus();
	        isValid= false;
	  }  else   if (custGstNo== "") {
		  alert("Please Enter Customer GST No.");
	        //document.getElementById('custGstNo').focus();
	        isValid= false;
	  }   else   if (custGstNo== "") {
		  alert("Please Select Section.");
	       // document.getElementById('sectionId').focus();
	        isValid= false;
	  }  
   //alert(isValid)
	}catch (e) {
		alert(e)
	}
    return isValid;
 
}
</script>

	<script type="text/javascript">
function findFranchiseeData(billNo)
{
	if(billNo>0)
	showPdf(billNo);
	  var frId=document.getElementById("fr_id").value;
	  //alert(frId)
		document.getElementById("fr_id_selected").value=frId;

		 $('#loader').show();
	$.getJSON(
					'${findFranchiseeData}',
					{
						fr_id:frId,
						ajax : 'true'
					},
					function(data) {
						if(data.length!=0)
							{
                              document.getElementById("fr_name").value=data.frName;
                              document.getElementById("gst_no").value=data.frGstNo;
                            //  document.getElementById("address").value=data.frAddress;
                              $('#loader').hide();
                              $("#fr_alert").hide(); 
							}
						
					});
	 $('#loader').hide();
}
</script>
	<script type="text/javascript">
function showPdf(billNo)
{
	if(billNo!=0)
		{
        window.open('${pageContext.request.contextPath}/pdf?url=pdf/showBillPdf/By-Road/0/'+billNo,'_blank');

		}
	

}
</script>
	<script type="text/javascript">
 jQuery(function() {
   jQuery('#sp_cake_id').change(function() {
	  var frId=document.getElementById("fr_id").value;
	  //alert(frId)
	    $("#sp_cd_alert").hide();  
			  $("#fr_alert").hide();  
	  var spId=document.getElementById("sp_cake_id").value; 
	  if(frId!="" && spId!="" && frId!=null && parseInt(frId)>0)
		  {
	       this.form.submit();

		  }else  
			  {
			 // alert("Please Select Franchisee/Special Cake");
			  $("#sp_cd_alert").show();  
			  $("#fr_alert").show();  
			  }
	
   });
});
 
 $(function() {
	    $("#spMenuId").change(function() {	    	
	    	  $('#loader').show();
	    	var fd = new FormData();
	    	fd.append('menuId', $('option:selected', this).val());
	    	var menuIndex = $("#menuIndex"+$('option:selected', this).val()).data("menuindex");
	    	fd.append('menuIndex', menuIndex);
	    	
			//$('#txtPlaces').val(cityname + " ");
			// var menuIndex = $("#menuIndex" + $('option:selected', this).val()).data("menuIndex");
	    	$
	    	.ajax({
	    	url : '${pageContext.request.contextPath}/getAllFrIdNameByMenuId',
	    	type : 'post',
	    	dataType : 'json',
	    	data : fd,
	    	contentType : false,
	    	processData : false,
	    	success : function(resData) {
	    		var html = '<option value="-1"></option>';
	    		var len = resData.length;
	    		if(len==0){
	    			 $('#loader').hide();
	    			 alert("No Assigned Franchise found with selected menu");
	    		}
	    		 $('#fr_id')
	    		.find('option')
	    	    .remove()
	    	    .end();
	    		 
	    		 
	    		 $("#fr_id").append(
                         $("<option ></option>").attr(
                             "value", 0).text("Select Franchisee")
                     );
	    		 
	    		 
	    		for ( var i = 0; i < len; i++) {
	    			$("#fr_id").append(
	                           $("<option ></option>").attr(
	                               "value", resData[i].frId).text(resData[i].frName)
	                       );
	    		} 
	    		$("#fr_id").trigger("chosen:updated");
	    		  $('#loader').hide();
	    		  $("#menu_alert").hide(); 
	    	},
	    	});
	    	  $('#loader').show();
	    	$
	    	.ajax({
	    	url : '${pageContext.request.contextPath}/getSPCodesByMenuId',
	    	type : 'post',
	    	dataType : 'json',
	    	data : fd,
	    	contentType : false,
	    	processData : false,
	    	success : function(resData) {
	    		var html = '<option value="-1"></option>';
	    		var len = resData.length;
	    		//alert(len)
	    		if(len==0){
	    			 $('#loader').hide();
	    			 alert("No Assigned Franchise found with selected menu");
	    		}
	    		 $('#sp_cake_id')
	    		.find('option')
	    	    .remove()
	    	    .end();
	    		 
	    		 
	    		 
	    		 	$("#sp_cake_id").append(
	                         $("<option ></option>").attr(
	                             "value", 0).text("Select Special Cake")
	                     );
	    		 
	    		for ( var i = 0; i < len; i++) {
	    			$("#sp_cake_id").append(
	                           $("<option ></option>").attr(
	                               "value", resData[i]).text(resData[i])
	                       );
	    		} 
	    		$("#sp_cake_id").trigger("chosen:updated");
	    		  $('#loader').hide();
				   $("#menu_alert").hide(); 

	    	},
	    	});
	    });
	    $('#loader').hide();
	});
 
 /* $(function() {
	    $("#fr_id").change(function() {
	    	  $('#loader').show();
	    	  var menuId=document.getElementById("spMenuId").value;
	    	var fd = new FormData();
	    	fd.append('menuId', menuId);
	    	$
	    	.ajax({
	    	url : '${pageContext.request.contextPath}/getSPCodesByMenuId',
	    	type : 'post',
	    	dataType : 'json',
	    	data : fd,
	    	contentType : false,
	    	processData : false,
	    	success : function(resData) {
	    		var html = '<option value="-1"></option>';
	    		var len = resData.length;
	    		if(len==0){
	    			 $('#loader').hide();
	    			 alert("No Assigned Franchise found with selected menu");
	    		}
	    		 $('#sp_cake_id')
	    		.find('option')
	    	    .remove()
	    	    .end();
	    		for ( var i = 0; i < len; i++) {
	    			$("#sp_cake_id").append(
	                           $("<option ></option>").attr(
	                               "value", resData[i]).text(resData[i])
	                       );
	    		} 
	    		$("#sp_cake_id").trigger("chosen:updated");
	    		  $('#loader').hide();
	    	},
	    	});
	    });
	    $('#loader').hide();
	}); */
	
	function getMenus(sectionId) {
		var selctedMenu=$('#selectedMenu').val();
		 $('#loader').show();
		$.getJSON('${getMnlBillMenusSectionAjax}', {	
			sectionId : sectionId,
			ajax : 'true'
		}, function(data) {
			var len = data.length;
			
			$('#spMenuId')
		    .find('option')
		    .remove()
		    .end();
			  $("#spMenuId").append($("<option></option>").attr( "value",-1).text("SELECT ANY MENU")); 
			for ( var i = 0; i < len; i++) {
				 if(data[i].menuId==selctedMenu){
					 
						$("#spMenuId").append(
			                       $("<option selected id='menuIndex"+data[i].menuId+"' data-menuindex='"+i+"'></option>").attr(
			                           "value", data[i].menuId).text(data[i].menuTitle)
			             );
					 
				 }else{
						$("#spMenuId").append(
			                       $("<option id='menuIndex"+data[i].menuId+"' data-menuindex='"+i+"'></option>").attr(
			                           "value", data[i].menuId).text(data[i].menuTitle)
			             );
					 
				 }
				 
			
			}

			   $("#spMenuId").trigger("chosen:updated");
			   $('#loader').hide();
		});
	}
	
</script>
</body>
</html>