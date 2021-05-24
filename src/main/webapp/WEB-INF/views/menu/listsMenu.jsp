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
<body>
	<jsp:include page="/WEB-INF/views/include/logout.jsp"></jsp:include>
	<div class="container" id="main-container">

		<!-- BEGIN Sidebar -->
		<div id="sidebar" class="navbar-collapse collapse">
<c:url var="delMultiMenu"  value="/delMultiMenu"></c:url>
			<jsp:include page="/WEB-INF/views/include/navigation.jsp"></jsp:include>
			<c:url var="getAllMenuPrint" value="/getAllMenuPrint"></c:url>

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
					<h1>
						<i class="fa fa-file-o"></i> Menus
					</h1>
				</div>
			</div>
			<!-- END Page Title -->


			<!-- BEGIN Main Content -->
			<div class="row">
				<div class="col-md-12">

					<div class="box">
						<div class="box-title">
							<h3>
								<i class="fa fa-table"></i> Menus List 
							</h3>
							<div class="box-tool">
								<a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a>

							</div>
						</div>

						<div class="box-content">
							<jsp:include page="/WEB-INF/views/include/tableSearch.jsp"></jsp:include>


							<div class="clearfix"></div>
							
							<div class="tableFixHead">
	<table id="table1">         
	<thead style="background-color: #f3b5db;">
		<tr class="bgpink">
			<th >#<input type="checkbox" name="selAllChkbx"
										id="selAllChkbx" /></th>
												<th >Menu Title</th>
												<th >Menu Desc</th>
												<th >Category</th>
												<th >Type</th>
												<th >Action</th>
		</tr>
	</thead>
	
	<tbody>
											<c:forEach items="${mesnuShowList}" var="menu"
												varStatus="count">
												
												<c:set value="0" var="flag" />
												<c:forEach items="${menuIds}" var="menuIds">
													<c:if
														test="${menu.menuId == menuIds.menuId && menu.isSameDayApplicable == menuIds.type}">
														<c:set value="1" var="flag" />
													</c:if>
												</c:forEach>
												<tr>
																										<td   ><c:out value="${count.index+1}" />&nbsp; <input type="checkbox" class="chk" name="select_to_print" id="${menu.menuId}"	value="${menu.menuId}"/></td>
													<td ><c:out value="${menu.menuTitle}" /></td>
													<td ><c:out value="${menu.menuDesc}" /></td>
													<td ><c:out value="${menu.catName}" /></td>
													<td style="text-align: center;"><c:out 
													value="${menu.isSameDayApplicable==0 ? 'Regular' : 
															menu.isSameDayApplicable==1 ? 'Same Day Regular' : 
															menu.isSameDayApplicable==2 ? 'Regular with limit' : 
														  	menu.isSameDayApplicable==3 ? 'Regular cake As SP Order' : 'Delivery And Production Date'}" /></td>
													<%-- <td align="left"><img src="${url}${menu.menuImage}"
														width="120" height="100"
														onerror="this.src='resources/img/No_Image_Available.jpg';" /></td> --%>
													<td style="text-align: center;"><a
														href="updateMenuShow/${menu.menuId}"><i class="fa fa-pencil" aria-hidden="true"></i></a>&nbsp;&nbsp;
															
															<c:if test="${flag==0}">
															 <a
														href="deleteMenuShow/${menu.menuId}"
														onClick="return confirm('Are you sure want to delete this record');"><span
															class="glyphicon glyphicon-remove"></span></a></c:if></td>
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
						<button type="button" class="btn btn-primary"onclick="exportToExcel1()" >Excell</button>
					<button type="button" class="btn btn-primary"onclick="multiDelete()" >Delete</button>
					<button type="button" class="btn btn-primary"onclick="getHeaders()" >Excel/Pdf</button>

						<%-- 


						<div class="box-content">
                       <jsp:include page="/WEB-INF/views/include/tableSearch.jsp"></jsp:include>
 
							<div class="clearfix"></div>
							<div class="table-responsive" style="border: 0">
								<table width="100%" class="table table-advance" id="table1">
									<thead>
										<tr>
										<th >#<input type="checkbox" name="selAllChkbx"
										id="selAllChkbx" /></th>
												<th >Menu Title</th>
												<th >Menu Desc</th>
												<th >Category</th>
												<th >Type</th>
												<th >Action</th>
										</tr>
									</thead>
									<tbody>
					
                             <c:forEach items="${message}" var="message" varStatus="count">
										<tr>
											<td><c:out value="${count.index+1}"/></td>
											<td align="left"><c:out value="${message.msgFrdt} ${message.msgTodt}" /></td>
											<td align="left"><c:out value="${message.msgImage}" /></td>
											<td align="left"><img src="${url}${message.msgImage}" width="120" height="100"  onerror="this.src='resources/img/No_Image_Available.jpg';" /></td>
											
											
											<td align="left"><c:out value="${message.msgHeader}"/></td>
											<td align="left"><c:out value="${message.msgDetails}" /></td>
											<td align="left"><a
												href="updateMessage/${message.msgId}"><span
													class="glyphicon glyphicon-edit"></span></a>&nbsp;&nbsp;&nbsp;&nbsp;

												<a
												href="deleteMessage/${message.msgId}"
												onClick="return confirm('Are you sure want to delete this record');"><span
													class="glyphicon glyphicon-remove"></span></a></td>
										</tr>

</c:forEach>

									</tbody>
								</table>
							</div>
						</div> --%>
					</div>
				</div>
			</div>



			<!-- END Main Content -->
			<footer>
				<p>2017 © MONGINIS.</p>
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
function multiDelete() {
	
	 var elemntIds = [];										
	
	$(".chk:checkbox:checked").each(function() {
		elemntIds.push($(this).val());
	}); 
	//alert(elemntIds)
	$.getJSON(
								'${delMultiMenu}',
								{
									elemntIds : JSON.stringify(elemntIds),
									/* val : val, */
									ajax : 'true'
								},
								function(data) {
									alert(data.message)
									window.location.reload();
							
									
								});
}
</script>


<script type="text/javascript">
function exportToExcel1()
{
	window.open("${pageContext.request.contextPath}/exportToExcelNew");
			document.getElementById("expExcel1").disabled=true;
}
</script>



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
								'${getAllMenuPrint}',
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
											//alert("Gen PDF alert");
											 window.open('${pageContext.request.contextPath}/pdfForReport?url=pdf/getAllMenuListPdf/'+elemntIds.join());
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