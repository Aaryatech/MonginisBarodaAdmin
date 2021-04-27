<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	 

	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
	 <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/tableSearch.css">
	<body>
	
	<jsp:include page="/WEB-INF/views/include/logout.jsp"></jsp:include>


	<c:url var="getRmSubCategory" value="/getRmSubCategory" />

	<c:url var="insertSfItemDetail" value="/insertSfItemDetail" />
	<c:url var="getRmCategory" value="/getRmCategory" />

	<c:url var="getItemDetail" value="/getItemDetail" />
	<c:url var="getSingleItem" value="/getSingleItem" />

	<c:url var="getRawMaterial" value="/getRawMaterial" />

	<c:url var="itemForEdit" value="/itemForEdit" />
	<c:url var="getRmListByCatId" value="/getRmListByCatId" />


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
					<!-- <h1>
						<i class="fa fa-file-o"></i>Semi Finished Item 
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
								<i class="fa fa-bars"></i>Add Item Details:- <b> SF
									Name-${sfName}</b>
							</h3>
							<div class="box-tool">
								<a href="${pageContext.request.contextPath}/showItemSf">Back to List</a> <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a>
							</div>

						</div>
						<div ><!-- class="box-content" -->
							<form
								action="${pageContext.request.contextPath}/insertSfItemDetail"
								method="post" class="form-horizontal" id="validation-form"
								method="post">
								
								<div class="frm_Sec_one single">
								   <div class="row">
								   		<div class="col-md-3 box_marg">
											<label class="control-label left">SF Type</label>
											<div class="controls icon_add">
											<i class="fa fa-user frm_icon" aria-hidden="true"></i>
											<input type="text" name="sf_item_type_name"
											readonly="readonly" value="${sfTypeName}" id="sf_item_name"
											class="form-control padd_left" placeholder="SF Name"
											data-rule-required="true" />
											</div>
										</div>
										
										<div class="col-md-3 box_marg" style="display: none">
											<label class="control-label left" id="itemNameLabel">Material Name</label>
											<div class="controls icon_add"  id="item_name_div">
											<i class="fa fa-user frm_icon" aria-hidden="true"></i>
											<input type="text" name="item_name" style="display: none"
											readonly="readonly" value="" id="item_name"
											class="form-control padd_left" />
											</div>
										</div>
										
										<div class="col-md-3 box_marg">
											<label class="control-label left">Material Type</label>
											<div class="controls icon_add">
											<i class="fa fa-list-ul frm_icon" aria-hidden="true"></i>
											<select name="material_type" id="material_type"
											class="form-control padd_left" placeholder="Material Type"
											data-rule-required="true">
											<option value="0">Select Material Type</option>
											<option value="1">RM</option>
											<option value="2">SF</option>
										</select>
											</div>
										</div>
										
										<div class="col-md-3 box_marg">
											<label class="control-label left">Rm Group</label>
											<div class="controls icon_add">
											<i class="fa fa-leaf frm_icon" aria-hidden="true"></i>
											<select name="rm_group" id="rm_group" class="form-control padd_left" tabindex="6">
										<option value="0" disabled="disabled" selected="selected">Select RM Group</option>
											 <c:forEach items="${rmItemGroupList}" var="rmItemGroupList"
						            	varStatus="count">
						            	<c:choose>
						            	<c:when test="${rmItemGroupList.grpId!=2 && rmItemGroupList.grpId!=3}">
						            								   <option value="${rmItemGroupList.grpId}"><c:out value="${rmItemGroupList.grpName}"/></option>
						            	
						            	</c:when>
						            	</c:choose>
												</c:forEach>
										</select>
											</div>
										</div>
										
										<div class="col-md-3 box_marg">
											<label class="control-label left">RM Category</label>
											<div class="controls icon_add">
											<i class="fa fa-list-ul frm_icon" aria-hidden="true"></i>
											<select name="rm_cat" id="rm_cat" class="form-control padd_left" tabindex="6">
										<option value="0"disabled="disabled" selected="selected">Select RM Category</option>
											 
										</select>
											</div>
										</div>
										
										<div class="col-md-3 box_marg">
											<label class="control-label left">Material Name</label>
											<div class="controls icon_add">
											<i class="fa fa-user frm_icon" aria-hidden="true"></i>
											<select class="form-control padd_left chosen"tabindex="6"   name="rm_material_name"  id="rm_material_name"
											 placeholder="Material Name"
											data-rule-required="true">
											<option value="0">Select Material</option>
										</select>
											</div>
										</div>
										
										<div class="col-md-3 box_marg">
											<label class="control-label left">Weight</label>
											<div class="controls icon_add">
											<i class="fa fa-leaf frm_icon" aria-hidden="true"></i>
											<input type="text" name="sf_item_weight" id="sf_item_weight"
											class="form-control padd_left" placeholder="SF Weight " />
											</div>
										</div>
										
										<div class="col-md-3 box_marg">
											<label class="control-label left">Qty</label>
											<div class="controls icon_add">
											<i class="fa fa-list-ul frm_icon" aria-hidden="true"></i>
											<input type="text" name="qty" id="qty" class="form-control padd_left"
											placeholder="Qty" />
											</div>
										</div>
										
										<div class="col-md-3 box_marg">
											<label class="control-label left">Sq.No</label>
											<div class="controls icon_add">
											<i class="fa fa-list-ul frm_icon" aria-hidden="true"></i>
											<input type="text" name="seq_no" id="seq_no" class="form-control padd_left"
											placeholder="Sequence No." />
											</div>
										</div>
										
								   </div>
								</div>  
								
								<div class="form-group">
					<div class="three_buttons">
						<input type="button" class="btn btn-primary" value="Submit" onclick="submitItem();">
						<input type="button" class="btn btn-primary" value="Cancel" onclick="clearData();">
					</div>					
				</div> 


								<div class="row">
								<div align="center" id="loader" style="display: none">

									<span>
										<h4>
											<font color="#343690">Loading</font>
										</h4>
									</span> <span class="l-1"></span> <span class="l-2"></span> <span
										class="l-3"></span> <span class="l-4"></span> <span
										class="l-5"></span> <span class="l-6"></span>
								</div>
						</div>
<div class="col-md-9" ></div> 
					<label for="search" class="col-md-3" id="search">
    <i class="fa fa-search" ></i>
									<input type="text"  id="myInput" onkeyup="myFunction()" placeholder="Search.." title="Type in a name">
										</label> 
										
										 
						<div class="clearfix"></div>
					
					<div class="box-content">
						<div class="tableFixHead">
	<table id="table1">        
	<thead style="background-color: #f3b5db;">
		<tr class="bgpink">
			<th style="text-align: center; width:70px;">Sr No</th>
			<th style="text-align: left;">Material Name</th>
			<th style="text-align: left;">Material Type</th>
			<th style="text-align: right;">Qty</th>
			<th style="text-align: right;">Weight</th>
			<th style="text-align: right;">UOM</th>
			<th style="text-align: right;">Action</th>
		</tr>
	</thead>

	<tbody>

									<c:forEach items="${sfDetailList}" var="sfDetailList"
													varStatus="count">

													<c:choose>

														<c:when test="${sfDetailList.delStatus == '0'}">
														
								                       
															<tr>

																<td style="text-align:center;"><c:out value="${count.index+1}" /></td>

																<td style="text-align:left;"><c:out
																		value="${sfDetailList.rmName}" /></td>

																<c:choose>
																	<c:when test="${sfDetailList.rmType == 1}">
																		<td style="text-align:left;"><c:out value="RM" /></td>
																		<c:set var="rm" value="${rm+sfDetailList.rmWeight}" />
																		 <c:set var="total" value="${total+sfDetailList.rmWeight}" />
																	</c:when>

																	<c:when test="${sfDetailList.rmType == 2}">
																		<td style="text-align:right;"><c:out value="SF" /></td>
																		<c:set var="sf" value="${sf+sfDetailList.rmWeight}" />
																		 <c:set var="total" value="${total+sfDetailList.rmWeight}" />
																	</c:when>
																</c:choose>
																<td style="text-align:right;"><c:out
																		value="${sfDetailList.rmQty}" /></td>

																<td style="text-align:right;"><c:out
																		value="${sfDetailList.rmWeight}" /></td>
																<td style="text-align:right;"><c:forEach items="${rmUomList}"
																		var="rmUomList" varStatus="cnt">																<c:choose>
																			<c:when
																				test="${sfDetailList.rmUnit==rmUomList.uomId}">
											                         	${rmUomList.uom}
											                           </c:when>
																		</c:choose>
																	</c:forEach></td>
																<td style="text-align:right;"><centera href='#' class='action_btn'
																	onclick="deleteSfDetail(${count.index})">
																	<i class="fa fa-times" aria-hidden="true"></i></a> &nbsp;
																	<a href='#' class='action_btn' onclick="editSfDetail(${count.index})">
																	<i class="fa fa-pencil" aria-hidden="true"></i></a></td>
															</tr>
														</c:when>
													</c:choose>

													

												</c:forEach>

								</tbody>
	</table>
</div>	
					</div>	
								
							
						
						
					<div class="frm_Sec_one single">
					   <div class="row">
					   		<div class="col-md-3 box_marg">
								<label class="control-label left">RM Weight</label>
								<div class="controls icon_add">
								<i class="fa fa-leaf frm_icon" aria-hidden="true"></i>
								<input type="text" name="rmWt" id="rmWt" class="form-control padd_left" placeholder="RM Weight " value="${rm}" />
								</div>
							</div>
							
							<div class="col-md-3 box_marg">
								<label class="control-label left">SF</label>
								<div class="controls icon_add">
								<i class="fa fa-leaf frm_icon" aria-hidden="true"></i>
								<input type="text" name="sfWt" id="sfWt" class="form-control padd_left" placeholder="SF Weight" value="${sf}"/>
								</div>
							</div>
							
							<div class="col-md-3 box_marg">
								<label class="control-label left">Total Weight</label>
								<div class="controls icon_add">
								<i class="fa fa-leaf frm_icon" aria-hidden="true"></i>
								<input type="text" name="totalWt" id="totalWt" class="form-control padd_left" placeholder="Total Weight" value="${total}" />
								</div>
							</div>
						</div>
					</div>								
							
					
					<div class="form-group">
						<div class="three_buttons">
							<input type="submit" class="btn btn-primary" value="Submit" />
							<button type="button" class="btn btn-primary">Cancel</button>
						</div>					
				</div>			

						</form>
					</div>
				</div>

			</div>

		</div>
	</div>
	<!-- END Main Content -->
	<footer>
	<p>2017 © MONGINIS.</p>
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
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/common.js"></script>

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/jquery-validation/dist/jquery.validate.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/jquery-validation/dist/additional-methods.min.js"></script>


	<script type="text/javascript">
	var editFlag=false;
	var key1=0;
		function submitItem() {
						
			if(editFlag==true){
				var materialType = $('#material_type').val();
				var materialName=$("#rm_material_name option:selected").html();
				var materialNameId= $('#rm_material_name').val(); 
				var seqNo=$('#seq_no').val();
				var sfWeight = document.getElementById("sf_item_weight").value;
				var qty = document.getElementById("qty").value;
				var validation=validate();
					if(validation){
				$.getJSON('${itemForEdit}', {
					mat_type : materialType,
					mat_name_id : materialNameId,
					mat_name : materialName,
					sf_weight : sfWeight,
					qty : qty,
					seqNo:seqNo,
					key : key1,
					ajax : 'true',

				},function(data) {
					
					var len = data.length;
					$('#table1 td').remove();
					var rm=0;var sf=0;var total=0;
					$.each(data,function(key, sfDetail) {
						if(sfDetail.delStatus == 0){
					var tr = $('<tr></tr>');
					var rmTypeName;
					if(sfDetail.rmType == 1){
						rmTypeName="RM";
						rm=rm+sfDetail.rmWeight;
						total=total+sfDetail.rmWeight;
					}else if(sfDetail.rmType == 2){
						rmTypeName="SF";
						sf=sf+sfDetail.rmWeight;
						total=total+sfDetail.rmWeight;
					}

					
				  	tr.append($('<td></td>').html(key+1));

				  	tr.append($('<td></td>').html(sfDetail.rmName));

				  	tr.append($('<td></td>').html(""+rmTypeName));

				  	tr.append($('<td></td>').html(sfDetail.rmQty));

				  	tr.append($('<td></td>').html(sfDetail.rmWeight));
				  	
				  	tr.append($('<td></td>').html(sfDetail.uom));
				  
				 	tr.append($('<td></td>').html("<a href='#' class='action_btn' onclick=deleteSfDetail("+key+")><i class='fa fa-trash-o fa-lg'></i></a>&nbsp;&nbsp;<a href='#' class='action_btn' onclick=editSfDetail("+key+")><i class='fa fa-edit  fa-lg'></i></a>"));
					}
					$('#table1 tbody').append(tr);
					})
					document.getElementById("rmWt").value=rm;
					document.getElementById("sfWt").value=sf;
					document.getElementById("totalWt").value=total;
					});

				document.getElementById("sf_item_weight").value="";
				document.getElementById("qty").value="";
				$("#item_name_div").hide();
				$("#item_name").hide();
				$("#itemNameLabel").hide();
				document.getElementById("material_type").options.selectedIndex = "0";
				 var html = '<option value="0" selected >Select Raw Material</option>';
					html += '</option>';
					$('#rm_material_name').html(html);
					$("#rm_material_name").trigger("chosen:updated");
				 document.getElementById("rm_material_name").selectedIndex = "0"; 
				 document.getElementById("seq_no").value="";
					}//end of validation
			}// end of if
			else{
			var materialType = $('#material_type').val();
			var materialName=$("#rm_material_name option:selected").html();
			var materialNameId= $('#rm_material_name').val();
			var seqNo= $('#seq_no').val();
			var sfWeight = document.getElementById("sf_item_weight").value;
			var qty = document.getElementById("qty").value;
		
			 var validation=validate();
			if(validation){
			 
			var key=-1;
			var editKey=-1;
			$.getJSON('${getItemDetail}', {
				mat_type : materialType,
				mat_name_id : materialNameId,
				mat_name : materialName,
				sf_weight : sfWeight,
				qty : qty,
				seqNo:seqNo,
				key:key,
				editKey:editKey,
				ajax : 'true',

			}, function(data) {
				
				var len = data.length;
				$('#table1 td').remove();
				var rm=0;var sf=0;var total=0;
				$.each(data,function(key, sfDetail) {
				var tr = $('<tr></tr>');
				var rmTypeName;
				
				if(sfDetail.delStatus == 0){
					if(sfDetail.rmType == 1){
						rmTypeName="RM";
						rm=rm+sfDetail.rmWeight;
						
					}else if(sfDetail.rmType == 2){
						rmTypeName="SF";
						sf=sf+sfDetail.rmWeight;
					}
					total=total+sfDetail.rmWeight;
			  	tr.append($('<td></td>').html(key+1));

			  	tr.append($('<td></td>').html(sfDetail.rmName));

			  	tr.append($('<td></td>').html(""+rmTypeName));

			  	tr.append($('<td></td>').html(sfDetail.rmQty));

			  	tr.append($('<td></td>').html(sfDetail.rmWeight));
			  	tr.append($('<td></td>').html(sfDetail.uom));
				tr.append($('<td></td>').html("<a href='#' class='action_btn' onclick=deleteSfDetail("+key+")><i class='fa fa-trash-o fa-lg'></i></a>   &nbsp;&nbsp;     <a href='#' class='action_btn' onclick=editSfDetail("+key+")><i class='fa fa-edit  fa-lg'></i></a>"));			 	//tr.append($('<td></td>').html("<a href='#' class='action_btn' onclick=editItemDetail("+key+")> <abbr title='edit'> <i class='fa fa-edit  fa-lg' ></i></abbr> </a> <a href='#' class='action_btn' onclick=deleteItemDetail("+key+")><abbr title='Delete'><i class='fa fa-trash-o  fa-lg'></i></abbr></a>"));
				}
				$('#table1 tbody').append(tr);

				})
				document.getElementById("rmWt").value=rm;
				document.getElementById("sfWt").value=sf;
				document.getElementById("totalWt").value=total;
				});
			
			document.getElementById("sf_item_weight").value="";
			document.getElementById("qty").value="";
			$("#material_type").val="0";
			document.getElementById("material_type").options.selectedIndex = "0";
			document.getElementById("rm_material_name").options.selectedIndex = "0";
			 document.getElementById("rm_group").selectedIndex = "0";  
			 document.getElementById("rm_cat").selectedIndex = "0";  
			 var html = '<option value="0" selected >Select Raw Material</option>';
				html += '</option>';
				$('#rm_material_name').html(html);
				$("#rm_material_name").trigger("chosen:updated");
	 		 document.getElementById("rm_material_name").selectedIndex = "0"; 
			 document.getElementById("seq_no").value="";
			}// end of validation if
			}//end of else
				editFlag=false;
				}
		
		
function deleteSfDetail(key){
	
	var isDel=confirm('Are you Sure to Delete this Record');
	if(isDel==true){
	var editKey=-2;
	if(key == null ){
		key=-2;
	}
	$.getJSON('${getItemDetail}', {
		key:key,
		editKey : editKey,
		ajax : 'true',

	}, function(data) {
		
		var len = data.length;

		$('#table1 td').remove();
		var rm=0;var sf=0;var total=0;
		$.each(data,function(key, sfDetail) {
			if(sfDetail.delStatus == 0){
		var tr = $('<tr></tr>');
		var rmTypeName;
		if(sfDetail.rmType == 1){
			rmTypeName="RM";
			rm=rm+sfDetail.rmWeight;
			total=total+sfDetail.rmWeight;
		}else if(sfDetail.rmType == 2){
			rmTypeName="SF";
			sf=sf+sfDetail.rmWeight;
			total=total+sfDetail.rmWeight;
		}
		
	  	tr.append($('<td></td>').html(key+1));

	  	tr.append($('<td></td>').html(sfDetail.rmName));

	  	tr.append($('<td></td>').html(""+rmTypeName));

	  	tr.append($('<td></td>').html(sfDetail.rmQty));

	  	tr.append($('<td></td>').html(sfDetail.rmWeight));
	  	
	  	tr.append($('<td></td>').html(sfDetail.uom));
	  
	 // tr.append($('<td></td>').html("<input type=button class= btn btn-primary  id=delete onClick=deleteSfDetail("+key+"); Value=Delete> <input type=button id=edit onClick=editSfDetail("+key+"); Value=Edit> "));
	  	tr.append($('<td></td>').html("<a href='#' class='action_btn' onclick=deleteSfDetail("+key+")><i class='fa fa-trash-o fa-lg'></i></a>  &nbsp;&nbsp;      <a href='#' class='action_btn' onclick=editSfDetail("+key+")><i class='fa fa-edit  fa-lg'></i></a>"));
			}
	  	$('#table1 tbody').append(tr);
		})
		document.getElementById("rmWt").value=rm;
		document.getElementById("sfWt").value=sf;
		document.getElementById("totalWt").value=total;
		});
	}//end of if isDel
	else{
		isDel=false;
	}
}

function editSfDetail(token){
 
	editFlag=true;
	
	$.getJSON('${getSingleItem}', {
		ajax : 'true',
	}, function(data) {
		var len = data.length;
//alert(JSON.stringify(data))
		 $.each(data,function(key, sfDetail) {
			editKey=key; 

		if(key==token)
			{
		
		if(sfDetail.rmType==2)
			{
			 document.getElementById("rm_group").options.selectedIndex =0;
			 document.getElementById("rm_cat").options.selectedIndex =0;

			 document.getElementById("rm_group").disabled = true;
			 document.getElementById("rm_cat").disabled = true;
			}
				    document.getElementById("sf_item_weight").value=sfDetail.rmWeight;
				    document.getElementById("qty").value=sfDetail.rmQty;
					 document.getElementById("material_type").options.selectedIndex =sfDetail.rmType;

					$('#rm_material_name').val('sfDetail.rmId').prop('selected', true);
					
					document.getElementById("item_name").value=sfDetail.rmName;
					document.getElementById("rm_group").disabled = true;
					 document.getElementById("rm_cat").disabled = true;
					 document.getElementById("seq_no").value=sfDetail.seqNo;
					appendItem(sfDetail.rmId);
				
				 key1=key;
			}
		 })  
		});
}
function appendItem(rmId){
	
	var rmType = document.getElementById("material_type").value;
	$('#loader').show();
	$.getJSON('${getRawMaterial}', {
		material_type : rmType,
					
					ajax : 'true',
				},  function(data) {
					$('#loader').hide();
					var html = '<option value="0" selected >Select Raw Material</option>';
					
					var len = data.length;
					for ( var i = 0; i < len; i++) {
						if(data[i].id==rmId){
							html += '<option value="' + data[i].id + '"selected>'
							+ data[i].name + '</option>';
						}else{
						html += '<option value="' + data[i].id + '">'
								+ data[i].name + '</option>';
					}
					}
					html += '</option>';
					$('#rm_material_name').html(html);
	    			$("#rm_material_name").trigger("chosen:updated");
				});
}

</script>
<script type="text/javascript">
function insertItemDetail(){
	$.getJSON('${insertSfItemDetail}',
			{
				ajax : 'true',
            });
}
</script>
<script type="text/javascript">
$(document).ready(function() { 
	$('#material_type').change(
	function() {
    if($(this).val()==2)
    	{
    	$('#loader').show();
	    $.getJSON('${getRawMaterial}', {
		      material_type : $(this).val(),
			  ajax : 'true',
				},  function(data) {
					$('#loader').hide();
                    
					var html = '<option value="0" selected >Select Raw Material</option>';
					
					var len = data.length;
					for ( var i = 0; i < len; i++) {
						html += '<option value="' + data[i].id + '">'
								+ data[i].name + '</option>';
					}
					html += '</option>';
					$('#rm_material_name').html(html);
					$("#rm_material_name").trigger("chosen:updated");

				});
	document.getElementById("rm_group").disabled = true;
	 document.getElementById("rm_cat").disabled = true;
    	}
    else
    	{
    	     document.getElementById("rm_group").disabled = false;
    		 document.getElementById("rm_cat").disabled = false;
    			var html = '<option value="0" selected >Select Raw Material</option>';
    			html += '</option>';
    			$('#rm_material_name').html(html);
    			$("#rm_material_name").trigger("chosen:updated");
    		 document.getElementById("rm_material_name").selectedIndex = "0"; 
    	}
    });
});
</script>
<script type="text/javascript">
function validate(){
	var isValid=true;
	var materialType = $('#material_type').val();
	var materialName=$("#rm_material_name option:selected").html();
	var materialNameId= $('#rm_material_name').val();
	var sfWeight = document.getElementById("sf_item_weight").value;
	var qty = document.getElementById("qty").value;

	if(materialType == 0){
		alert("Please Select Valid Material Type");
		isValid= false;
	}else if(materialNameId==0){
		alert("Please Select Valid Material");
		isValid= false;
	}else if(sfWeight==null || sfWeight=="" || sfWeight<0 || isNaN(sfWeight)){
		alert("Please Select Valid sfWeight");
		isValid= false;
	}else if(qty==null || qty== "" || qty<0 || isNaN(qty)){
		alert("Please Select Valid Qty ");
		isValid= false;
	}
	return isValid;
}
function clearData(){
	document.getElementById("sf_item_weight").value="";
	document.getElementById("qty").value="";
	$("#material_type").val="0";
	document.getElementById("material_type").options.selectedIndex = "0";
	 var html = '<option value="0" selected >Select Raw Material</option>';
		html += '</option>';
		$('#rm_material_name').html(html);
		$("#rm_material_name").trigger("chosen:updated");
	 document.getElementById("rm_material_name").selectedIndex = "0"; 
	 document.getElementById("rm_group").selectedIndex = "0";  
	 document.getElementById("rm_cat").selectedIndex = "0";  
}
</script>
	<script type="text/javascript">
$(document).ready(function() { 
	$('#rm_group').change(
			function() {
				$.getJSON('${getRmCategory}', {
					grpId : $(this).val(),
					ajax : 'true'
				}, function(data) {
					var html = '<option value="" disabled="disabled" selected >Select Category</option>';
					
					var len = data.length;
					for ( var i = 0; i < len; i++) {
						html += '<option value="' + data[i].catId + '">'
								+ data[i].catName + '</option>';
					}
					html += '</option>';
					$('#rm_cat').html(html);
					$('#rm_cat').formcontrol('refresh');

				});
			});
});
$(document).ready(function() { 
	$('#rm_cat').change(
			function() {
				$.getJSON('${getRmListByCatId}', {
					catId : $(this).val(),
					ajax : 'true'
				}, function(data) {
					var html = '<option value="" disabled="disabled" selected >Select Category</option>';
					
					var len = data.length;
					for ( var i = 0; i < len; i++) {
						html += '<option value="' + data[i].rmId + '">'
								+ data[i].rmName + '</option>';
					}
					html += '</option>';
					$('#rm_material_name').html(html);
					$("#rm_material_name").trigger("chosen:updated");

				});
			});
});
</script>
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
</script>
</body>
</html>