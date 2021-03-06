<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	 

	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
	<body>
	<style>
	.modal-content{
	    margin-top: 5%;
	    margin-left: 35%;
	    width: 40%;
	    height: 50%;
	}
	</style>
	<c:url value="/getFlavourPrintIds" var="getFlavourPrintIds" />
	
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
					<!--<h1>
						<i class="fa fa-file-o"></i> Flavour Ledger
					</h1>-->

				</div>
			</div> 
			<!-- END Page Title -->

			<c:set var="isEdit" value="0">
			</c:set>

			<c:set var="isDelete" value="0">
			</c:set>

			<c:forEach items="${sessionScope.newModuleList}" var="modules">
				<c:forEach items="${modules.subModuleJsonList}" var="subModule">
					<c:choose>
						<c:when
							test="${subModule.subModuleMapping eq 'showCakeTypeList'}">

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
								<c:when test="${subModule.deleteRejectApprove=='visible'}">
									<c:set var="isDelete" value="1">
									</c:set>
								</c:when>
								<c:otherwise>
									<c:set var="isDelete" value="0">
									</c:set>
								</c:otherwise>
							</c:choose>
						</c:when>
					</c:choose>

				</c:forEach>
			</c:forEach>
			

			<!-- BEGIN Main Content -->
			<div class="row">
				<div class="col-md-12">
					<div class="box">
						<div class="box-title">
							<h3>
								<i class="fa fa-bars"></i> Add Cake Type  
							</h3>
							<div class="box-tool">
								<a href=""></a> <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a>
							</div>
							<!-- <div class="box-tool">
								<a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a> <a data-action="close" href="#"><i
									class="fa fa-times"></i></a>
							</div>  -->
						</div>


						<div ><!-- class="box-content" -->
							<form action="addCakeType" class="form-horizontal"
								id="validation-form" method="post">
								
								<input type="hidden" value="${cakeType.cakeTypeId}" name="cakeTypeId" id="cakeTypeId">
								
								<div class="frm_Sec_one single">									
									<div class="row">
										<div class="col-md-3 box_marg">
											<label class="control-label left">Cake Type</label>
												<div class="controls icon_add">
													<i class="fa fa-list-ul frm_icon" aria-hidden="true"></i>
													<input type="text" name="cake_type_name" id="cake_type_name"
											placeholder="Cake Type Name" class="form-control padd_left"
											data-rule-required="true" value="${cakeType.typeName}" />
													</div>
													 <span class="span_err" id="err_type" >Enter Cake Type</span>
										</div>
										
										<div class="col-md-3 box_marg">
											<label class="control-label left">Extra Field Applicable</label>
												<div class="controls icon_add">
													<label class="radio-inline"> <input type="radio"  
									${cakeType.extraFieldApplicable == 0 ? 'checked' : ''}
											name="ex_field" id="optionsRadios0" value="0" /> Yes
										</label>
										<label class="radio-inline"> <input type="radio"
											name="ex_field" id="optionsRadios1" value="1" 
											${cakeType.extraFieldApplicable == 1 ? 'checked' : ''} />No
										</label>
													</div>
										</div>
										
										
										
										<div class="col-md-3 box_marg">
											<label class="control-label left">Condition</label>
												<div class="controls icon_add">
													<label class="radio-inline"> <input type="radio"
											name="type_con" id="optionsRadios0" value="0"
											 ${cakeType.typeCondition == 0 ? 'checked' : ''}/> Not Applicable
										</label>
										<label class="radio-inline"> <input type="radio"
											name="type_con" id="optionsRadios1" value="1"
											 ${cakeType.typeCondition == 1 ? 'checked' : ''} /> Number											
										</label>
										<label class="radio-inline"> <input type="radio"
											name="type_con" id="optionsRadios2" value="2"
											${cakeType.typeCondition == 2 ? 'checked' : ''}/> Character
										</label> 
													</div>
										</div>
										
										<div class="col-md-3 box_marg">
											<label class="control-label left">Is Active</label>
												<div class="controls icon_add">
													<label class="radio-inline"> <input type="radio" ${cakeType.isActive == 0 ? 'checked' : ''}
											name="isActive" id="optionsRadios0" value="0" /> Yes
										</label>
										<label class="radio-inline"> <input type="radio"
											name="isActive" id="optionsRadios1" value="1" ${cakeType.isActive == 1 ? 'checked' : ''} />
											No
										</label>
													</div>
										</div>
										
									</div>
								</div>	

								
							   <div class="form-group">
								<div class="row three_buttons">
									<button type="submit" class="btn btn-primary" style="width: 70px" id="sub_btn">Submit</button>
										<button type="button" class="btn btn-primary" onclick="window.location.reload()"  >Cancel</button>
										
									
						</div>
								</div>

							</form>

						</div>
					</div>
				</div>
			</div>

			<div class="box">
				<div class="box-title">
					<h3>
						<i class="fa fa-table"></i> Cake Type List
					</h3>
					<div class="box-tool">
						<a data-action="collapse" href="#"><i class="fa fa-chevron-up"></i></a>
						<!--<a data-action="close" href="#"><i class="fa fa-times"></i></a>-->
					</div>
				</div>
               			<div class="box-content">
 
<jsp:include page="/WEB-INF/views/include/tableSearch.jsp"></jsp:include>

							
							
							<div class="tableFixHead">
      <table id="table1">
        <thead>
          <thead style="background-color: #f3b5db;">
				<tr class="bgpink">
					<th style="width: 70px; text-align: center;">#<input type="checkbox" id="selAllChkbx" name="selAllChkbx" ></th>
					<th style="text-align: center;">Cake Type</th>
					<th style="text-align: center;">Extra Field Appl</th>
					<th style="text-align: center;">Condition</th>
					<th style="text-align: center;">Status</th>
					<th style="text-align: center; width:70px;">Action</th>
				</tr>
			</thead>
        <tbody>
					<c:forEach items="${cakeTypeList}" var="cakeTypeList" varStatus="count">
									<tr>
										<td style="text-align: center;"><c:out value="${count.index+1}" /><input type="checkbox" class="chk"
																	name="select_to_print" id="${cakeTypeList.cakeTypeId}"
																	value="${cakeTypeList.cakeTypeId}" /></td>
										<td style="text-align: left; "><c:out value="${cakeTypeList.typeName}" /></td>
										<td style="text-align: right;">${cakeTypeList.extraFieldApplicable == 0 ? 'Yes' : 'NO'}</td>
										<td style="text-align: right;">
										${cakeTypeList.typeCondition == 0 ? 'Not Applicable' : cakeTypeList.typeCondition == 1 ? 'Number' : 'Character'}
										</td>
										<td style="text-align: right;"><c:out value="${cakeTypeList.isActive==0 ? 'Yes' : 'No'}" /></td>

										<c:choose>
											<c:when test="${isEdit==1 and isDelete==1}">
												<td align="right"><a
													href="${pageContext.request.contextPath}/updateCakeType?cakeTypeId=${cakeTypeList.cakeTypeId}">
														<i class="fa fa-pencil" aria-hidden="true"></i>
												</a>&nbsp; <a
													href="${pageContext.request.contextPath}/deleteCakeType?cakeTypeId=${cakeTypeList.cakeTypeId}"
													onClick="return confirm('Are you sure want to delete this record');"><i
													class="glyphicon glyphicon-remove"></i></a></td>
											</c:when>

											<c:when test="${isEdit==1 and isDelete==0}">
												<td align="right"><a
													href="${pageContext.request.contextPath}/updateCakeType?cakeTypeId=${cakeTypeList.cakeTypeId}">
														<i class="fa fa-pencil" aria-hidden="true"></i>
												</a>&nbsp; <a
													href="${pageContext.request.contextPath}/deleteCakeType?cakeTypeId=${cakeTypeList.cakeTypeId}"
													class="disableClick" 
													onClick="return confirm('Are you sure want to delete this record');"><i
													class="glyphicon glyphicon-remove"></i></a></td>
											</c:when>

											<c:when test="${isEdit==0 and isDelete==1}">

												<td align="right"><a class="disableClick"
													style="opacity: 0.5;"
													href="${pageContext.request.contextPath}/updateCakeType?cakeTypeId=${cakeTypeList.cakeTypeId}">
														<i class="fa fa-pencil" aria-hidden="true"></i>
												</a>&nbsp; <a
													href="${pageContext.request.contextPath}/deleteCakeType?cakeTypeId=${cakeTypeList.cakeTypeId}"
													onClick="return confirm('Are you sure want to delete this record');"><i
													class="glyphicon glyphicon-remove"></i></a></td>
											</c:when>

											<c:otherwise>
												<td align="right"><a class="disableClick"
													href="${pageContext.request.contextPath}/updateCakeType?cakeTypeId=${cakeTypeList.cakeTypeId}">
														<i class="fa fa-pencil" aria-hidden="true"></i>
												</a>&nbsp; <a class="disableClick"
													href="${pageContext.request.contextPath}/deleteCakeType?cakeTypeId=${cakeTypeList.cakeTypeId}"
													onClick="return confirm('Are you sure want to delete this record');"><i
																	class="glyphicon glyphicon-remove"></i></a></td>
											</c:otherwise>
										</c:choose>

									</tr>
								</c:forEach>

							</tbody>
      </table>
    </div>
							
							
							
								
				
							</div>
							<div class="col-sm-2  controls">
									<input type="button" id="expExcel" class="btn btn-primary"
										value="EXPORT TO Excel" onclick="exportToExcel1();">
								</div>
							
							</div>


			<!-- END Main Content -->
			<footer>
			<p>2018 © MONGINIS.</p>
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

<script type="text/javascript">
	$('#selAllChkbx').click(function(event) {   
		//alert("Hiii")
	   if(this.checked) {
	        // Iterate each checkbox
	        $(':checkbox').each(function() {
	            this.checked = true;                        
	        });
	    } else {
	        $(':checkbox').each(function() {
	            this.checked = false;                       
	        });
	    }
	});
	
	

	
	</script>
<script type="text/javascript">
function exportToExcel1()
{
	window.open("${pageContext.request.contextPath}/exportToExcelNew");
			document.getElementById("expExcel1").disabled=true;
}

</script>
<script type="text/javascript">

$("#sub_btn")
.on(
		"click",
		function() {
			
			var isError = false;
			var errMsg = "";

			if (!$("#cake_type_name").val()) {
				isError = true;
				$("#err_type").show();
			} else {
				$("#err_type").hide();
			}
			
			if(!isError){
				var form=document.getElementById("validation-form");
				form.submit();

			}
			
			return false;
		});
    
	function deleteById() {

		var checkedVals = $('.chk:checkbox:checked').map(function() {
			return this.value;
		}).get();
		checkedVals = checkedVals.join(",");

		if (checkedVals == "") {
			alert("Please Select Flavours")
		} else {
			if (confirm("Are You Sure You Want To Inactive Selected Flavours.")) {
				window.location.href = '${pageContext.request.contextPath}/updateFlavourStatus/'
					+ checkedVals + "/1";
			  } 
			

		}

	}

	function doActiveById() {
		

		var checkedVals = $('.chk:checkbox:checked').map(function() {
			return this.value;
		}).get();
		checkedVals = checkedVals.join(",");

		if (checkedVals == "") {
			alert("Please Select Flavours")
		} else {
			if (confirm("Are You Sure You Want To Active Selected Flavours.")) {
				window.location.href = '${pageContext.request.contextPath}/updateFlavourStatus/'
					+ checkedVals + "/0";
			  } 
		}

	}
</script>

<!-- <script>
				function getHeaders(){
					
					openModel();
					$('#modelTable td').remove();
				var thArray = [];
	
				$('#printtable2 > thead > tr > th').each(function(){
				    thArray.push($(this).text())
				})
				
					
				var seq = 0;
					for (var i = 0; i < thArray.length; i++) {
						seq=i+1;					
						var tr1 = $('<tr></tr>');
						tr1.append($('<td style="padding: 7px; line-height:0; border-top:0px;"></td>').html('<input type="checkbox" class="chkcls" name="chkcls'
								+ seq
								+ '" id="catCheck'
								+ seq
								+ '" value="'
								+ seq
								+ '">') );
						tr1.append($('<td style="padding: 7px; line-height:0; border-top:0px;"></td>').html(innerHTML=thArray[i]));
						$('#modelTable tbody').append(tr1);
					}
				}
				
				$(document).ready(

						function() {

							$("#selAllChk").click(
									function() {
										$('#modelTable tbody input[type="checkbox"]')
												.prop('checked', this.checked);

									});
						});
				
				  function getIdsReport(val) {
					  var isError = false;
						var checked = $("#modal_theme_primary input:checked").length > 0;
					
						if (!checked) {
							$("#error_modelchks").show()
							isError = true;
						} else {
							$("#error_modelchks").hide()
							isError = false;
						}

						if(!isError){
					  var elemntIds = [];										
								
								$(".chkcls:checkbox:checked").each(function() {
									elemntIds.push($(this).val());
								}); 
												
						$
						.getJSON(
								'${getFlavourPrintIds}',
								{
									elemntIds : JSON.stringify(elemntIds),
									val : val,
									ajax : 'true'
								},
								function(data) {
									if(data!=null){
										//$("#modal_theme_primary").modal('hide');
										if(val==1){
											window.open("${pageContext.request.contextPath}/exportToExcelNew");
											//document.getElementById("expExcel").disabled = true;
										}else{			
											 window.open('${pageContext.request.contextPath}/pdfForReport?url=pdf/getFlavourListPdf/'+elemntIds.join());
											 $('#selAllChk').prop('checked', false);
										}
									}
								});
						}
					}		
				</script> 
<script>
//Get the modal
var modal = document.getElementById("myModal");
function openModel(){
	modal.style.display = "block";
}

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
  modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}
</script>-->
</body>
</html>