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
	<c:url var="getItemsByCatId" value="/getItemsAjaxByCatId" ></c:url>
	<c:url value="/updateMrp" var="updateMrp" ></c:url>
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
						<i class="fa fa-file-o"></i> Route
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
								<i class="fa fa-bars"></i> MRP Configuretion
							</h3>
							<div class="box-tool">
								<a href=""></a> <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a>
							</div>
							<!-- <div class="box-tool">
								<a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a> <a data-action="close" href="#"><i
									class="fa fa-times"></i></a>
							</div> -->
						</div>


						<div class="box-content">
							<form action="${pageContext.request.contextPath}/updateItemMrps" class="form-horizontal" method="post"
								id="validation-form">
								<div class="form-group">
									<label class="col-sm-3 col-lg-2 control-label">Category</label>
									<div class="col-sm-9 col-lg-10 controls">
										<select class="form-control chosen" name="catId" id="catId">

											<!-- <option   value="1">A</option>
											<option   value="2">B</option>
											<option   value="3">C</option> -->
											<c:forEach items="${mCategoryList}" var="cateGory">
												<option value="${cateGory.catId}">${cateGory.catName}</option>
											</c:forEach>

										</select>
									</div>
								</div>



								<div class="form-group">
									<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2">
										<button type="button" class="btn btn-primary"
											style="width: 70px" onclick="searchCall()">Search</button>
										<!--<button type="button" class="btn">Cancel</button>-->
									</div>
								</div>
							<!-- newly added /form to be tested -->


							<div class="box">
								<div class="box-title">
									<h3>
										<i class="fa fa-table"></i> Item List
									</h3>
									<div class="box-tool">
										<a data-action="collapse" href="#"><i
											class="fa fa-chevron-up"></i></a>
										<!--<a data-action="close" href="#"><i class="fa fa-times"></i></a>-->
									</div>
								</div>

								<div class="box-content">
									<jsp:include page="/WEB-INF/views/include/tableSearch.jsp"></jsp:include>
									<div class="clearfix"></div>
									<div class="table-responsive" style="border: 0">
										<table width="100%" class="table table-advance" id="table1">
											<thead style="background-color: #f3b5db;">
												<tr>
													<th width="45" style="width: 18px">Select</th>

													<th style="text-align: center;">#</th>
													<th style="text-align: center;">Item Name</th>
													<th style="text-align: center;">MRP1</th>
													<th style="text-align: center;">MRP2</th>
													<th style="text-align: center;">MRP3</th>
												</tr>
											</thead>
											<tbody>

											</tbody>
										</table>
									</div>
								</div>
								<div class="form-group"
									style="background-color: white; padding: 0 0 10px 0;">
									&nbsp; &nbsp; &nbsp; &nbsp; <input type="submit" id="btn_sub"
										class="btn btn-primary" value="Submit" />
								</div>
							</div>
							</form>
						</div>

						<div id="id01" class="modal">

								<div class="container1" style="background-color: #ffffff">
									<h1>
										<i class="fa fa-list" id="subcatHeader"></i>
									</h1>
								

								
									<div class="col-md-12 table-responsive">
										<table class="table table-bordered table-striped"
											style="width: 100%; height: 80px;" id="table_grid11">
											<thead style="background-color: #f3b5db;">
												<tr>
													<th style="text-align: center;">SR.NO.</th>
													<th style="text-align: center;">Franchisee Name</th>
													<th style="text-align: center;">Fr Code</th>
													<th style="text-align: center;">City</th>
													<th style="text-align: center;">Owner</th>
													<th style="text-align: center;">Contact</th>
												</tr>
											</thead>
											<tbody>												
											</tbody>
										</table>
									</div>
									
								

								
									<button type="button"
										onclick="document.getElementById('id01').style.display='none'"
										class="btn btn-primary">CLOSE</button>
										
										<div style="clear:both"></div>
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
function deleteById()
{

var checkedVals = $('.chk:checkbox:checked').map(function() {
    return this.value;
}).get();
checkedVals=checkedVals.join(",");



if(checkedVals=="")
	{
	alert("Please Select Items")
	}
else
	{
	

/* 	alert(JSON.stringify(checkedVals));

	$.post(
			'${updateMrp}',
			{
				selectedItemsId :checkedVals,
				
				ajax : 'true'
			},
			function(data) {
				alert(JSON.stringify(data))
			});
	 */
	//window.location.href='${pageContext.request.contextPath}/deleteRoute/'+checkedVals;

	}

}
</script>
<script type="text/javascript">
function searchCall() {

	var catId =document.getElementById("catId").value;
	//alert(name)
	$('#table1 td').remove();
	$.post(
					'${getItemsByCatId}',
					{
						catId : catId,
						ajax : 'true'
					},
					function(data) {
						
						 $.each(data, function(key, item) {
							 
							 
											var tr = $('<tr id="tr'+item.id+'" name="tr'+item.id+'" ></tr>');
											
											
											tr
											 .append($(
															'<td></td>')
															.html(
																	'<input type=checkbox name="selc'+item.id+'" id="select_to_agree'+item.id+'"  class="chk" value='+item.id+'>'));

											tr
											 .append($(
															'<td></td>')
															.html(
																	key + 1));

											tr
											 .append($(
															'<td></td>')
															.html(
																	item.itemName ));		
											tr
											.append($(
													'<td style="display: none;"></td>')
													.html(
															'<span style="margin:0 15px; width: 35px;">'+item.id+'</span><input type="text" value="'+item.id+'" id="itemId'+item.id+'" name="itemId'+item.id+'">'));
										
											tr
											.append($(
													'<td></td>')
													.html(
															'<span style="margin:0 15px; width: 35px; display: inline-block;">'+item.itemMrp1+'</span><input type="text" value="'+item.itemMrp1+'"   id="mrp1'+item.id+'" name="mrp1'+item.id+'" oninput="inputMrp('+item.id+')"  style="width:50px;" >'));
											
											tr
											.append($(
													'<td></td>')
													.html(
															'<span style="margin:0 15px; width: 35px; display: inline-block;">'+item.itemMrp2+'</span><input type="text" value="'+item.itemMrp2+'"   id="mrp2'+item.id+'" name="mrp2'+item.id+'" oninput="inputMrp('+item.id+')" style="width:50px;" >'));
											
											tr
											.append($(
													'<td></td>')
													.html(
															'<span style="margin:0 15px; width: 35px; display: inline-block;">'+item.itemMrp3+'</span><input type="text" value="'+item.itemMrp3+'"   id="mrp3'+item.id+'" name="mrp3'+item.id+'" oninput="inputMrp('+item.id+')" style="width:50px;"  >'));
											
										
											
											$('#table1 tbody')
													.append(tr);
										}); 
					}); 
	
}

</script>
<script type="text/javascript">
function inputMrp(val) {
	var select='select_to_agree'+val;
	var tr='tr'+val;
	document.getElementById(select).checked = true;
	document.getElementById(tr).style.backgroundColor='#05ADF0';
}
</script>
</body>
</html>