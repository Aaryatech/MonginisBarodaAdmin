<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<body onload="calTotalGstOnLoad()">
	<jsp:include page="/WEB-INF/views/include/logout.jsp"></jsp:include>
	
	
	<c:url var="getGroup2ByCatId" value="/getGroup2ByCatId" />

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
					<h1>
						<i class="fa fa-file-o"></i> Items
					</h1>

				</div>
			</div>
			<!-- END Page Title -->



			<!-- BEGIN Main Content -->
			<div class="row">
				<div class="col-md-12">
					<div class="box">
						<div class="box-title">
							<h3>
								<i class="fa fa-bars"></i> Edit Item 
							</h3>
							<div class="box-tool">
								<a href="${pageContext.request.contextPath}/itemList">Back to List</a> <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a>
							</div>
							<!-- <div class="box-tool">
								<a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a> <a data-action="close" href="#"><i
									class="fa fa-times"></i></a>
							</div> -->
						</div>


						<div class="aa"><!-- box-content -->
							<form action="updateItemProcess" class="form-horizontal" id="validation-form"
								 method="post" enctype="multipart/form-data">
								 
								 
							<div class="frm_Sec_one single">	 
								 <div class="txt_title">Product Information</div>
								 <div class="row">
								 	<div class="col-md-3 box_marg"  style="display: none;">
										<label class="control-label left">Item Id</label>
											<div class="controls icon_add">
											<input type="hidden" name="itemId" value="${item.id}">								
											</div>
									</div>
									
									<div class="col-md-3 box_marg" style="display: none;">
											<label class="control-label left">Product Type</label>
												<div class="controls icon_add">
													<label class="radio-inline"> <input type="radio" ${item.itemGrp3==0 ? 'checked' : ''}
											name="temp" id="temp" value="0">
											Franchise
										</label> <label class="radio-inline"> <input type="radio"
											name="product_type" id="prdRadios2" value="1" ${item.itemGrp3==1 ? 'checked' : ''}
											data-rule-required="false" />3<sup>rd</sup> Party</label>
												</div>
										</div>
										
									<div class="col-md-3 box_marg">
											<label class="control-label left">Category</label>
												<div class="controls icon_add">
													<i class="fa fa-list-ul frm_icon" aria-hidden="true"></i>
													<select data-placeholder="Select Group" name="item_grp1"
											class="form-control padd_left chosen" tabindex="-1" id="item_grp1"
											data-rule-required="true" >


											<c:forEach items="${mCategoryList}" var="mCategoryList">
												<c:choose>
													<c:when test="${mCategoryList.catId==item.itemGrp1}">
														<option selected value="${mCategoryList.catId}"><c:out value="${mCategoryList.catName}"></c:out> </option>
													</c:when>
													<%-- <c:otherwise>
														<option value="${mCategoryList.catId}"><c:out value="${mCategoryList.catName}"></c:out></option>
													</c:otherwise> --%>
												</c:choose>


											</c:forEach>

										</select>
												</div>
										</div>
										
									<div class="col-md-3 box_marg">
											<label class="control-label left">Sub Category</label>
												<div class="controls icon_add">
													<i class="fa fa-list-ul frm_icon" aria-hidden="true"></i>
													<select data-placeholder="Select Group" name="item_grp2"
											class="form-control padd_left chosen-select" tabindex="-1" 
											id="item_grp2" data-rule-required="true">
											<option selected value="${selectedItemId}"><c:out value="${selectedItem}"></c:out></option>
											
											 <%-- <c:forEach items="${subCategoryList}" var="subCategoryList">
													
													
													<option value="${subCategoryList.subCatId}"><c:out value="${subCategoryList.subCatName}"></c:out></option>
												</c:forEach> --%>
										</select>
												</div>
										</div>	
										
										<div class="col-md-3 box_marg">
											<label class="control-label left">Item Name</label>
												<div class="controls icon_add">
													<i class="fa fa-coffee frm_icon" aria-hidden="true"></i>
													<input type="text" name="item_name" id="item_name"
											value="${item.itemName}" placeholder="Item Name"
											class="form-control padd_left" data-rule-required="true"
											/>
													
												</div>
												<input type="hidden" name="item_rate1" id="item_rate1" value="${item.itemRate1}"/>
										</div>	
									
									<div class="col-md-3 box_marg">
											<label class="control-label left">Item Code</label>
												<div class="controls icon_add">
													<i class="fa fa-code frm_icon" aria-hidden="true"></i>
													<input type="text" name="item_id" id="item_id"
											placeholder="Item Code" class="form-control padd_left"
											data-rule-required="true" value="${item.itemId}" readonly="readonly" />
													
												</div>
										</div>
										
									<div class="col-md-3 box_marg">
											<label class="control-label left">MIN Qty.</label>
												<div class="controls icon_add">
													<i class="fa fa-arrow-down frm_icon" aria-hidden="true"></i>
													<input type="text" name="min_qty" id="min_qty"
											value="${item.minQty}" placeholder="Minimum Quantity"
											class="form-control padd_left" data-rule-required="true" data-rule-number="true" />
													
												</div>
										</div>
										
										<div class="col-md-3 box_marg">
											<label class="control-label left">MAX Qty.</label>
												<div class="controls icon_add">
													<i class="fa fa-arrow-up frm_icon" aria-hidden="true"></i>
													<input type="text" name="item_grp3" id="item_grp3"
											value="${item.itemGrp3}" placeholder="Item Grp3"
											class="form-control padd_left"  data-rule-required="true"
											data-rule-number="true" />
													
												</div>
										</div>	
										
									<div class="col-md-3 box_marg">
											<label class="control-label left">UOM</label>
												<div class="controls icon_add">
													<i class="fa fa-glass frm_icon" aria-hidden="true"></i>
													<select name="item_uom" id="item_uom" class="form-control padd_left chosen" placeholder="Item UOM"
												 data-rule-required="true" onchange="uomChanged()">
											<option value="">Select Item UOM</option>
											<c:forEach items="${rmUomList}" var="rmUomList"
													varStatus="count">
													<c:choose>
													<c:when test="${rmUomList.uomId==itemSupp.uomId}">
														<option value="${rmUomList.uomId}" selected><c:out value="${rmUomList.uom}"/></option>
													</c:when>
													<c:otherwise>
														<option value="${rmUomList.uomId}"><c:out value="${rmUomList.uom}"/></option>
													</c:otherwise>
													</c:choose>
												</c:forEach>
										</select>											
												</div>
										</div>
										
									<div class="col-md-3 box_marg">
											<label class="control-label left">Item Shelf Lifed</label>
												<div class="controls icon_add">
													<i class="fa fa-bullseye frm_icon" aria-hidden="true"></i>
													<input type="text" name="item_shelf_life" id="item_shelf_life"
											value="${item.shelfLife}" placeholder="Item Shelf Life"
											class="form-control padd_left" data-rule-required="true" data-rule-number="true" />
													
												</div>
										</div>		
									
									
								 </div>
							</div>
							
							<div class="frm_Sec_one single">
								 <div class="txt_title">Rate & Tax Information</div>
								 <div class="row">
								 	<div class="col-md-2 box_marg">
											<label class="control-label left">MRP1</label>
												<div class="controls icon_add">
													<i class="fa fa-inr frm_icon" aria-hidden="true"></i>
													<input type="text" name="item_mrp1" id="item_mrp1"
											value="${item.itemMrp1}" placeholder="Item Mrp1"
											class="form-control padd_left" data-rule-required="true" data-rule-number="true"/>
													
												</div>
										</div>
										
										<div class="col-md-2 box_marg">
											<label class="control-label left">MRP2</label>
												<div class="controls icon_add">
													<i class="fa fa-inr frm_icon" aria-hidden="true"></i>
													<input type="text" name="item_mrp2" id="item_mrp2"
											value="${item.itemMrp2}" placeholder="Item Mrp2"
											class="form-control padd_left" data-rule-required="true" data-rule-number="true" />
													
												</div>
										</div>
										
										<div class="col-md-2 box_marg">
											<label class="control-label left">MRP3</label>
												<div class="controls icon_add">
													<i class="fa fa-inr frm_icon" aria-hidden="true"></i>
													<input type="text" name="item_mrp3" id="item_mrp3"
											value="${item.itemMrp3}" placeholder="Item Mrp3"
											class="form-control padd_left" data-rule-required="true" data-rule-number="true"/>
													
												</div>
										</div>
										
										<div class="col-md-2 box_marg" style="display: none;">
											<label class="control-label left">Special Rate</label>
												<div class="controls icon_add">
													<i class="fa fa-road frm_icon" aria-hidden="true"></i>
													<input type="text" name="item_rate3" id="item_rate3"
											value="${item.itemRate3}" placeholder="Item Rate3"
											class="form-control padd_left" data-rule-required="true" data-rule-number="true" />
													
												</div>
										</div>
										
										
										
										<div class="col-md-2 box_marg" style="display: none;">
											<label class="control-label left">Margin %</label>
												<div class="controls icon_add">
													<i class="fa fa-road frm_icon" aria-hidden="true"></i>
													<input type="text" name="grn_two" id="grn_two"
											placeholder="Enter Margin %" class="form-control padd_left"
											data-rule-required="true" data-rule-number="true" value="${item.grnTwo}" onchange="calMrp()"/>
													
												</div>
										</div>
										
										<div class="col-md-2 box_marg">
											<label class="control-label left">GST Tax %</label>
												<div class="controls icon_add">
													<i class="fa fa-money frm_icon" aria-hidden="true"></i>
													<input type="text" name="item_tax3" id="item_tax3"
											value="${item.itemTax3}" placeholder="IGST"
											class="form-control padd_left" data-rule-required="true" data-rule-number="true"value="0.0"onchange="calTotalGst()"/>
											
													
												</div>
										</div>
										
										<div class="col-md-2 box_marg" style="display: none;">
											<label class="control-label left">CGST %</label>
												<div class="controls icon_add">
													<i class="fa fa-road frm_icon" aria-hidden="true"></i>
													<input type="text" name="item_tax2" id="item_tax2"
											value="${item.itemTax2}" placeholder="CGST"
											class="form-control padd_left" data-rule-required="true" data-rule-number="true" value="0.0" onchange="calTotalGst()"/>
													
												</div>
										</div>
										
										<div class="col-md-2 box_marg" style="display: none;">
											<label class="control-label left">SGST %</label>
												<div class="controls icon_add">
													<i class="fa fa-road frm_icon" aria-hidden="true"></i>
													<input type="text" name="item_tax1" id="item_tax1"
											value="${item.itemTax1}" placeholder="SGST"
											class="form-control padd_left" data-rule-required="true" data-rule-number="true" value="0.0" />
													
												</div>
										</div>
										
										<div class="col-md-2 box_marg" style="display: none;">
											<label class="control-label left">Total GST Applicable %</label>
												<div class="controls icon_add">
													<i class="fa fa-road frm_icon" aria-hidden="true"></i>
													<input type="text" name="total_gst_appli" id="total_gst_appli"
											placeholder="Total GST Applicable" class="form-control padd_left"
											data-rule-required="true" data-rule-number="true" disabled/>
													
												</div>
										</div>
										
										<div class="col-md-2 box_marg">
											<label class="control-label left">Cess %</label>
												<div class="controls icon_add">
													<i class="fa fa-money frm_icon" aria-hidden="true"></i>
													<input type="text" name="cessPer" id="cessPer"
										   class="form-control padd_left"
											 value="${itemSupp.itemCess}"/>								
												</div>
										</div>
										
										<input type="hidden" name="id" id="id" value="${itemSupp.id}"/>
										<div class="col-md-2 box_marg">
											<label class="control-label left">HSN Code</label>
												<div class="controls icon_add">
													<i class="fa fa-code frm_icon" aria-hidden="true"></i>
													<input type="text" name="item_hsncd" id="item_hsncd"
											placeholder="HSN Code" class="form-control padd_left"
											data-rule-required="true" value="${itemSupp.itemHsncd}"/>												
												</div>
										</div>
										
								 </div>
							</div>
							
							<div class="frm_Sec_one single">
								 <div class="txt_title">Other Information</div>
								 <div class="row">
								 	<div class="col-md-3 box_marg">
											<label class="control-label left">Product Image</label>
												<div class="controls icon_add">
													<div class="fileupload fileupload-new"
											data-provides="fileupload">
											<div class="fileupload-new img-thumbnail"
												style="width: 80%; height: auto; padding:0">
												<img style="width: 100%;"
													src="${url}${item.itemImage}"  onerror="this.src='${pageContext.request.contextPath}/resources/img/No_Image_Available.jpg';"/>
													

											</div>
											<div
												class="fileupload-preview fileupload-exists img-thumbnail"
												style="max-width: 100%; max-height: auto; line-height: 20px;"></div>
											<div>
												<span class="btn btn-default btn-file"><span
													class="fileupload-new">Select image</span> <span
													class="fileupload-exists">Change</span> <input type="file"
													class="file-input" name="item_image" id="item_image"
													value="${item.itemImage}"/></span> <a
													href="#" class="btn btn-default fileupload-exists"
													data-dismiss="fileupload">Remove</a>
											</div>
										</div>												
												</div>
										</div>
										
									<div class="col-md-2 box_marg">
											<label class="control-label left">Is Used?</label>
												<div class="controls icon_add">
													<i class="fa fa-dot-circle-o frm_icon" aria-hidden="true"></i>
													
													<select class="form-control padd_left " tabindex="1"
											name="is_used">
                               <c:choose>
                               <c:when test="${strIsUsed==1}">
                                <option value="1" selected>Active</option>
								<option value="4">Inactive</option>
								<option value="11">Monday Active</option>
								<option value="12">Tuesday Active</option>
								<option value="13">Wednesday Active</option>
								<option value="14">Thursday Active</option>
								<option value="15">Friday Active</option>
								<option value="16">Saturday Active</option>
								<option value="17">Sunday Active</option>
                               </c:when>
                                <c:when test="${strIsUsed==4}">
                                <option value="1" >Active</option>
								<option value="4" selected>Inactive</option>
								<option value="11">Monday Active</option>
								<option value="12">Tuesday Active</option>
								<option value="13">Wednesday Active</option>
								<option value="14">Thursday Active</option>
								<option value="15">Friday Active</option>
								<option value="16">Saturday Active</option>
								<option value="17">Sunday Active</option>
                               </c:when>
                                <c:when test="${strIsUsed==11}">
                                <option value="1" >Active</option>
								<option value="4" >Inactive</option>
								<option value="11" selected>Sunday Active</option>
								<option value="12" >Monday Active</option>
								<option value="13" >Tuesday Active</option>
								<option value="14" >Wednesday Active</option>
								<option value="15" >Thursday Active</option>
								<option value="16" >Friday Active</option>
								<option value="17" >Saturday Active</option>
                               </c:when>
                                <c:when test="${strIsUsed==12}">
                                <option value="1" >Active</option>
								<option value="4" >Inactive</option>
								<option value="11">Sunday Active</option>
								<option value="12" selected>Monday Active</option>
								<option value="13" >Tuesday Active</option>
								<option value="14" >Wednesday Active</option>
								<option value="15" >Thursday Active</option>
								<option value="16" >Friday Active</option>
								<option value="17" >Saturday Active</option>
                               </c:when>
                                <c:when test="${strIsUsed==13}">
                                <option value="1" >Active</option>
								<option value="4" >Inactive</option>
								<option value="11">Sunday Active</option>
								<option value="12">Monday Active</option>
								<option value="13" selected>Tuesday Active</option>
								<option value="14" >Wednesday Active</option>
								<option value="15" >Thursday Active</option>
								<option value="16" >Friday Active</option>
								<option value="17" >Saturday Active</option>
                               </c:when>
                                <c:when test="${strIsUsed==14}">
                                <option value="1" >Active</option>
								<option value="4" >Inactive</option>
								<option value="11">Sunday Active</option>
								<option value="12">Monday Active</option>
								<option value="13">Tuesday Active</option>
								<option value="14" selected>Wednesday Active</option>
								<option value="15" >Thursday Active</option>
								<option value="16" >Friday Active</option>
								<option value="17" >Saturday Active</option>
                               </c:when>
                                <c:when test="${strIsUsed==15}">
                                <option value="1" >Active</option>
								<option value="4" >Inactive</option>
								<option value="11">Sunday Active</option>
								<option value="12">Monday Active</option>
								<option value="13">Tuesday Active</option>
								<option value="14">Wednesday Active</option>
								<option value="15" selected>Thursday Active</option>
								<option value="16" >Friday Active</option>
								<option value="17" >Saturday Active</option>
                               </c:when>
                                <c:when test="${strIsUsed==16}">
                                <option value="1" >Active</option>
								<option value="4" >Inactive</option>
								<option value="11">Sunday Active</option>
								<option value="12">Monday Active</option>
								<option value="13">Tuesday Active</option>
								<option value="14">Wednesday Active</option>
								<option value="15">Thursday Active</option>
								<option value="16" selected>Friday Active</option>
								<option value="17" >Saturday Active</option>
                               </c:when>
                                  <c:when test="${strIsUsed==17}">
                                <option value="1" >Active</option>
								<option value="4" >Inactive</option>
								<option value="11">Sunday Active</option>
								<option value="12">Monday Active</option>
								<option value="13">Tuesday Active</option>
								<option value="14">Wednesday Active</option>
								<option value="15">Thursday Active</option>
								<option value="16">Friday Active</option>
								<option value="17" selected>Saturday Active</option>
                               </c:when>
                               <c:otherwise>
                                <option value="1" >Active</option>
								<option value="4" >Inactive</option>
								<option value="11">Sunday Active</option>
								<option value="12">Monday Active</option>
								<option value="13">Tuesday Active</option>
								<option value="14">Wednesday Active</option>
								<option value="15">Thursday Active</option>
								<option value="16">Friday Active</option>
								<option value="17">Saturday Active</option>
                               </c:otherwise>
							   </c:choose>			
								
								</select>
													
												</div>
										</div>
										
								<div class="col-md-2 box_marg">
											<label class="control-label left">Item Sort Id</label>
												<div class="controls icon_add">
													<i class="fa fa-list-ul frm_icon" aria-hidden="true"></i>
													<input type="text" name="item_sort_id" id="item_sort_id"
											value="${item.itemSortId}" placeholder="Item Sort Id"
											class="form-control padd_left" data-rule-required="true" data-rule-number="true"/>
													
												</div>
										</div>
										
									<div class="col-md-2 box_marg">
											<label class="control-label left">Station No</label>
												<div class="controls icon_add">
													<i class="fa fa-list-ul frm_icon" aria-hidden="true"></i>
													<input type="text" name="item_rate2" id="item_rate2"
											value="${item.itemRate2}" placeholder="Item Mrp2"
											class="form-control padd_left" data-rule-required="true" data-rule-number="true" />													
												</div>
										</div>
										
										<div> <input type="hidden" name="prevImage" value="${item.itemImage}"></div>
										
										<input type="hidden" name="uom" id="uom" value="${itemSupp.itemUom}"/> 	
										
									<div class="col-md-2 box_marg">
											<label class="control-label left">Short Name</label>
												<div class="controls icon_add">
													<i class="fa fa-user frm_icon" aria-hidden="true"></i>
													<input type="text" name="short_name" id="short_name"
											placeholder="Short Name" class="form-control padd_left"
											data-rule-required="true"  value="${itemSupp.shortName}"/>								
												</div>
										</div>
										
										<div class="col-md-3 box_marg" >
											<label class="control-label left">Cut Section</label>
												<div class="controls icon_add">
												<i class="fa fa-scissors frm_icon" aria-hidden="true"></i>
												<select name="cut_section" id="cut_section" class="form-control padd_left chosen"
												 data-rule-required="true">
											<option value="">Select Cut Section</option>
											
										<c:choose>
										<c:when test="${itemSupp.cutSection==0}">
										<option value="0" selected>Not Applicable</option>
											<option value="1">Single Cut</option>
											<option value="2">Double Cut</option>
										</c:when>
											<c:when test="${itemSupp.cutSection==1}">
											<option value="0" >Not Applicable</option>
											<option value="1"selected>Single Cut</option>
											<option value="2">Double Cut</option>
											</c:when>
											<c:when test="${itemSupp.cutSection==2}">
											<option value="0" >Not Applicable</option>
											<option value="1">Single Cut</option>
											<option value="2"selected>Double Cut</option>
											</c:when>
											<c:otherwise>
										    <option value="0" selected>Not Applicable</option>
											<option value="1">Single Cut</option>
											<option value="2">Double Cut</option>
											</c:otherwise>
										</c:choose>
										</select>
												</div>
										</div>
										
										<div class="col-md-3 box_marg" >
											<label class="control-label left">Type Of Tray</label>
												<div class="controls icon_add">
												<i class="fa fa-th-large frm_icon" aria-hidden="true"></i>
												<select name="tray_type" id="tray_type" class="form-control padd_left chosen" placeholder="Type Of Tray"
												 data-rule-required="true">
											<option value="">Select Type Of Tray</option>
											<c:forEach items="${trayTypes}" var="trayTypes"
													varStatus="count">
													<c:choose>
													<c:when test="${trayTypes.typeId==itemSupp.trayType}">
														<option value="${trayTypes.typeId}" selected><c:out value="${trayTypes.typeName}"/></option>
													</c:when>
													<c:otherwise>
														<option value="${trayTypes.typeId}"><c:out value="${trayTypes.typeName}"/></option>
													</c:otherwise>
													</c:choose>
												</c:forEach>
										</select>
												
												</div>
										</div>
										
										
										
										<div class="col-md-3 box_marg" >
											<label class="control-label left">No. Of Item Per Tray</label>
												<div class="controls icon_add">
												<i class="fa fa-list-ul frm_icon" aria-hidden="true"></i>
												<input type="text" name="no_of_item" id="no_of_item"
											placeholder="No. Of Item Per Tray" class="form-control padd_left"
											data-rule-required="true"  data-rule-number="true" value="${itemSupp.noOfItemPerTray}"/>
												
												</div>
										</div>
										
										
										
										
										
										
										<input type="hidden" name="input_per_qty" id="input_per_qty"
											placeholder="Input Per Unit" class="form-control"
											data-rule-required="true"  data-rule-number="true" value="1"/>
											
								<!-- 			<input type="hidden" value="0" name="cut_section">
							   <input type="hidden" value="0" name="tray_type">
							   <input type="hidden" value="0" name="no_of_item"> -->
							   <input type="hidden" value="0" name="actual_weight">
							   <input type="hidden" value="0" name="base_weight">	
													
										
								 </div>
								 
							</div>
							
							
								 
							
								
								
								<div class="row" style="text-align: right; padding: 15px 40px;">										
												<input type="submit" class="btn btn-primary" value="Submit">					
												<button type="button" class="btn btn-primary">Cancel</button> 
												
												<div class="clr"></div>
											</div>
							   
							  
							 
							
							</form>
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
$(document).ready(function() { 
	$('#item_grp1').change(
			function() {
				$.getJSON('${getGroup2ByCatId}', {
					catId : $(this).val(),
					ajax : 'true'
				}, function(data) {
					var html = '<option value="" selected >select Group 2</option>';
					
					var len = data.length;
					for ( var i = 0; i < len; i++) {
						html += '<option value="' + data[i].subCatId + '">'
								+ data[i].subCatName + '</option>';
					}
					html += '</option>';
					$('#item_grp2').html(html);
					$('#item_grp2').formcontrol('refresh');

				});
			});
});
</script>

<script>
function calTotalGst() {
	var igst = parseFloat($("#item_tax3").val());
	
	var cgst = igst/2;
	var sgst = igst/2;
	var totGst = parseFloat(cgst + sgst);
	
	document.getElementById("item_tax1").setAttribute('value', sgst);
	document.getElementById("item_tax2").setAttribute('value', cgst);

	document.getElementById("total_gst_appli").setAttribute('value',
			totGst);
}
</script>

<script>
function calTotalGstOnLoad() {
   
	  var sgst=parseFloat($("#item_tax1").val());
	  var cgst=parseFloat($("#item_tax2").val());
	  var totalGst=parseFloat(cgst+sgst);
	
	  document.getElementById("total_gst_appli")
		.setAttribute('value', totalGst);
}
</script>
<script type="text/javascript">
function calMrp()
{
	var mrp1 = parseFloat($("#item_mrp1").val());
	var mrp2 = parseFloat($("#item_mrp2").val());
	var mrp3 = parseFloat($("#item_mrp3").val());
	var margin= parseFloat($("#grn_two").val());
	
	var calRate1=mrp1-((mrp1*margin)/100);      
	var calRate2=mrp2-((mrp2*margin)/100);  
	var calRate3=mrp3-((mrp3*margin)/100);  
	document.getElementById("item_rate1").setAttribute('value', (calRate1).toFixed(2));
	//document.getElementById("item_rate2").setAttribute('value',  (calRate2).toFixed(2));
	//document.getElementById("item_rate3").setAttribute('value',  (calRate3).toFixed(2));
}
</script>
<script type="text/javascript">

			function uomChanged() {
				
				document.getElementById('uom').value=$('#item_uom option:selected').text();
				
			}
</script>

</body>
</html>