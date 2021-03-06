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
							<i class="fa fa-square frm_icon" aria-hidden="true"></i>
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
						<span id="section_alert" class="span_err">Please select section</span>
							
						</div>
						
						<div class="col-md-6 box_marg">
							<label class="control-label left">Menu</label>
							<div class="controls icon_add">
							<i class="fa fa-bars frm_icon" aria-hidden="true"></i>
							<select data-placeholder="Choose Menu"
								class="form-control padd_left chosen" tabindex="6" id="selectMenu"
								name="selectMenu">
								<%-- <option value="-1"><c:out value=""/></option> --%>
								<%-- <c:forEach items="${unSelectedMenuList}" var="unSelectedMenu"
									varStatus="count">
									<option value="${unSelectedMenu.menuId}"><c:out value="${unSelectedMenu.menuTitle}"/></option>
								</c:forEach> --%>
							</select>
							</div>
																		<span id="menu_alert" class="span_err">Please select menu</span>
							
						</div>
						
						<div class="col-md-10 box_marg">
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
						
						<!-- <div class="col-md-6 box_marg" style="display: none">
							<label class="control-label left">Discount %</label>
							<div class="controls icon_add">
							<i class="fa fa-road frm_icon" aria-hidden="true"></i>
							<input type="text" name="discPer" id="discPer" value="0" class="form-control padd_left"  />
							</div>
						</div> -->
						
						<div class="col-md-2 box_marg">
						<div class=" three_buttons one_row">
						<input type="button"   class="btn btn-primary" value="Get Items" onclick="getItems()" />
															<button type="button" onClick="window.location.reload();" class="btn btn-primary">Cancel</button>
									</div>				
						</div>
						
					</div>
				</div>	
				
				
				<div class="frm_Sec_one single">
					<div class="row">
				<div class="col-md-4 box_marg">
							<label class="control-label left">Items</label>
							<div class="controls icon_add">
							<i class="fa fa-coffee frm_icon" aria-hidden="true"></i>
							<select data-placeholder="Choose Item"
								class="form-control padd_left chosen"  tabindex="6"
								id="items" name="items">
								</select>
							
							
							<input style="display: none" type="text" name="discPer" id="discPer" value="0" class="form-control padd_left"  />
							</div>
							
																			<span id="item_alert" class="span_err">Please select item</span>
							
						</div>
						
						<div class="col-md-4 box_marg">
							<label class="control-label left">Total Qty</label>
							<div class="controls icon_add">
							<i class="fa fa-bullseye frm_icon" aria-hidden="true"></i>
							<input  type="text" name="total_qty" maxlength="6" id="total_qty" value="0" class="form-control padd_left"  />
							</div>
														<span id="duplicate_alert" class="span_err" style="color: green;"></span>
												<span id="qty_alert" class="span_err">Please enter quantity</span>
							
							
						</div>
						
							<div class="col-md-2 box_marg">
					<div class="three_buttons one_row">
						<input type="button" id="searchFr" class="btn btn-primary" value="Add Item" onclick="addItems()">					
						<button type="button" class="btn btn-primary" onClick="window.location.reload();">Cancel</button>
					</div>
				</div>
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

				 	<jsp:include page="/WEB-INF/views/include/tableSearch.jsp"></jsp:include>
	
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
						<div class="col-md-4 box_marg">
							<label class="control-label left">Order From</label>
							<div class="controls icon_add">
							<i class="fa fa-road frm_icon" aria-hidden="true"></i>
							<input class="form-control padd_left date-picker" id="date" size="19" placeholder="dd-MM-yyyy"
							type="text" name="date" value="${date}"  required/>							
							</div>
						</div>
						
						<div class="col-md-4 box_marg">
							<label class="control-label left">To Date</label>
							<div class="controls icon_add">
							<i class="fa fa-road frm_icon" aria-hidden="true"></i>
							<input class="form-control padd_left date-picker" id="deldate" size="19" placeholder="dd-MM-yyyy"
											type="text" name="deldate" value="${date}" required />			
							</div>
						</div>
					
				
				<div class="col-md-2 box_marg">
					<div class="three_buttons one_row">
						<button class="btn btn-primary" onclick="submitOrder()" id="submitOrder" disabled>Submit</button>						
						<button type="button" onClick="window.location.reload();" class="btn btn-primary">Cancel</button>
					</div>
				</div>	
				</div>
				</div>	
				
			
				
			
		</div></form>
		<jsp:include page="/WEB-INF/views/include/copyrightyear.jsp"></jsp:include>
	</div>
	<!-- END Main Content -->

	<a id="btn-scrollup" class="btn btn-circle btn-lg" href="#"><i
		class="fa fa-chevron-up"></i></a>
<script>
jQuery.fn.ForceNumericOnly =
	function()
	{
	    return this.each(function()
	    {
	        $(this).keydown(function(e)
	        {
	            var key = e.charCode || e.keyCode || 0;
	            // allow backspace, tab, delete, enter, arrows, numbers and keypad numbers ONLY
	            // home, end, period, and numpad decimal
	            return (
	                key == 8 || 
	                key == 9 ||
	                key == 13 ||
	                key == 46 ||
	                key == 110 ||
	                key == 190 ||
	                (key >= 35 && key <= 40) ||
	                (key >= 48 && key <= 57) ||
	                (key >= 96 && key <= 105));
	        });
	    });
	};
	$("#total_qty").ForceNumericOnly();

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
	    		  $("#items").trigger("chosen:updated");
	    		  $('#table_grid td').remove();
	    			$('#table_grid th').remove();
	    			$('#menu_alert').hide();
	    	},
	    	});
	    });
	    $('#loader').hide();
	    //$("#items").trigger("chosen:updated");
	  
	});
</script>
<script type="text/javascript">
function addItems1(){
	alert("OOOOO")
	$('#table_grid td').remove();
	$('#table_grid th').remove();
	$('#loader').show(); 
	 var fd=new FormData();
	   //var itm= document.getElementById("items").value;
	    fd.append('items',3);
	     fd.append('total_qty',33)
	      fd.append('item_index',1);
	
	
	
}//end of function
</script>
<script type="text/javascript">
function addItems(){
	//alert("PPP") 	
			$("#item_alert").hide();
			$("#qty_alert").hide();
	 var itm1= document.getElementById("items").value;
    var totQty=document.getElementById("total_qty").value;
	if(itm1=="" || itm1==""){
		$("#item_alert").show();
	}else if(totQty=="" || totQty==null){
		$("#qty_alert").show();
	}else{
		$('#loader').show();
	try{
 		//alert("PPP")
	$('#table_grid td').remove();
	$('#table_grid th').remove();
	var selectedMenu = $("#selectMenu").val();
	//var discPer = $("#discPer").val();
 	var selectedFr = $("#selectFr").val();
	franchasee();
	var frId = [];
    $.each($("#selectFr option:selected"), function(){            
    	frId.push($(this).val());
    });
    //var frId=0;
    $('#loader').show(); 
    var fd=new FormData();
   var itm= document.getElementById("items").value;
	var itemIndex = $("#item_index"+itm).data("index");
 //  alert("Index" +catId)
    fd.append('items',itm);
     fd.append('total_qty',document.getElementById("total_qty").value);
      fd.append('item_index',itemIndex);
   $.ajax({
    	url : '${pageContext.request.contextPath}/getAjaxItemForPush',
    	type : 'post',
    	dataType : 'json',
    	data : fd,
    	contentType : false,
    	processData : false,
    	success : function(data) {
    		document.getElementById("submitOrder").disabled=false;
    			var lastIndex=data.length;
				document.getElementById("duplicate_alert").innerHTML = ""+data[lastIndex-1].message;
				$("#duplicate_alert").show();
				document.getElementById("total_qty").value="1";
			$.each(data,function(key, itemname) {
			
								var index = key + 1;
								var tr = $("<tr></tr>");
							  	tr.append($("<td></td>").html(""+index));
							  	tr.append($("<td style='text-align: left;'></td>").html(itemname.itemName));
					    		tr.append($('<td></td>').html("<input onkeypress='return IsNumeric(event);' ondrop='return false;' style='text-align: right;'  readonly height: 24px;'  onpaste='return false;' type=number   class=form-control   value = "+itemname.totalQty+" tabindex="+key+">"));

							  	tr.append($("<td style='text-align: left;display:none;'></td>").html("<input type='text' name=disc_per"+itemname.itemId+" style='width:45px; text-align: right;' class='form-control' id=disc_per"+itemname.itemId+" value="+discPer+" > "));
								var pushQty=0;
						    	  var  orderQty=0;
							      $.each(frId, function(key, id){  
							    	  var qty=0;
							    	 /*  if(itemname.getOrderDataForPushOrder!=null)
						    	 		 {
						    	  $.each(itemname.getOrderDataForPushOrder, function(key, frData){
						    			if (frData.frId == id && itemname.itemId==frData.itemId){
						    	 				qty=frData.orderQty;
			
						    		}
						    	  });	
						    	 		 } */
						    	 		 
								    		tr.append($('<td></td>').html("<input onkeypress='return IsNumeric(event);' ondrop='return false;' style='text-align: right;'  height: 24px;'  onpaste='return false;' type=number min=0 max=500 class='form-control "+itemname.itemId+"' onkeyup='calculateSum("+itemname.itemId+","+itemname.totalQty+")'  id=itemId"+itemname.itemId+"orderQty"+ id+ " name=itemId"+itemname.itemId+"orderQty"+id+" value = "+qty+" tabindex="+key+">"));

							    	  /* if(qty > 0){
							    		  
						    		tr.append($('<td></td>').html("<input type=number min=0 max=500 class=form-control  readonly='true' style='text-align: right;'  height: 24px;'  id=itemId"+itemname.itemId+"orderQty"+ id+ " name=itemId"+itemname.itemId+"orderQty"+id+" value = "+qty+">"));
							    	  }
							    	  else
							    		{
							    		tr.append($('<td></td>').html("<input onkeypress='return IsNumeric(event);' ondrop='return false;' style='text-align: right;'  height: 24px;'  onpaste='return false;' type=number min=0 max=500 class=form-control   id=itemId"+itemname.itemId+"orderQty"+ id+ " name=itemId"+itemname.itemId+"orderQty"+id+" value = "+qty+" tabindex="+key+">"));
							    		} */
						      });
							$('#table_grid tbody').append(tr);
							 
						})
						$('#loader').hide();
    	}
    	})
	}catch (e) {
		alert(e);
	} 
	}
	//alert("OK")
}
</script>


<script type="text/javascript">
function calculateSum(classname,totQty) {
	var sum = 0;
	//iterate through each textboxes and add the values
	$("."+classname).each(function() {
if(this.value>totQty){
	this.value=0;
	return false;
}
		//add only if the value is number
		if(!isNaN(this.value) && this.value.length!=0) {
			sum += parseFloat(this.value);
		}

	});
	//.toFixed() method will roundoff the final sum to 2 decimal places
	if(sum<=totQty){
		
	}else{
		$("."+classname).each(function() {
			
			if(this.value>0){
				//alert("Qty Exceed");
			this.value=0;
			return false;
			}
		});	
	}
	//alert(sum);
}
</script>


<script type="text/javascript">
function getItems(){
	var isValid = validate();
	if (isValid) {
	try{
	//alert("In getItems")
	$('#table_grid td').remove();
	$('#table_grid th').remove();
	//document.getElementById("searchFr").disabled=true;
	var selectedMenu = $("#selectMenu").val();
	var discPer = $("#discPer").val();
 	var selectedFr = $("#selectFr").val();
	//franchasee();
	var frId = [];
    $.each($("#selectFr option:selected"), function(){            
    	frId.push($(this).val());
    });
    //var frId=0;
    $('#loader').show(); 
    
    $.getJSON('${getItemList}',{
		menu_id : selectedMenu,
		fr_id_list : JSON.stringify(frId),
		ajax : 'true'
	},
	function(data) {
		if (data == "") {
			alert("No records found !!");
		}
		else{ 
			$('#items')
		    .find('option')
		    .remove()
		    .end();
	$("#items").append($("<option></option>").attr( "value","").text("Select Any Item"));
			document.getElementById("submitOrder").disabled=false;
		$.each(data,function(key, itemname) {
			//<option id="menu-cat${menu.menuId}" value="${menu.menuId}" data-catid="${menu.mainCatId}">${menu.menuTitle}</option>

			$("#items").append($("<option id='item_index"+itemname.itemId+"' value='"+itemname.itemId+"' data-index='"+key+"'></option>").attr( "value",itemname.itemId).text(itemname.itemName));
					})
					$("#items").trigger("chosen:updated");
		  $('#loader').hide();
		}
});
	  // $("#items").trigger("chosen:updated");
	}catch (e) {
		alert(e);
	}
	}
}
</script>
	<script type="text/javascript">
		function searchItem() {
			var isValid = validate();
			if (isValid) {/* 
				$('#table_grid td').remove();
				$('#table_grid th').remove();
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
						
						$('#items')
					    .find('option')
					    .remove()
					    .end();
						
				$("#items").append($("<option></option>").attr( "value",0).text("Select Any Item"));
						document.getElementById("submitOrder").disabled=false;
					$.each(data,function(key, itemname) {
						$("#items").append($("<option></option>").attr( "value",itemname.itemId).text(""+itemname.itemName));
								
								})
					}
			});
				   $("#items").trigger("chosen:updated"); */
 
			}
			if(1==2){
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
		}
	</script>

	<script type="text/javascript">
		function validate() {
			$("#menu_alert").hide();
			$("#fr_alert").hide();
			$("#section_alert").hide();
			var selectedMenu = $("#selectMenu").val();
			var selectedFr = $("#selectFr").val();
			var isValid = true;
			var section=$("#section").val();
			 if (section == "" || section == null) {
					isValid = false;
					//alert("Please select Menu");
					$("#section_alert").show();
				}
			else if (selectedMenu == "" || selectedMenu == null) {
				isValid = false;
				//alert("Please select Menu");
				$("#menu_alert").show();
			} else if (selectedFr == "" || selectedFr == null) {
				isValid = false;
				//alert("Please select Franchise");
				$("#fr_alert").show();
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
        tr.insertCell(2).outerHTML = "<th style='text-align: center;'>Total Qty</th>";

        tr.insertCell(3).outerHTML = "<th style='text-align: center; display:none;'>Disc%</th>";
        	
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
		$('#loader').show();
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
$("#selectMenu").append($("<option></option>").attr( "value","").text("Select Any Menu"));
		for ( var i = 0; i < len; i++) {

			$("#selectMenu").append(
                       $("<option></option>").attr(
                           "value", data[i].menuId).text(data[i].menuTitle)
             );
		}

		   $("#selectMenu").trigger("chosen:updated");
		   $('#loader').hide();
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