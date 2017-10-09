<%@include file="config.jsp" %>
<html>
<head>
 	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common/en_US/index.css" />
  	<%@include file="metaFile.jsp"%>
	<title>Society Management System</title>
	<%String currentPage="package";%>
</head>
<body>
<div class="contentBg">
	<div class="center">

		<%@include file="header.jsp" %>
		<div class="content">
			<div id="primaryContentDiv">
				<div class="package">
					<h2>Premium Account</h2>
					<div class="ribbon blue"></div>
					<p><b>Full-features access</b></p>
					<p>Resident Community | Society Management | Resident Management | Recurring Billing | Society Accounting | Secured Network | Help / Support | Utilities </p>
				</div>				
			</div>
			<!-- <div class="pricingDiv"></div>
			<div class="contactUsDiv"></div> -->
			
		</div>
	</div>
</div>
<%@include file="footer.jsp" %>
</body>
<script src="<%=request.getContextPath()%>/js/index.js" type="text/javascript"></script>
</html>