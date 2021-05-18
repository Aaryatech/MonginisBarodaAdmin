  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/tableSearch.css">
  <div class="col-md-9" ></div> 
					<label for="search" class="col-md-3 search_align" id="search"><!-- style="border-radius: 25px;" -->
    <i class="fa fa-search"></i>
									<input type="text"  id="myInput" onkeyup="myFunction()"  placeholder="Search.." title="Type in a name">
										</label>  
<script>
		$(document).ready(function(){
		  $("#myInput").on("keyup", function() {
		    var value = $(this).val().toLowerCase();
		    $("#table1 tbody tr").filter(function() {
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
  <script>
function myFunction() {
  var input, filter, table, tr, td, i;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  
  if (!document.getElementById('table1')){
	    
	    table = document.getElementById("table_grid");
	}
  else{
  table = document.getElementById("table1");
  }
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