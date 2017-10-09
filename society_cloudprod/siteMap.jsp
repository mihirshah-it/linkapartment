<%@include file="config.jsp" %>
<html>
<head>
 	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common/en_US/index.css" />
  	<%@include file="metaFile.jsp"%>
	<title>Society Management System</title>
	<%String currentPage="siteMap";%>
</head>
<body>
<div class="contentBg">
	<div class="center">
		
		<%@include file="header.jsp" %>
		<div class="content">
			
			<div id="primaryContentDiv" style="height: 500px;">
				<h1>Site Map</h1>
            	<span>all pages Links for better SEO</span>
			</div>
			<div class="pricingDiv"></div>
			<div class="contactUsDiv"></div>
		</div>
	</div>
</div>
<%@include file="footer.jsp" %>
</body>
<script src="<%=request.getContextPath()%>/js/index.js" type="text/javascript"></script>
</html>