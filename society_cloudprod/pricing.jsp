<%@include file="config.jsp" %>
<html>
<head>
 	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common/en_US/index.css" />
 	<%@include file="metaFile.jsp"%>
	<title>Society Management System :: Pricing</title>
	<%String currentPage="pricing";%>
</head>
<body>
<div class="contentBg">
	<div class="center">

		<%@include file="header.jsp" %>
		<div class="content">
			<div id="primaryContentDiv">
			  <h1>OUR PRICING</h1>
			  <span>HOW MUCH IS THIS APARTMENT MANAGEMENT SOFTWARE?</span>
			  
	          <h3>Keeping things simple is our #1 goal. We don't overwhelm you with lots of confusing pricing options and make you pay a premium.</h3>
			  <h4> For Societies / Complexes with Active Owners Association</h4>
			  <p>LinkApartment.com is a hosted solution and is offered as a annual subscription to Societies / Associations / Facility Management Firms</p>
	
			  <p>The price of using Link Apartment depends upon the number of residential units* in your complex.
			  Typical pricing for a Society / Complex with around <strong>25 residential units</strong> would be <i><strong>Rs. 250/- per month</strong></i> for full-featured access to Link Apartment.</p>
			  <p>We are confident you will be delighted with the price for the rich feature set Link Apartment offers.</p>
	          <p><i><strong>We offer 30-day no-obligation free trial for all complexes.</strong></i> 
	          	
	          <!-- <p><strong>Money Back Gaurantee:</strong> In an unlikely event that you do not like Link Apartment after you paid the money - you can discontinue the usage any time and we guarantee that we would refund the money on a pro-rata basis for the unused period. You truly pay what you use for. So, what are you waiting for? Register your complex</strong></a>, NOW.</p> -->
	          <p><small>* - A Residential Unit is a single flat / apartment / plot / villa / house.</small></p>
	       	  
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