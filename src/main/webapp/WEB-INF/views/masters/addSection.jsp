<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<style>
/* Extra styles for the cancel button */
.cancelbtn {
	width: auto;
	padding: 10px 18px;
	background-color: #f44336;
}

.container1 {
	padding: 16px;
	margin-left: 5%;
	margin-right: 5%;
}

/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
	padding-top: 60px;
}

/* Modal Content/Box */
.modal-content {
	background-color: #fefefe;
	margin: 5% auto 15% auto;
	/* 5% from the top, 15% from the bottom and centered */
	border: 1px solid #888;
	width: 80%; /* Could be more or less, depending on screen size */
}

/* The Close Button (x) */
.close {
	position: absolute;
	right: 25px;
	top: 0;
	color: #000;
	font-size: 35px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: red;
	cursor: pointer;
}

/* Add Zoom Animation */
.animate {
	-webkit-animation: animatezoom 0.6s;
	animation: animatezoom 0.6s
}

@
-webkit-keyframes animatezoom {
	from {-webkit-transform: scale(0)
}

to {
	-webkit-transform: scale(1)
}

}
@
keyframes animatezoom {
	from {transform: scale(0)
}

to {
	transform: scale(1)
}

}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
	span.psw {
		display: block;
		float: none;
	}
	.cancelbtn {
		width: 100%;
	}
}
</style> 

	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
	<body  onload="onLoadFunc()"  >
	<c:url value="/getMenuByType" var="getMenuByType" ></c:url>
	<c:url value="/delMultiSection" var="delMultiSection" ></c:url>
	<c:url  var="getSectionPrint" value="/getSectionPrint" ></c:url>
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
						<i class="fa fa-file-o"></i>Sub Category
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
							test="${subModule.subModuleMapping eq 'addSection'}">

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
								<i class="fa fa-bars"></i>Section  
							</h3>
							<div class="box-tool">
								<a href="${pageContext.request.contextPath}/showSubCatList"></a> <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a>
							</div>
							
						</div>
						<div ><!-- class="box-content" -->
							<form action="${pageContext.request.contextPath}/insertSection"
								class="form-horizontal" method="post" id="validation-form">

								<input type="hidden" name="sectionId" id="sectionId"
									value="${editSection.sectionId}" />
									
								
								<div class="frm_Sec_one single">
									<div class="row">
										<div class="col-md-3 box_marg">
													<label class="control-label left" for="item_name">Section Name</label>
														<div class="controls icon_add">
															<i class="fa fa-user frm_icon" aria-hidden="true"></i>
															<input type="text" name="sectionName" id="sectionName"
											placeholder="Section Name" class="form-control padd_left"
											data-rule-required="true" value="${editSection.sectionName}" />
															
															</div><span class="span_err" id="err_sec" >Enter Section Name</span>
												</div>
												
										<div class="col-md-3 box_marg">
													<label class="control-label left" for="item_name">Section Type</label>
														<div class="controls icon_add">
															<i class="fa fa-list-ul frm_icon" aria-hidden="true"></i>
															<select class="form-control padd_left chosen" name="sec_type"
											id="sec_type" data-rule-required="true">

											<c:forEach items="${sectionTypeList}" var="secType">
											<c:choose>
												<c:when test="${editSection.sectionType==secType.id}">
												<option selected="selected" value="${secType.id}"><c:out
														value="${secType.sectiontypeName}" /></option>
												
												</c:when>
												<c:otherwise>
												<option value="${secType.id}"><c:out
														value="${secType.sectiontypeName}" /></option>
												</c:otherwise>
											
											</c:choose>
												

											</c:forEach>
										</select>
															
															</div>
												</div>
												
										<div class="col-md-3 box_marg">
													<label class="control-label left" for="item_name">Menu Type</label>
														<div class="controls icon_add">
															<i class="fa fa-leaf frm_icon" aria-hidden="true"></i>
															
															<select data-placeholder="Select Menu"
													class="form-control padd_left chosen" name="isSameDayAppicable" id="isSameDayAppicable"
													data-rule-required="true" multiple="multiple" onchange="selectMenuType()" >
												
														<!-- 	<select class="form-control padd_left input-sm"
											name="isSameDayAppicable" id="isSameDayAppicable"
											onchange="selectMenuType(this.value)"> -->
											<c:forEach items="${menuTypeList}" var="menuType">
											<option value="${menuType.menuType}">${menuType.menuTypeDesc}</option>
											
											</c:forEach>
											
											<%-- <c:choose>
											<c:when test="${editSection.menuType==-1 }">
											<option >Select Menu Type</option>
											<option selected="selected" value="-1">All</option>
											<option value="0">Regular</option>
											<option value="3">Bulk Order</option>
											<option value="2">Special Cake</option>
											
											</c:when>
											<c:when test="${editSection.menuType==0 }">
											<option >Select Menu Type</option>
											<option  value="-1">All</option>
											<option selected="selected" value="0">Regular</option>
											<option value="3">Bulk Order</option>
											<option value="2">Special Cake</option>
											
											</c:when>
											<c:when test="${editSection.menuType==3 }">
											<option >Select Menu Type</option>
											<option  value="-1">All</option>
											<option  value="0">Regular</option>
											<option selected="selected" value="3">Bulk Order</option>
											<option value="2">Special Cake</option>
											
											</c:when>
											<c:when test="${editSection.menuType==2 }">
											<option >Select Menu Type</option>
											<option  value="-1">All</option>
											<option  value="0">Regular</option>
											<option  value="3">Bulk Order</option>
											<option selected="selected" value="2">Special Cake</option>
											
											</c:when>
											<c:otherwise>
											<option >Select Menu Type</option>
											<option  value="-1">All</option>
											<option  value="0">Regular</option>
											<option  value="3">Regular cake As SP Order</option>
											<option selected="selected" value="2">Special Cake</option>
											
											</c:otherwise>
											
											
											</c:choose> --%>
											

										</select>	
															
															</div><span class="span_err" id="err_menu" >Select Menu</span>
												</div>	
												
										<div class="col-md-3 box_marg">
													<label class="control-label left" for="item_name">Status</label>
														<div class="controls icon_add">
															<c:choose>
												<c:when test="${editSection.isActive==1}">
												<label class="radio-inline"> <input type="radio"
													name="fr_status" id="optionsRadios1" value="0" >
													Active
												</label> <label class="radio-inline"> <input type="radio"
													name="fr_status" id="optionsRadios1" value="1" checked />
													In-active
												</label>
												
												</c:when>
												<c:otherwise>
												<label class="radio-inline"> <input type="radio"
													name="fr_status" id="optionsRadios1" value="0" checked >
													Active
												</label> <label class="radio-inline"> <input type="radio"
													name="fr_status" id="optionsRadios1" value="1"  />
													In-active
												</label>
												
												</c:otherwise>
											
											
											</c:choose>
										</select>
															
															</div>
												</div>	
										
										<div class="col-md-10 box_marg">
											<label class="control-label left" for="item_name">Select Menu</label>
											<div class="controls icon_add">
												<i class="fa fa-list-ul frm_icon" aria-hidden="true"></i>
													<select data-placeholder="Select Menu"
													class="form-control padd_left chosen" name="menuIds" id="menuIds"
													data-rule-required="true" multiple="multiple">
												    </select>
											</div>
										</div>
												
										<div class="col-md-2 box_marg">
											<div class="row three_buttons one_row">
											<input type="submit" class="btn btn-primary" value="Submit" onclick="return validate()" id="sub_btn">
											<button type="button" class="btn btn-primary">Cancel</button>
											</div>
										</div>		
										
										<div class="clr"></div>	
												
															
												
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
						<i class="fa fa-table"></i> Section List
					</h3>
					<div class="box-tool">
						<a data-action="collapse" href="#"><i class="fa fa-chevron-up"></i></a>
						 
					</div>
				</div>
               	<div class="box-content">
 
                 <jsp:include page="/WEB-INF/views/include/tableSearch.jsp"></jsp:include>

							<div class="clearfix"></div>
							
							<div class="tableFixHead">
							
      <table id="table1">
        <thead>
          <thead style="background-color: #f3b5db;">
				<tr class="bgpink">
					<th style="text-align: center; width: 80px;">Sr. No.<input type="checkbox" id="selAllChkbx" name="selAllChkbx" ></th> 
			        <th style="text-align: center; min-width:130px;">Section Name </th>
			        <th style="text-align: center; min-width:130px;">Section Type </th>
			        <th style="text-align: center;"> Menu Name </th>
			        <th style="text-align: center;"> Staus </th>
			        <th style="text-align: center; width: 70px;">Action</th>
				</tr>
			</thead>
        <tbody>
						  <c:set var="cnt" value="0"></c:set>
					           <c:forEach items="${sectionList}" var="sectionList" varStatus="count">
				            
									<tr>
										<td  style="text-align: center;"><c:out value="${cnt+1}" /><c:set var="cnt" value="${cnt+1}"></c:set><input type="checkbox" class="chkcls" name="chkcls" id="catCheck+${sectionList.sectionId}" value="${sectionList.sectionId}"></td>
										<td align="left"><c:out value="${sectionList.sectionName}" /></td>
										<td align="left"><c:out value="${sectionList.secTypeName}" /></td>
										
										
										
										<td align="left">
											 <c:forEach items="${sectionList.menuList}" var="menuList" >
												<c:out value="${menuList.menuTitle}" />,
											</c:forEach> 
										</td>
										
										<c:choose>
										<c:when test="${sectionList.isActive==0}">
										<td align="left">Active</td>
										</c:when>
										<c:otherwise>
										<td align="left">In-Active</td>
										</c:otherwise>
										</c:choose>

										<c:choose>
											<c:when test="${isEdit==1 and isDelete==1}">
												<td align="right"><a
													href="${pageContext.request.contextPath}/editSection/${sectionList.sectionId}">
														<i class="fa fa-pencil" aria-hidden="true"></i>
												</a>&nbsp; <a
													href="${pageContext.request.contextPath}/deleteSection/${sectionList.sectionId}"
													onClick="return confirm('Are you sure want to delete this record');"><span
														class="glyphicon glyphicon-remove"></span></a></td>
											</c:when>

											<c:when test="${isEdit==1 and isDelete==0}">
												<td align="right"><a
													href="${pageContext.request.contextPath}/editSection/${sectionList.sectionId}">
														<i class="fa fa-pencil" aria-hidden="true"></i>
												</a>&nbsp; <a class="disableClick"
													href="${pageContext.request.contextPath}/deleteSection/${sectionList.sectionId}"
													onClick="return confirm('Are you sure want to delete this record');"><span
														class="glyphicon glyphicon-remove"></span></a></td>
											</c:when>

											<c:when test="${isEdit==0 and isDelete==1}">
												<td align="right"><a class="disableClick"
													href="${pageContext.request.contextPath}/editSection/${sectionList.sectionId}">
														<i class="fa fa-pencil" aria-hidden="true"></i>
												</a>&nbsp; <a
													href="${pageContext.request.contextPath}/deleteSection/${sectionList.sectionId}"
													onClick="return confirm('Are you sure want to delete this record');"><span
														class="glyphicon glyphicon-remove"></span></a></td>

											</c:when>

											<c:otherwise>
												<td align="right"><a class="disableClick" 
													href="${pageContext.request.contextPath}/editSection/${sectionList.sectionId}">
														<i class="fa fa-pencil" aria-hidden="true"></i>
												</a>&nbsp; <a class="disableClick"
													href="${pageContext.request.contextPath}/deleteSection/${sectionList.sectionId}"
													onClick="return confirm('Are you sure want to delete this record');"><span
														class="glyphicon glyphicon-remove"></span></a></td>
											</c:otherwise>
										</c:choose>





									</tr> 
								</c:forEach> 
							</tbody>
      </table>
      
    </div>
   
    <div id="myModal" class="modal">

		<!-- Modal content -->
		<div class="modal-content" style="width: 40%" id="modal_theme_primary">
			<span class="close">&times;</span>
			<div class="box">
				<div class="box-title">
					<h3>
						<i class="fa fa-table"></i> Select Columns
					</h3>
				</div>

				<div class="box-content">
					<div class="clearfix"></div>
					<div class="table-responsive" style="border: 0">
						<table width="100%" class="table table-advance" id="modelTable">
							<thead style="background-color: #f3b5db;">
								<tr>
									<th width="15"><input type="checkbox" name="selAll"
										id="selAllChk" /></th>
									<th>Headers</th>
								</tr>
							</thead>
							<tbody>
							</tbody>
						</table>
						<span class="validation-invalid-label" id="error_modelchks"
							style="display: none;">Select Check Box.</span>
					</div>
				</div>
				<div class="form-group"
					style="padding: 0 0 10px 0;">
					<input type="button" class="btn btn-primary" id="expExcel" onclick="getIdsReport(1)" value="Excel" /> 
					<input type="button" class="btn btn-primary" onclick="getIdsReport(2)" value="Pdf" />
				</div>
			</div>

		</div>

	</div>
    
							
								
				</div>
				 <button type="button" style="margin-left: 10px;margin-bottom: 10px" class="btn btn-primary"  onclick="deleteMultiSection()" >Delete</button>
    <input style="margin-left: 10px;margin-bottom: 10px" type="submit" class="btn btn-primary" onclick="getHeaders()" value="Excel/Pdf">
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
<script type="text/javascript">
function selectMenuType() {
	//alert("Hiiii")
	//alert(val)
	var ids= $('#isSameDayAppicable').val();
	
	  $.post('${getMenuByType}', {
		  menuType :JSON.stringify(ids),
	    ajax : 'true'
		}, function(data) {
			//alert(JSON.stringify(data))
			var html = '<option value="">Select Menu</option>';
			
			var len = data.length;
			
			$('#menuIds')
		    .find('option')
		    .remove()
		    .end()
		 /*  $("#menuIds").append($("<option></option>").attr( "value",-1).text("ALL"));  */

			for ( var i = 0; i < len; i++) {

               $("#menuIds").append(
                       $("<option selected></option>").attr(
                           "value", data[i].menuId).text(data[i].menuTitle)
                   );
			}
	
			   $("#menuIds").trigger("chosen:updated");
			
		});
	
	  
	
}


</script>
<script type="text/javascript">
function onLoadFunc() {
	//alert("Hiii")
	var id=document.getElementById("isSameDayAppicable").value;
	//alert(id);
	selectMenuType();
}

</script>
<script type="text/javascript">
$('#selAllChkbx').click(function(event) {   
	//alert("Hiii")//chk
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

$("#sub_btn")
.on(
		"click",
		function() {
			
			var isError = false;
			var errMsg = "";

			if (!$("#sectionName").val()) {
				isError = true;
				$("#err_sec").show();
			} else {
				$("#err_sec").hide();
			}
			
			if (!$("#isSameDayAppicable").val()) {
				isError = true;
				$("#err_menu").show();
			} else {
				$("#err_menu").hide();
			}
			if(!isError){
				var form=document.getElementById("validation-form");
				form.submit();
			}
			
			return false;
		});
		
		
function deleteMultiSection(){
	var secId = [];										
	
	$(".chkcls:checkbox:checked").each(function() {
		secId.push($(this).val());
	}); 
	//alert(secId)

 	$.getJSON('${delMultiSection}',

			{
		vehId:JSON.stringify(secId),
				ajax : 'true'

			},
			function(data) {
				//alert(JSON.stringify(data))
				alert(data.message)
			window.location.reload();
				
			});
 


}

</script>

<script>
				function getHeaders(){
					
					openModel();
					$('#modelTable td').remove();
				var thArray = [];
	
				$('#table1 > thead > tr > th').each(function(){
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
								'${getSectionPrint}',
								{
									elemntIds : JSON.stringify(elemntIds),
									val : val,
									ajax : 'true'
								},
								function(data) {
									
									if(data!=null){
										//$("document.getElementById("myModal");#modal_theme_primary").modal('hide');
										if(val==1){
											window.open("${pageContext.request.contextPath}/exportToExcelNew");
											//document.getElementById("expExcel").disabled = true;
										}else{		
											alert("Gen PDF alert");
											 window.open('${pageContext.request.contextPath}/pdfForReport?url=pdf/getSectionListPdf/'+elemntIds.join());
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
</script>



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

</body>

</html>