<%@include file="config.jsp" %>
<html>
<head>
 	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common/en_US/index.css" />
  	<%@include file="metaFile.jsp"%>
	<title>Society Management System :: Contact US</title>
	<%String currentPage="contactUs";%>
</head>
<body>
<div class="contentBg">
	<div class="center">

		<%@include file="header.jsp" %>
		<div class="content">
			<div id="primaryContentDiv">
				<h1>Contact Us</h1>
				<p>If you are looking for a demo or a trial to understand Link Apartment.com features better, please call or mail on below details. Link Apartment.com will reply to you in 24 hours.</p>
				<p>Email us at support@LinkApartment.com for all support related queries.</p>
				<p>Contact us at +91-996-703-4657</p>				
			</div>
			
		</div>
	</div>
</div>
<%@include file="footer.jsp" %>
</body>
<script src="<%=request.getContextPath()%>/js/index.js" type="text/javascript"></script>
</html>