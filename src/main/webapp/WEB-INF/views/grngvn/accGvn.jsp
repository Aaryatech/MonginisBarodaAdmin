<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<body>
	<jsp:include page="/WEB-INF/views/include/logout.jsp"></jsp:include>

	<c:url var="insertAccGvnProcessAgree" value="/insertAccGvnProcessAgree" />
	<c:url var="insertAccGvnProcessDisAgree"
		value="/insertAccGvnProcessDisAgree" />
	<c:url var="getDateForGvnAcc" value="/getDateForGvnAcc" />


	<c:url var="getGvnStatus" value="/getGvnStatus" />

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
						<i class="fa fa-file-o"></i>GVN for Acc
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
								<i class="fa fa-bars"></i> Account GVN List
							</h3>
							<div class="box-tool">
								<a href="">Back to List</a> <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a>
							</div>

						</div>


						<div class="box-content">
							<form
								action="${pageContext.request.contextPath}/insertAccGvnByCheckBoxes"
								class="form-horizontal" method="post" id="validation-form">
									<input type="hidden" value="${headerId}" id="headerId"
									name="headerId">
								<div class="box" style="margin-bottom: 0;
    box-shadow: 0 0px 0px 0 rgba(255, 111, 0, 0.3);
    background: #ff6f00;
    background: -webkit-linear-gradient(45deg, #ff6f00 0%, #ffca28 100%);
    background: linear-gradient(45deg, #d66f3f 0%, #e696ca 100%);">
									<%-- <div class="box-title">
										<h3>
											<i class="fa fa-table"></i> GVN List  GVN List Date-${grnDate} srNo-${srNo}
										</h3>
										<div class="box-tool">
											<a data-action="collapse" href="#"><i
												class="fa fa-chevron-up"></i></a>
											
										</div>
									</div> --%>
									<c:set var="sts" value="${0}"></c:set>
									<c:forEach items="${gvnList}" var="gvnList">
												<c:choose>
														<c:when test="${(gvnList.grnGvnStatus==1) or (gvnList.grnGvnStatus==2) or (gvnList.grnGvnStatus==3) or (gvnList.grnGvnStatus==5) or (gvnList.grnGvnStatus==6)}">
														<c:set var="sts" value="${1}"></c:set>
														</c:when>
												</c:choose>
									</c:forEach>

									<div class="box-content">
									<c:set var="statusGRN" value="NA"></c:set>
												<c:forEach items="${gStatusLst}" var="grnStatus">
												<c:if test="${grnStatus.statusValue==gateHeader.grngvnStatus}">
												<c:set var="statusGRN" value="${grnStatus.statusName}"></c:set>
												</c:if>
												</c:forEach>

				<div style="padding: 15px">
				<span style="padding: 15px;">GR	N NO:<strong>${srNo}</strong></span><span style="padding: 15px;" >Date:<strong>${grnDate}</strong></span><span style="padding: 15px;" >Status:<strong>${statusGRN}</strong></span>
				<jsp:include page="/WEB-INF/views/include/tableSearch.jsp"></jsp:include>
				</div>
				
										
<div class="tableFixHead">
	<table id="table1">         
	<thead style="background-color:#f3b5db; ">
		<tr>
		<c:choose>
			<c:when test="${sts==1}">
			 <th style="text-align: center;"><input type="checkbox" onClick="selectedGvn(this)" disabled/></th>
			</c:when>
			<c:otherwise>
			<th style="text-align: center;"><input type="checkbox" onClick="selectedGvn(this)" /></th>
			</c:otherwise>
	</c:choose>
			
			
			<th style="text-align: center; width:80px;">Sr No</th>
			<th style="text-align: center;">Invoice No</th>
			<th style="text-align: center;">Invoice Date</th>
			<!-- <th style="text-align: left;">Franchise Name</th> -->
			<th style="text-align: center;" >Item Name</th>
			<th style="text-align: center;">GVN Quantity</th>
			<th style="text-align: center;">Sell Apr Qty</th>
			<th>Edited Qty</th>
														<th>Already Apr Qty</th>
														<th>Pur Qty</th>

			<th style="text-align: center;">Gvn Amt</th>
			<th style="text-align: center;">PHOTO 1</th>
			<th style="text-align: center;">PHOTO 2</th>
			<th style="text-align: center;">Status</th>
			<th style="text-align: center;">Action</th>
		</tr>
	</thead>
	
	<tbody>

													<c:forEach items="${gvnList}" var="gvnList"
														varStatus="count">

														<c:choose>
															<c:when
																test="${gvnList.aprQtyGate!=gvnList.grnGvnQty or gvnList.aprQtyStore!=gvnList.aprQtyGate}">

																<c:set var="color" value="white"></c:set>
															</c:when>
															<c:otherwise>
																<c:set var="color" value="white"></c:set>
															</c:otherwise>
														</c:choose>

														<tr bgcolor="${color}">


															<c:choose>
																<c:when test="${gvnList.grnGvnStatus==4}">
																	<td style="text-align: center;"><input type="checkbox" checked="checked" name="select_to_agree"
																		id="${gvnList.grnGvnId}" value="${gvnList.grnGvnId}"></></td>

																</c:when>
																<c:when test="${gvnList.grnGvnStatus==7}">
																	<td style="text-align: right;"><input type="checkbox" name="select_to_agree"
																		id="${gvnList.grnGvnId}" value="${gvnList.grnGvnId}"></></td>

																</c:when>

																<c:otherwise>
																	<td style="text-align: right;"><input type="checkbox" name="select_to_agree"
																		disabled="disabled" id="${gvnList.grnGvnId}"
																		value="${gvnList.grnGvnId}" /></td>
																</c:otherwise>
															</c:choose>
															<td style="text-align: left;"><c:out value="${count.index+1}" /></td>
															<td style="text-align: left;"><c:out value="${gvnList.invoiceNo}" /></td>
															<td style="text-align: right;"><c:out value="${gvnList.refInvoiceDate}" /></td>
															<%-- <td style="text-align: right;"><c:out value="${gvnList.frName}" /></td> --%>
															<td style="text-align: right;"><c:out value="${gvnList.itemName}" /></td>
															<td style="text-align: right;"><c:out value="${gvnList.grnGvnQty}" />
																<input type="hidden"
																name="approve_acc_login${gvnList.grnGvnId}"
																id="approve_acc_login${gvnList.grnGvnId}"
																value="${gvnList.approvedLoginAcc}" /></td>

															<td style="text-align: right;"><c:out
																	value="${gvnList.aprQtyStore}" /> <c:set var="qty"
																	value="0"></c:set> <c:choose>
																	<c:when
																		test="${gvnList.grnGvnStatus==1 or gvnList.grnGvnStatus==2 or gvnList.grnGvnStatus==3}">
																		<c:set var="qty" value="${gvnList.aprQtyGate}" />
																	</c:when>

																	<c:when
																		test="${gvnList.grnGvnStatus==4 or gvnList.grnGvnStatus==5}">
																		<c:set var="qty" value="${gvnList.grnGvnQty}" />
																	</c:when>

																	<c:otherwise>
																		<c:set var="qty" value="${gvnList.aprQtyAcc}"></c:set>
																	</c:otherwise>
																</c:choose>
																
																<c:set value="0" var="other_apr_qty"></c:set>
																	<c:set value="0" var="pur_qty"></c:set>
																	<c:forEach items="${aprQtyGGList}" var="aprQtyList">
																	<c:if test="${gvnList.billDetailNo==aprQtyList.billDetailNo}">
																		<c:set value="${aprQtyList.allAprQty}" var="other_apr_qty"></c:set>
																	<c:set value="${aprQtyList.billQty}" var="pur_qty"></c:set>
																	</c:if>
																	</c:forEach>
																	<c:if test="${qty>(pur_qty-other_apr_qty)}">
																		<c:set var ="qty" value="${pur_qty-other_apr_qty}" ></c:set>
																	</c:if>
															<td align="center"><input type="text"
																name="acc_gvn_qty${gvnList.grnGvnId}"
																style="width: 50px" class="form-control"
																onkeyup="calcGvn(${gvnList.baseRate},${gvnList.grnGvnId},
																	${gvnList.sgstPer},${gvnList.cgstPer},${gvnList.cessPer},${gvnList.grnGvnQty},${qty},${gvnList.itemMrp},${pur_qty},${other_apr_qty})"
																id='acc_gvn_qty${gvnList.grnGvnId}' value="${qty}" /></td>
	<td align="center" width="5%">${other_apr_qty}</td>
																			<td align="center" width="5%">${pur_qty}</td>
																
																
															<%-- <td style="text-align: right;"><input type="text"
																name="acc_gvn_qty${gvnList.grnGvnId}"
																style="width: 50px" class="form-control"
																onkeyup="calcGvn(${gvnList.baseRate},${gvnList.grnGvnId},
																	${gvnList.sgstPer},${gvnList.cgstPer},${gvnList.cessPer},${gvnList.grnGvnQty},${qty},${gvnList.itemMrp})"
																id='acc_gvn_qty${gvnList.grnGvnId}' value="${qty}" /></td>
 --%>
															<td style="text-align: right;" id='gvnAmt${gvnList.grnGvnId}' align="left"><c:out
																	value="${gvnList.grnGvnAmt}"></c:out></td>

															<td style="text-align: right;"><a href="${url}${gvnList.gvnPhotoUpload1}"
																data-lightbox="image-1">Image 1</a></td>

															<td style="text-align: right;"><a href="${url}${gvnList.gvnPhotoUpload2}"
																data-lightbox="image-1">Image 2</a></td>

															<%-- <c:choose>
																<c:when test="${gvnList.grnGvnStatus==1}">
																	<td style="text-align: right;"><c:out value="Pending"></c:out></td>

																</c:when>

																<c:when test="${gvnList.grnGvnStatus==2}">
																	<td style="text-align: right;"><c:out
																			value="Approved From Dispatch"></c:out></td>

																</c:when>

																<c:when test="${gvnList.grnGvnStatus==3}">
																	<td style="text-align: right;"><c:out
																			value="Reject From Dispatch"></c:out></td>

																</c:when>

																<c:when test="${gvnList.grnGvnStatus==4}">
																	<td style="text-align: right;"><c:out
																			value="Approved From Saless"></c:out></td>

																</c:when>

																<c:when test="${gvnList.grnGvnStatus==5}">
																	<td style="text-align: right;"><c:out value="Reject From Sales"></c:out></td>

																</c:when>

																<c:when test="${gvnList.grnGvnStatus==6}">
																	<td style="text-align: right;"><c:out
																			value="Approved From Account"></c:out></td>

																</c:when>

																<c:when test="${gvnList.grnGvnStatus==7}">
																	<td style="text-align: right;"><c:out
																			value="Reject From Account"></c:out></td>

																</c:when>

															</c:choose> --%>
															
															
															<c:set var="statusGRN" value="NA"></c:set>
												<c:forEach items="${gStatusLst}" var="grnStatus">
												<c:if test="${grnStatus.statusValue==gvnList.grnGvnStatus}">
												<c:set var="statusGRN" value="${grnStatus.statusName}"></c:set>
												</c:if>
												</c:forEach>
													<td style="text-align: right;"><c:out value="${statusGRN}"></c:out></td>
															
															<c:choose>
																<c:when test="${gvnList.grnGvnStatus==4}">

																	<td style="text-align: right;">

																		<ul class="table-menu">

																			<li><a href="" id="callSubmit"
																				onclick="insertGrnCall(${gvnList.grnGvnId})"> <i
																					class="fa fa-check"></i></a></li>

																			<li>
																				<div class="dropdown">
																					<a class="dropdown-toggle" href="#"
																						data-toggle="dropdown"><i class="fa fa-times"></i></a>
																					<div class="dropdown-menu">
																						<div class="form">
																							<select name="acc_remark${gvnList.grnGvnId}"
																								id="acc_remark${gvnList.grnGvnId}"
																								class="form-control">
																								<c:forEach items="${remarkList}"
																									var="remarkList">
																									<option value="${remarkList.remark}">${remarkList.remark}</option>
																								</c:forEach>
																							</select> </br> <input class="btn btn-primary" value="Submit"
																								onclick="insertGrnDisAgree(${gvnList.grnGvnId})" />

																						</div>
																					</div>
																				</div>
																			</li>
																			<li>
																				<div class="dropdown">
																					<a class="dropdown-toggle" href="#"
																						data-toggle="dropdown"><i
																						class="fa fa-info-circle"></i></a>
																					<div class="dropdown-menu">
																						<div class="form">
																							Franchisee Remark
																							<textarea name="t1" readonly="readonly"
																								class="form-control"><c:out value="${gvnList.frGrnGvnRemark}"></c:out></textarea>

																						</div>
																					</div>
																				</div>
																			</li>

																		</ul>

																	</td>

																</c:when>



																<c:when test="${gvnList.grnGvnStatus==6}">

																	<td style="text-align: right;">
																		<ul class="table-menu">

																			<li><a href="" id="callSubmit"
																				class="disableClick"
																				onclick="insertGrnCall(${gvnList.grnGvnId})"> <i
																					class="fa fa-check"></i></a></li>

																			<li>
																				<div class="dropdown">
																					<a class="dropdown-toggle" href="#"
																						data-toggle="dropdown"><i class="fa fa-times"></i></a>
																					<div class="dropdown-menu">
																						<div class="form">
																							<select name="acc_remark${gvnList.grnGvnId}"
																								id="acc_remark${gvnList.grnGvnId}"
																								class="form-control">
																								<c:forEach items="${remarkList}"
																									var="remarkList">
																									<option value="${remarkList.remark}">${remarkList.remark}</option>
																								</c:forEach>
																							</select> </br> <input class="btn btn-primary" value="Submit"
																								onclick="insertGrnDisAgree(${gvnList.grnGvnId})" />

																						</div>
																					</div>
																				</div>
																			</li>
																			<li>
																				<div class="dropdown">
																					<a class="dropdown-toggle" href="#"
																						data-toggle="dropdown"><i
																						class="fa fa-info-circle"></i></a>
																					<div class="dropdown-menu">
																						<div class="form">
																							Franchisee Remark
																							<textarea name="t1" readonly="readonly"
																								class="form-control"><c:out value="${gvnList.frGrnGvnRemark}"></c:out></textarea>

																						</div>
																					</div>
																				</div>
																			</li>

																		</ul>

																	</td>

																</c:when>


																<c:when test="${gvnList.grnGvnStatus==7}">

																	<td style="text-align: right;">

																		<ul class="table-menu">

																			<li><a href="" id="callSubmit"
																				onclick="insertGrnCall(${gvnList.grnGvnId})"> <i
																					class="fa fa-check"></i></a></li>

																			<li>
																				<div class="dropdown">
																					<a class="dropdown-toggle" href="#" id="disableMe"
																						data-toggle="dropdown"><i class="fa fa-times"></i></a>
																					<div class="dropdown-menu">
																						<div class="form">
																							<select name="acc_remark${gvnList.grnGvnId}"
																								id="acc_remark${gvnList.grnGvnId}"
																								class="form-control">
																								<c:forEach items="${remarkList}"
																									var="remarkList">
																									<option value="${remarkList.remark}">${remarkList.remark}</option>
																								</c:forEach>
																							</select> </br> <input class="btn btn-primary" value="Submit"
																								onclick="insertGrnDisAgree(${gvnList.grnGvnId})" />

																						</div>
																					</div>
																				</div>
																			</li>
																			<li>
																				<div class="dropdown">
																					<a class="dropdown-toggle" href="#"
																						data-toggle="dropdown"><i
																						class="fa fa-info-circle"></i></a>
																					<div class="dropdown-menu">
																						<div class="form">
																							Franchisee Remark
																							<textarea name="t1" readonly="readonly"
																								class="form-control"><c:out value="${gvnList.frGrnGvnRemark}"></c:out></textarea>

																							Account remark
																							<textarea name="t1" readonly="readonly"
																								class="form-control">${gvnList.approvedRemarkAcc}</textarea>
																						</div>
																					</div>
																				</div>
																			</li>

																		</ul>
																	</td>

																</c:when>


																<c:otherwise>


																	<c:choose>

																		<c:when test="${gvnList.grnGvnStatus==3}">

																			<td style="text-align: right;">


																				<ul class="table-menu">

																					<li><a href="" id="callSubmit"
																						class="disableClick"
																						onclick="insertGrnCall(${gvnList.grnGvnId})">
																							<i class="fa fa-check"></i>
																					</a></li>

																					<li>
																						<div class="dropdown">
																							<a class="dropdown-toggle" href="#"
																								id="disableMe" data-toggle="dropdown"><i
																								class="fa fa-times"></i></a>
																							<div class="dropdown-menu">
																								<div class="form">
																									<select name="acc_remark${gvnList.grnGvnId}"
																										id="acc_remark${gvnList.grnGvnId}"
																										class="form-control">
																										<c:forEach items="${remarkList}"
																											var="remarkList">
																											<option value="${remarkList.remark}">${remarkList.remark}</option>
																										</c:forEach>
																									</select> </br> <input class="btn btn-primary" value="Submit"
																										onclick="insertGrnDisAgree(${gvnList.grnGvnId})" />

																								</div>
																							</div>
																						</div>
																					</li>
																					<li>
																						<div class="dropdown">
																							<a class="dropdown-toggle" href="#"
																								data-toggle="dropdown"><i
																								class="fa fa-info-circle"></i></a>
																							<div class="dropdown-menu">
																								<div class="form">
																									Franchisee Remark
																									<textarea name="t1" readonly="readonly"
																										class="form-control"><c:out value="${gvnList.frGrnGvnRemark}"></c:out></textarea>

																									Dispatch remark
																									<textarea name="t1" readonly="readonly"
																										class="form-control">${gvnList.approvedRemarkGate}</textarea>
																								</div>
																							</div>
																						</div>
																					</li>

																				</ul>
																			</td>

																		</c:when>



																		<c:when test="${gvnList.grnGvnStatus==5}">

																			<td style="text-align: right;">


																				<ul class="table-menu">

																					<li><a href="" id="callSubmit"
																						class="disableClick"
																						onclick="insertGrnCall(${gvnList.grnGvnId})">
																							<i class="fa fa-check"></i>
																					</a></li>

																					<li>
																						<div class="dropdown">
																							<a class="dropdown-toggle" href="#"
																								id="disableMe" data-toggle="dropdown"><i
																								class="fa fa-times"></i></a>
																							<div class="dropdown-menu">
																								<div class="form">
																									<select name="acc_remark${gvnList.grnGvnId}"
																										id="acc_remark${gvnList.grnGvnId}"
																										class="form-control">
																										<c:forEach items="${remarkList}"
																											var="remarkList">
																											<option value="${remarkList.remark}">${remarkList.remark}</option>
																										</c:forEach>
																									</select> </br> <input class="btn btn-primary" value="Submit"
																										onclick="insertGrnDisAgree(${gvnList.grnGvnId})" />

																								</div>
																							</div>
																						</div>
																					</li>
																					<li>
																						<div class="dropdown">
																							<a class="dropdown-toggle" href="#"
																								data-toggle="dropdown"><i
																								class="fa fa-info-circle"></i></a>
																							<div class="dropdown-menu">
																								<div class="form">
																									Franchisee Remark
																									<textarea name="t1" readonly="readonly"
																										class="form-control"><c:out value="${gvnList.frGrnGvnRemark}"></c:out></textarea>

																									Store remark
																									<textarea name="t1" readonly="readonly"
																										class="form-control">${gvnList.approvedRemarkStore}</textarea>
																								</div>
																							</div>
																						</div>
																					</li>

																				</ul>

																			</td>


																		</c:when>


																		<c:otherwise>

																			<td style="text-align: right;">

																				<ul class="table-menu">

																					<li><a href="" id="callSubmit"
																						class="disableClick"
																						onclick="insertGrnCall(${gvnList.grnGvnId})">
																							<i class="fa fa-check"></i>
																					</a></li>

																					<li>
																						<div class="dropdown">
																							<a class="dropdown-toggle" href="#"
																								id="disableMe" data-toggle="dropdown"><i
																								class="fa fa-times"></i></a>
																							<div class="dropdown-menu">
																								<div class="form">
																									<select name="acc_remark${gvnList.grnGvnId}"
																										id="acc_remark${gvnList.grnGvnId}"
																										class="form-control">
																										<c:forEach items="${remarkList}"
																											var="remarkList">
																											<option value="${remarkList.remark}">${remarkList.remark}</option>
																										</c:forEach>
																									</select> </br> <input class="btn btn-primary" value="Submit"
																										onclick="insertGrnDisAgree(${gvnList.grnGvnId})" />

																								</div>
																							</div>
																						</div>
																					</li>
																					<li>
																						<div class="dropdown">
																							<a class="dropdown-toggle" href="#"
																								data-toggle="dropdown"><i
																								class="fa fa-info-circle"></i></a>
																							<div class="dropdown-menu">
																								<div class="form">
																									Franchisee Remark
																									<textarea name="t1" readonly="readonly"
																										class="form-control"><c:out value="${gvnList.frGrnGvnRemark}"></c:out></textarea>

																								</div>
																							</div>
																						</div>
																					</li>

																				</ul>

																			</td>


																		</c:otherwise>


																	</c:choose>


																</c:otherwise>
															</c:choose>
														</tr>

													</c:forEach>

												</tbody>
	</table>
</div>


								
										<!-- this is for ajax call<input type="submit" class="btn btn-primary" value="Submit"
										id="callSubmit" onclick="callSubmitGrn(); getGrnId();"> -->

	<div style="display: inline-block; width:100%; margin:15px 0 0 0;">
 <label style="float: left;" class=" control-label franchisee_label"><input type="checkbox" name="isDateUpdate" value="1">&nbsp; GRN Date</label>
						<div class="col-sm-3 col-lg-2 controls">
						
										<input class="form-control date-picker" id="date" size="19" placeholder="dd-mm-yyyy"
											type="text" name="date" value="${grnDate}" required/>
									</div>
										<div
											class="col-sm-2 col-sm-offset-0 col-lg-2 col-lg-offset-0">
											<input type="submit" value="Submit"  disabled="disabled" class="btn btn-primary" id="submitGvn">


										</div></div>
										<!-- </form> -->

									</div>
								</div>

							</form>
						</div>
					</div>
				</div>
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

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap/js/lightbox.js"></script>
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


	<!-- insertGrnDisAgree -->
	<script type="text/javascript">
	function calcGvn(baseRate,grnId,sgstPer,cgstPer,cessPer,gvnQty,curQty,discPer,purQty,otherAprQty){
		
		
		//alert("HII");
			
			var grandTotal;
			var aprTotalTax;
			
			var aprTaxableAmt;
			
			checkQty(grnId,gvnQty,curQty,purQty,otherAprQty);//Calling another function 

			
			var gvnQty=$("#acc_gvn_qty"+grnId).val();
			//alert(gvnQty);
			
			//var gvnAmt=parseFloat(acc_gvn_qty)*parseFloat(baseRate);
			//alert(gvnAmt);
			//$("#gvn_amt"+itemId).html(gvnAmt.toFixed(2));

			 var taxableAmt=baseRate*gvnQty;
			 
			 var discAmt=(taxableAmt*discPer)/100;
			 taxableAmt=taxableAmt-discAmt;
				
				var totalTax=(taxableAmt*(sgstPer+cgstPer+cessPer))/100;
				
				var grandTotal=taxableAmt+totalTax;	
				
				
				document.getElementById('gvnAmt'+grnId).innerText=grandTotal.toFixed(2);

		}


function calcGvn1(baseRate,grnId,sgstPer,cgstPer,cessPer,gvnQty,curQty,discPer){
	
	
//alert("HII");
	
	var grandTotal;
	var aprTotalTax;
	
	var aprTaxableAmt;
	
	checkQty(grnId,gvnQty,curQty);//Calling another function 

	
	var gvnQty=$("#acc_gvn_qty"+grnId).val();
	//alert(gvnQty);
	
	//var gvnAmt=parseFloat(acc_gvn_qty)*parseFloat(baseRate);
	//alert(gvnAmt);
	//$("#gvn_amt"+itemId).html(gvnAmt.toFixed(2));

	 var taxableAmt=baseRate*gvnQty;
	 
	 var discAmt=(taxableAmt*discPer)/100;
	 taxableAmt=taxableAmt-discAmt;
		
		var totalTax=(taxableAmt*(sgstPer+cgstPer+cessPer))/100;
		
		var grandTotal=taxableAmt+totalTax;	
		
		
		document.getElementById('gvnAmt'+grnId).innerText=grandTotal.toFixed(2);

}

</script>

	<script type="text/javascript">


function insertGrnDisAgree(grnGvnId){
//alert("second function called ");
var grnId=grnGvnId;
var approve_acc_login=$("#approve_acc_login"+grnGvnId).val();
var acc_remark=$("#acc_remark"+grnId).val();
var acc_gvn_qty=$("#acc_gvn_qty"+grnGvnId).val();
var headerId=$("#headerId").val();


if($("#acc_remark"+grnGvnId).val() == ''){
	alert("Please Enter Grn Remark!");
	
}
else{
	
	
	$.getJSON('${insertAccGvnProcessDisAgree}',
			{
			
			grnId : grnId,
			approveAccLogin : approve_acc_login,
			accRemark : acc_remark,	
			acc_gvn_qty : acc_gvn_qty,
			headerId : headerId,

				ajax : 'true',
			

			}
);


	




callRefreshDisAgree();
/* callSecondRefresh();
callThirdRefresh();
callfourthRefresh(); */
}
}


</script>

	<script type="text/javascript">
function callRefreshDisAgree(){
	
		alert("DisApproved Successfully");
		window.location.reload();
	//document.getElementById("validation-form").reload();
	}

</script>



	<!-- insertGrnDisAgree -->


	<!-- insertGrnAgree -->

	<script type="text/javascript">


function insertGrnCall(grnGvnId){
//alert("second function called ");
var grnId=grnGvnId;
var approve_acc_login=$("#approve_acc_login"+grnGvnId).val();
var acc_remark=$("#acc_remark"+grnGvnId).val();
var acc_gvn_qty=$("#acc_gvn_qty"+grnGvnId).val();

var headerId=$("#headerId").val();

/* alert(grnId);
alert(approve_gate_login); */

	

	$.getJSON('${insertAccGvnProcessAgree}',
							{
							
							grnId : grnId,
							approveAccLogin:approve_acc_login,
							acc_gvn_qty : acc_gvn_qty,
							headerId : headerId,
								ajax : 'true',
							
	 complete: function() {
	       //alert("ajax completed");
	       
 	  }
}
);

callRefresh();
/* callSecondRefresh();
callThirdRefresh();
callfourthRefresh(); */
}


</script>

	<script type="text/javascript">
function callRefresh(){
	alert("Approved Successfully");
		window.location.reload();
	//document.getElementById("validation-form").reload();
	}

</script>




	<!-- insertGrnAgree -->


	<script>
var acc = document.getElementsByClassName("accordion");
var i;

for (i = 0; i < acc.length; i++) {
  acc[i].onclick = function() {
    this.classList.toggle("active");
    var panel = this.nextElementSibling;
    if (panel.style.maxHeight){
      panel.style.maxHeight = null;
    } else {
      panel.style.maxHeight = panel.scrollHeight + "px";
    } 
  }
}
</script>


	<script type="text/javascript">

function showGateGvnDetails(){
	

		var fromDate=$("#from_date").val();
	
		var toDate=$("#to_date").val();
		
		alert(fromDate);
		alert(toDate);
		
		$.getJSON('${showGateGvnDetails}',
				{
				
				from_date :fromDate,
				to_date	: toDate,
					
					ajax : 'true',
				
				});


}

</script>



	<script type="text/javascript">

function getDate(){
	
	
	var fromDate=$("#from_date").val();
	var toDate=$("#to_date").val();
	
	
	
	
	$.getJSON('${getDateForGvnAcc}',
			{
			
			fromDate : fromDate,
			toDate:toDate,
				
				ajax : 'true',

}
);

	
}


</script>

	<script>
	$(document).ready(function(){
	    //Handles menu drop down
	    $('.dropdown-menu').find('.form').click(function (e) {
	        e.stopPropagation();
	    });
	});
</script>

	<script type="text/javascript">
function checkQty1(grnId,gvnQty,qty){
	//alert("JJJ");
	var entered=$("#acc_gvn_qty"+grnId).val();
	//alert("received = " +entered);
	if(entered>gvnQty){
		alert("Can not Enter Qty Greater than Gvn Qty ");
		document.getElementById("acc_gvn_qty"+grnId).value=qty;
	}
}

function checkQty(grnId,gvnQty,qty,purQty,otherAprQty){
	//alert("JJJ");
	var entered=$("#acc_gvn_qty"+grnId).val();
	//alert("received = " +entered);
	if(entered>gvnQty){
		alert("Can not Enter Qty Greater than Gvn Qty ");
		document.getElementById("acc_gvn_qty"+grnId).value=qty;
	}
	
	var maxAllowQty=purQty-otherAprQty;
	//alert(maxAllowQty)
	if(entered>maxAllowQty){
		alert("Can not Approve Qty Greater than Purchase Qty ");
		document.getElementById("acc_gvn_qty"+grnId).value=maxAllowQty;
	}
}

</script>

	<script>
	
		function selectedGvn(source) {
			checkboxes = document.getElementsByName('select_to_agree');
			$.getJSON('${getGvnStatus}', {
				
				ajax : 'true'
			}, function(data) {
				
				for(var i=0;i<data.length;i++){
					checkboxes[data[i]].checked = source.checked;
				}
			});	
				
		/* checkboxes = document.getElementsByName('select_to_agree');
			
			for (var i = 0, n = checkboxes.length; i < n; i++) {
				checkboxes[i].checked = source.checked;
				
			} */
			
			
		}
		
	</script>
	<script type="text/javascript">
	  $(document).on('change', 'input[type="checkbox"]', function(e){
	    	var flag=0;
	    	$('[name="select_to_agree"]').each( function (){
	    		
	            if($(this).prop('checked') == true){
	            	flag=1;
	            }
	    	});
	            if(flag==1)
	            	{
	            	document.getElementById("submitGvn").disabled=false;

	            	}else{
		            	document.getElementById("submitGvn").disabled=true;

	            	}
	        
	    });


	</script>

</body>
</html>