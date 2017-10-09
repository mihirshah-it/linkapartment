<%@include file="config.jsp" %>
<html>
<head>
 	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common/en_US/index.css" />
  	<%@include file="metaFile.jsp"%>
	<title>Society Management System :: FAQs</title>
	<%String currentPage="faq";%>
</head>
<body>
<div class="contentBg">
	<div class="center">

		<%@include file="header.jsp" %>
		<div class="content">
		<div id="primaryContentDiv" class="faq">
		
		  <h1>FAQs</h1>
          <span>FREQUENTLY ASKED QUESTIONS</span>
        
          <h2 class="opentag"><div class="icon question"></div>What is Link Apartment?</h2>
          <p class="opentagcont">Link Apartment is a web portal that provides tools to effectively manage and easily maintain the various aspects of your residential complex, be it Apartment Complexes, Private Layouts, Row houses, Villas or even a Colony. Your Association can register with Link Apartment and create an online space for your community to manage the association activities. </p>
          
          <h2 class="opentag"><div class="icon question"></div>I want to Register my apartment complex or layout with Link Apartment. What are my next steps?</h2>
          <p class="opentagcont">Please register your complex / layout <a href="https://www.LinkApartment.com/common_public/new_register_complex">here</a>  by filling in the details. Soon after you submit your request, support team from Link Apartment would reach out to you to set up your complex's private, secure portal in Link Apartment in less than one business day. </p>
          
          <h2 class="opentag"><div class="icon question"></div>Our Complex is still underconstruction (OR) We are yet to form an association / society for our complex. Can we still use Link Apartment?</h2>
          <p class="opentagcont">Yes. We asbolutely understand the importance of all owners having a common platform to discuss topcis related to thier complex even before as association is formed and funds are available. Thus, we offer Link Apartment for complexes who are yet to take posession or yet to form an association free of cost. You just need to register your complex <a href="https://www.LinkApartment.com/common_public/new_register_complex">here</a> and once your association is formed you can upgrade to a to fully featured version of Link Apartment to meet the enhanced needs of the association. For more details, please visit our <a href="https://www.LinkApartment.com/pricing">pricing</a> page. </p>

          <h2 class="opentag"><div class="icon question"></div>What is the price for using Link Apartment?</h2>
          <p class="opentagcont">Link Apartment is free to use for complexes where owner associations are yet to be formed. For complexes with active associations or under maintenance by the property developer, we offer prices that are dependent on number of units (flats/plots/houses) in your complex. Prices start from as low as Rs. 249/- per month. Please visit our <a href="https://www.LinkApartment.com/pricing">pricing</a> page to know more details. We offer a free, no-obligation 30-day trial for all complexes. You can try the features before you subscribe to Link Apartment.</p>

          <h2 class="opentag"><div class="icon question"></div>Should we pay after trial period, if we do not use Link Apartment after the trial?</h2>
          <p class="opentagcont">No. If you decide not to use Link Apartment after your 30-day trial, you need not pay. This is a no-obligation trial.</p>
          
	      <h2 class="opentag"><div class="icon question"></div>How can the Owners / Residents Association Management Committees use Link Apartment?</h2>
          <p class="opentagcont">Link Apartment provides a host of Administration tools/features that helps the association management committees to ensure smooth functioning of the complex. Please find the tools that are currently available by visiting at the features section <a href="https://www.LinkApartment.com/apartment-management-accounting-software">here</a>. </p>

          <h2 class="opentag"><div class="icon question"></div>How can individual Owners / Residents use Link Apartment?</h2>
          <p class="opentagcont">Link Apartment brings together the owners/residents on to a common platform and promotes community living. Please visit the features section <a href="https://www.LinkApartment.com/apartment-management-accounting-software">here</a> to know how you can benefit from Link Apartment as a owner/resident. </p>

          <h2 class="opentag"><div class="icon question"></div>What type of support is offered by Link Apartment?</h2>
          <p class="opentagcont">Link Apartment helps you with initial setup to load your complex details and past data (such as member data, past expenses, assets, vehicles, parking lots), email support, training your estate manager and staff. </p>

          <h2 class="opentag"><div class="icon question"></div>Will you refund the money if we decide not to use Link Apartment in future?</h2>
          <p class="opentagcont">In an unlikely event that you decide not to use Link Apartment, the money you have paid will be refunded on a pro-rata basis for unused period. For example, you have signed up and paid for 12 months and then decided not to use at the end of 5th month, the amount of 7 months shall be refunded. You only pay for what you use. </p>
          
          <h2 class="opentag"><div class="icon question"></div>Is our Data Secure and Confidential on Link Apartment?</h2>
          <p class="opentagcont">Absolutely Yes. Link Apartment uses industry standard security practices to protect your data.<br /><br />

		  Link Apartment uses Secure Socket Layer(SSL) technology to encrypt the entire transmission of data between your browser and the our server.<br /><br />In addition, Link Apartment has strict user access control in place - the information of your complex is only visible to the members of your community and not other users of Link Apartment, unless you chose to make it public. Even within the same community, the information is visible based on the roles of the user. Only administrators can view all the information related to the community. Members with other roles can see only that information that is needed.<br /><br />
		  Moreover, the data storage of your data is in a word class Data Center implementing highest security standards to ensure peace of mind to you.</p>
         
          <h2 class="opentag"><div class="icon question"></div>What happens to our Data if we decide not to use Link Apartment in future?</h2>
          <p class="opentagcont">In an unlikely event that you decide to discontinue the use of Link Apartment, the administrator will have the option of downloading data of the complex. Post the confirmation from the administrator, we would permanently delete the data of the complex from our servers. </p>
          
          </div>
		<div class="pricingDiv"></div>
		<div class="contactUsDiv"></div>
		</div>
	</div>
</div>
<%@include file="footer.jsp" %>
</body>
<script src="<%=request.getContextPath()%>/js/index.js" type="text/javascript"></script>
<script type="text/javascript">initFaq();</script>
</html>