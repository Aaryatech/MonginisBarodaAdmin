<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	 

	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
	<body onload="onCatIdChange(${suppCatId},${suppId})">
	
	<jsp:include page="/WEB-INF/views/include/logout.jsp"></jsp:include>
	
	<c:url var="getItemsByCatId" value="/getItemsByCatId" />

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
						<i class="fa fa-file-o"></i>Item Supplement
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
								<i class="fa fa-bars"></i> Add Product Supplement 
							</h3>
							<div class="box-tool">
								<a href="${pageContext.request.contextPath}/showItemSupList">Back to List</a> <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a>
							</div>
							
						</div>




						<div><!--  class="box-content" -->
							<form action="${pageContext.request.contextPath}/addItemSupProcess" class="form-horizontal"
								method="post" id="validation-form">

	                    <input type="hidden" name="id" id="id" value="${itemSupp.id}"/>
							  <c:choose>
							  <c:when test="${isEdit==1}">
							  
							  <div class="frm_Sec_one single">									
									<div class="row">
										<div class="col-md-6 box_marg" >
											<label class="control-label left">Category</label>
												<div class="controls icon_add">
												<i class="fa fa-list-ul frm_icon" aria-hidden="true"></i>
												<select name="cat_id" id="cat_id" class="form-control padd_left" placeholder="Select Category"disabled="disabled">
											<option value="-1">Select Category</option>
										 <c:forEach items="${mCategoryList}" var="mCategoryList">
										            	  <option value="${mCategoryList.catId}"><c:out value="${mCategoryList.catName}"></c:out></option>
										</c:forEach> 
												
								</select>	
				
												</div>
										</div>
										
										
										<div class="col-md-6 box_marg" >
											<label class="control-label left">Item</label>
												<div class="controls icon_add">
												<i class="fa fa-coffee frm_icon" aria-hidden="true"></i>
												<select name="item_id" id="item_id" class="form-control padd_left" placeholder="Select Item" disabled="disabled">
											<option value="-1">Select Item</option>
											
												
								</select>
				
												</div>
										</div>
									</div>
								</div>	
                             
								</c:when>
								<c:otherwise>
								
								<div class="frm_Sec_one single">									
									<div class="row">
										<div class="col-md-6 box_marg" >
											<label class="control-label left">Category</label>
												<div class="controls icon_add">
												<i class="fa fa-list-ul frm_icon" aria-hidden="true"></i>
												<select name="cat_id" id="cat_id" data-rule-required="true" class="form-control padd_left chosen" placeholder="Select Category" onchange="onCatIdChange(this.value,0)">
											<option value="-1">Select Category</option>
										 <c:forEach items="${mCategoryList}" var="mCategoryList">
										 <c:choose>
										 <c:when test="${mCategoryList.catId==suppCatId}">
										  <option value="${mCategoryList.catId}" selected><c:out value="${mCategoryList.catName}"></c:out></option>
										 </c:when>
										 <c:otherwise>
										  <option value="${mCategoryList.catId}"><c:out value="${mCategoryList.catName}"></c:out></option>
										 </c:otherwise>
										 </c:choose>
										            	 
										</c:forEach> 
												
								</select>	
				
												</div>
										</div>
										
										
										<div class="col-md-6 box_marg" >
											<label class="control-label left">Item</label>
												<div class="controls icon_add">
												<i class="fa fa-coffee frm_icon" aria-hidden="true"></i>
												<select name="item_id" id="item_id" data-rule-required="true" class="form-control padd_left" placeholder="Select Item">
											<option value="">Select Item</option>
											
												
								</select>
												</div>
										</div>
									</div>
								</div>	
								
                             
								</c:otherwise>
								</c:choose>
								
							
								<input type="hidden" name="sel_item_id" id="sel_item_id" value="${itemSupp.itemId}"/>
								
								
								<div class="frm_Sec_one single">									
									<div class="row">
										<div class="col-md-3 box_marg" >
											<label class="control-label left">Item Name</label>
												<div class="controls icon_add">
												<i class="fa fa-coffee frm_icon" aria-hidden="true"></i>
												<input type="text" name="item_name" id="item_name" class="form-control padd_left"
											 value="${itemSupp.itemName}" disabled="disabled"/>
												</div>
										</div>
										
										<div class="col-md-3 box_marg" >
											<label class="control-label left">HSN Code</label>
												<div class="controls icon_add">
												<i class="fa fa-code frm_icon" aria-hidden="true"></i>
												<input type="text" name="item_hsncd" id="item_hsncd"
											placeholder="HSN Code" class="form-control padd_left"
											data-rule-required="true" value="${itemSupp.itemHsncd}"/>
												</div>
										</div>
										
										<div class="col-md-3 box_marg" >
											<label class="control-label left">UOM</label>
												<div class="controls icon_add">
												<i class="fa fa-glass frm_icon" aria-hidden="true"></i>
												<select name="item_uom" id="item_uom" class="form-control padd_left chosen" placeholder="Item UOM"
												 data-rule-required="true" onchange="uomChanged()">
											<option value="">Select Item UOM</option>
											<c:forEach items="${rmUomList}" var="rmUomList"
													varStatus="count">
													<c:choose>
													<c:when test="${rmUomList.uomId==itemSupp.uomId}">
														<option value="${rmUomList.uomId}" selected><c:out value="${rmUomList.uom}"/></option>
													</c:when>
													<c:otherwise>
														<option value="${rmUomList.uomId}"><c:out value="${rmUomList.uom}"/></option>
													</c:otherwise>
													</c:choose>
												</c:forEach>
										</select>
												</div>
										</div>
										
										<input type="hidden" name="uom" id="uom" value="${itemSupp.itemUom}"/> 
										<div class="col-md-3 box_marg" >
											<label class="control-label left">Actual Weight</label>
												<div class="controls icon_add">
												<i class="fa fa-leaf frm_icon" aria-hidden="true"></i>
												<input type="text" name="actual_weight" id="actual_weight"
											placeholder="Actual Weight" class="form-control padd_left"
											data-rule-required="true" data-rule-number="true"value="${itemSupp.actualWeight}"/>
												</div>
										</div>
										
										<div class="col-md-3 box_marg" >
											<label class="control-label left">Base Weight</label>
												<div class="controls icon_add">
												<i class="fa fa-leaf frm_icon" aria-hidden="true"></i>
												<input type="text" name="base_weight" id="base_weight"
											placeholder="Base Weight" class="form-control padd_left"
											data-rule-required="true" data-rule-number="true" value="${itemSupp.baseWeight}"/>
												</div>
										</div>
										
										<div class="col-md-3 box_marg" >
											<label class="control-label left">Short Name</label>
												<div class="controls icon_add">
												<i class="fa fa-user frm_icon" aria-hidden="true"></i>
												<input type="text" name="short_name" id="short_name"
											placeholder="Short Name" class="form-control padd_left"
											data-rule-required="true"  value="${itemSupp.shortName}"/>
												</div>
										</div>
										
										<input type="hidden" name="input_per_qty" id="input_per_qty"
											placeholder="Input Per Unit" class="form-control"
											data-rule-required="true"  data-rule-number="true" value="1"/>
											
											<div class="col-md-3 box_marg" >
											<label class="control-label left">Cut Section</label>
												<div class="controls icon_add">
												<i class="fa fa-scissors frm_icon" aria-hidden="true"></i>
												<select name="cut_section" id="cut_section" class="form-control padd_left chosen"
												 data-rule-required="true">
											<option value="">Select Cut Section</option>
											
										<c:choose>
										<c:when test="${itemSupp.cutSection==0}">
										<option value="0" selected>Not Applicable</option>
											<option value="1">Single Cut</option>
											<option value="2">Double Cut</option>
										</c:when>
											<c:when test="${itemSupp.cutSection==1}">
											<option value="0" >Not Applicable</option>
											<option value="1"selected>Single Cut</option>
											<option value="2">Double Cut</option>
											</c:when>
											<c:when test="${itemSupp.cutSection==2}">
											<option value="0" >Not Applicable</option>
											<option value="1">Single Cut</option>
											<option value="2"selected>Double Cut</option>
											</c:when>
											<c:otherwise>
										    <option value="0" selected>Not Applicable</option>
											<option value="1">Single Cut</option>
											<option value="2">Double Cut</option>
											</c:otherwise>
										</c:choose>
										</select>
												</div>
										</div>
										
										<div class="col-md-3 box_marg" >
											<label class="control-label left">Type Of Tray</label>
												<div class="controls icon_add">
												<i class="fa fa-th-large frm_icon" aria-hidden="true"></i>
												<select name="tray_type" id="tray_type" class="form-control padd_left chosen" placeholder="Type Of Tray"
												 data-rule-required="true">
											<option value="">Select Type Of Tray</option>
											<c:forEach items="${trayTypes}" var="trayTypes"
													varStatus="count">
													<c:choose>
													<c:when test="${trayTypes.typeId==itemSupp.trayType}">
														<option value="${trayTypes.typeId}" selected><c:out value="${trayTypes.typeName}"/></option>
													</c:when>
													<c:otherwise>
														<option value="${trayTypes.typeId}"><c:out value="${trayTypes.typeName}"/></option>
													</c:otherwise>
													</c:choose>
												</c:forEach>
										</select>
												
												</div>
										</div>
										
										<div class="col-md-3 box_marg" >
											<label class="control-label left">No. Of Item Per Tray</label>
												<div class="controls icon_add">
												<i class="fa fa-list-ul frm_icon" aria-hidden="true"></i>
												<input type="text" name="no_of_item" id="no_of_item"
											placeholder="No. Of Item Per Tray" class="form-control padd_left"
											data-rule-required="true"  data-rule-number="true" value="${itemSupp.noOfItemPerTray}"/>
												
												</div>
										</div>
										
										<div class="col-md-3 box_marg" >
											<label class="control-label left">Cess %</label>
												<div class="controls icon_add">
												<i class="fa fa-money frm_icon" aria-hidden="true"></i>
												<input type="text" name="cessPer" id="cessPer"
										   class="form-control padd_left"
											 value="${itemSupp.itemCess}"/>
												
												</div>
										</div>
										
										<div class="clr"></div>
										
										
										
										<div class="col-md-3 box_marg"><!-- style="visibility: hidden;" -->
											<label class="control-label left">Gate Sale Allowed?</label>
												<div class="controls icon_add">
												<c:choose>
												<c:when test="${itemSupp.isGateSale==0}">
												<label class="radio-inline"> <input type="radio"
													name="is_gate_sale" id="optionsRadios1" value="0" checked>
													No
												</label> <label class="radio-inline"> <input type="radio"
													name="is_gate_sale" id="optionsRadios1" value="1" />
													Yes
												</label>
												</c:when>
												
												<c:when test="${itemSupp.isGateSale==1}">
												<label class="radio-inline"> <input type="radio"
													name="is_gate_sale" id="optionsRadios1" value="0" >
													No
												</label> <label class="radio-inline"> <input type="radio"
													name="is_gate_sale" id="optionsRadios1" value="1" checked/>
													Yes
												</label>
												</c:when>
												<c:otherwise>
												<label class="radio-inline"> <input type="radio"
													name="is_gate_sale" id="optionsRadios1" value="0" checked>
													No
												</label> <label class="radio-inline"> <input type="radio"
													name="is_gate_sale" id="optionsRadios1" value="1" />
													Yes
												</label>
												</c:otherwise>
												</c:choose>
												
												</div>
										</div>
										
										<div class="col-md-3 box_marg"> <!-- style="visibility: hidden;" -->
											<label class="control-label left">Gate Sale Discount Allowed?</label>
												<div class="controls icon_add">
												<c:choose>
												<c:when test="${itemSupp.isGateSaleDisc==0}">
												<label class="radio-inline"> <input type="radio"
													name="is_gate_sale_disc" id="optionsRadios1" value="0" checked>
													No
												</label> <label class="radio-inline"> <input type="radio"
													name="is_gate_sale_disc" id="optionsRadios1" value="1" />
													Yes
												</label>
												</c:when>
												
												<c:when test="${itemSupp.isGateSaleDisc==1}">
												<label class="radio-inline"> <input type="radio"
													name="is_gate_sale_disc" id="optionsRadios1" value="0" >
													No
												</label> <label class="radio-inline"> <input type="radio"
													name="is_gate_sale_disc" id="optionsRadios1" value="1" checked/>
													Yes
												</label>
												</c:when>
												<c:otherwise>
												<label class="radio-inline"> <input type="radio"
													name="is_gate_sale_disc" id="optionsRadios1" value="0" checked>
													No
												</label> <label class="radio-inline"> <input type="radio"
													name="is_gate_sale_disc" id="optionsRadios1" value="1" />
													Yes
												</label>
												</c:otherwise>
												</c:choose>
												
												</div>
										</div>
										
										
										<div class="col-md-3 box_marg"> <!-- style="visibility: hidden;" -->
											<label class="control-label left">Gate Sale Discount Allowed?</label>
												<div class="controls icon_add">
												<c:choose>
												<c:when test="${itemSupp.isAllowBday==0}">
												<label class="radio-inline"> <input type="radio"
													name="is_allow_bday" id="optionsRadios1" value="0" checked>
													No
												</label> <label class="radio-inline"> <input type="radio"
													name="is_allow_bday" id="optionsRadios1" value="1" />
													Yes
												</label>
												</c:when>
												
												<c:when test="${itemSupp.isAllowBday==1}">
												<label class="radio-inline"> <input type="radio"
													name="is_allow_bday" id="optionsRadios1" value="0" >
													No
												</label> <label class="radio-inline"> <input type="radio"
													name="is_allow_bday" id="optionsRadios1" value="1" checked/>
													Yes
												</label>
												</c:when>
												<c:otherwise>
												<label class="radio-inline"> <input type="radio"
													name="is_allow_bday" id="optionsRadios1" value="0" checked>
													No
												</label> <label class="radio-inline"> <input type="radio"
													name="is_allow_bday" id="optionsRadios1" value="1" />
													Yes
												</label>
												</c:otherwise>
												</c:choose>
												
												</div>
										</div>
										
									</div>
								</div>	
								
							
							    
						   
							    
							   
							    
							
							  
								<div class="row" style="text-align: right; padding: 15px 39px 22px 15px;">
								<input type="submit" class="btn btn-primary" value="Submit">
 								<button type="button" class="btn btn-primary">Cancel</button>
									
						</div>
								
							   
							 
							 
								
							</form>
					
							
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
/* $(document).ready(function() { 
	$('#cat_id').change( */
			function onCatIdChange(catId,itemId) {
				
				$.getJSON('${getItemsByCatId}', {
					cat_id : catId,
					ajax : 'true'
				}, function(data) {
					var html = '<option value="" selected >Select Item</option>';
					
					var len = data.length;
					for ( var i = 0; i < len; i++) {
						if(data[i].id==itemId){
						html += '<option value="' + data[i].id + '"selected>'
								+ data[i].itemName + '</option>';
								
						document.getElementById('item_name').value=data[i].itemName;	
						}
						else
							{
							html += '<option value="' + data[i].id + '">'
							+ data[i].itemName + '</option>';	
							}
					}
					html += '</option>';
					$('#item_id').html(html);

				});
                document.getElementById('sel_item_id').value=itemId;
				
			}/* );
}); */
</script>
<script type="text/javascript">
$(document).ready(function() { 
	$('#item_id').change(
			function() {
				document.getElementById('sel_item_id').value=$(this).val();
				
				document.getElementById('item_name').value=$('#item_id option:selected').text();

			});
});
</script>
<script type="text/javascript">

			function uomChanged() {
				
				document.getElementById('uom').value=$('#item_uom option:selected').text();
				
			}
</script>
</body>
</html>
