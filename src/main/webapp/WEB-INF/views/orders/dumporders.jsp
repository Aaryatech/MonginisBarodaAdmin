<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
  
	
<style>
@media only screen and (min-width: 1200px) {
	.franchisee_label, .menu_label {
		width: 22%;
	}
	.franchisee_select, .menu_select {
		width: 76%;
	}
	.date_label {
		width: 40%;
	}
	.date_select {
		width: 50%;
		padding-right: 0px;
	}
}
</style>
 
  	<style>
 table{
  width:100%;
 
  border:1px solid #ddd;
}
 </style>
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<body>

<jsp:include page="/WEB-INF/views/include/logout.jsp"></jsp:include>
	<c:url var="getNonOrderFrList" value="/getNonOrderFrList"></c:url>
	<c:url var="getOrderItemList" value="/getOrderItemList"></c:url>
	<c:url value="/getMenusSectionAjax" var="getMenusSectionAjax"/>
	


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
						<i class="fa fa-file-o"></i> Dump Orders
					</h1>-->

				</div>
			</div> 
			<!-- END Page Title -->

	<form id="submitDumpOrderForm"
				action="${pageContext.request.contextPath}/submitDumpOrder" onsubmit="submitOrder.disabled = true; return confirm('Do you want to Submit ?');"
				method="post">
		<!-- BEGIN Main Content -->
		<div class="box">
			<div class="box-title">
				<h3>
					<i class="fa fa-bars"></i>Dump Orders For Franchise
				</h3>
			</div>
			<div class="box-content">
			</div>
				<div ><!-- class="box-content" -->
				
					
					<div class="frm_Sec_one single">
						<div class="row">
							<div class="col-md-3 box_marg">
											<label class="control-label left">Section</label>
												<div class="controls icon_add">
													<i class="fa fa-square frm_icon" aria-hidden="true"></i>
													<select data-placeholder="Choose Section"
								class="form-control padd_left chosen" tabindex="6" id="section"
								name="section" onchange="getMenus(this.value)">		
								<!-- <option value="-1">All</option> -->	
								<option value="">Select Section</option>					
								 <c:forEach items="${section}" var="section"
									varStatus="count">
									<option value="${section.sectionId}"><c:out
											value="${section.sectionName}" /></option>
								</c:forEach> 
							</select>
							
													
											</div>
																							<span id="section_alert" class="span_err">Please select section</span>
											
										</div>
										
							<div class="col-md-3 box_marg">
											<label class="control-label left">Menu</label>
												<div class="controls icon_add">
													<i class="fa fa-bars frm_icon" aria-hidden="true"></i>
													<select data-placeholder="Choose Menu"
								class="form-control padd_left chosen" tabindex="6" id="selectMenu"
								name="selectMenu" onchange="getFr()">
								<c:forEach items="${unSelectedMenuList}" var="unSelectedMenu"
									varStatus="count">
									<option value="${unSelectedMenu.menuId}"><c:out value="${unSelectedMenu.menuTitle}"/></option>
								</c:forEach>
							</select>		
											</div>
											<span id="menu_alert" class="span_err">Please select menu</span>
										</div>
										
							<div class="col-md-3 box_marg">
											<label class="control-label left">Production Date</label>
												<div class="controls icon_add">
													<i class="fa fa-calendar frm_icon" aria-hidden="true"></i>
													<input class="form-control padd_left date-picker" placeholder="dd-MM-yyyy"
								id="date" size="19" type="text" name="date" onblur="getFr()"
								value="${todayDate}" required />
								
												
											</div>
										</div>	
									
									
							<div class="col-md-3 box_marg" >
											<label class="control-label left">Search By</label>
												<div class="controls icon_add">
												
								<label class="radio-inline"> <input value="1" class="" id="prev_date" checked type="radio"
								name="search_by" />
													Stock Type
												</label>
												
												<label class="radio-inline">  <input value="2" class=""
								id="stock_type" type="radio" name="search_by" />
													Prev Date
												</label>				
												
												
								
												
											</div>
										</div>	
										</div>
										<div class="row">
									<div id="prev_date_div" style="display: none;">		
							<div class="col-md-3 box_marg">
											<label class="control-label left">Previous Order (Prod) Date</label>
												<div class="controls icon_add">
												<input value="${todayDate}" class="form-control padd_left date-picker"
									id="dp2" size="16" type="text" name="order_date" />
									
								
												
											</div>
										</div>	
										
							</div>	
							
							<div class="col-md-9 box_marg">
											<label class="control-label left">Franchise</label>
												<div class="controls icon_add">
													<i class="fa fa-user frm_icon" aria-hidden="true"></i>
													<select data-placeholder="Choose Franchisee"
								class="form-control padd_left chosen " multiple="multiple" tabindex="6"
								id="selectFr" name="selectFr">
							</select>
								</div>											
								<span id="fr_alert" class="span_err">Please select franchise</span>
								
										</div>
										
																			
										
						</div>
					</div>				
				
				
				<div class="col-md-3 box_marg" style="display: none;">
											<label class="control-label left">Discount%</label>
												<div class="controls icon_add">
												<input type="text" name="discPer" id="discPer" value="1" class="form-control padd_left"/>
											</div>
										</div>		
					
				</div>
				
				<div class="form-group">
								<div class="three_buttons">
									<input type="button" id="searchFr" class="btn btn-primary" value="Search"
							onclick="searchOrders()" />
									<button type="button" onClick="window.location.reload();" class="btn btn-primary">Cancel</button>
							
									
								</div>
								
							<div align="center" id="loader" style="display: none;background-color: white;">
					<span>
						<h4>
							<font color="#343690">Loading</font>
						</h4>
					</span> <span class="l-1"></span> <span class="l-2"></span> <span
						class="l-3"></span> <span class="l-4"></span> <span class="l-5"></span>
					<span class="l-6"></span>
				</div>	
								
								
								
								</div>
				
			
				
			</div>
			 	<jsp:include page="/WEB-INF/views/include/tableSearch.jsp"></jsp:include>
			
		<div class="box">
				<div class=" box-content"><!--  -->
					
					<div class="tableFixHead">
	<table id="table_grid">         
	<thead style="background-color: #f3b5db;">
		<tr class="bgpink">
		</tr>
	</thead>
	
	<tbody>
	</tbody>
	</table>
</div>
				
				
					<!-- <div id="table-scroll" class="table-scroll"></div> -->
							 
									
									
					<div class="row" align="center">
					
				<label class=" col-md-1 control-label franchisee_label" style="display:none;">Delivery Date</label>
						<div class="col-sm-3 col-lg-2 controls"  style="display:none;">
										<input class="form-control date-picker" placeholder="dd-mm-yyyy" id="deldate" size="19"
											type="text" name="deldate" value="${todayDate}"  />
									</div>
						
					</div>
					
					<div >
						<div class="three_buttons">
							<button class="btn btn-primary" id="submitOrder" disabled>Submit</button>
						</div>
					</div>
				
				</div>
			
		</div></form>
			<jsp:include page="/WEB-INF/views/include/copyrightyear.jsp"></jsp:include>
	</div>
	<!-- END Main Content -->
			

	<a id="btn-scrollup" class="btn btn-circle btn-lg" href="#"><i
		class="fa fa-chevron-up"></i></a>
		


	<script type="text/javascript">
				function getFr() {
					var orderDate = document.getElementById("date").value;
					$.getJSON('${getNonOrderFrList}', {
						menu_id : $("#selectMenu").val(),
						orderDate: orderDate,
						ajax : 'true'
					}, function(data) {
						var html = '<option value="-1"><c:out value=""/></option>';
						var len = data.length;
						$('#selectFr')
					    .find('option')
					    .remove()
					    .end()
						for ( var i = 0; i < len; i++) {
							 $("#selectFr").append(
			                           $("<option ></option>").attr(
			                               "value", data[i].frId).text(data[i].frName)
			                       );
						} 
						$("#selectFr").trigger("chosen:updated");
					});
				}
				
				
				
				$("#section").change(function(){
					  alert("The text has been changed.");
					});
	</script>
<script type="text/javascript">
$('input[type=radio][name=search_by]').change(function() {
    if (this.value ==1) {
        document.getElementById("prev_date_div").style="display:none"
    }
    else if (this.value ==2) {
    	  document.getElementById("prev_date_div").style="display:block"
    }
});
		function searchOrders() {
			
			
			$('#table_grid td').remove();
			$('#table_grid th').remove();
			
			var isValid = validate();
			
			if (isValid) {
				document.getElementById("searchFr").disabled=true;
				var selectedMenu = $("#selectMenu").val();
				var discPer = $("#discPer").val();
				var selectedFr = $("#selectFr").val();
				var searchBy=$('input[name="search_by"]:checked').val();
				var preOrderDate = document.getElementById("dp2").value;
				franchasee();
				var frId = [];
			       
				
		        $.each($("#selectFr option:selected"), function(){            
		        	frId.push($(this).val());
		           
		            
		        });
				
		       
		        $('#loader').show();
				$.getJSON('${getOrderItemList}',{
									menu_id : selectedMenu,
									fr_id_list : JSON.stringify(frId),
									preOrder_Date : preOrderDate,
									searchBy : searchBy,
									ajax : 'true'
								},
								function(data) {

									//$('#table_grid td').remove();
											document.getElementById("searchFr").disabled=false;
									$('#loader').hide();

									if (data == "") {
										alert("No records found !!");

									}

									else{ 
										document.getElementById("submitOrder").disabled=false;
									$.each(data,function(key, orderdata) {

														var index = key + 1;

													 
														var tr = $('<tr></tr>');
														tr.append($("<td style='text-align: center;'></td>").html(""+index));
													  	tr.append($("<td style='text-align: left;'></td>").html(orderdata.itemName));
														tr.append($("<td style='text-align: left; display:none;'></td>").html("<input type='text' name=disc_per"+orderdata.itemId+" style='width:45px; text-align: right;' class='form-control' id=disc_per"+orderdata.itemId+" value="+discPer+" > "));
													  
													      $.each(frId, function(key, id){    
													    	 	 var qty=0;
													    	 	 if(orderdata.orderData!=null)
													    	 		 {
													    	  $.each(orderdata.orderData, function(key, frData){
													    	if (frData.frId==id){
													    	 qty=frData.orderQty;
													    	}
													    	 						    	
													    	
													    	  });	
													    	 		 }
													    		 //var orderQty = "<td align=center><input onkeypress='return IsNumeric(event);' ondrop='return false;' onpaste='return false;' type=number min=0 max=500 class=form-control   id=itemId"+orderdata.itemId+"orderQty"+ id+ " name=itemId"+orderdata.itemId+"orderQty"+id+" value = "+qty +"></td>"; 
																
													    		 tr.append($("<td style='text-align: center;'></td>").html("<input onkeypress='return IsNumeric(event);' ondrop='return false;' style='text-align: left;'  height: 24px;'  onpaste='return false;' type=number min=0 max=500 class=form-control   id=itemId"+orderdata.itemId+"orderQty"+ id+ " name=itemId"+orderdata.itemId+"orderQty"+id+" value = "+qty +">"));
													      });
													    
														
													  
  
													  	
													  	$('#table_grid tbody').append(tr);
													})
									}
														

								});

			}
		}
	</script>
	<script>
		$(document).ready(function(){
		  $("#myInput").on("keyup", function() {
		    var value = $(this).val().toLowerCase();
		    $("#table_grid tbody tr").filter(function() {
		      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
		      try{
		    	  if(value==""||value==null){
		    		  document.getElementById("calldelete").disabled = false;
		    	  }else{
		    		  document.getElementById("calldelete").disabled = true;
		    	  }
		}catch (e) {
			
		}
		    });
		  });
		});
</script>
	
	
		<script type="text/javascript">
		function validate() {
			$("#fr_alert").hide();
			$("#menu_alert").hide();
			$("#section_alert").hide();
			var selectedMenu = $("#selectMenu").val();
			var selectedFr = $("#selectFr").val();
			var selectOrderDate =$("#dp2").val();
			var section = $("#section").val();

			var isValid = true;
			if (section == "" || section == null) {
				$("#section_alert").show();
				isValid = false;
			}else if(selectedMenu == "" || selectedMenu == null){
				isValid = false;
				$("#menu_alert").show();
			}
			else if($('#selectMenu :selected').text() == ''){
				isValid = false;
				$("#menu_alert").show();
			} else if (selectedFr == "" || selectedFr == null) {
				isValid = false;
				$("#fr_alert").show();
			}
			else if (selectOrderDate == "" || selectOrderDate == null) {
				isValid = false;
				alert("Please select Previous Order Date");
			}
			return isValid;

		}
	</script>

	

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
function franchasee() {
        var frName = [];
       
        var i=0;
   
        var tr;
        tr = document.getElementById('table_grid').tHead.children[0];

        tr.insertCell(0).outerHTML = "<th style='text-align:center; width:80px;'>Sr. No.</th>"
        tr.insertCell(1).outerHTML = "<th style='text-align: left;'>Item Name</th>"
        tr.insertCell(2).outerHTML = "<th style='text-align: left; display:none;'>Disc%</th>"
        $.each($("#selectFr option:selected"), function(){            
        	frName.push($(this).text());
        	i++;
        });
        i=i-1;
        $.each(frName, function(){  
       
            tr.insertCell(3).outerHTML = "<th style='text-align: left;'>"+frName[i] +"</th>"
            i--;
       });
        	
        
	}
	
	var specialKeys = new Array();
    specialKeys.push(8); //Backspace
    function IsNumeric(e) {
        var keyCode = e.which ? e.which : e.keyCode
        var ret = ((keyCode >= 48 && keyCode <= 57) || specialKeys.indexOf(keyCode) != -1 || keyCode==9);
       // document.getElementById("error").style.display = ret ? "none" : "inline";
        return ret;
    }
</script>
<script type="text/javascript">
function getMenus(sectionId) {
	$.getJSON('${getMenusSectionAjax}', {	
		sectionId : sectionId,
		ajax : 'true'
	}, function(data) {
		var len = data.length;
		
		$('#selectMenu')
	    .find('option')
	    .remove()
	    .end()
		 $("#selectMenu").append($("<option></option>").attr( "value","").text("Select Any Menu"));

		for ( var i = 0; i < len; i++) {

			$("#selectMenu").append(
                       $("<option></option>").attr(
                           "value", data[i].menuId).text(data[i].menuTitle)
             );
		}

		   $("#selectMenu").trigger("chosen:updated");
	});
}
</script>

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
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/chosen-bootstrap/chosen.jquery.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-inputmask/bootstrap-inputmask.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/jquery-tags-input/jquery.tagsinput.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/jquery-pwstrength/jquery.pwstrength.min.js"></script>
	<%-- <script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-fileupload/bootstrap-fileupload.min.js"></script>
	 --%><script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-duallistbox/duallistbox/bootstrap-duallistbox.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/dropzone/downloads/dropzone.min.js"></script>
	<%-- <script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-timepicker/js/bootstrap-timepicker.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/clockface/js/clockface.js"></script> --%>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-colorpicker/js/bootstrap-colorpicker.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-daterangepicker/date.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-daterangepicker/daterangepicker.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-switch/static/js/bootstrap-switch.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-wysihtml5/wysihtml5-0.3.0.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-wysihtml5/bootstrap-wysihtml5.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/ckeditor/ckeditor.js"></script>

	<!--flaty scripts-->
	<script src="${pageContext.request.contextPath}/resources/js/flaty.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/flaty-demo-codes.js"></script>
		
</body>
</html>