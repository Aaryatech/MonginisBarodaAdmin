<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<body>

	<jsp:include page="/WEB-INF/views/include/logout.jsp"></jsp:include>

	<c:url var="getBillList" value="/getReportItemwise"></c:url>
	<c:url var="getFlavourBySpfId" value="/getFlavourBySpfId" />
    <c:url var="searchFConf"  value="/findFlConf" />
    <c:url var="showAllSpSelected" value="/showAllSpSelected" />

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
					<i class="fa fa-file-o"></i>Flavor Configuration
				</h1> -->
				<h4></h4>
			</div>
		</div>
		<!-- END Page Title -->

		<!-- BEGIN Breadcrumb -->
		<%-- <div id="breadcrumbs">
			<ul class="breadcrumb">
				<li><i class="fa fa-home"></i> <a
					href="${pageContext.request.contextPath}/home">Home</a> <span
					class="divider"><i class="fa fa-angle-right"></i></span></li>
				<li class="active">HSN Report</li>
			</ul>
		</div> --%>
		<!-- END Breadcrumb -->

		<!-- BEGIN Main Content -->
		<div class="box">
			<div class="box-title">
				<h3>
					<i class="fa fa-bars"></i>Special Flavour Configuration 
				</h3>
	                 <div class="box-tool">
								<a href="${pageContext.request.contextPath}/flConfList">Special Flavour Configuration List</a>
								<a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a>
							</div>
			</div>

			<div ><!-- class="box-content" -->
				<!-- <div align="center" id="loader" style="display: none">

						<span>
							<h4>
								<font color="#343690">Loading</font>
							</h4>
						</span> <span class="l-1"></span> <span class="l-2"></span> <span
							class="l-3"></span> <span class="l-4"></span> <span class="l-5"></span>
						<span class="l-6"></span>
					</div> -->
					
				<div class="frm_Sec_one single">
					<div class="row">
						<div class="col-md-4 box_marg">
							<label class="control-label left">Select Sp Cake</label>
								<div class="controls icon_add">
									<i class="fa fa-shopping-cart frm_icon" aria-hidden="true"></i>
									<select data-placeholder="Choose Sp Cake"
								class="form-control padd_left chosen" tabindex="6" id="selectSp"	multiple="multiple"  name="selectSp" onchange="showAllSpSelected(this.value)">

								<option value=""disabled="disabled">Select Sp Cake</option>
								<option value="-1">ALL</option>
								
								<c:forEach items="${specialCakeList}" var="sp"
									varStatus="count">
									<option value="${sp.spId}"><c:out value="${sp.spName}" /></option>
								</c:forEach> 
							</select>
							
									
									</div>
						</div>
						
						<div class="col-md-4 box_marg">
							<label class="control-label left">Flavour</label>
								<div class="controls icon_add">
									<i class="fa fa-leaf frm_icon" aria-hidden="true"></i>
									<select data-placeholder="Choose Flavor"
								class="form-control padd_left chosen" tabindex="6" multiple="multiple" id="spFlavour"	name="spFlavour">
							 <option value="" disabled="disabled">Select Flavor</option>
							  <option value="${strFlavours}" >ALL</option>
							 <c:forEach items="${flavoursList}" var="fl"
									varStatus="count">
									<option value="${fl.spfId}"><c:out value="${fl.spfName}" /></option>
							</c:forEach> 
							</select>
									</div>
						</div>
						
						<div class="col-md-4 box_marg">
							<div class="row three_buttons one_row" style="padding:26px 0 0 0;">
								<button class="btn btn-primary" onclick="searchConf()">Search</button>
									<button type="button" class="btn btn-primary" onclick="window.location.reload()" >Cancel</button>
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
	<div class="box">
			<div class="box-title">
				<h3>
					<i class="fa fa-list-alt"></i>Special Flavour Configuration List
				</h3>
			</div>
			<form id="saveFlavourConf" onsubmit="submitFl.disabled = true; return confirm('Do you want to Save ?');"
				action="${pageContext.request.contextPath}/saveFlavourConf"
				method="post">
				<input type="hidden" name="sp" id="sp" value="0"/><input type="hidden" name="fl" id="fl" value="0"/>
				<div class=" box-content">
					
					
					<div class="tableFixHead">
      <table id="table_grid"> 
        <thead>
          <thead style="background-color: #f3b5db;">
				<tr>
					<th style="text-align: center;" width="70">Sr.No.</th>
					<th style="text-align: left;">Flavour Name</th>
					<th style="text-align: left;">Mrp 1</th>
					<th style="text-align: left;">Mrp 2</th>
					<th style="text-align: left;">Mrp 3</th>
				</tr>
			</thead>
        <tbody>
	</tbody>
      </table>
    </div>
					
					
					<div class="form-group">
						<div class=" three_buttons" style="padding: 15px 0 0 0 ;"> 
						<input class="btn btn-primary"  value="Submit" onclick="callSubmit()" disabled="disabled" type="submit" id="submitFl" name="submitFl" >
						<button type="button" class="btn btn-primary">Cancel</button>
						</div>
					</div>
	
				</div>
			</form>
		</div>
		<jsp:include page="/WEB-INF/views/include/copyrightyear.jsp"></jsp:include>
		
	</div>
	<!-- END Main Content -->

	
	<a id="btn-scrollup" class="btn btn-circle btn-lg" href="#"><i
		class="fa fa-chevron-up"></i></a>


	<script type="text/javascript">
		function searchConf() {
			var spFlavour = $("#spFlavour").val();
			var selectSp = $("#selectSp").val();
			document.getElementById("fl").value=spFlavour;
			document.getElementById("sp").value=selectSp;
			$('#loader').show();

			$.getJSON(
							'${searchFConf}',
							{
								spFlavour: JSON.stringify(spFlavour),
								ajax : 'true'
							},
							function(data) {
								$('#loader').hide();
                             	$('#table_grid td').remove();
								document.getElementById("submitFl").disabled=false;


								if (data == "") {
									alert("No records found !!");
									document.getElementById("submitFl").disabled=true;
								}

								$
										.each(
												data,
												function(key, report) {
	                                              var index = key + 1;

													var tr = $('<tr></tr>');

													tr.append($('<td style="text-align:center;"></td>')
															.html(key + 1));

													tr
															.append($('<td style="text-align:left;"></td>').html(report.spfName));

													/* tr
													.append($(
															'<td  style="text-align:right;"></td>')
															.html("<input type=number oninput='return calcRate(this.value,"+report.spfId+")'  ondrop='return false;' onpaste='return false;' style='text-align: right;' class='form-control' min=0 id=mrp"+report.spfId+" name=mrp"+report.spfId+" Value=0  >"));
						
													tr
															.append($(
																	'<td  style="text-align:right;"></td>')
																	.html("<input type=number onkeypress='return IsNumeric(event);'  ondrop='return false;' onpaste='return false;' style='text-align: right;' class='form-control' min=0 id=rate"+report.spfId+" name=rate"+report.spfId+" Value=0  >"));
 */
 
 tr
	.append($(
			'<td style="text-align:left;"></td>')
			.html("<input type=number oninput='return calcRate1(this.value,"+report.spfId+")'  ondrop='return false;' onpaste='return false;' class='form-control' min=0 id=mrp1"+report.spfId+" name=mrp1"+report.spfId+" Value=0  >"));

	tr
			.append($(
					'<td style="text-align:left;"></td>')
					.html("<input type=number onkeypress='return IsNumeric(event);'  ondrop='return false;' onpaste='return false;' class='form-control' min=0 id=mrp2"+report.spfId+" name=mrp2"+report.spfId+" Value=0  >"));

	tr
	.append($(
			'<td style="text-align:left;"s></td>')
			.html("<input type=number onkeypress='return IsNumeric(event);'  ondrop='return false;' onpaste='return false;' class='form-control' min=0 id=mrp3"+report.spfId+" name=mrp3"+report.spfId+" Value=0  >"));
			

													$('#table_grid tbody')
															.append(tr);

												})

								
							});

		}
	</script>
    <script type="text/javascript">

			function spTypeChange(spType) {
			
				$.getJSON('${getFlavourBySpfId}', {
					spType : spType,
					ajax : 'true'
				}, function(data) {
					var html = '<option value="">Select Flavour</option>';
					//alert(JSON.stringify(data));
					var len = data.length;
					
					for ( var i = 0; i < len; i++) {
						html += '<option value="' + data[i].spfId + '">'
								+ data[i].spfName + '</option>';
					}
					html += '</option>';
					$('#spFlavour').html(html);
				    $("#spFlavour").trigger("chosen:updated");

				});
			}
     </script>
     <script type="text/javascript">
     function showAllSpSelected(spId)
     {
      	 if(spId==-1){
      		$('#loader').show();
    	 $.getJSON('${showAllSpSelected}', {
				ajax : 'true'
			}, function(data) {
				var html = '<option value="-1">ALL</option>';
				 html += '<option value="0">Clear Selection</option>';
				//alert(JSON.stringify(data));
				var len = data.length;
				
				for ( var i = 0; i < len; i++) {
					html += '<option value="' + data[i].spId + '" selected>'
							+ data[i].spName + '</option>';
				}
				html += '</option>';
				$('#selectSp').html(html);
			    $("#selectSp").trigger("chosen:updated");
				$('#loader').hide();
			});
    	 }else if(spId==0){
    		 $("#selectSp option:selected").removeAttr("selected");
    	    	$("#selectSp").trigger("chosen:updated");
    	    	$('#loader').hide();
    	 }
      	//$('#loader').hide();
     }
     </script>
     <script type="text/javascript">
     function calcRate(mrp,spfId)
     {
    	 var rate=mrp-(mrp*21/100);
    	 document.getElementById("rate"+spfId).value=rate;
    	 
     }
     function clearSpSelected(){
    	// $("select#selectSp").attr('selectedIndex', 0);
    	
    	    //$("#selectSp").val(null).trigger("change"); 
    	$("#selectSp option:selected").removeAttr("selected");
    	$("#selectSp").trigger("chosen:updated");

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