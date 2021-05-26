<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.buttonload {
    background-color: white; /* Green background */
    border: none; /* Remove borders */
    color: #ec268f; /* White text */
    padding: 12px 20px; /* Some padding */
    font-size: 15px; /* Set a font-size */
    display:none;
}

/* Add a right margin to each icon */
.fa {
    margin-left: -12px;
    margin-right: 8px;
}
</style>
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<body>
	<jsp:include page="/WEB-INF/views/include/logout.jsp"></jsp:include>
 <c:url var="getItemsByCatId" value="/getItemByIdUpdateHsn"></c:url>
 <c:url value="/getAllItemAjaxHsn" var="getAllItemAjaxHsn" ></c:url>

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
						<i class="fa fa-file-o"></i> Update Items
					</h1>
 -->
					<c:set var="isEdit" value="0">
					</c:set>
					<c:set var="isView" value="0">
					</c:set>
					<c:set var="isAdd" value="0">
					</c:set>

					<c:forEach items="${sessionScope.newModuleList}" var="modules">
						<c:forEach items="${modules.subModuleJsonList}" var="subModule">

							<c:choose>
								<c:when test="${subModule.subModuleMapping eq 'addItem'}">

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
										<c:when test="${subModule.view=='visible'}">
											<c:set var="isView" value="1">
											</c:set>
										</c:when>
										<c:otherwise>
											<c:set var="isView" value="0">
											</c:set>
										</c:otherwise>
									</c:choose>


									<c:choose>
										<c:when test="${subModule.addApproveConfig=='visible'}">
											<c:set var="isAdd" value="1">
											</c:set>
										</c:when>
										<c:otherwise>
											<c:set var="isAdd" value="0">
											</c:set>
										</c:otherwise>
									</c:choose>
								</c:when>
							</c:choose>
						</c:forEach>
					</c:forEach>

				</div>
			</div>
			<!-- END Page Title -->

			<!-- BEGIN Main Content -->
			<div class="row">
				<div class="col-md-12">
					<div class="box">
						<div class="box-title">
							<h3>
								&nbsp; &nbsp;<i class="fa fa-bars"></i> Update Product HSN Code And Tax 
							</h3>
							<div class="box-tool">

								<a href="${pageContext.request.contextPath}/itemList">Back
									to List &nbsp;&nbsp;</a> <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a>


							</div>
							
						</div>


						<div ><!-- class="box-content" -->
							<form action="${pageContext.request.contextPath}/updateHsnAndTaxPerc" class="form-horizontal"
								method="post" id="validation-form" enctype="multipart/form-data">
					
					
						<div class="frm_Sec_one single">
							<div class="row">
								<div class="col-md-3 box_marg">
											<label class="control-label left">Category</label>
												<div class="controls icon_add">
													<i class="fa fa-list-ul frm_icon" aria-hidden="true" style="left:10px;"></i>	
													<select name="cat_id" id="cat_id" class="form-control padd_left chosen" placeholder="Select Category" onchange="catChange(this.value)">
											<option value="">Select Category</option>
										 <c:forEach items="${mCategoryList}" var="mCategoryList">
										            	  <option value="${mCategoryList.catId}"><c:out value="${mCategoryList.catName}"></c:out></option>
										</c:forEach> 
												
								</select>
										</div>
										<button class="buttonload" id="loader">
                                   <i class="fa fa-spinner fa-spin"></i>Loading
                                   </button>
							</div>
							
							<div class="col-md-3 box_marg">
											<label class="control-label left">Item</label>
												<div class="controls icon_add">
													<i class="fa fa-coffee frm_icon" aria-hidden="true" style="left:10px;"></i>	
													<select name="items[]" id="items" multiple="multiple" data-rule-required="true" class="form-control padd_left chosen" onchange="AllItemsel()" multiplaceholder="Select Item">
										<%-- <c:forEach items="${itemsList}" var="item">
												<option value="${item.id}"><c:out value="${item.itemName}"></c:out></option>
										</c:forEach> --%>
								   </select>
								   
												
										</div>
										<span class="span_err" id="err_item" >Enter Item</span>
							</div>
							
							<div class="col-md-3 box_marg">
											<label class="control-label left">HSN Code</label>
												<div class="controls icon_add">
													<i class="fa fa-code frm_icon" aria-hidden="true" style="left:10px;"></i>	
													<input type="text" name="hsn_code" id="hsn_code"
											placeholder="Hsn Code" class="form-control padd_left"
											data-rule-required="true" />
												
										</div>
										 <span class="span_err" id="err_hsn" >Enter HSN Code</span>
							</div>
							
							<div class="col-md-2 box_marg">
											<label class="control-label left">GST Tax %</label>
												<div class="controls icon_add">
													<i class="fa fa-money frm_icon" aria-hidden="true"></i>
													<input type="text" name="taxPer" id="taxPer"
											placeholder="IGST" class="form-control padd_left"
											data-rule-required="true" data-rule-number="true" 
											onchange="calTotalGstadd()" />
													
												</div>
												 <span class="span_err" id="err_gst" >Enter GST Tax</span>
										</div>
							
							<div class="col-md-3 box_marg" style="display: none;">
											<label class="control-label left">IGST %</label>
												<div class="controls icon_add">
													<i class="fa fa-money frm_icon" aria-hidden="true" style="left:10px;"></i>	
													<input type="text" name="item_tax3" id="item_tax3"
											placeholder="IGST" class="form-control padd_left"
											data-rule-required="true" data-rule-number="true" value="0.0"
											onchange="calTotalGst()" />
												
										</div>
							</div>
							
							<div class="col-md-3 box_marg" style="display: none;">
											<label class="control-label left">CGST %</label>
												<div class="controls icon_add">
													<i class="fa fa-money frm_icon" aria-hidden="true" style="left:10px;"></i>	
													<input type="text" name="item_tax2" id="item_tax2"
											placeholder="CGST" class="form-control padd_left"
											data-rule-required="true" data-rule-number="true" value="0.0"
											onchange="calTotalGst()" />
												
										</div>
							</div>
							
							<div class="col-md-3 box_marg" style="display: none;">
											<label class="control-label left">SGST %</label>
												<div class="controls icon_add">
													<i class="fa fa-money frm_icon" aria-hidden="true" style="left:10px;"></i>
													<input type="text" name="item_tax1" id="item_tax1"
											placeholder="SGST" class="form-control padd_left"
											data-rule-required="true" data-rule-number="true" value="0.0" />
										</div>
							</div>
							
							
							
							<div class="col-md-3 box_marg" style="display: none;">
											<label class="control-label left">Total GST Applicable %</label>
												<div class="controls icon_add">
													<i class="fa fa-money frm_icon" aria-hidden="true" style="left:10px;"></i>
													<input type="text" name="total_gst_appli" id="total_gst_appli"
											placeholder="Total GST Applicable" class="form-control padd_left"
											data-rule-required="true" data-rule-number="true" disabled />
										</div>
							</div>
							
							
							
							
						</div></div>

                        
                              
							<div class="form-group">
								<div class="row three_buttons">
									<c:choose>

											<c:when test="${isAdd==1}">

												<input type="submit" class="btn btn-primary" value="Submit" id="sub_btn">

											</c:when>

											<c:otherwise>
												<input type="submit" disabled="disabled"
													class="btn btn-primary" value="Submit" id="sub_btn">

											</c:otherwise>
										</c:choose>

										<button type="button" class="btn btn-primary">Cancel</button>
									
						</div>
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



	<script>
		function calTotalGst() {
			var igst = parseFloat($("#item_tax3").val());
			var cgst = parseFloat($("#item_tax2").val());
			var sgst = parseFloat(igst - cgst);
			var totGst = parseFloat(cgst + sgst);

			document.getElementById("item_tax1").setAttribute('value', sgst);

			document.getElementById("total_gst_appli").setAttribute('value',
					totGst);
		}
	</script>
	<script>
		function calTotalGstadd() {
			var igst = parseFloat($("#taxPer").val());
			
			var cgst = igst/2;
			var sgst = igst/2;
			var totGst = parseFloat(cgst + sgst);
			
			document.getElementById("item_tax1").setAttribute('value', sgst);
			document.getElementById("item_tax2").setAttribute('value', cgst);
			document.getElementById("item_tax3").setAttribute('value', igst);
			document.getElementById("total_gst_appli").setAttribute('value',
					totGst);
		}
	</script>
	
<script type="text/javascript">

			function catChange(cat_id) {
				$('#loader').show();
				$.getJSON('${getItemsByCatId}', {
					catId : cat_id,
					ajax : 'true'
				}, function(data) {
					var html = '';
					$('#loader').hide();
					var len = data.length;
					
					
					/*  $("#items").append($("<option></option>").attr( "value",-1).text("ALL"));
					for ( var i = 0; i < len; i++) {
						html += '<option value="' + data[i].id + '">'
								+ data[i].itemName + '</option>';
					}
					html += '</option>';
					$('#items').html(html); */
					
					
					
					
					$('#items')
				    .find('option')
				    .remove()
				    .end()
				 $("#items").append($("<option></option>").attr( "value",-1).text("ALL"));
                    for ( var i = 0; i < len; i++) {
                            
                                
                        $("#items").append(
                                $("<option></option>").attr(
                                    "value", data[i].id).text(data[i].itemName)
                            );
                    }
					
					
					
					
					   $("#items").trigger("chosen:updated");
					   
					   
					   

				});
			}
</script>
<script type="text/javascript">
function AllItemsel() {
	var itemId=$('#items').val();
	//alert(itemId)
	
	if(itemId==-1){
		//alert("All")
		$.getJSON('${getAllItemAjaxHsn}', {
			
			ajax : 'true'
		}, function(data) {
			//alert(JSON.stringify(data))
			var len = data.length;
			$('#items')
		    .find('option')
		    .remove()
		    .end()
		 $("#items").append($("<option></option>").attr( "value",-1).text("ALL"));
            for ( var i = 0; i < len; i++) {
                    
                        
                $("#items").append(
                        $("<option selected></option>").attr(
                            "value", data[i].id).text(data[i].itemName)
                    );
            }
			
			
			
			
			   $("#items").trigger("chosen:updated");
			
			
		});
	}
	
}
     
$("#sub_btn")
.on(
		"click",
		function() {
			
			var isError = false;
			var errMsg = "";

			if (!$("#taxPer").val().trim()) {
				isError = true;
				$("#err_gst").show();
			} else {
				$("#err_gst").hide();
			}
			
			if (!$("#items").val()) {
				isError = true;
				$("#err_item").show();
			} else {
				$("#err_item").hide();
			}
			
			if (!$("#hsn_code").val().trim()) {
				isError = true;
				$("#err_hsn").show();
			} else {
				$("#err_hsn").hide();
			}
			
			
			
		
			return false;
		});
</script>
</body>
</html>