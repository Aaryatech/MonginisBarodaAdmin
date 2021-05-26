<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	 


	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
	<body>
	
	
	<jsp:include page="/WEB-INF/views/include/logout.jsp"></jsp:include>
	
	<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/loader.css">
	<c:url var="getSelcTedSsubCat"
		value="/getSelcTedSsubCat" />
<c:url value="/getAllsubCat" var="getAllsubCat" ></c:url>
<c:url value="/getAllStockType" var="getAllStockType" ></c:url>
<c:url value="/getItemsForConfig" var="getItemsForConfig" ></c:url>
<c:url  value="/getItemListAfterUpdate" var="getItemListAfterUpdate" ></c:url>
<c:url value="/updateValueAjax" var="updateValueAjax" >
</c:url>
<c:url value="/submitConfig" var="submitConfig" ></c:url>

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
		<!-- Loader Start -->
<div align="center" id="loader" style="display: none;">

							<span>
								<h4>
									<font color="#343690">Loading</font>
								</h4>
							</span> <span class="l-1"></span> <span class="l-2"></span> <span
								class="l-3"></span> <span class="l-4"></span> <span class="l-5"></span>
							<span class="l-6"></span>
						</div>
<!-- Loader End -->
			<!-- BEGIN Page Title -->
			<div class="page-title">
				 <div>
					<!--<h1>
						<i class="fa fa-file-o"></i>Stock Type Configuration 
					</h1>-->
				</div> 
			</div> 
			<!-- END Page Title -->


			<!-- BEGIN Main Content -->
			<div class="row">
				<div class="col-md-12">
					<div class="row">
						<div class="col-md-12">
							<div><!--  class="box" -->



								<div class="row">
									<div class="col-md-12">

										<div class="box">
											<div class="box-title">
												<h3>
													<i class="fa fa-table"></i> Stock Type Configuration
												</h3>
												<div class="box-tool">
													<a data-action="collapse" href="#"><i
														class="fa fa-chevron-up"></i></a>
													<!--<a data-action="close" href="#"><i class="fa fa-times"></i></a>-->
												</div>
											</div>


											<div><!-- class="box-content" -->
												<form
													action="${pageContext.request.contextPath}/getItemsbyCatIdProcess"
													name="validation-from" id="validation-from" method="get">
													
													<div class="frm_Sec_one single">
														<div class="row">
															<div class="col-md-3 box_marg">
																<label class="control-label left">Category</label>
																	<div class="controls icon_add">
																		<i class="fa fa-list-ul frm_icon" aria-hidden="true" ></i>
																		<select data-placeholder="Select Category"
																	class="form-control padd_left chosen" tabindex="6" name="cat_id"
																	required="required" id="cat_id" multiple="multiple">

																	<option value="-1">All</option>
																	<c:forEach items="${catList}" var="catIdName"
																		varStatus="count">
																		<option value="${catIdName.catId}">${catIdName.catName}</option>
																	</c:forEach>
																</select>
															        </div> <span class="span_err" id="err_cat" >Select Category</span>
														</div>
														
														<div class="col-md-3 box_marg">
																<label class="control-label left">Sub-Category</label>
																	<div class="controls icon_add">
																		<i class="fa fa-list-ul frm_icon" aria-hidden="true" ></i>
																		<select data-placeholder="Select Category"
																	class="form-control padd_left chosen" tabindex="6"
																	name="subcat_id" id="subcat_id" multiple="multiple"
																	required="required">
																</select>
															        </div> <span class="span_err" id="err_subcat" >Enter Sub Category Name</span>
														</div>
														
														<div class="col-md-3 box_marg">
																<label class="control-label left">Stock Type</label>
																	<div class="controls icon_add">
																		<i class="fa fa-stack-exchange frm_icon" aria-hidden="true" ></i>
																		<select data-placeholder="Select Category"
																	class="form-control padd_left chosen" tabindex="6"
																	name="stocktype_id" id="stocktype_id"
																	multiple="multiple" required="required">

																	<option value="-1">All</option>
																	<c:forEach items="${StockTypeList}" var="StockType"
																		varStatus="count">
																		<option value="${StockType.id}">${StockType.stockTypeName}</option>
																	</c:forEach>
																</select>
															        </div>
														</div>
														
														<div class="col-md-3 box_marg">
																<label class="control-label left">Field</label>
																	<div class="controls icon_add">
																		<i class="fa fa-bars frm_icon" aria-hidden="true" ></i>
																<select data-placeholder="Select Category"
																	class="form-control padd_left chosen" tabindex="6"
																	name="field_id" id="field_id">
																	<option value="1">Min Qty</option>
																	<option value="2">Max Qty</option>
																	<option value="3">Reorder Qty</option>
																</select>
															        </div>
														</div>
														
														</div>
													</div>

											
											<div class="form-group">
								<div class="row three_buttons" style="padding:10px 15px;">
										<input type="button" readonly="readonly" onclick="FindItems()" class="btn btn-primary" value="Submit" id="sub_btn">
										<button type="button" class="btn btn-primary">Cancel</button>
									
						</div>
								</div> 



											


												</form>

												<form action="updateStockType"
													name="validation-from2" id="validation-from" method="post">

													<jsp:include page="/WEB-INF/views/include/tableSearch.jsp"></jsp:include>

													<c:set var="settingValue" value="${settingValue}" />


													<div ><!-- class="box-content" -->


														
														
														<div class="tableFixHead">
	<table id="table1">         
	<thead style="background-color: #f3b5db;">
		
	</thead>
	
	<tbody>
																		<c:forEach items="${itemList}" var="item"
																			varStatus="count">

																			<c:set var="id" value="${item.itemId}" />


																			<tr>

																				<td align="left">${count.index+1}</td>

																				<td align="left"><c:out
																						value="${item.itemName}" /> <input type="hidden"
																					name="cat_name" value="${cId}"></td>


																				<c:forEach items="${item.stockDetails}"
																					var="stDetails" varStatus="count">
																					<td align="left"><input type="hidden"
																						name="${item.itemId}stockId${count.index}"
																						value="${stDetails.frStockId}">
																						<div align="center"
																							class="col-sm-9 col-lg-10 controls">
																							Min <input align="left" type="text"
																								name="${item.itemId}min${count.index}"
																								id="${item.itemId}min${count.index}"
																								placeholder="Min" class="form-control"
																								data-rule-required="true" style="width: 65px"
																								value="${stDetails.minQty}" />
																						</div>

																						<div align="center"
																							class="col-sm-9 col-lg-10 controls">
																							Max <input type="text"
																								name="${item.itemId}max${count.index}"
																								id="${item.itemId}max${count.index}"
																								placeholder="Max" class="form-control"
																								data-rule-required="true" style="width: 65px"
																								value="${stDetails.maxQty}" />
																						</div>

																						<div align="center"
																							class="col-sm-9 col-lg-10 controls">
																							Reorder <input type="text"
																								name="${item.itemId}reorder${count.index}"
																								id="${item.itemId}reorder${count.index}"
																								placeholder="reorder" class="form-control"
																								data-rule-required="true" style="width: 65px"
																								value="${stDetails.reorderQty}"
																								onblur="enableSubmit(${item.itemId},${count.index});" />
																						</div></td>


																				</c:forEach>
																				<td></td>

																			</tr>

																		</c:forEach>

																	</tbody>
	</table>
</div>
														
														
														
														

														

													</div>
													
													<div class="form-group">
								<div class="row three_buttons" style="padding:10px 15px;">
									

												<input type="button" class="btn btn-primary"
																value="Update" id="updateBtn" onclick="updateConfiguration()"  />
											

										<button type="button" class="btn btn-primary">Cancel</button>
									
						</div>
								</div> 





													<div class="form-group">
														<div
															class="col-sm-25 col-sm-offset-3 col-lg-30 col-lg-offset-5">
															
														</div>
													</div>

												</form>

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


	<!-- <script type="text/javascript">
		$(document).ready(function() {
			$('#callSubmit').submit(function() {
				
				
				var cat_id=$("#cat_name");
				$.ajax({

					type : "get",
					url : "frItemStockConfigurationProcess", 
				

				});
			});

		});
	</script> -->
	<script type="text/javascript">
	function UpdateStockTypeConfig() {
	alert("On Click")	
	}
	
	</script>
	
	<script type="text/javascript">
	$(document).ready(function() { 
		$('#stocktype_id').change(function() {
			//alert($('#stocktype_id').val());
			var catIds=$('#stocktype_id').val();
			if(catIds==-1){
				//alert($('#cat_id').val());
				 $.post('${getAllStockType}', {
					 ajax : 'true'
				   }, function(data) {
						
						//alert(JSON.stringify(data))
						var html = '<option value="">Select Stock Type</option>';
						
						var len = data.length;
						
						$('#stocktype_id')
					    .find('option')
					    .remove()
					    .end()
						 $("#stocktype_id").append($("<option></option>").attr( "value",-1).text("ALL"));

						for ( var i = 0; i < len; i++) {
		    
		                   $("#stocktype_id").append(
		                           $("<option selected></option>").attr(
		                               "value", data[i].id).text(data[i].stockTypeName)
		                       );
						}
				
						   $("#stocktype_id").trigger("chosen:updated");
						
						
					});
			}
			
			
			
		});
		
	});
	
	</script>
	
	<script type="text/javascript">
	function updateConfiguration() {
	//alert("Hiii");	
	 $('#loader').show();
	 $.post('${submitConfig}', {
		 ajax : 'true' 
	   }, function(data) {
		   /* if(data==1){
			  alert("success");
		   } */
		  
		   window.location.reload();
		   
	   });
	
	
	}
	
	</script>
	
	
	<script type="text/javascript">
	$(document).ready(function() { 
		$('#cat_id').change(function() {
			//alert($('#cat_id').val());
			var catIds=$('#cat_id').val();
			if(catIds==-1){
				//alert($('#cat_id').val());
				 $.post('${getAllsubCat}', {
					 ajax : 'true' 
				   }, function(data) {
						
						//alert(JSON.stringify(data))
						var html = '<option value="">Select Sub-Category</option>';
						
						var len = data.length;
						
						$('#subcat_id')
					    .find('option')
					    .remove()
					    .end()
						 $("#subcat_id").append($("<option></option>").attr( "value",-1).text("ALL"));

						for ( var i = 0; i < len; i++) {
		    
		                   $("#subcat_id").append(
		                           $("<option selected></option>").attr(
		                               "value", data[i].subCatId).text(data[i].subCatName)
		                       );
						}
				
						   $("#subcat_id").trigger("chosen:updated");
						
						
					});
			}else{
				 $.post('${getSelcTedSsubCat}', {
					 catIds :JSON.stringify(catIds),
					 ajax : 'true'
				   }, function(data) {
						
					//	alert(JSON.stringify(data))
						var html = '<option value="">Select Sub-Category</option>';
						
						var len = data.length;
						
						$('#subcat_id')
					    .find('option')
					    .remove()
					    .end()
						 $("#subcat_id").append($("<option></option>").attr( "value",-1).text("ALL"));

						for ( var i = 0; i < len; i++) {
		    
		                   $("#subcat_id").append(
		                           $("<option selected></option>").attr(
		                               "value", data[i].subCatId).text(data[i].subCatName)
		                       );
						}
				
						   $("#subcat_id").trigger("chosen:updated");
						
						
					});
			}
			
			
			
			
		});
		
	});
	
	</script>

	<script>
	
		function validateReOrder(itemId,index){
			//$('#callSubmit').style.display="block";
			// document.getElementById("callSubmit").style.display="none";
			var isSubmit=true;
			
		var reOrderQty=document.getElementById(itemId+'reorder'+index).value;
		var min=document.getElementById(itemId+'min'+index).value;
		
		var max=document.getElementById(itemId+'max'+index).value;
		
		//alert("min= "+min);
		//alert("max= "+max);
		//alert("reorder "+reOrderQty);

		if(parseInt(max)<=parseInt(min)){
			alert("Enter maximum Qty greater than minimum Qty");
		isSubmit=false;
		 //document.getElementById("callSubmit").style.display="none";

		}
		else if(parseInt(reOrderQty)>=parseInt(max)){
			alert("Enter reorder Qty between minimum and maximum Qty");
			isSubmit=false;
		 //document.getElementById("callSubmit").style.display="none";

			}else if(parseInt(reOrderQty) <= parseInt(min)){
				alert("Enter reorder Qty between minimum and maximum Qty");
				isSubmit=false;
			}
		
		return isSubmit;
		
	}
		function enableSubmit(itemId,index){
			 document.getElementById("callSubmit").style.display="none";

			var flag=validateReOrder(itemId,index);
			if(flag==true){
			 document.getElementById("callSubmit").style.display="block";

			}else{
				// document.getElementById("callSubmit").style.display="none";

				document.getElementById(itemId+'reorder'+index).value=0;
				document.getElementById(itemId+'min'+index).value=0;
				document.getElementById(itemId+'max'+index).value=0;
				 document.getElementById("callSubmit").style.display="block";
				
			}
		}
	
	</script>
	<script type="text/javascript">
	function FindItems() {
		//alert("Hiii")
		//var catId=$('#cat_id').val();
		var sCatId=$('#subcat_id').val();
		var sType=$('#stocktype_id').val();
		var field=$('#field_id').val();
		//alert(field)
		var e = document.getElementById("field_id");
		var selFiled = e.options[e.selectedIndex].text;
		
		
		$('#table1 th').remove();
		$('#table1 td').remove();
		
		
		
		$.post('${getItemsForConfig}', {
			sType :JSON.stringify(sType),
			 sCatId:JSON.stringify(sCatId),
			 field:field,
			 ajax : 'true'
		   }, function(data) {
			 // alert(JSON.stringify(data)) 
			  
			 
			  var tr = $('<tr class="bgpink" ></tr>');
			  tr.append($('<th style="width:60px; text-align:center" ></th>').html("#"));
			  tr.append($('<th style="text-align:left"></th>').html("Item Name"));
			  $.each(data.stockTypelist, function(key, report) {
					//alert(report)
					var index = key + 1;
					tr.append($('<th style="text-align:left"></th>').html(report.stockTypeName));
				$('#table1 thead').append(tr);

				});
			  
			  
			  $.each(data.itemlist, function(key, report) {
					//alert(report)
					var tr = $('<tr  id="tr'+report.id+'" name="tr'+report.id+'"  ></tr>');
					var index = key + 1;
					tr.append($('<td style="text-align:center"></td>').html('<input type=checkbox name="selc'+report.id+'" id="select_to_agree'+report.id+'"  class="chk" value='+report.id+'>'));
					tr.append($('<td  style="text-align:left"></td>').html(report.itemName));
					for(var i=0 ; i<data.stockTypelist.length;i++){
						var a=0;	
					 for(var j=0 ;j<data.itemStockList.length;j++){
					
					 
						if(report.id==data.itemStockList[j].itemId &&  data.stockTypelist[i].id== data.itemStockList[j].type && field==1){
							//alert("found")
						 	a=data.itemStockList[j].minQty;
							break;
							}else if(report.id==data.itemStockList[j].itemId &&  data.stockTypelist[i].id== data.itemStockList[j].type && field==2){
								a=data.itemStockList[j].maxQty;
								break;
							}else if(report.id==data.itemStockList[j].itemId &&  data.stockTypelist[i].id== data.itemStockList[j].type && field==3){
								a=data.itemStockList[j].reorderQty;
								break;
							}
						} 
				
						
						
						
						tr.append($('<td style="text-align:left; width:180px;"></td>').html('<span class="field_txt">'+selFiled+'</span> <input type="text" style="width:60px" placeholder="'+selFiled+'" value="'+a+'"   id="type'+report.id+data.stockTypelist[i].id+'"  name="type'+report.id+data.stockTypelist[i].id+'"   class="form-control" onchange="inputMrp('+report.id+','+data.stockTypelist[i].id+','+field+',this.value)"    ">'));
						//tr.append($('<td   width="200" align="left" ></td>').html('1'));
						$('#table1 tbody').append(tr);
					}
						
					
					
					
					
					
				

				});
			  
			  
			  
			  
			   
		   }); 
		
	}
	</script>
	
	<script type="text/javascript">
function inputMrp(itemId,typeId,field,val1) {
	/* var select='select_to_agree'+val;
	var tr='tr'+val;
	document.getElementById(select).checked = true;
	document.getElementById(tr).style.backgroundColor='#05ADF0'; */
	//alert("Item-->"+itemId);
	//alert("Type-->"+typeId);
	//alert(field)
	//alert(val1)

	$.post('${updateValueAjax}', {
		itemId :itemId,
		typeId:typeId,
		field:field,
		val1:val1,
		 ajax : 'true'
	   }, function(data) {
		   
		   AppendItemsList();  
		   
	   });
	
	
}

function AppendItemsList(){
	//alert("in AppendItemsList()");
	var sCatId=$('#subcat_id').val();
		var sType=$('#stocktype_id').val();
		var field=$('#field_id').val();
		//alert(field)
		var e = document.getElementById("field_id");
		var selFiled = e.options[e.selectedIndex].text;
		
		
		$('#table1 th').remove();
		$('#table1 td').remove();
	
	$.post('${getItemListAfterUpdate}', {
		sType :JSON.stringify(sType),
		 sCatId:JSON.stringify(sCatId),
		 field:field,
		 ajax : 'true'
	   }, function(data) {
		 // alert(JSON.stringify(data)) 
		  
		 
		  var tr = $('<tr class="bgpink" ></tr>');
		  tr.append($('<th  width="17" style="width: 18px" ></th>').html("#"));
		  tr.append($('<th   width="200" align="left" ></th>').html("Item Name"));
		  $.each(data.stockTypelist, function(key, report) {
				//alert(report)
				var index = key + 1;
				tr.append($('<th   width="200" align="left" ></th>').html(report.stockTypeName));
			$('#table1 thead').append(tr);

			});
		  
		  
		  $.each(data.itemlist, function(key, report) {
				//alert(report)
				var tr = $('<tr  id="tr'+report.id+'" name="tr'+report.id+'"  ></tr>');
				var index = key + 1;
				tr.append($('<td  width="17" style="width: 18px" ></td>').html('<input type=checkbox name="selc'+report.id+'" id="select_to_agree'+report.id+'"  class="chk" value='+report.id+'>'));
				tr.append($('<td   width="200" align="left" ></td>').html(report.itemName));
				for(var i=0 ; i<data.stockTypelist.length;i++){
					var a=0;	
				 for(var j=0 ;j<data.itemStockList.length;j++){
				
				 
					if(report.id==data.itemStockList[j].itemId &&  data.stockTypelist[i].id== data.itemStockList[j].type && field==1){
						//alert("found")
					 	a=data.itemStockList[j].minQty;
						break;
						}else if(report.id==data.itemStockList[j].itemId &&  data.stockTypelist[i].id== data.itemStockList[j].type && field==2){
							a=data.itemStockList[j].maxQty;
							break;
						}else if(report.id==data.itemStockList[j].itemId &&  data.stockTypelist[i].id== data.itemStockList[j].type && field==3){
							a=data.itemStockList[j].reorderQty;
							break;
						}
					} 
			
					
					
					
					tr.append($('<td width="30" align="left" ></td>').html('<span class="field_txt">'+selFiled+'</span> <input type="text" style="width:60px" placeholder="'+selFiled+'" value="'+a+'"   id="type'+report.id+data.stockTypelist[i].id+'"  name="type'+report.id+data.stockTypelist[i].id+'"   class="form-control" onchange="inputMrp('+report.id+','+data.stockTypelist[i].id+','+field+',this.value)"    ">'));
					//tr.append($('<td   width="200" align="left" ></td>').html('1'));
					$('#table1 tbody').append(tr);
				}
					
				
				
				
				
				
			

			});
		  
		  
		  
		  
		   
	   }); 
	
	
	
	

	
}


$("#sub_btn")
.on(
		"click",
		function() {
			
			var isError = false;
			var errMsg = "";

			if (!$("#cat_id").val()) {
				isError = true;
				$("#err_cat").show();
			} else {
				$("#err_cat").hide();
			}
			
			if (!$("#subcat_id").val()) {
				isError = true;
				$("#err_subcat").show();
			} else {
				$("#err_subcat").hide();
			}
			
	
			return false;
		});

</script>


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
</body>
</html>
