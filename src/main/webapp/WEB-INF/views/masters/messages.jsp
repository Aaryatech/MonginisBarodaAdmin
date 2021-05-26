<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	 

	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
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

		<!-- BEGIN Content -->
		<div id="main-content">
			<!-- BEGIN Page Title -->
			 <div class="page-title">
				<div>
					<!--<h1>
						<i class="fa fa-file-o"></i> Messages
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
							test="${subModule.subModuleMapping eq 'showSpMessages'}">

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
								<i class="fa fa-bars"></i> Add Message 
								 
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


						<div >
							<form action="addMessage" class="form-horizontal"
								id="validation-form" method="post">

							<div class="frm_Sec_one single">
								<div class="row">
									<div class="col-md-10 box_marg">
											<label class="control-label left">Message</label>
												<div class="controls icon_add">
												<i class="fa fa-road frm_icon" aria-hidden="true"></i>
												<input type="text" name="message" id="message"
											placeholder="Message" class="form-control padd_left"
											data-rule-required="true" />
												
												<input type="hidden" name="itemId" value="3">								
												</div>
												<span class="span_err" id="err_msg" >Enter Message</span>
										</div>
										
										<div class="col-md-2 box_marg">
											<div class=" three_buttons one_row">
									<button type="submit" class="btn btn-primary" id="sub_btn"> Submit </button>
				<button type="button" class="btn btn-primary" onclick="window.location.reload()" >Cancel</button>
									</div>
										
									
						</div>
								</div>
							</div>
							</div></div>
							
					

								
								

<div><!--  class="box-content" -->


								<div class="box">
									<div class="box-title">
										<h3>
											<i class="fa fa-table"></i> Messages List
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
							
							
							<div class="tableFixHead">
      <table id="table1">
        <thead>
          <thead style="background-color: #f3b5db;">
				<tr class="bgpink">
					   <th style="text-align: center; width:70px;">Sr No<input type="checkbox" id="selAllChkbx" name="selAllChkbx" >	</th>						
						<th style="text-align: center;">Name</th>
						<th style="text-align: center; width:70px;">Action</th>
				</tr>
			</thead>
        <tbody>
							<c:forEach items="${spMessageList}" var="spMessageList" varStatus="count">
														<tr>
							<td style="text-align: left;" width="30px" ><c:out value="${count.index+1}"/> &nbsp; <input type="checkbox" class="chk" name="select_to_print" id="${spMessageList.spMsgId}"	value="${spMessageList.spMsgId}"/></td>
							<td style="text-align: left;"><c:out value="${spMessageList.spMsgText}" /></td>

																<c:choose>
																	<c:when test="${isEdit==1 and isDelete==1}">
																		<td style="text-align: right;"><a
																			href="${pageContext.request.contextPath}/updateSpMessage/${spMessageList.spMsgId}"><i
																				class="fa fa-pencil" aria-hidden="true"></i></a> <a
																			href="${pageContext.request.contextPath}/deleteSpMessage/${spMessageList.spMsgId}"
																			onClick="return confirm('Are you sure want to delete this record');">
																				<span class="glyphicon glyphicon-remove"></span>
																		</a></td>
																	</c:when>

																	<c:when test="${isEdit==1 and isDelete==0}">
																		<td style="text-align: right;"><a
																			href="${pageContext.request.contextPath}/updateSpMessage/${spMessageList.spMsgId}"><i
																				class="fa fa-pencil" aria-hidden="true"></i></a> <a class="disableClick" 
																			href="${pageContext.request.contextPath}/deleteSpMessage/${spMessageList.spMsgId}"
																			onClick="return confirm('Are you sure want to delete this record');">
																				<span class="glyphicon glyphicon-remove"></span>
																		</a></td>
																	</c:when>

																	<c:when test="${isEdit==0 and isDelete==1}">
																		<td style="text-align: right;"><a class="disableClick" 
																			href="${pageContext.request.contextPath}/updateSpMessage/${spMessageList.spMsgId}"><i
																				class="fa fa-pencil" aria-hidden="true"></i></a> <a
																			href="${pageContext.request.contextPath}/deleteSpMessage/${spMessageList.spMsgId}"
																			onClick="return confirm('Are you sure want to delete this record');">
																				<span class="glyphicon glyphicon-remove"></span>
																		</a></td>

																	</c:when>

																	<c:otherwise>
																		<td style="text-align: right;"><a class="disableClick" 
																			href="${pageContext.request.contextPath}/updateSpMessage/${spMessageList.spMsgId}"><i
																				class="fa fa-pencil" aria-hidden="true"></i></a> <a class="disableClick" 
																			href="${pageContext.request.contextPath}/deleteSpMessage/${spMessageList.spMsgId}"
																			onClick="return confirm('Are you sure want to delete this record');">
																				<span class="glyphicon glyphicon-remove"></span>
																		</a></td>
																	</c:otherwise>
																</c:choose>
															</tr>
													</c:forEach>



							</tbody>
      </table>
    </div>
							
							
							
							
							
								
				
						    <div class="form-group" style="padding: 15px 15px 0 0; text-align: right;">			
								<input type="button" class="btn btn-primary" onclick="deleteById()" value="Delete" />
							</div>
							</div>
								</div> </div>
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
	</div>
	<!-- END Content -->

	<!-- END Container -->

	<!--basic scripts-->
	<script
		src="//ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
	<script>
		window.jQuery
				|| document.write('<script src="${pageContext.request.contextPath}/resources/assets/jquery/jquery-2.0.3.min.js"><\/script>')
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

$("#sub_btn")
.on(
		"click",
		function() {
			
			var isError = false;
			var errMsg = "";

			if (!$("#message").val()) {
				isError = true;
				$("#err_msg").show();
			} else {
				$("#err_msg").hide();
			}
			
			
			return false;
		});
		
		
function deleteById()
{

var checkedVals = $('.chk:checkbox:checked').map(function() {
    return this.value;
}).get();
checkedVals=checkedVals.join(",");

if(checkedVals=="")
	{
	alert("Please Select Message")
	}
else
	{
	window.location.href='${pageContext.request.contextPath}/deleteSpMessage/'+checkedVals;

	}

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
</body>
</html>