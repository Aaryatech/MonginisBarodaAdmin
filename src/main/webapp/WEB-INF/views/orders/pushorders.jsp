<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
 <jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
 <jsp:include page="/WEB-INF/views/include/logout.jsp"></jsp:include>
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
.table-responsive tbody > tr:hover{
  background-color: #ffa;
}
</style>
  	<style>
 table{
  width:100%;
 
  border:1px solid #ddd;
}
 </style>
</head>
<body>
	<c:url var="getItemList" value="/getItemList"></c:url>
	<c:url value="/getDumpMenusSectionAjax" var="getDumpMenusSectionAjax"/>
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
	
		<!-- END Page Title -->
	<form id="submitPushOrderForm"
				action="${pageContext.request.contextPath}/submitPushOrder" onsubmit="submitOrder.disabled = true; return confirm('Do you want Submit ?');"
				method="post">

		<!-- BEGIN Main Content -->
		<div class="box">
			<div class="box-title">
				<h3>
					<i class="fa fa-bars"></i>Push Orders For Franchise 
				</h3>

			</div>
			<div><!-- class="box-content" -->
			
				<div class="frm_Sec_one single">
					<div class="row">
						<div class="col-md-6 box_marg">
							<label class="control-label left">Section</label>
							<div class="controls icon_add">
							<i class="fa fa-road frm_icon" aria-hidden="true"></i>
							<select data-placeholder="Choose Section"
								class="form-control padd_left chosen" tabindex="6" id="section"
								name="section" onchange="getMenus(this.value)">		
								<!-- <option value="-1">All</option>		 -->	
								<option value="">Select Section</option>				
								 <c:forEach items="${section}" var="section"
									varStatus="count">
									<option value="${section.sectionId}"><c:out
											value="${section.sectionName}" /></option>
								</c:forEach> 
							</select>
							</div>
						</div>
						
						<div class="col-md-6 box_marg">
							<label class="control-label left">Menu</label>
							<div class="controls icon_add">
							<i class="fa fa-road frm_icon" aria-hidden="true"></i>
							<select data-placeholder="Choose Menu"
								class="form-control padd_left chosen" tabindex="6" id="selectMenu"
								name="selectMenu">
								<%-- <option value="-1"><c:out value=""/></option> --%>
								<c:forEach items="${unSelectedMenuList}" var="unSelectedMenu"
									varStatus="count">
									<option value="${unSelectedMenu.menuId}"><c:out value="${unSelectedMenu.menuTitle}"/></option>
								</c:forEach>
							</select>
							</div>
						</div>
						
						<div class="col-md-6 box_marg">
							<label class="control-label left">Franchise</label>
							<div class="controls icon_add">
							<i class="fa fa-road frm_icon" aria-hidden="true"></i>
							<select data-placeholder="Choose Franchisee"
								class="form-control padd_left chosen " multiple="multiple" tabindex="6"
								id="selectFr" name="selectFr">
								<option value="-1"><c:out value="" /></option>
							</select>
							
							</div>
						</div>
						
						<div class="col-md-6 box_marg" style="display: none">
							<label class="control-label left">Discount %</label>
							<div class="controls icon_add">
							<i class="fa fa-road frm_icon" aria-hidden="true"></i>
							<input type="text" name="discPer" id="discPer" value="0" class="form-control padd_left"  />
							</div>
						</div>
						
					</div>
				</div>	
				
				
				<div class="form-group">
					<div class="three_buttons">
						<input type="button" id="searchFr" class="btn btn-primary" value="Search" onclick="searchItem()" />							
						<button type="button" class="btn btn-primary">Cancel</button>
					</div>
				</div>
				
				<div align="center" id="loader" style="display: none">
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

	
		<div class="box">
		
				<div class=" box-content">
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
    </div>
				
				
				<div class="frm_Sec_one single">
					<div class="row">
						<div class="col-md-6 box_marg">
							<label class="control-label left">From Date</label>
							<div class="controls icon_add">
							<i class="fa fa-road frm_icon" aria-hidden="true"></i>
							<input class="form-control padd_left date-picker" id="date" size="19" placeholder="dd-MM-yyyy"
							type="text" name="date" value="${date}"  required/>							
							</div>
						</div>
						
						<div class="col-md-6 box_marg">
							<label class="control-label left">To Date</label>
							<div class="controls icon_add">
							<i class="fa fa-road frm_icon" aria-hidden="true"></i>
							<input class="form-control padd_left date-picker" id="deldate" size="19" placeholder="dd-MM-yyyy"
											type="text" name="deldate" value="${date}" required />			
							</div>
						</div>
					</div>
				</div>	
				
				<div class="form-group">
					<div class="three_buttons">
						<button class="btn btn-primary" onclick="submitOrder()" id="submitOrder" disabled>Submit</button>						
						<button type="button" class="btn btn-primary">Cancel</button>
					</div>
				</div>	
				
			
				
			
		</div></form>
		<jsp:include page="/WEB-INF/views/include/copyrightyear.jsp"></jsp:include>
	</div>
	<!-- END Main Content -->

	<a id="btn-scrollup" class="btn btn-circle btn-lg" href="#"><i
		class="fa fa-chevron-up"></i></a>

<script type="text/javascript">

	$(function() {
	    $("#selectMenu").change(function() {
	    	  $('#loader').show();
	    	  document.getElementById("searchFr").disabled=false;
	    	var fd = new FormData();
	    	fd.append('menuId', $('option:selected', this).val());
	    	$
	    	.ajax({
	    	url : '${pageContext.request.contextPath}/getAllFrIdNameByMenuIdConfigured',
	    	type : 'post',
	    	dataType : 'json',
	    	data : fd,
	    	contentType : false,
	    	processData : false,
	    	success : function(resData) {
	    		var html = '<option value="-1"></option>';
	    		var len = resData.length;
	    		if(len==0){
	    			 $('#loader').hide();
	    			 alert("No Assigned Franchise found with selected menu");
	    		}
	    		 $('#selectFr')
	    		.find('option')
	    	    .remove()
	    	    .end();
	    		for ( var i = 0; i < len; i++) {
	    			$("#selectFr").append(
	                           $("<option ></option>").attr(
	                               "value", resData[i].frId).text(resData[i].frName)
	                       );
	    		} 
	    		$("#selectFr").trigger("chosen:updated");
	    		  $('#loader').hide();
	    	},
	    	});
	    });
	    $('#loader').hide();
	});
</script>
	<script type="text/javascript">
		function searchItem() {
			
			$('#table_grid td').remove();
			$('#table_grid th').remove();
			var isValid = validate();
			if (isValid) {
				  
				document.getElementById("searchFr").disabled=true;
				var selectedMenu = $("#selectMenu").val();
				var discPer = $("#discPer").val();
				var selectedFr = $("#selectFr").val();
				franchasee();
				
				var frId = [];
		        $.each($("#selectFr option:selected"), function(){            
		        	frId.push($(this).val());
		        });
		      
		        $('#loader').show();
				$.getJSON('${getItemList}',{
									menu_id : selectedMenu,
									fr_id_list : JSON.stringify(frId),
									ajax : 'true'
								},
								function(data) {
									//alert(JSON.stringify(data))
									document.getElementById("searchFr").disabled=false;
									$('#loader').hide();
									if (data == "") {
										alert("No records found !!");
									}
									else{ 
										document.getElementById("submitOrder").disabled=false;
									$.each(data,function(key, itemname) {
														var index = key + 1;
														var tr = $("<tr></tr>");
													  	tr.append($("<td></td>").html(""+index));
													  	tr.append($("<td style='text-align: left; padding-left: 15%;'></td>").html(itemname.itemName));
													  	tr.append($("<td style='text-align: left; padding-left: 5%; display:none;'></td>").html("<input type='text' name=disc_per"+itemname.itemId+" style='width:45px; text-align: right;' class='form-control' id=disc_per"+itemname.itemId+" value="+discPer+" > "));
														var pushQty=0;
												    	  var  orderQty=0;
													      $.each(frId, function(key, id){  
													    	  var qty=0;
													    	  if(itemname.getOrderDataForPushOrder!=null)
												    	 		 {
												    	  $.each(itemname.getOrderDataForPushOrder, function(key, frData){
												    			if (frData.frId == id && itemname.itemId==frData.itemId){
												    	 				qty=frData.orderQty;

												    		}
												    	  });	
												    	 		 }
													    	  if(qty > 0){
												    		//var orderQty = "<td align=center><input type=number min=0 max=500 class=form-control  readonly='true'   id=itemId"+itemname.itemId+"orderQty"+ id+ " name=itemId"+itemname.itemId+"orderQty"+id+" value = "+qty+"></td>"; 
												    		tr.append($('<td></td>').html("<input type=number min=0 max=500 class=form-control  readonly='true' style='text-align: right;'  height: 24px;'  id=itemId"+itemname.itemId+"orderQty"+ id+ " name=itemId"+itemname.itemId+"orderQty"+id+" value = "+qty+">"));
													    	  }
													    	  else
													    		{//var orderQty = "<td align=center><input onkeypress='return IsNumeric(event);' ondrop='return false;' onpaste='return false;' type=number min=0 max=500 class=form-control   id=itemId"+itemname.itemId+"orderQty"+ id+ " name=itemId"+itemname.itemId+"orderQty"+id+" value = "+qty+"></td>"; 
													    		tr.append($('<td></td>').html("<input onkeypress='return IsNumeric(event);' ondrop='return false;' style='text-align: right;'  height: 24px;'  onpaste='return false;' type=number min=0 max=500 class=form-control   id=itemId"+itemname.itemId+"orderQty"+ id+ " name=itemId"+itemname.itemId+"orderQty"+id+" value = "+qty+" tabindex="+key+">"));
													    		}
												      });
													$('#table_grid tbody').append(tr);
												})
									}
							});
			}
		}
	</script>

	<script type="text/javascript">
		function validate() {
			var selectedMenu = $("#selectMenu").val();
			var selectedFr = $("#selectFr").val();
			var isValid = true;
			if($('#selectMenu :selected').text() == ''){
				isValid = false;
				alert("Please select Menu");
			} else if (selectedFr == "" || selectedFr == null) {
				isValid = false;
				alert("Please select Franchise");
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
       // alert("In franchasee")
        tr.insertCell(0).outerHTML = "<th aligh='right'>Sr.</th>";
        tr.insertCell(1).outerHTML = "<th style='text-align: center;'>ItemName</th>";
        tr.insertCell(2).outerHTML = "<th style='text-align: center; display:none;'>Disc%</th>";
        	
        $.each($("#selectFr option:selected"), function(){            
        	frName.push($(this).text());
        	i++;
        });
        i=i-1;
        $.each(frName, function(){  
            tr.insertCell(3).outerHTML = "<th style='text-align: center;'>"+frName[i] +"</th>"
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
	$.getJSON('${getDumpMenusSectionAjax}', {	
		sectionId : sectionId,
		ajax : 'true'
	}, function(data) {
		var len = data.length;
		
		$('#selectMenu')
	    .find('option')
	    .remove()
	    .end();
		/*  $("#selectMenu").append($("<option></option>").attr( "value",-1).text("ALL")); */
$("#selectMenu").append($("<option></option>").attr( "value",0).text("Select Any Menu"));
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
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-fileupload/bootstrap-fileupload.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-duallistbox/duallistbox/bootstrap-duallistbox.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/dropzone/downloads/dropzone.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-timepicker/js/bootstrap-timepicker.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/clockface/js/clockface.js"></script>
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