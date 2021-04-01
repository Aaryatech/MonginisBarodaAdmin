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
			<!-- <div class="page-title">
				<div>
					<h1>
						<i class="fa fa-file-o"></i> Flavour Ledger
					</h1>

				</div>
			</div> -->
			<!-- END Page Title -->



			<!-- BEGIN Main Content -->
			<div class="row">
				<div class="col-md-12">
					<div class="box">
						<div class="box-title">
							<h3>
								<i class="fa fa-bars"></i> Add Flavour 
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


						<div><!-- class="box-content" -->
							<form action="addFlavour" class="form-horizontal"
								id="validation-form" method="post">

								
								<div class="frm_Sec_one single">									
									<div class="row">
											<div class="col-md-6 box_marg">
											<label class="control-label left">Flavour Name</label>
												<div class="controls icon_add">
													<i class="fa fa-road frm_icon" aria-hidden="true"></i>
													<input type="text" name="spf_name" id="spf_name"
											placeholder="Flavour Name" class="form-control padd_left"
											data-rule-required="true" />	
													</div>
										</div>
										
										<div class="col-md-6 box_marg">
											<label class="control-label left">Add On Rate</label>
												<div class="controls icon_add">
													<i class="fa fa-road frm_icon" aria-hidden="true"></i>
													<input type="text" name="spf_adon_rate" id="spf_adon_rate"
											placeholder="Add on rate" class="form-control padd_left" 
											  data-rule-required="true" data-rule-number="true"
											onKeyPress="return isNumberCommaDot(event)" />
													</div>
										</div>
										
										<div class="col-md-6 box_marg">
											<label class="control-label left">Type</label>
												<div class="controls icon_add">
													<label class="radio-inline"> <input type="radio"
											name="sp_type" id="optionsRadios1" value="2" checked/> FC
										</label>
										<label class="radio-inline"> <input type="radio"
											name="sp_type" id="optionsRadios1" value="1"  />
											Chocolate
										</label>
													</div>
										</div>
										
									</div>
								</div>

								

								<div class="form-group">
								<div class="row three_buttons">
									<button type="submit" class="btn btn-primary" style="width: 70px">Submit</button>
									<button type="button" class="btn btn-primary">Cancel</button>
										
									
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
						<i class="fa fa-table"></i> Flavour List
					</h3>
					<div class="box-tool">
						<a data-action="collapse" href="#"><i class="fa fa-chevron-up"></i></a>
						<!--<a data-action="close" href="#"><i class="fa fa-times"></i></a>-->
					</div>
				</div>
               			<div class="box-content">
 
<jsp:include page="/WEB-INF/views/include/tableSearch.jsp"></jsp:include>

							<div class="clearfix"></div>
							
							
							<div class="tableFixHead">
      <table id="table2">
        <thead>
          <thead style="background-color: #f3b5db;">
				<tr class="bgpink">
					<th width="17"  style="text-align: center;">SELECT</th>
					<th width="17"  style="text-align: center;">#</th>
					<th width="348" style="text-align: center;">Name</th>
					<th width="322" style="text-align: center;">Add on rate</th>
					<th width="290" style="text-align: center;">Type</th>
					<th width="80" style="text-align: center;">Action</th>
				</tr>
			</thead>
       <tbody>
					<c:forEach items="${flavoursList}" var="flavoursList" varStatus="count">
									<tr>
			<td  style="text-align: center;"><input type="checkbox" class="chk" name="select_to_print" id="${flavoursList.spfId}"	value="${flavoursList.spfId}"/></td>
									
										<td><c:out value="${count.index+1}" /></td>
										<td style="text-align: center;"><c:out value="${flavoursList.spfName}" /></td>
										<td style="text-align: center;"><c:out
												value="${flavoursList.spfAdonRate}" /></td>

										<c:set var="strSpType" value="${flavoursList.spType}"></c:set>
										<c:choose>
											<c:when test="${flavoursList.spType==1}">
												<td style="text-align: center;">
													<c:out value="Chocolate" /></td>
											</c:when>
											<c:when test="${flavoursList.spType==2}">
												<td style="text-align: center; ">
													<c:out value="FC" /></td>
                                           </c:when>
                                           <c:otherwise>
                                           <td style="text-align: center; ">
                                           	<c:out value=""/></td>
                                           </c:otherwise>
										</c:choose>
										<td style="text-align: center;">
										<select name="activeStatus" id="activeStatus" onchange="if (this.value) window.location.href=this.value" >
										<c:choose>
											<c:when test="${flavoursList.delStatus==0}">
  										     <option value="${pageContext.request.contextPath}/updateFlavourStatus/${flavoursList.spfId}/0" selected>Active</option>
  										     <option value="${pageContext.request.contextPath}/updateFlavourStatus/${flavoursList.spfId}/1">Inactive</option>
  										    </c:when>
  										    <c:when test="${flavoursList.delStatus==1}">
  										     <option value="${pageContext.request.contextPath}/updateFlavourStatus/${flavoursList.spfId}/0" >Active</option>
  										     <option value="${pageContext.request.contextPath}/updateFlavourStatus/${flavoursList.spfId}/1" selected>Inactive</option>
  										    </c:when>
  										 </c:choose>
										</select>
										
										&nbsp; &nbsp;<a href="updateFlavour/${flavoursList.spfId}">
												<i class="fa fa-pencil" aria-hidden="true"></i>
											</a>
										
										</td>

										
									</tr>
								</c:forEach>

							</tbody>
      </table>
    </div>
							
							
								
						<div class="form-group">
								<div class="row" style="    text-align: right; padding: 20px 15px 0 0;">
									<input type="button" id="btn_delete" class="btn btn-primary" onclick="doActiveById()" value="Active" /> 
														
								<input type="button" id="btn_delete" class="btn btn-primary" onclick="deleteById()" value="Inactive" /> 
											
						<input type="button" id="btn_exl_pdf" class="btn btn-primary" onclick="getHeaders()" value="Excel / Pdf" />
											
											
									
										
									
						</div>
								</div>	
							
						

							</div></div>


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
<table width="100%" class="table table-advance" id="printtable2" style="display: none;">
		<thead style="background-color: #f3b5db;" >
			<tr>
				<th>Flavour</th>
				<th>Add On Rate</th>
				<th>Type</th>
				<th>Status</th>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>

	<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content" id="modal_theme_primary">
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
										id="selAllChk" />
									</th>
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
				<div class="form-group" style="background-color: white;">
									&nbsp;	&nbsp;	&nbsp;	&nbsp;
										<input type="button" margin-right: 5px;"
											class="btn btn-primary" id="expExcel" onclick="getIdsReport(1)" 
											value="Excel" />
									&nbsp;	&nbsp;	&nbsp;	&nbsp;
										<input type="button" margin-right: 5px;"
											class="btn btn-primary" onclick="getIdsReport(2)" 
											value="Pdf" />
									</div>
									</div>
								
  </div>

</div>
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
function deleteById()
{

var checkedVals = $('.chk:checkbox:checked').map(function() {
    return this.value;
}).get();
checkedVals=checkedVals.join(",");

if(checkedVals=="")
	{
	alert("Please Select Flavours")
	}
else
	{
		if (confirm("Are You Sure You Want To Inactive Selected Flavours.")) {
			window.location.href='${pageContext.request.contextPath}/updateFlavourStatus/'+checkedVals+"/1";
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
<script>
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
</script>
</body>
</html>