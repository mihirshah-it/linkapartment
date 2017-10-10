<%@include file="../common/config.jsp" %>
<html>
<HEAD>
   <TITLE>test</TITLE> 
<style>
body {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 16px;
	margin-top: 10px;
}

ul {
	margin: 0;
}

#contentWrap {
	width: 700px;
	margin: 0 auto;
	height: auto;
	overflow: hidden;
}

#contentTop {
	width: 600px;
	padding: 10px;
	margin-left: 30px;
}

#contentLeft {
	float: left;
	width: 400px;
}

#contentLeft li {
	list-style: none;
	margin: 0 0 4px 0;
	padding: 10px;
	background-color:#00CCCC;
	border: #CCCCCC solid 1px;
	color:#fff;
}


	

#contentRight {
	float: right;
	width: 260px;
	padding:10px;
	background-color:#336600;
	color:#FFFFFF;
}

</style>    
</HEAD>
<body>

<div id="contentWrap">

		<div id="contentLeft">
			<ul>
				<% for (long i=0;i<10;i++) { %>
					<li id="recordsArray_<%=i%>">Name <%=i %></li>
				<% } %>
			</ul>
		</div>
		
		<div id="contentRight">
		  <p>Array will be displayed here.</p>
		  <p>&nbsp; </p>
		</div>
	
</div>
</body>

<script>
$(document).ready(function(){ 
	   
	$(function() {
		$("#contentLeft ul").sortable({ opacity: 0.6, cursor: 'move', update: function() {
			var order = $(this).sortable("serialize") + '&action=updateRecordsListings'; 
			alert(order);
			/*
			$.post("updateDB.php", order, function(theResponse){
				$("#contentRight").html(theResponse);
			}); 
			*/
		}								  
		});
	});
	

});	
</script>
</html>