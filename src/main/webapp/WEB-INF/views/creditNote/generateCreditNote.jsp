
<%@page import="java.util.*,java.text.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<body>

	<jsp:include page="/WEB-INF/views/include/logout.jsp"></jsp:include>

	<c:url value="/getCreditNoteType" var="getCreditNoteType" />
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
			<div class="page-title">
			<div>
				<!-- <h1>
					<i class="fa fa-file-o"></i>Credit Note 
				</h1> -->
				
			</div>
		</div>
			
			<div class="box">
				<div class="box-title">
				<h3>
					<i class="fa fa-file-o"></i> Credit Note 
				</h3>

			</div>
			
			<form action="/insertCreNoteProcess" class="form-horizontal"
				method="post" id="validation">
				
				<div class="frm_Sec_one single">
					<div class="row">
						<div class="col-md-2 box_marg">
							<label class="control-label left">Type</label>
							<div class="controls icon_add">
							<i class="fa fa-stack-exchange frm_icon" aria-hidden="true"></i>
							<select class="form-control padd_left" name="selectType" id="selectType">
						<c:choose>
						<c:when test="${type==1}">
							<option value="1" selected>GRN Credit Note</option>
							<option value="0">GVN Credit Note</option>
						</c:when>
						<c:when test="${type==0}">
							<option value="1">GRN Credit Note</option>
							<option value="0"selected>GVN Credit Note</option>
						</c:when>
						<c:otherwise>
							<option value="1">GRN Credit Note</option>
							<option value="0">GVN Credit Note</option>
						</c:otherwise>
						</c:choose>
						</select>
							</div>
					   </div>
					   
					   <div class="col-md-2 box_marg">
							<label class="control-label left">From Date</label>
							<div class="controls icon_add">
							<i class="fa fa-calendar frm_icon" aria-hidden="true"></i>
							<input class="form-control padd_left date-picker" id="fromdate" size="16"
											type="text" name="fromdate" value="${fromDate}" required />
							</div>
					   </div>
					   
					   <div class="col-md-2 box_marg">
							<label class="control-label left">To Date</label>
							<div class="controls icon_add">
							<i class="fa fa-calendar frm_icon" aria-hidden="true"></i>
							<input class="form-control padd_left date-picker" id="todate" size="16"
											type="text" name="todate" value="${toDate}" required />
							</div>
					   </div>
					   
					   <div class="col-md-6 box_marg">
							<label class="control-label left">Franchise</label>
							<div class="controls icon_add">
							<i class="fa fa-user frm_icon" aria-hidden="true"></i>
							<select data-placeholder="Franchise Name"
								class="form-control padd_left chosen"   
								id="frid" name="frid" multiple="multiple" required>
								<c:choose>
										<c:when test="${isAllFrSel==0}">
								        <option value="-1"><c:out value="All"/></option>
                                          <c:forEach items="${franchiseeList}" var="fr"
												varStatus="count2">
												<c:set var="flag" value="0"></c:set>
									     <c:forEach items="${selFranchise}" var="selFr"	varStatus="count2">
										   <c:choose>
														<c:when test="${selFr==fr.frId}">
															<option selected value="${fr.frId}"><c:out value="${fr.frName}"/></option>
																<c:set var="flag" value="1"></c:set>
														</c:when>
														<c:otherwise>  
										    	 </c:otherwise>
									           </c:choose>
												</c:forEach> 		
													<c:choose>
												<c:when test="${flag==0}">
												 <option value="${fr.frId}"><c:out value="${fr.frName}"/></option>
												</c:when>
												</c:choose>
										   </c:forEach>
										   </c:when>
										   <c:otherwise>
										   <option value="-1" selected>All</option>
								 
								  <c:forEach items="${franchiseeList}" var="franchiseeList" >
									<option value="${franchiseeList.frId}"><c:out value="${franchiseeList.frName}"/></option>
								</c:forEach>   
										   </c:otherwise></c:choose>
							</select>
							</div>
					   </div>
					   
					</div>
				</div>	
				
				<div class="form-group">
				<div class="three_buttons">
					<input type="button" value="Search" onclick="getGrnGvnDetail()" class="btn btn-primary">&nbsp;
					<input type="button" value="View Credit Notes" onclick="viewCreditNotes()" class="btn btn-primary">
					<input type="button" class="btn btn-primary" value="Cancel">
				</div>					
		    </div>

			
			</form>
			
			
			

			
			<form action="${pageContext.request.contextPath}/insertCreditNote"
				class="form-horizontal" method="post" id="validation-form">



				<div class="row">
					<div class="col-md-12">

						<div ><!-- class="box" -->
							<div class="box-title">
								<h3>
									<i class="fa fa-table"></i> Generate Credit Note
								</h3>
								<div class="box-tool">
									<a data-action="collapse" href="#"><i
										class="fa fa-chevron-up"></i></a>
									<!--<a data-action="close" href="#"><i class="fa fa-times"></i></a>-->
								</div>
							</div>
							<!-- <input type="checkbox" onClick="toggle(this)" /> Select All<br/> -->
							<div class="box-content">
							<jsp:include page="/WEB-INF/views/include/tableSearch.jsp"></jsp:include>
							
								<div class="tableFixHead">
									<table id="table1">        
										<thead style="background-color: #f3b5db;">
											<tr class="bgpink">
												<th style="text-align: center; width:80px;"><input type="checkbox" onClick="selectcreditnote(this)" />ALL</th>
												<th style="text-align: center; width:80px;">SR</th>
												<th style="text-align: right;">Grn-Gvn Date</th>
												<th style="text-align: right;">Grn-Gvn SrNo</th>
												<th style="text-align: right;">Grn-Gvn Id</th>
												<th style="text-align: left;">Franchisee</th>
												<th style="text-align: right;">Invoice No</th>
												<th style="text-align: right;">Type</th>
												<th style="text-align: left;">Item</th>
												<th style="text-align: right;">Qty</th>
												<th style="text-align: right;">Amt</th>
											</tr>
										</thead>
									<tbody>

											<c:forEach items="${creditNoteList}" var="creditNoteList"
												varStatus="count">



												<tr>
													<td style="text-align: center;"><input type="checkbox" name="select_to_credit" class="chk"
														id="select_to_credit" value="${creditNoteList.grnGvnId}"></td>

													<td style="text-align: center;"><c:out value="${count.index+1}" /></td>



													<td style="text-align: right;"><fmt:formatDate pattern = "dd-MM-yyyy" value = "${creditNoteList.grnGvnDate}" /></td>
													<td style="text-align: right;"><c:out
															value="${creditNoteList.grngvnSrno}" /></td>
													<td style="text-align: right;"><c:out
															value="${creditNoteList.grnGvnHeaderId}" /></td>

													<td style="text-align: left;"><c:out
															value="${creditNoteList.frName}" /></td>

													<td style="text-align: right;"><c:out
															value="${creditNoteList.invoiceNo}" /></td>

													<c:choose>
														<c:when test="${creditNoteList.isGrn==1}">
															<td style="text-align:right;"><c:out value="GRN"></c:out></td>

														</c:when>
														<c:otherwise>
															<td style="text-align: right;"><c:out value="GVN"></c:out></td>

														</c:otherwise>


													</c:choose>


													<td style="text-align: left;"><c:out
															value="${creditNoteList.itemName}" /></td>


													<td style="text-align: right;"><c:out
															value="${creditNoteList.aprQtyAcc}" /></td>


													<td style="text-align: right;"><c:out
															value="${creditNoteList.aprGrandTotal}" /></td>


												</tr>
											</c:forEach>

										</tbody>
									</table>
								</div>
							</div>

								<div class="clearfix"></div>
								
								<div class="frm_Sec_one single">
			<div class="row">
				<div class="col-md-4 box_marg">
					<label class="control-label left">Date</label>
					<div class="controls icon_add">
					<i class="fa fa-calendar frm_icon" aria-hidden="true"></i>
					<input class="form-control padd_left date-picker" id="date" size="19" placeholder="dd-mm-yyyy" value="${toDate}"
											type="text" name="date" autocomplete="off" required/>
					</div>
			   </div>
			</div>
		</div>	
		
		<div class="form-group">
			<div class="three_buttons">
				<input type="submit" class="btn btn-primary" disabled value="Generate Credit Note" id="submitCRNote"/>
				<input type="button" class="btn btn-primary" value="Cancel">
			</div>					
	    </div>	

							
						</div>
					</div>
				</div>
				</form>
			</div>	
		
			<!-- END Main Content -->
			<footer>
				<p>2019 © MONGINIS.</p>
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
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-daterangepicker/date.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-daterangepicker/daterangepicker.js"></script>

	<script>
	
		function selectcreditnote(source) {
			checkboxes = document.getElementsByName('select_to_credit');
			
			for (var i = 0, n = checkboxes.length; i < n; i++) {
				checkboxes[i].checked = source.checked;
			}
			
		}
		
	</script>
	<script type="text/javascript">
	    $(document).on('change', 'input[type="checkbox"]', function(e){
	    	var flag=0;
	    	$('[name="select_to_credit"]').each( function (){
	    		
	            if($(this).prop('checked') == true){
	            	flag=1;
	            }
	    	});
	            if(flag==1)
	            	{
	            	document.getElementById("submitCRNote").disabled=false;

	            	}else{
		            	document.getElementById("submitCRNote").disabled=true;

	            	}
	        
	    });
	    $(function() {
	        $("#validation-form").submit(function(e) {
				var isValid=true;
	        	if ($("#validation-form input:checkbox:checked").length > 0)
				{ 	//alert("OK");
				}
				else
				{
				isValid=false;
				alert("No checkbox selected please select minimum one ");
				}
	            //do your own request an handle the results
	           // alert(isValid);
	            if(isValid==true){
	            	var result = confirm("Are you sure to generate this credit note");
	            	document.getElementById("submitCRNote").disabled=true;
	            	if (result==true) {
	           /*  $.ajax({
	                    url: '${pageContext.request.contextPath}/insertCreditNote',
	                    type: 'post',
	                    dataType: 'application/json',
	                    data: $("#validation-form").serialize(),
	                    success: function(data) {
	                    	alert("Credit Note Generated !!");
	                    	window.open("${pageContext.request.contextPath}/showCreditNotes");
	                    }
	            }); */
	            return true;}else{
	            		return false;
	            	}
	            }else{
	            	return false;
	            }
	        });
	    });
	</script>
	
	<script>
	function getGrnGvnDetail(){
			var selectedType = $("#selectType").val();
	        var form = document.getElementById("validation");
	        form.action ="${pageContext.request.contextPath}/insertCreNoteProcess";
	        form.submit();
	        $("#selectType").value=selectedType;
	}
    function viewCreditNotes(){
	window.open('${pageContext.request.contextPath}/showCreditNotes');
	}
	</script>
	
</body>
</html>