<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<style>
	/* table{
  width:100%;
  border:1px solid #ddd;
      border-collapse: collapse;
  
}
th {
    border: 1px #DDD solid;
}
td {
    border: 1px #DDD solid;
    padding: 3px 6px;
 
} */
.selected{
    background:#ffffff;
}
root
    {
        display: block;
    }

    th.sortable
    {
        color: #FFF;
        cursor: pointer;
        text-decoration: underline;
    }

        th.sortable:hover
        {
            color: black;
        }

    th.sorted-asc, th.sorted-desc
    {
        color: black;
        background-color: cadetblue;
    }

</style>
<body>

	<jsp:include page="/WEB-INF/views/include/logout.jsp"></jsp:include>

<c:url var="excelForFrBill" value="/excelForFrBill" />
	<c:url var="callGetBillListProcess" value="/getBillListProcessForPrint" />
<c:url var="excelForFrBillExcel" value="/excelForFrBillExcel" />
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
						<i class="fa fa-file-o"></i>View Your Bills for Print
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
							test="${subModule.subModuleMapping eq 'showBillListForPrint'}">

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
								<i class="fa fa-bars"></i> View Your Bills for Print
							</h3>
							<div class="box-tool">
								<a href="">Back to List</a> <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a>
							</div>
							<!-- <div class="box-tool">
								<a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a> <a data-action="close" href="#"><i
									class="fa fa-times"></i></a>
							</div> -->
						</div>


						<div><!-- class="box-content" -->
							<form class="form-horizontal" method="get" id="validation-form">
	                        <input type="hidden" class="form-control" name="billnumber" id="billnumber"	value="0"  />
							<input type="hidden" class="form-control" name="issinglepdf" id="issinglepdf" 	value="0" />
							
								<div class="frm_Sec_one single">
									<div class="row">
										<div class="col-md-12 box_marg">
										<label class="control-label left" for="textfield2">Select Franchise</label>
										<div class="controls icon_add">
										<i class="fa fa-user frm_icon" aria-hidden="true"></i>
										<select class="form-control padd_left chosen" multiple="multiple"
											tabindex="6" name="fr_id" id="fr_id">
											<option value="-1">All</option>
											<c:forEach items="${allFrIdNameList}" var="allFrIdNameList"
												varStatus="count">
												<option value="${allFrIdNameList.frId}">${allFrIdNameList.frName}</option>
											</c:forEach>
										</select>
										</div>
									</div>
									
										<div class="col-md-3 box_marg">
										<label class="control-label left">From Date</label>
										<div class="controls icon_add">
										<i class="fa fa-calendar frm_icon" aria-hidden="true"></i>
										<input class="form-control padd_left date-picker" id="dp1" size="16"
											value="${todaysDate}" type="text" name="from_date" required />
										</div>
									</div>
									
										<div class="col-md-3 box_marg">
										<label class="control-label left">To Date</label>
										<div class="controls icon_add">
										<i class="fa fa-calendar frm_icon" aria-hidden="true"></i>
										<input class="form-control padd_left date-picker" id="dp2" size="16"
											value="${todaysDate}" type="text" name="to_date" required />
										</div>
									</div>
									
									
									<div class="col-md-3 box_marg">
										<label class="control-label left">Select Route</label>
										<div class="controls icon_add">
										<i class="fa fa-road frm_icon" aria-hidden="true"></i>
										<select class="form-control padd_left chosen" tabindex="6"
											name="route_id" id="route_id">
											<option value="0">Select Route</option>
											<c:forEach items="${routeList}" var="route" varStatus="count">
												<option value="${route.routeId}"> ${route.routeName}</option>
											</c:forEach>
										</select>
										</div>
									</div>
									
									<div class="col-md-3 box_marg">
										<label class="control-label left">Section</label>
										<div class="controls icon_add">
										<i class="fa fa-square frm_icon" aria-hidden="true"></i>
										<select id="section"  class='form-control padd_left'>
											<option value="-">All</option>
												<c:forEach items="${sectionList}" var="sectionList">
													<option value="${sectionList.sectionId}"><c:out value="${sectionList.sectionName}" /></option>
												</c:forEach>
										</select>
										</div>
									</div>
									
									</div>
								</div>	
								
								<div class="form-group">
								<div class=" three_buttons">
									<input class="btn btn-primary" type="button" value="Search" id="callSubmit" onclick="callSearch()">
									<input type="button" class="btn btn-primary" value="Cancel"">
								</div>					
						    </div>




								<div align="center" id="loader" style="display: none">

									<span>
										<h4>
											<font color="#343690">Loading</font>
										</h4>
									</span> <span class="l-1"></span> <span class="l-2"></span> <span
										class="l-3"></span> <span class="l-4"></span> <span
										class="l-5"></span> <span class="l-6"></span>
								</div>

								<!-- </form>
 -->
								<!-- <tion="getBillListProcess" class="form-horizontal"
								method="post" id="validation-form"> -->
								<div class="box1">
								<!-- 	<div class="box-title">
										<h3>
											<i class="fa fa-table"></i> Bill List
										</h3>
										<div class="box-tool">
											<a data-action="collapse" href="#"><i
												class="fa fa-chevron-up"></i></a>
											<a data-action="close" href="#"><i class="fa fa-times"></i></a>
										</div>
									</div> -->

									<div ><!-- class="box-content" -->
									
										<div class="frm_Sec_one single">
											<div class="row">
												<div class="col-md-3 box_marg">
													<label class="control-label left">Transport Mode</label>
													<div class="controls icon_add">
													<i class="fa fa-stack-exchange frm_icon" aria-hidden="true"></i>
													<input type="text" class="form-control padd_left" name="transport_mode" value="By Road"
													data-rule-required="true" />
													</div>
												</div>
												
												<div class="col-md-3 box_marg">
													<label class="control-label left">Vehicle No</label>
													<div class="controls icon_add">
													<i class="fa fa-file-text frm_icon" aria-hidden="true"></i>
													<input type="text" class="form-control padd_left" name="vehicle_no"
													value="0" data-rule-required="true" />
													</div>
												</div>
											</div>
										</div>
									

<div class="box-content">
		<div class="col-md-9" ></div> 
		
		
										
					<label for="search" class="col-md-3" id="search">
    								
									<input type="text"  id="myInput" onkeyup="myFunction()" autocomplete="off" class="form-control" placeholder="Search Shop Name & Invoice Number" title="Type in a name">
										</label>  

										<!-- <div class="clearfix"></div> -->
										
<div class="tableFixHead">
	<table id="table1">        
	<thead style="background-color: #f3b5db;">
		<tr class="bgpink">
			<th style="text-align: center; width:70px;"><input type="checkbox" onClick="selectBillNo(this)" /> All<br /></th>
			<th style="text-align: center; width:70px;">Sr</th>
			<th style="text-align: right;" class="sortable">Inv No</th>
			<th style="text-align: right;">Date</th>
			<th style="text-align: left;" class="sortable">Franchise</th>
			<th style="text-align: left;">Taxable Amt</th>
			<th style="text-align: right;">Tax Amt</th>
			<th style="text-align: right;">Total</th>
			<th style="text-align: right;">Status</th>
			<th style="text-align: right;">Action</th>
		</tr>
	</thead>

	<tbody>
	<c:forEach items="${billHeadersList}" var="billHeadersList"
		varStatus="count">

		<tr>
		
			<td style="text-align: center;"><input type="checkbox" name="select_to_print"
				id="${billHeadersList.billNo}"
				value="${billHeadersList.billNo}"/></td>
                                              
			<td style="text-align: center;"><c:out value="${count.index+1}" /></td>
                                               
			<td style="text-align: right;"><c:out
					value="${billHeadersList.invoiceNo}" /></td>

			<td style="text-align: right;"><c:out
					value="${billHeadersList.billDate}" /></td>

			<td style="text-align: left;"><c:out
					value="${billHeadersList.frName}" /></td>
			<td style="text-align: left;"><c:out
					value="${billHeadersList.taxableAmt}" /></td>
			<td style="text-align: right;"><c:out
					value="${billHeadersList.totalTax}" /></td>
			
			<td style="text-align: right;">
			
			<fmt:formatNumber type="number" maxFractionDigits="2" value="${billHeadersList.taxableAmt + billHeadersList.totalTax}" /></td>
			
			<c:if test="${billHeadersList.status==1}">
				
					<td style="text-align: right;"><c:out
							value="Pending" /></td>
				</c:if>
				<c:if test="${billHeadersList.status==2}">
				
					<td style="text-align: right;"><c:out
							value="Received" /></td>
				</c:if>
				
			<td style="text-align: right;">
			
			
			
			
			<c:choose>
																		<c:when test="${isEdit==1}">
																			<a href="#" onclick="submitBill()" title="Bill Detail"><i class="fa fa-pencil" aria-hidden="true"></i></a>
																		</c:when>
																		<c:otherwise>
																			<a class="disableClick" href="#" onclick="submitBill()" title="Bill Detail"><i class="fa fa-pencil" aria-hidden="true"></i></a>
																		</c:otherwise>
																	</c:choose>
			
			 &nbsp;&nbsp;
			<input type="button"  id="btn_submit_pdf" class="btn btn-primary"
			value="PDF" onclick="submitBillPdf()" style="padding: 0px 4px;font-size: 14px;">&nbsp;
			<c:if test="${billHeadersList.status==1}">
			<a href="${pageContext.request.contextPath}/updateBillStatusAdmin?billNo=${billHeadersList.billNo}&stat=2" title="Received">
			<i class="fa fa-info" aria-hidden="true"></i></a> 
			</c:if>
			</td>
		</tr>
	</c:forEach>
</tbody>
	</table>
</div>
										
										
		<div class="form-group">
			<div class="three_buttons" style="padding:16px 30px 0 0;">
				<input type="button" id="btn_submit" class="btn btn-primary" onclick="submitBill()" value="BillDetail" style="display: none;"/>
				<input type="button" id="expExcel" class="btn btn-primary" value="EXPORT TO Excel" onclick="createExel();" >
				<input type="button" id="expExcel" class="btn btn-primary" value="Excel Hsnwise Summary Tally" onclick="createExelHsnwise();" >							
				<input type="button" disabled id="expExcel2" class="btn btn-primary" value="Hsnwise Summary" onclick="exportToExcel();" >
				<input type="button" class="btn btn-primary" value="Cancel">
			</div>					
	    </div>								



									
									</div>
								</div>
							</form>
						</div>
					</div>
					
				</div>
				
			</div>
			<!-- END Main Content -->
			


			<a id="btn-scrollup" class="btn btn-circle btn-lg" href="#"><i
				class="fa fa-chevron-up"></i></a>
		</div>
		<!-- END Content -->
		<footer>
				<p>2018 © MONGINIS.</p>
			</footer>
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
		function submitBill() {
			//submitBillForm.submit();
			// window.open("${pageContext.request.contextPath}/pdf?url=showBillPdf");

			// window.open("${pageContext.request.contextPath}/showBillListForPrint");
var form = document.getElementById("validation-form")
form.action = "${pageContext.request.contextPath}/getBillDetailForPrint";
form.submit();
		}
		$('#btn_submit')
				.click(
						function() {
							var form = document.getElementById("validation-form")
							form.action = "${pageContext.request.contextPath}/getBillDetailForPrint";
							form.submit();
						});	
		
	</script>


	<script type="text/javascript">
		
		$('#btn_submit_pdf')
				.click(
						function() {
							document.getElementById("validation-form").target = "_blank";

							var form = document.getElementById("validation-form");

							form.action = "${pageContext.request.contextPath}/getBillDetailForPrintPdf";
							form.submit();
						});
		function submitBillPdf() {
			document.getElementById("validation-form").target = "_blank";

			var form = document.getElementById("validation-form");

			form.action = "${pageContext.request.contextPath}/getBillDetailForPrintPdf";
			form.submit();
		}
		
	</script>
<script type="text/javascript">
	function validate() {

		var selectedFr = $("#fr_id").val();
		var selectedRoute = $("#route_id").val();


		var isValid = true;
	
		if ((selectedFr == "" || selectedFr == null ) && (selectedRoute==0)) { 

				alert("Please Select Route  Or Franchisee");
				isValid = false;
		
		}
		return isValid;

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


	<script type="text/javascript">
		$(document).ready(function() {
			$('#callSubmit2').submit(function() {
				alert("searching");
				$.ajax({
					type : "get",
					url : "/getBillListProcess", //this is my servlet
					/*   data: "input=" +$('#ip').val()+"&output="+$('#op').val(), */
					success : function(data) {
						alert("success");

					}

				});
			});

		});
	</script>

	<script type="text/javascript">
		function callSearch() {

			//var frId = document.getElementById("fr_id").value;
			var array = [];
			var frIds = $("#fr_id").val();
			var fromDate = document.getElementById("dp1").value;
			var toDate = document.getElementById("dp2").value;
			var section= document.getElementById("section").value;
			var routeId = document.getElementById("route_id").value;
			var isValid=validate();
			if(isValid==true){
			$('#loader').show();

			$
					.getJSON(
							'${callGetBillListProcess}',
							{
								fr_id_list : JSON.stringify(frIds),
								from_date : fromDate,
								to_date : toDate,
								route_id : routeId,
								ajax : 'true'
							},
							function(data) {
								$('#table1 td').remove();
								$('#loader').hide();
								if (data == "") {
									alert("No Bill Found");
								}
								$.each(data,function(key, bill) {
												
													if(section!="-" &&  section==bill.exVarchar1){
													var tr = $('<tr></tr>');
													tr.append($('<td class="col-sm-1"></td>').html("<input type='checkbox' name='select_to_print' value="+bill.billNo+">"));
                                                    tr.append($('<td class="col-sm-1"></td>').html(key + 1));
                                                    tr.append($('<td class="col-md-1"></td>').html(bill.invoiceNo));
                                                    tr.append($('<td class="col-md-1"></td>').html(bill.billDate));
													tr.append($('<td class="col-md-2"></td>').html(bill.frName));
													tr.append($('<td class="col-md-2" style="text-align:right;"></td>').html(bill.taxableAmt.toFixed(2)));
													tr.append($('<td class="col-sm-1" style="text-align:right;"></td>').html(bill.totalTax.toFixed(2)));
													tr.append($('<td class="col-md-1" style="text-align:right;"></td>').html(bill.grandTotal.toFixed(2)));
													tr.append($('<td class="col-md-2"></td>').html("<input type='button' id='btn_submit' name='btn_submit' onClick='submitBill()' value='BillDetail'  class='btn btn-primary'/> &nbsp;&nbsp; <input type='button' id='btn_submit_pdf' value='PDF'  class='btn btn-primary' onClick='submitBillPdf()'/>"));
													$('#table1 tbody').append(tr);
												}
													
													document.getElementById("expExcel2").disabled=false;

									})
										if(section=="-")
										{
									$.each(data,function(key, bill) {
											
														var tr = $('<tr></tr>');
														tr.append($('<td class="col-sm-1"></td>').html("<input type='checkbox' name='select_to_print' value="+bill.billNo+">"));
	                                                    tr.append($('<td class="col-sm-1"></td>').html(key + 1));
	                                                    tr.append($('<td class="col-md-1"></td>').html(bill.invoiceNo));
	                                                    tr.append($('<td class="col-md-1"></td>').html(bill.billDate));
														tr.append($('<td class="col-md-2"></td>').html(bill.frName));
														tr.append($('<td class="col-md-2" style="text-align:right;"></td>').html(bill.taxableAmt.toFixed(2)));
														tr.append($('<td class="col-sm-1" style="text-align:right;"></td>').html(bill.totalTax.toFixed(2)));
														tr.append($('<td class="col-md-1" style="text-align:right;"></td>').html(bill.grandTotal.toFixed(2)));
														tr.append($('<td class="col-md-2"></td>').html("<input type='button' id='btn_submit' name='btn_submit' onClick='submitBill()' value='BillDetail'  class='btn btn-primary'/> &nbsp;&nbsp; <input type='button' id='btn_submit_pdf' value='PDF'  class='btn btn-primary' onClick='submitBillPdf()'/>"));
														$('#table1 tbody').append(tr);
													
											document.getElementById("expExcel2").disabled=false;

										})
								}

							});
			}

		}
	</script>
	
	<script type="text/javascript">
	 
		function createExel() {
 
			var fromDate = document.getElementById("dp1").value;
			var toDate = document.getElementById("dp2").value;
			  var select_to_print = document.forms[0];
			 // alert(JSON.stringify(select_to_print));
    	var txt = "";
    	var i;
    	var flag=0;
    	var all=0;
    	 for (i = 0; i < select_to_print.length; i++) {
        if (select_to_print[i].checked  && select_to_print[i].value!="on") {
            txt = txt + select_to_print[i].value + ",";
            flag=1;
        }
    } 
		
			 if(flag==1)
				 {
			$
					.getJSON(
							'${excelForFrBill}',
							{
								checkboxes : txt,
								all : all,
								fromDate : fromDate,
								toDate : toDate,
								ajax : 'true'
							},
							function(data) {
								
							 alert("Excel Ready");
								 exportToExcel();
							 
							});
				 }
			 else
				 {
				 alert("Select Minimum 1 Bill ");
				 }

		}
		
		function exportToExcel()
		{
			//alert("Export Excel");
			window.open("${pageContext.request.contextPath}/exportToExcel"); 
			document.getElementById("expExcel2").disabled=true;

		}
		function createExelHsnwise() {
			 //alert("Hi");
			  try {
			var fromDate = document.getElementById("dp1").value;
			var toDate = document.getElementById("dp2").value;
			  var select_to_print = document.forms[0];
			  //alert(JSON.stringify(select_to_print));
    	var txt = "";
    	var i;
    	var flag=0;
    	var all=0;
    	//alert("before for")
    	 for (i = 0; i < select_to_print.length; i++) {
        if (select_to_print[i].checked  && select_to_print[i].value!="on") {
            txt = txt + select_to_print[i].value + ",";
            flag=1;
        }
    } 
    	 alert("in flag  after for Length " +txt.length)
			 if(flag==1)
				 {
				// alert("in flag  ==1")
				
				 
			$
					.getJSON(
							'${excelForFrBillExcel}',
							{
								checkboxes : txt,
								all : all,
								fromDate : fromDate,
								toDate : toDate,
								ajax : 'true'
							},
							function(data) {
								
							// alert("Excel Ready");
								 exportToExcel();
							 
							});
				 }
			 else
				 {
				 alert("Select Minimum 1 Bill ");
				 }
			  }catch(err) {
				//  alert("in catch")
				  //alert(err);
			  }
		}
	</script>


	<script>
	
		function selectBillNo(source) {
			checkboxes = document.getElementsByName('select_to_print');
			
			for (var i = 0, n = checkboxes.length; i < n; i++) {
				checkboxes[i].checked = source.checked;
			}
			
		}
		
		
		
		
		function myFunction() {
			  var input, filter, table, tr, td,td1, i;
			  input = document.getElementById("myInput");
			  filter = input.value.toUpperCase();
			  table = document.getElementById("table1");
			  tr = table.getElementsByTagName("tr");
			  for (i = 0; i < tr.length; i++) {
			    td = tr[i].getElementsByTagName("td")[2];
			    td1 = tr[i].getElementsByTagName("td")[4];
			    if (td || td1) {
			      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
			        tr[i].style.display = "";
			      }else if (td1.innerHTML.toUpperCase().indexOf(filter) > -1) {
			        tr[i].style.display = "";
			      }  else {
			        tr[i].style.display = "none";
			      }
			    }       
			  }//end of for
			  
			 
			  
			}
	</script>
	
<script type="text/javascript">
	$(document).ready(function () {

        //grab all header rows
        $('th').each(function (column) {
            $(this).addClass('sortable').click(function () {
                    var findSortKey = function ($cell) {
                        return $cell.find('.sort-key').text().toUpperCase()+ ' ' + $cell.text().toUpperCase();

                    };
                    var sortDirection = $(this).is('.sorted-asc') ? -1 : 1;
                    var $rows = $(this).parent().parent().parent().find('tbody tr').get();
                    var bob = 0;
                    //loop through all the rows and find
                    $.each($rows, function (index, row) {
                        row.sortKey = findSortKey($(row).children('td').eq(column));
                    });

                    //compare and sort the rows alphabetically or numerically
                    $rows.sort(function (a, b) {                       
                        if (a.sortKey.indexOf('-') == -1 && (!isNaN(a.sortKey) && !isNaN(a.sortKey))) {
                             //Rough Numeracy check                          
                                
                                if (parseInt(a.sortKey) < parseInt(b.sortKey)) {
                                    return -sortDirection;
                                }
                                if (parseInt(a.sortKey) > parseInt(b.sortKey)) {                                
                                    return sortDirection;
                                }

                        } else {
                            if (a.sortKey < b.sortKey) {
                                return -sortDirection;
                            }
                            if (a.sortKey > b.sortKey) {
                                return sortDirection;
                            }
                        }
                        return 0;
                    });

                    //add the rows in the correct order to the bottom of the table
                    $.each($rows, function (index, row) {
                        $('tbody').append(row);
                        row.sortKey = null;
                    });

                    //identify the collumn sort order
                    $('th').removeClass('sorted-asc sorted-desc');
                    var $sortHead = $('th').filter(':nth-child(' + (column + 1) + ')');
                    sortDirection == 1 ? $sortHead.addClass('sorted-asc') : $sortHead.addClass('sorted-desc');

                    //identify the collum to be sorted by
                    $('td').removeClass('sorted').filter(':nth-child(' + (column + 1) + ')').addClass('sorted');
                });
            });
        });
	</script>
	<!-- <script type="text/javascript">
	$(document).ready(function () {
	    $(document).on('click', 'tbody tr', function () {
	        var checked= $(this).find('input[type="checkbox"]');
	        checked.prop('checked', !checked.is(':checked'));
	        $(this).toggleClass('selected'); // or anything else for highlighting purpose
	    });
	    $(document).on('click', 'input[type="checkbox"]', function () {
	        $(this).prop('checked', !$(this).is(':checked'));
	        $(this).parent('tr').toggleClass('selected'); // or anything else for highlighting purpose
	    });
	});
	</script> -->

</body>
</html>