<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
table,th,td{
border:1px solid grey;
}

</style>

<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/tableSearch.css">
<body>

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
		
		<c:set var="isEdit" value="0">
			</c:set>

			<c:set var="isDelete" value="0">
			</c:set>

			<c:forEach items="${sessionScope.newModuleList}" var="modules">
				<c:forEach items="${modules.subModuleJsonList}" var="subModule">
					<c:choose>
						<c:when
							test="${subModule.subModuleMapping eq 'showAfeQue'}">

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

		<!-- BEGIN Content -->
		<div id="main-content">
			<!-- BEGIN Page Title -->
			 <div class="page-title">
				<div>
					<!--<h1>
						<i class="fa fa-file-o"></i>Add AFE Question
					</h1> -->
				</div>
			</div>
			<!-- END Page Title -->

			<!-- BEGIN Main Content -->
			<div class="row">
				<div class="col-md-12">
					<div class="box">
						<div class="box-title">
							<h3>
								<i class="fa fa-bars"></i>Add AFE Question 
							</h3>
							<div class="box-tool">
								<!-- <a href="">Back to List</a> <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a> -->
							</div>

						</div>


						<div><!-- class="box-content" -->
							<form action="insertAfeQue" method="post" class="form-horizontal"
								id="validation-form" method="post">
								
							<div class="frm_Sec_one single">
								<div class="row">
									<div class="col-md-9 box_marg">
										<label class="control-label left">Question </label>
										<div class="controls icon_add">
										<i class="fa fa-question frm_icon" aria-hidden="true"></i>
										<input class="form-control padd_left input" name="que" id="que"
											placeholder="question" data-rule-required="true" />
										</div>
							   		</div>
							   		
							   		<div class="col-md-3 box_marg" style="display: none">
										<label class="control-label left">Question Type</label>
										<div class="controls icon_add">
										<i class="fa fa-question frm_icon" aria-hidden="true"></i>
										<select name="que_type" id="que_type" class="form-control padd_left"
											placeholder="Que_Type" data-rule-required="true">
											<option selected value="0">QUE Type</option>
											<option value="1"><c:out value="A"/></option>
											<option value="2"><c:out value="B"/></option>
											<option value="3"><c:out value="C"/></option>
											<option value="4"><c:out value="D"/></option>

										</select>
										</div>
										</div>
										
									<div style="display: none">
										<div class="col-md-3 box_marg">
										<label class="control-label left">Question Point</label>
										<div class="controls icon_add">
										<i class="fa fa-question frm_icon" aria-hidden="true"></i>
										<input type="text" name="que_point" id="que_point"
											class="form-control padd_left" placeholder="Point" value="2"
											data-rule-required="true" data-rule-number="true" />
										</div>
										</div>
										
										<div class="col-md-3 box_marg">
										<label class="control-label left">Category Name</label>
										<div class="controls icon_add">
										<i class="fa fa-question frm_icon" aria-hidden="true"></i>
										<input type="text" name="que_cat" id="que_cat" value="default_Category"
											class="form-control padd_left" placeholder="Category"
											data-rule-required="true" />
										</div>
										</div>
										
										
										
									</div>	
									
										<div class="col-md-3 box_marg">
											<label class="control-label left">&nbsp;</label>
											<div class="three_buttons" style="padding: 0; text-align: left;">
												<input type="submit" class="btn btn-primary" value="Submit">
												<input type="button" class="btn btn-primary" value="Cancel">
											</div>
										</div>
										
										
							   		</div>
								</div>
							</div>
							
							<!-- <div class="form-group">
								<div class="three_buttons">
									<input type="submit" class="btn btn-primary" value="Submit">
									<input type="button" class="btn btn-primary" value="Cancel">
								</div>					
						    </div> -->		

								
								<div class="col-md-9"></div>
								<label for="search" class="col-md-3" id="search"> <i
									class="fa fa-search"></i> <input
									type="text" id="myInput" onkeyup="myFunction()"
									placeholder="Search.." title="Type in a name">
								</label>
								<div class="clearfix"></div>
								<div class="box-content">
						<div class="tableFixHead">
							<table id="table1">         
							<thead style="background-color: #f3b5db;">
								<tr class="bgpink">
									<th style="text-align: center; width:80px;">Sr No</th>
									<th style="text-align: left;">Question</th>
									<th style="text-align: right; width:80px;">Action</th> 
								</tr>
							</thead>
							
							<tbody>

							<c:forEach items="${qList}" var="que" varStatus="count">
								<tr>
									<td style="text-align: center;"><c:out value="${count.index+1}" /></td>
									<td style="text-align: left;"><c:out value="${que.question}" /></td>




												<c:choose>

													<c:when test="${isDelete==1}">
														<td style="text-align: right;" onmouseover="callme()"><a
															href="${pageContext.request.contextPath}/deleteQuestion/${que.queId}"
															class="btn bnt-primary"
															style="color: #333; background: none;"
															onClick="return confirm('Are you sure want to delete this record');">
																<i class="fa fa-times" aria-hidden="true"></i>
														</a></td>

													</c:when>

													<c:otherwise>
														<td style="text-align: right;" onmouseover="callme()"><a
															class="disableClick"
															href="${pageContext.request.contextPath}/deleteQuestion/${que.queId}"
															class="btn bnt-primary"
															style="color: #333; background: none;"
															onClick="return confirm('Are you sure want to delete this record');">
																<i class="fa fa-times" aria-hidden="true"></i>
														</a></td>
													</c:otherwise>
												</c:choose>

											</tr>
							</c:forEach>
						</tbody>
							</table>
						</div>
					</div>
								
							</form>
						</div>
					</div>
				</div>
				
				<footer>
					<p>2018 © MONGINIS.</p>
				</footer>
				
			</div>
		</div>
		
		
	</div>

	<!-- END Main Content -->
	


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
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/common.js"></script>

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/jquery-validation/dist/jquery.validate.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/jquery-validation/dist/additional-methods.min.js"></script>
	s
	<script>
function myFunction() {
  var input, filter, table, tr, td, i;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("table1");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[1];
    if (td) {
      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }       
  }
}

function callSubmit() {
	
	var que =document.getElementById("que").value;
	var queType =document.getElementById("que_type").value;
	var quePoint =document.getElementById("que_point").value;
	var catName =document.getElementById("que_cat").value;
	var queTypeName=$("#que_type option:selected").html();

	alert("TextArea Que = "+que);
	alert("Que type Name " +queTypeName);
	alert("Que Point  " +quePoint);
	alert("cat Name " +catName);
	
}

function deleteQuestion(queId){
	
	  var form = document.getElementById("validation-form")
	    form.action ='${pageContext.request.contextPath}/deleteQuestion/'+queId;
	    form.submit();
	
}

</script>
</body>
</html>

