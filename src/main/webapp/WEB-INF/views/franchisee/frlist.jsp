<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:url var="callConfigMenuList" value="/callConfigMenuList" />

<c:url value="/updateFranchiseeConf/{settingId}" var="updateFranchiseeConf"></c:url>
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


		<!-- BEGIN Content -->
		<div id="main-content">
			<!-- BEGIN Page Title -->
		 	<div class="page-title">
				<div>
					<!--<h1>
						<i class="fa fa-file-o"></i>Franchisee Configuration
					</h1>-->
				</div>
			</div> 
			<!-- END Page Title -->


			<c:set var="isEdit" value="0">
			</c:set>

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
			</c:forEach>



			<!-- BEGIN Main Content -->
			<div class="row">
				<div class="col-md-12">
					<div class="row">
						<div class="col-md-12">
							<div ><!-- class="box" -->


								<div class="row">
									<div class="col-md-12">

										<div class="box"><!--  -->
											<div class="box-title">
												<h3>
													<i class="fa fa-table"></i> Configured Menu List 
												</h3>
												<div class="box-tool">
													<a data-action="collapse" href="#"><i
														class="fa fa-chevron-up"></i></a>
													<!--<a data-action="close" href="#"><i class="fa fa-times"></i></a>-->
												</div>																								
											</div>											
											
                                          <div class="box-content">
											
                                  
											<div class="col-md-6 box_marg">
											<label class="control-label left">Category</label>
												<div class="controls icon_add">
													<i class="fa fa-list-ul frm_icon" aria-hidden="true"></i>	
													<select data-placeholder="Select Category" multiple="multiple"
											class="form-control padd_left chosen" name="cat_id" tabindex="-1"
											id="cat_id" data-rule-required="true">
											

											<c:forEach items="${catList}" var="catList">
												<c:choose>
													<c:when test="${catList.catId==subCategory.catId}">
														<option value="${catList.catId}" selected><c:out
																value="${catList.catName}"></c:out></option>
													</c:when>
													<c:otherwise>
														<option value="${catList.catId}"><c:out
																value="${catList.catName}"></c:out></option>
													</c:otherwise>
												</c:choose>
											</c:forEach>

										</select>									
												</div>
												
									
										</div>
										
										
													<div class="three_buttons one_row">	
										<input class="btn btn-primary" type="button" value="Search"
											id="callSubmit" onclick="callSearch()">
										</div>

                                  
									
									
						
												<div class="clearfix"></div>
												
													
	<jsp:include page="/WEB-INF/views/include/tableSearch.jsp"></jsp:include>
	
												
												<div class="tableFixHead">
      <table id="table1">
        <thead>
          <thead style="background-color: #f3b5db;">
				<tr class="bgpink">
					<th style="text-align: center; width: 70px;" id="sr">#</th>
					<th style="text-align: center; width: 100px;" id="fr">Sequence </th>
					<th style="text-align: left;" id="menu">Menu Title</th>
					<th style="text-align: right;" id="cat">Category Name</th>
					<th style="text-align: right;" id="time">Time</th>
					<th style="text-align: right;" id="type">Type</th>
					<th style="text-align: right; width: 100px;">Action</th>
				</tr>
			</thead>
        <tbody>
																<c:forEach items="${configureFrList}"
																	var="configureFrList" varStatus="count">


																	<tr>
																		<td style="text-align: center;"><c:out value="${count.index+1}"></c:out></td>
																		<td style="text-align: center;"><c:out
																				value="${configureFrList.frId}"></c:out> <!-- <img src="http://monginisaurangabad.com/admin/uploads/cakes/0L6KEg55AhP18.jpg" alt="" width="150" height="100" /> -->
																		</td>
																		<td style="text-align: left;"><c:out
																				value="${configureFrList.menuTitle}  "></c:out>${configureFrList.menuId}</td>
																		<td style="text-align: right;"><c:out
																				value="${configureFrList.catName}  "></c:out></td>
																		<%-- 	<td align="left"><c:out
																			value="${configureFrList.itemShow}"></c:out></td>
 --%>

																		<td style="text-align: right;"><c:out
																				value="${configureFrList.fromTime} To ${configureFrList.toTime}"></c:out></td>

																		<c:choose>
																			<c:when test="${configureFrList.settingType==1}">
																				<td style="text-align: right;"><c:out value="Daily"></c:out></td>
																			</c:when>
																			<c:when test="${configureFrList.settingType==2}">
																				<td style="text-align: right;"><c:out value="Date"></c:out></td>
																			</c:when>
																			<c:when test="${configureFrList.settingType==3}">
																				<td style="text-align: right;"><c:out value="Day"></c:out></td>
																			</c:when>
																		</c:choose>
 
																		<c:choose>
																			<c:when test="${isEdit==1}">

																				<td style="text-align: right;"><a
																					href="updateFranchiseeConf/${configureFrList.settingId}"><i class="fa fa-pencil" aria-hidden="true"></i></a>&nbsp;


																				
																			</c:when>
																			<c:otherwise>
																				<td style="text-align: right;"><a
																					href="updateFranchiseeConf/${configureFrList.settingId}" class="disableClick"><span
																						class="fa fa-pencil"></span></a>&nbsp;

																			</c:otherwise>
																		</c:choose>
																		<%-- <td align="left"><a
																			href="updateFranchiseeConf/${configureFrList.settingId}"><span
																				class="glyphicon glyphicon-edit"></span></a>&nbsp;&nbsp;&nbsp;&nbsp;
 --%>
																		<%-- <a
																		href="deleteSpecialCake/${configureFrList.settingId}"
																		onClick="return confirm('Are you sure want to delete this record');"><span
																			class="glyphicon glyphicon-remove"></span></a></td> --%>
																	</tr>

																</c:forEach>


															</tbody>
      </table>
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
//'.tbl-content' consumed little space for vertical scrollbar, scrollbar width depend on browser/os/platfrom. Here calculate the scollbar width .
$(window).on("load resize ", function() {
  var scrollWidth = $('.tbl-content').width() - $('.tbl-content table').width();
  $('.tbl-header').css({'padding-right':scrollWidth});
}).resize();
</script>
<script>

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


function callSearch() {

		var catIds = $("#cat_id").val();
		alert("hi sh"+catIds);
// 		$('#loader').show();

		$
				.getJSON(
						'${callConfigMenuList}',
						{
// 							catIds : catIds,
							catIds : JSON.stringify(catIds),					
							ajax : 'true',
						},
						function(data) {alert("datta"+data);
							//alert(JSON.stringify(data))
							$('#table1 td').remove();
// 							$('#loader').hide();
							if (data == "") {
								alert("No Orders Found");
								document.getElementById("expExcel").disabled = true;
								document.getElementById("addtoprod").disabled = true;

							}
							$
									.each(
											data,
											function(key, configureFrList) {
											
												var tr = $('<tr></tr>');
											//	tr.append($('<td></td>').html("shubham"));
											
	                                                      tr
															.append($(
																	'<td></td>')
																	.html(
																			key + 1));
	                                                      
	                                                      

	       												  tr
	       													.append($(
	       															'<td></td>')
	       															.html(
	       																	configureFrList.frId));
	       												  
	       												  tr
	       												    .append($(
	       														    '<td></td>')
	       														    .html(
	       																    configureFrList.menuTitle));
	       												  
	       												  tr
	       												    .append($(
	       														   '<td></td>')
	       														   .html(
	       																configureFrList.catName));
	                                                      
	       												tr
	       												.append($(
	       														'<td></td>')
	       														.html(
	       																configureFrList.fromTime +"To" +configureFrList.toTime ));
	       										
	       												
	       												
	       												if(configureFrList.settingType==1)
	       													{
	       												  tr
	       												    .append($(
	       														   '<td></td>')
	       														   .html("Daily"
	       																));
	       													}
	       												
	       												else if(configureFrList.settingType==2)
       													{
       												  tr
       												    .append($(
       														   '<td></td>')
       														   .html("Date"
       																));
       													}
	       												
	       												else
	       													{
	       												  tr
	       												    .append($(
	       														   '<td></td>')
	       														   .html("Day"
	       																));
	       													}

	       											
// 	       											  tr
//      												    .append($(
//      														   '<td></td>')
//      														   .html(
//      																));


tr
.append($(
'<td style="text-align:right;"></td>')
.html(
" <a href='javascript:void(0)' class='action_btn'onclick=updateFranchiseeConf("+configureFrList.settingId+ ")><abbr title='Edit'><i class='fa fa-pencil'></i></abbr></a>"));

	       												 
												$('#table1 tbody').append(tr);
// 										 		document.getElementById("expExcel").disabled = false;
// 												document.getElementById("addtoprod").disabled = false;
// 												document.getElementById('range').style.display='block'; 
// 												var len = data.length
// 												//alert(JSON.stringify(spCakeOrder))
// 												var tr = $('<tr></tr>');
												//alert("datta"+configureFrList.menuTitle);
												

// 												tr
// 												.append($(
// 														'<td>Hi shubham</td>')
// 														);
									
												
// 												tr
// 													.append($(
// 															'<td></td>')
// 															.html(
// 																	 1));
												
											
												
								

									
						
// 												tr
// 												.append($(
// 														'<td></td>')
// 														.html(
// 																configureFrList.menuTitle));
												

												

												
// 												tr
// 												.append($(
// 														'<td></td>')
// 														.html(
// 																configureFrList.frId));
// 												tr
// 												.append($(
// 														'<td style="text-align: center;"></td>')
// 														.html(
// 																configureFrList.frId));

// 												$('#table1 tbody')
// 														.append(tr);\
											//	alert("menuTitle ssdsdds"+configureFrList.menuTitle);
												
											})

						});

	}
</script>
</body>

</html>