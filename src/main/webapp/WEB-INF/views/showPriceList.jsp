<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<style>

/* h1{
  font-size: 30px;
  color: #fff;
  text-transform: uppercase;
  font-weight: 300;
  text-align: center;
  margin-bottom: 15px;
} */
th:hover{
     cursor:pointer;
    background:#AAA;
    
}
table{
  width:100%;
  table-layout: fixed;
  border:1px solid #ddd;
}

/* th{
  padding: 20px 15px;
  text-align: left;
  font-weight: 500;
  font-size: 14px;
  text-shadow: 0 1px 0 #ffffff;
  color: #ddd;
  text-transform: uppercase;
} */
/* td{
  padding: 15px;
  text-align: left;
  vertical-align:middle;
  font-weight: 300;
  font-size: 12px;
  color: #ddd;
  border-bottom: solid 1px rgba(255,255,255,0.1);
 
}
 */

/* demo styles */
/* 
@import url(https://fonts.googleapis.com/css?family=Roboto:400,500,300,700);
body{
  
  font-family: 'Roboto', sans-serif;
} */
/* for custom scrollbar for webkit browser

::-webkit-scrollbar {
    width: 6px;
} 
::-webkit-scrollbar-track {
    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3); 
} 
::-webkit-scrollbar-thumb {
    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3); 
}*/

</style>
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

<c:url value="/searchItemInSubcat" var="searchItemInSubcat"></c:url>
<c:url value="/updateRate" var="updateRate"></c:url>
<c:url var="getGroup2ByCatId" value="/getSubcat2ByCatId" />
 <c:url var="setAllMenuSelected"  value="/setAllMenuSelected" />
    <c:url var="setAllFrIdSelected"  value="/setAllFrIdSelected" />
    
    
    
		<!-- BEGIN Content -->
		<div id="main-content">
			<!-- BEGIN Page Title -->
		 	<div class="page-title">
				<div>
					<!--<h1>
						<i class="fa fa-file-o"></i> Franchisee Configuration
					</h1>-->
				</div>
			</div> 
			<!-- END Page Title -->


			<c:set var="isEdit" value="0"> </c:set>
<%-- 
			<c:forEach items="${sessionScope.newModuleList}" var="modules">
				<c:forEach items="${modules.subModuleJsonList}" var="subModule">
					<c:choose>
						<c:when
							test="${subModule.subModuleMapping eq 'configureFranchiseesList'}">
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
						</c:when>
					</c:choose>
				</c:forEach>
			</c:forEach> --%>



			<!-- BEGIN Main Content -->
			<div class="row">
				<div class="col-md-12">
					<div class="row">
						<div class="col-md-12">
							<div><!-- class="box" -->


								<div class="row">
									<div class="col-md-12">

										<div class="box">
											<div class="box-title">
												<h3>
													<i class="fa fa-table"></i> Price List 
												</h3>
												<div class="box-tool">
													<a data-action="collapse" href="#"><i
														class="fa fa-chevron-up"></i></a>
													<!--<a data-action="close" href="#"><i class="fa fa-times"></i></a>-->
												</div>
											</div>
                                          <div ><!-- class="box-content" -->
                                          
                                          <div class="frm_Sec_one single">
											<div class="row">
												<div class="col-md-3 box_marg">
													<label class="control-label left">Category</label>
														<div class="controls icon_add">
															<i class="fa fa-list-ul frm_icon" aria-hidden="true"></i>
															<select data-placeholder="Select Franchisee"
																name="item_grp1" class="form-control padd_left chosen"
																tabindex="-1" id="item_grp1" data-rule-required="true">

																<!-- <optgroup label="All Category"> -->
																<option selected>Select Category</option>

																<c:forEach items="${mCategoryList}" var="mCategoryList">


																	<option value="${mCategoryList.catId}"><c:out
																			value="${mCategoryList.catName}"></c:out></option>
																</c:forEach>
																<!-- 	</optgroup> -->

															</select>
															
															</div>
												</div>
												
												<div class="col-md-4 box_marg">
													<label class="control-label left">Sub-Category</label>
														<div class="controls icon_add">
															<i class="fa fa-list-ul frm_icon" aria-hidden="true"></i>
															<select data-placeholder="Select Menu" name="item_grp2"
																class="form-control padd_left chosen" tabindex="-1" id="item_grp2"
																multiple="multiple" data-rule-required="true">
																<!-- <optgroup label="All Menus">                                                     

													</optgroup> -->
																<option value="-1">ALL</option>
																<c:forEach items="${configureFranList}" var="menu">
																	<option value="${menu.menuId}">${menu.menuTitle}</option>

																</c:forEach>
															</select>
															
															</div>
												</div>
												
												<div class="col-md-3 box_marg">
													<label class="control-label left">MRP</label>
														<div class="controls icon_add">
															<i class="fa fa-inr frm_icon" aria-hidden="true"></i>
															<select data-placeholder="Select Franchisee"
																name="Mrp" class="form-control padd_left chosen"
																tabindex="-1" id="Mrp" data-rule-required="true">

																
																<option value="1" selected>MRP1</option>
																<option value="2" >MRP2</option>
																<option value="3" >MRP3</option>

															</select>
															</div>
												</div>
												
												<div class="col-md-2 box_marg">
													<div class="row three_buttons one_row" style="padding: 26px 0 0 0;">
									<input type="submit" class="btn btn-primary" value="Search" onclick="searchCall()">
									<button type="button" class="btn btn-primary">Cancel</button>
										
									
						</div>
												</div>
												
											</div>
										  </div>
										  
										  <div class="form-group">
								
								</div>

												


												<jsp:include page="/WEB-INF/views/include/tableSearch.jsp"></jsp:include>


												<div class="clearfix"></div>
							
							<div class="box-content">
								<div class="tableFixHead">
      <table id="table1">
        <thead>
          <thead style="background-color: #f3b5db;">
				<tr class="bgpink">
																	<th style="width: 70px; text-align: center;" id="sr">#</th>
																	<th style="text-align: left;"  id="fr">Item Name</th>
																	<th style="text-align: right; width: 150px;" id="menu">MRP</th>
																	<th style="text-align: right;" >
																	<div style="position: relative;" >
																		<div >
																			<input class="form-control" id="rate1" size="16"
																				required type="text" name="rate1" value=""
																				placeholder="Rate1" />
																			<!-- onblur=" return getProdQty(5,5)" -->
																		</div>
																		<i class="fa fa-chevron-circle-down"onclick="updateRate(1)" style="position: absolute;right: 5px;top: 10px;color: #333;font-size: 16px;" ></i>
																		</div>
																	</th>
																	
																	
																	
																	
																	<th style="text-align: right;" >
																	<div style="position: relative;" >
																		<div  >
																			<input class="form-control " id="rate2" size="16"
																				required type="text" name="rate2" value=""
																				placeholder="Rate2" />
																		</div>
																		
																		<i class="fa fa-chevron-circle-down"onclick="updateRate(2)" style="position: absolute;right: 5px;top: 10px;color: #333;font-size: 16px;"></i>
																		</div>
																	</th>
																	
																	
																	
																	<th style="text-align: right;" >
																	<div style="position: relative;" >
																		<div  >
																			<input class="form-control " id="rate3" size="16"
																				required type="text" name="rate3" value=""
																				placeholder="rate3" />
																			<!-- onblur=" return getProdQty(5,5)" -->
																		</div>
																		<i class="fa fa-chevron-circle-down"onclick="updateRate(3)" style="position: absolute;right: 5px;top: 10px;color: #333;font-size: 16px;" ></i>
																		</div>
																	</th>
																	
																	
																	<!-- <th width="66" align="left">Action</th> -->
																</tr>
			</thead>
        <tbody>
	</tbody>
      </table>
    </div>
    
    <div class="form-group">
		<div class=" three_buttons" id="range" style="padding:10px 15px 10px 0 ;">
			<input type="button" id="expExcel" class="btn btn-primary" value="Export To Excel" onclick="exportToExcel();">
			<button class="btn btn-primary" value="PDF" id="PDFButton" onclick="genPdf()">PDF</button>
			<button type="button" class="btn btn-primary">Cancel</button>
		</div>
	</div>
								
    
   
														
														
							</div>

												

											</div>
											
										</div>
									</div>
								</div>

							</div>
						</div>
					</div>
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
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-daterangepicker/date.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-daterangepicker/daterangepicker.js"></script>

<script type="text/javascript">
//'.tbl-content' consumed little space for vertical scrollbar, scrollbar width depend on browser/os/platfrom. Here calculate the scollbar width .
$(window).on("load resize ", function() {
  var scrollWidth = $('.tbl-content').width() - $('.tbl-content table').width();
  $('.tbl-header').css({'padding-right':scrollWidth});
}).resize();
</script>
<script type="text/javascript">
function searchCall() {
	//alert(document.getElementById("Mrp").value)
	var mrpType=document.getElementById("Mrp").value;
	var selectSubcat=document.getElementById("item_grp2");
	
	
	  var selectedScat = [];
	    for (var i = 0; i < selectSubcat.length; i++) {
	        if (selectSubcat.options[i].selected) selectedScat.push(selectSubcat.options[i].value);
	    }
	    
	   // alert(JSON.stringify(selectedScat));
	    $.post('${searchItemInSubcat}', {
	    	subcatIds : JSON.stringify(selectedScat),
	    	mrpType : mrpType,
			ajax : 'true'
		}, function(data) {
			//alert(JSON.stringify(data));
		
			
			if (data != null) {
				var len = data.length;
				$('#table1 td').remove();
				$.each(data,function(key, item) {
					var tr = $('<tr ></tr>');
					//alert(JSON.stringify(item))
							tr.append($('<td  style="text-align:center;"></td>').html(
									key+1));
							tr.append($('<td  style="text-align:left;"></td>').html(
									item.itemName));
					
							tr.append($('<td style="text-align:right;"></td>').html(
									item.itemMrp1));
							
							
							tr.append($('<td style="text-align:right;"></td>').html(
									item.itemRate1));
							
							
							
							tr.append($('<td style="text-align:right;" ></td>').html(
									item.itemRate2));
							
					
				
							
							tr.append($('<td style="text-align:right;" ></td>').html(
									item.itemRate3));
							
						
							
							
							
							$('#table1 tbody').append(
									tr);
							
						})
			
			
			
			}
			
		});
	    
}

</script>
<script type="text/javascript">
function updateRate(val) {
	var mrpType=document.getElementById("Mrp").value;
	//alert(mrpType)
	if(val==1){
		//alert("1")
		//alert(document.getElementById("rate1").value)
		var rate=document.getElementById("rate1").value;
	}else if(val==2){
		//alert("2")
		//alert(document.getElementById("rate2").value)
		var rate=document.getElementById("rate2").value;
	}else if(val==3){
		//alert("3")
		//alert(document.getElementById("rate3").value)
		var rate=document.getElementById("rate3").value;
	}
	
	
	if(!rate){
		alert("Please Enter Rate %")
	}else{
		
		 $.post('${updateRate}', {
		    	rateNo :val,
		    	rate : rate,
		    	mrpType:mrpType,
				ajax : 'true'
			}, function(data) {
				//alert(JSON.stringify(data))
				if (data != null) {
					var len = data.length;
					$('#table1 td').remove();
					$.each(data,function(key, item) {
						var tr = $('<tr ></tr>');
						//alert(JSON.stringify(item))
								tr.append($('<td ></td>').html(
										key+1));
								tr.append($('<td ></td>').html(
										item.itemName));
						
								if(mrpType==1){
									tr.append($('<td ></td>').html(
											item.itemMrp1));
								}
								else if(mrpType==2){
									tr.append($('<td ></td>').html(
											item.itemMrp2));
								}
								else if(mrpType==3){
									tr.append($('<td ></td>').html(
											item.itemMrp3));
								}
								
								
								
								tr.append($('<td ></td>').html(
										item.itemRate1));
								
								
								
								tr.append($('<td ></td>').html(
										item.itemRate2));
								
						
					
								
								tr.append($('<td ></td>').html(
										item.itemRate3));
								
							
								
								
								
								$('#table1 tbody').append(
										tr);
								
							})
				
				
				
				}
			});
		
	}
	
	 
	
	
	
}
</script>
<script type="text/javascript">
		$(document)
				.ready(
						function() {
							$('#item_grp1')
									.change(
											function() {
												//alert("Cat Sel")
												$.getJSON('${getGroup2ByCatId}',
																{
																	catId : $(
																			this)
																			.val(),
																	ajax : 'true'
																},
																function(data) {
																	//alert(JSON.stringify(data))
																	var html = '<option value="">Select Sub-Category</option>';
																	
																	var len = data.length;
																	
																	$('#item_grp2')
																    .find('option')
																    .remove()
																    .end()
																	 $("#item_grp2").append($("<option></option>").attr( "value",-1).text("ALL"));

																	for ( var i = 0; i < len; i++) {
													    
													                   $("#item_grp2").append(
													                           $("<option selected></option>").attr(
													                               "value", data[i].subCatId).text(data[i].subCatName)
													                       );
																	}
															
																	   $("#item_grp2").trigger("chosen:updated");

																});
											});
						});
	</script>
<script>

function exportToExcel()
{
	window.open("${pageContext.request.contextPath}/exportToExcel");
			document.getElementById("expExcel").disabled=true;
}

function genPdf() {

	
	
	
	
	 

	window
			.open('${pageContext.request.contextPath}/pdfForReport?url=pdf/showPricelistPdf/');

	//window.open("${pageContext.request.contextPath}/pdfForReport?url=showSaleReportByDatePdf/"+from_date+"/"+to_date);

}







function  confirm_delete(){
	return confirm('are you sure?');
}
function sortTable(f,n){
	var rows = $('#table1 tbody  tr').get();

	rows.sort(function(a, b) {

		var A = getVal(a);
		var B = getVal(b);

		if(A < B) {
			return -1*f;
		}
		if(A > B) {
			return 1*f;
		}
		return 0;
	});

	function getVal(elm){
		var v = $(elm).children('td').eq(n).text().toUpperCase();
		if($.isNumeric(v)){
			v = parseInt(v,10);
		}
		return v;
	}

	$.each(rows, function(index, row) {
		$('#table1').children('tbody').append(row);
	});
}
var f_sr = 1;
var f_fr = 1;
var l_menu = 1;
var l_cat= 1;
var l_time = 1;
$("#sr").click(function(){
    f_sr *= -1;
    var n = $(this).prevAll().length;
    sortTable(f_sr,n);
});
$("#fr").click(function(){
    f_fr *= -1;
    var n = $(this).prevAll().length;
    sortTable(f_fr,n);
});
$("#menu").click(function(){
   l_menu *= -1;
    var n = $(this).prevAll().length;
    sortTable(l_menu,n);
});
$("#cat").click(function(){
	   l_cat *= -1;
	    var n = $(this).prevAll().length;
	    sortTable(l_cat,n);
	});
$("#time").click(function(){
	   l_time *= -1;
	    var n = $(this).prevAll().length;
	    sortTable(l_time,n);
	});
</script>
<script>
function myFunction() {
  var input, filter, table, tr, td, i,td1,td2;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("table1");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[1];
    td1 = tr[i].getElementsByTagName("td")[2];
    td2 = tr[i].getElementsByTagName("td")[3];
    if (td||td1||td2) {
      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else  if (td1.innerHTML.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      }else   if (td2.innerHTML.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      }else {
        tr[i].style.display = "none";
      }
    }    
   
    
  }
}
</script>
<script type="text/javascript">
$(document).ready(function() { // if all label selected set all items selected
	
$('#fr_id').change(
		function () {
			 var selected=$('#fr_id').val();
	
        if(selected==-1){
			$.getJSON('${setAllFrIdSelected}', {
			//	selected : selected,
				ajax : 'true'
			}, function(data) {
				var html = '<option value="">Select Franchise</option>';
			
				var len = data.length;
				
				$('#fr_id')
			    .find('option')
			    .remove()
			    .end()
				 $("#fr_id").append($("<option></option>").attr( "value",-1).text("ALL"));

				for ( var i = 0; i < len; i++) {
    
                   $("#fr_id").append(
                           $("<option selected></option>").attr(
                               "value", data[i].frId).text(data[i].frName)
                       );
				}
		
				   $("#fr_id").trigger("chosen:updated");
			});
  }
});
});



</script>
<script type="text/javascript">
$(document).ready(function() { // if all label selected set all items selected
	
$('#menu').change(
		function () {
			 var selected=$('#menu').val();
	
        if(selected==-1){
			$.getJSON('${setAllMenuSelected}', {
			//	selected : selected,
				ajax : 'true'
			}, function(data) {
				var html = '<option value="">Select Menus</option>';
			
				var len = data.length;
				
				$('#menu')
			    .find('option')
			    .remove()
			    .end()
				 $("#menu").append($("<option></option>").attr( "value",-1).text("ALL"));

				for ( var i = 0; i < len; i++) {
    
                   $("#menu").append(
                           $("<option selected></option>").attr(
                               "value", data[i].settingId).text(data[i].menuTitle)
                       );
				}
		
				   $("#menu").trigger("chosen:updated");
			});
  }
});
});



</script>
</body>

</html>