<%@include file="config.jsp" %>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]>
<html class="no-js ie8" lang="en"> <![endif]-->
<!--[if IE 9 ]>
<html class="no-js ie9" lang="en"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html class="no-js" lang="en" xmlns="http://www.w3.org/1999/xhtml"> <!--<![endif]-->
<head lang="en">
    <%@include file="metaFile.jsp"%>
</head>

<body class="cssAnimate boats ct-navbar--toFixed ct-navbar--toMotive">
	 <!-- Preloader -->
<!--<div class="ct-preloader-container">                                           
    <div class='ct-preloader'><div><div><div><div><div><div><div><div><div><div></div></div></div></div></div></div></div></div></div></div></div>
</div>-->

<%@include file="topbar.jsp"%>
<%@include file="menu.jsp"%>


<div id="home" class="section ct-slick ct-js-slick" data-adaptiveHeight="true" data-animations="true" data-autoplay="true" data-infinite="true" data-autoplaySpeed="6000" data-draggable="false" data-touchMove="false" data-arrows="true" data-items="1">
       <div class="item" data-bg="./assets/images/bg-02.jpg">
           <div class="item-inner">
               <div class="ct-slick-image">
                   <img  src="assets/images/slideImage-01.png">
               </div>
               <div class="ct-slick-content">
                   <div class="row"> 
                       <div class="col-md-12 txt-center col-sm-6"><img class="animated" src="assets/images/link.jpg" alt="" data-fx="bounceInRight" data-time="50">
                           
                       </div>
					</div>
					<div class="row">
						<div class="col-md-3 txt-center col-sm-6">
                           <input type="button" value="Member Login" class="btn btn-sm btn-motive custom-btn-banner" onclick="javascript:loginPage();">
                       </div>
                       <div class="col-md-3 txt-center col-sm-6">
                           <input type="button" value="Committee Login" class="btn btn-sm btn-motive custom-btn-banner" onclick="javascript:loginPage();">
                       </div>
                       <div class="col-md-3 txt-center col-sm-6">
                           <input type="button" value="Consultant Login" class="btn btn-sm btn-motive custom-btn-banner" onclick="javascript:loginPage();">
                       </div>
                       <div class="col-md-3 txt-center col-sm-6">
                           <input type="button" value="Guest Login" class="btn btn-sm btn-motive custom-btn-banner" onclick="javascript:loginPage();">
                       </div>
                   </div>
               </div>
           </div>
       </div>
</div>


<section id="about"  class="section ct-u-marginTop90 ct-u-paddingBottom10">
    <div class="container">

        <div class="ct-sectionHeader ct-u-marginBottom50 ct-u-paddingTop90">
            <h2 class="ct-sectionHeader-title"><small>Welcome to <span>Link Apartment</span></small></h2>
            <div class="ct-sectionHeader-separator">
                <span class="minus"></span>
                <span class="slash">/</span>
                <span class="slash">/</span>
                <span class="minus"></span>
            </div>
            <p>100% web-based value-for-money hosted software service offering Accounting, Management and Communication tools for societies of commercial co-operative housing apartment owners associations and property management</p>
        </div>

		<div class="row">
            <div class="col-sm-12 ct-u-marginBottom50">
			<p>Link Apartment is a web-based, value-for-money, hosted software service offering Accounting, Management, and Communication tools for Co-operative Housing Societies, Apartment Owners Associations and Property Management firms in India.</p>
			<p>Link Apartment is a one stop, secure, comprehensive web based software for Residential Complexes (such as Apartments, Private Layouts, Row Houses, Gated Communities). Usage of Link Apartment by owners associations (RWAs, Housing Societies) improves the efficiency of operations & maintenance, reduces the maintenance costs and increases the satisfaction of the residents.</p>
			</div>
			</div>
        <div class="row">
            <div class="col-sm-6">
                <div class="ct-iconBox ct-iconBox--type1 media ct-u-marginBottom50">
                    <div class="h3 ct-iconBox-icon media-left"><small><i class="fa fa-wrench"></i></small></div>
                    <div class="ct-iconBox-content media-body">
                        <h6 class="ct-iconBox-header ct-u-hr ct-u-hr--left">What is LinkApartment.com?</h6>
                        <p>Link Apartment integrates various dimensions of managing a residential complex such as managing finances, managing data (of owners, facilities, assets, documents etc.), managing day-to-day operations, and most importantly bringing the entire community together. Link Apartment is offered as a hosted solution with zero </p>
                    </div>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="ct-iconBox ct-iconBox--type1 media ct-u-marginBottom50">
                    <div class="h3 ct-iconBox-icon media-left"><small><i class="fa fa-thumbs-o-up"></i></small></div>
                    <div class="ct-iconBox-content media-body">
                        <h6 class="ct-iconBox-header ct-u-hr ct-u-hr--left">Who Can Use?</h6>
                        <p>Link Apartment can be used by any one associated with a residential complex. Link Apartment has features which offer great value to the owners & tenants, the team maintaining the complex (managing committees, property management agencies, property developers), auditors and accountants. You can check out the details of our offerings in our features page.</p>
                    </div>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="ct-iconBox ct-iconBox--type1 media ct-u-marginBottom50">
                    <div class="h3 ct-iconBox-icon media-left"><small><i class="fa fa-anchor"></i></small></div>
                    <div class="ct-iconBox-content media-body">
                        <h6 class="ct-iconBox-header ct-u-hr ct-u-hr--left">How Can i Join?</h6>
                        <p>Getting started with Link Apartment is extremely simple!. Just submit details of your complex here. A secure, private portal for your complex shall be set up for a 30-day trial soon after we receive the details. You can experience the new way of apartment management right away with out paying !</p>
                    </div>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="ct-iconBox ct-iconBox--type1 media ct-u-marginBottom50">
                    <div class="h3 ct-iconBox-icon media-left"><small><i class="fa fa-star"></i></small></div>
                    <div class="ct-iconBox-content media-body">
                        <h6 class="ct-iconBox-header ct-u-hr ct-u-hr--left">How Much it costs?</h6>
                        <p>Link Apartment is a hosted solution and is offered as a annual subscription to Societies / Associations / Facility Management Firms The price of using Link Apartment depends upon the number of residential units* in your complex. Typical pricing for a Society / Complex with around 25 residential units would be  250/- per month for full-featured access to Link Apartment</p>
                    </div>
                </div>
            </div>
            
            
        </div>
    </div>
    
    <%--
    <div class="ct-sectionHeader ct-u-paddingBoth60">
        <h2 class="ct-sectionHeader-title"><small>The amazing <span>team</span></small></h2>
        <div class="ct-sectionHeader-separator">
            <span class="minus"></span>
            <span class="slash">/</span>
            <span class="slash">/</span>
            <span class="minus"></span>
        </div>
        <p>Our staff is dedicated, enthusiastic and always go the extra mile.</p>
    </div>
    
    <div class="ct-mediaSection ct-mediaSection--desktop" data-height="450" data-type="pattern" data-bg-image="./assets/images/demo-content/boats/bg-07.jpg" data-bg-image-mobile="./assets/images/demo-content/boats/bg-07.jpg">
    <div class="ct-mediaSection-inner">
        <div class="container">
            <div class="row">
                <div class="col-sm-3">
                    <div class="ct-personBox">
                        <div class="ct-personBox-image"><img src="assets/images/founder/person-01.jpg" alt=""/></div>
                        <div class="ct-personBox-content">
                            <h6 class="ct-personBox-header">Mihir Shah <small>founder</small></h6>
                            <!-- 
                            <ul class="ct-socials">
                                <li><a data-toggle="tooltip" data-placement="top" title="pinterest" href="#"><i class="fa fa-pinterest"></i></a></li>
                                <li><a data-toggle="tooltip" data-placement="top" title="facebook" href="#"><i class="fa fa-facebook-square"></i></a></li>
                                <li><a data-toggle="tooltip" data-placement="top" title="twitter" href="#"><i class="fa fa-twitter"></i></a></li>
                            </ul>
                             -->
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="ct-personBox">
                        <div class="ct-personBox-image"><img src="assets/images/founder/person-02.jpg" alt=""/></div>
                        <div class="ct-personBox-content">
                            <h6 class="ct-personBox-header">Jigar Mehta <small>founder</small></h6>
                            <!-- 
                            <ul class="ct-socials">
                                <li><a data-toggle="tooltip" data-placement="top" title="pinterest" href="#"><i class="fa fa-pinterest"></i></a></li>
                                <li><a data-toggle="tooltip" data-placement="top" title="facebook" href="#"><i class="fa fa-facebook-square"></i></a></li>
                                <li><a data-toggle="tooltip" data-placement="top" title="twitter" href="#"><i class="fa fa-twitter"></i></a></li>
                            </ul>
                             -->
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="ct-personBox">
                        <div class="ct-personBox-image"><img src="assets/images/founder/person-03.jpg" alt=""/></div>
                        <div class="ct-personBox-content">
                            <h6 class="ct-personBox-header">Viral Shah <small>co-founder</small></h6>
                            <!-- 
                            <ul class="ct-socials">
                                <li><a data-toggle="tooltip" data-placement="top" title="pinterest" href="#"><i class="fa fa-pinterest"></i></a></li>
                                <li><a data-toggle="tooltip" data-placement="top" title="facebook" href="#"><i class="fa fa-facebook-square"></i></a></li>
                                <li><a data-toggle="tooltip" data-placement="top" title="twitter" href="#"><i class="fa fa-twitter"></i></a></li>
                            </ul>
                             -->
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="ct-personBox">
                        <div class="ct-personBox-image"><img src="assets/images/founder/person-04.jpg" alt=""/></div>
                        <div class="ct-personBox-content">
                            <h6 class="ct-personBox-header">Vivek KT <small>tech manager</small></h6>
                            <!-- 
                            <ul class="ct-socials">
                                <li><a data-toggle="tooltip" data-placement="top" title="pinterest" href="#"><i class="fa fa-pinterest"></i></a></li>
                                <li><a data-toggle="tooltip" data-placement="top" title="facebook" href="#"><i class="fa fa-facebook-square"></i></a></li>
                                <li><a data-toggle="tooltip" data-placement="top" title="twitter" href="#"><i class="fa fa-twitter"></i></a></li>
                            </ul>
                             -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
	</div>
     --%>
    
</section>


<div id="features" class="section"></div>
<!-- <div class="ct-mediaSection ct-mediaSection--desktop" data-type="parallax" data-stellar-background-ratio="0.3" data-bg-image="./assets/images/bg-06.jpg" data-bg-image-mobile="./assets/images/bg-06.jpg" style="margin-top:5px;"> -->
<div class="ct-mediaSection ct-mediaSection--desktop" data-type="parallax" data-stellar-background-ratio="0.3" style="margin-top:5px;">
    <div class="container">
        <div class="ct-sectionHeader ct-u-paddingTop60 ct-u-paddingBottom70">
            <h2 class="ct-sectionHeader-title"><small>Our <span>Features</span></small></h2>
            <div class="ct-sectionHeader-separator">
                <span class="minus"></span>
                <span class="slash">/</span>
                <span class="slash">/</span>
                <span class="minus"></span>
            </div>
        </div>

        <div class="row">
            <div class="col-md-4 ct-u-paddingBottom90">
                <div class="ct-iconBox ct-iconBox--type3 media ct-u-marginTop30 text-right">
                    <div class="ct-iconBox-content media-body">
                        <h6 class="ct-iconBox-header ct-u-hr ct-u-hr--right">Resident Community</h6>
                        <p>Residents Directory, Friends List, Discussion Forum, Upload Photo/Files, Privacy Setting, Neighborhood Guide, Opinion Poll, Manage Events</p>
                    </div>
                    <div class="h3 ct-iconBox-icon ct-iconBox-icon--inverse media-right"><small><i class="fa fa-star"></i></small></div>
                </div>
                <div class="ct-iconBox ct-iconBox--type3 media ct-u-marginTop50 text-right">
                    <div class="ct-iconBox-content media-body">
                        <h6 class="ct-iconBox-header ct-u-hr ct-u-hr--right">Utilities</h6>
                        <p>SMS and Email Integrated, Mobile Applications, Excel & PDF Data Export</p>
                    </div>
                    <div class="h3 ct-iconBox-icon ct-iconBox-icon--inverse media-right"><small><i class="fa fa-money"></i></small></div>
                </div>
                <div class="ct-iconBox ct-iconBox--type3 media ct-u-marginTop50 text-right">
                    <div class="ct-iconBox-content media-body">
                        <h6 class="ct-iconBox-header ct-u-hr ct-u-hr--right">Resident Management</h6>
                        <p>Share Allotment/Transfer, Parking Management, Tenant Management, Facilities Booking, Membership, Register Nomination, Complain Register, Resident Loan Management, Managing Committee List, Online Payment Option</p>
                    </div>
                    <div class="h3 ct-iconBox-icon ct-iconBox-icon--inverse media-right"><small><i class="fa fa-flag"></i></small></div>
                </div>
				<div class="ct-iconBox ct-iconBox--type3 media ct-u-marginTop50 text-right">
                    <div class="ct-iconBox-content media-body">
                        <h6 class="ct-iconBox-header ct-u-hr ct-u-hr--right">HELP / SUPPORT</h6>
                        <p>Help Desk, Support Forum, Knowledgebase, Help Documentations, Legal Advice, Free Software Upgrades</p>
                    </div>
                    <div class="h3 ct-iconBox-icon ct-iconBox-icon--inverse media-right"><small><i class="fa fa-flag"></i></small></div>
                </div>

            </div>
            <div class="col-md-4 text-center ct-u-paddingBottom90"><img src="assets/images/middle-01.png" alt=""/></div>
            <div class="col-md-4 ct-u-paddingBottom90">
                <div class="ct-iconBox ct-iconBox--type3 media ct-u-marginTop30">
                    <div class="h3 ct-iconBox-icon ct-iconBox-icon--inverse media-left"><small><i class="fa fa-wrench"></i></small></div>
                    <div class="ct-iconBox-content media-body">
                        <h6 class="ct-iconBox-header ct-u-hr ct-u-hr--left">RECURRING BILLING</h6>
                        <p>Flat/Unit Mapping, Auto Recurring Bill, Additional Billing, Rules for Penalty/Interest, Fixed Charges, Charges on Area, Metered Reading, Tax Configuration</p>
                    </div>
                </div>
                <div class="ct-iconBox ct-iconBox--type3 media ct-u-marginTop50">
                    <div class="h3 ct-iconBox-icon ct-iconBox-icon--inverse media-left"><small><i class="fa fa-thumbs-o-up"></i></small></div>
                    <div class="ct-iconBox-content media-body">
                        <h6 class="ct-iconBox-header ct-u-hr ct-u-hr--left">Secured Network</h6>
                        <p>256 bits SSL Protection, Data Encryption, Backup and Restore, Role Base Security</p>
                    </div>
                </div>
                <div class="ct-iconBox ct-iconBox--type3 media ct-u-marginTop50">
                    <div class="h3 ct-iconBox-icon ct-iconBox-icon--inverse media-left"><small><i class="fa fa-anchor"></i></small></div>
                    <div class="ct-iconBox-content media-body">
                        <h6 class="ct-iconBox-header ct-u-hr ct-u-hr--left">SOCIETY ACCOUNTING</h6>
                        <p>Group and Account Master, Bank and Cash Accounts, Receipt and Payments, Financial Reports, Bank Reconciliation, Trial Balance, Income and Expenditure, Balance Sheet, Online Internal and Statutory Audit Facility, Dividend Calculator</p>
                    </div>
                </div>
				<div class="ct-iconBox ct-iconBox--type3 media ct-u-marginTop50">
                    <div class="h3 ct-iconBox-icon ct-iconBox-icon--inverse media-left"><small><i class="fa fa-anchor"></i></small></div>
                    <div class="ct-iconBox-content media-body">
                        <h6 class="ct-iconBox-header ct-u-hr ct-u-hr--left">Society Management</h6>
                        <p>Real Time Dashboard, Complain Register, Managing Committee Workflow, Agenda and Minutes Writing, Assets Tracking and Maintenance, Committee Change and Hand over, Election Management, Manage Service, Provider, Employee Management, Statuary Records and Registers, Property Tax Management, NOC Master, Letter/Circular Master, Society Bye Law, Documents Repository, Society Form</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- <div class="clearfix"></div>
<section id="package" class="section"></section>
<div class="ct-mediaSection ct-mediaSection--desktop ct-u-paddingBoth40" data-type="video" data-height="auto">
    <div class="ct-mediaSection-video embed-responsive embed-responsive-16by9">
        <video muted loop autoplay="autoplay" preload="auto">
            <source src='assets/videos/video-05.mp4' type='video/mp4'/>
        </video>
    </div>
	
    <div class="container ct-u-paddingBoth90">
        <div class="ct-callToAction ct-callToAction--type2 ct-u-sectionGrayLighter ct-shadow ct-shadow--type1">
            <div class="ct-u-displayTableVertical">
                <div class="ct-u-displayTableCell ct-callToAction-content">
                    <h3 class="ct-callToAction-header">Package- Premium Account</h3>
                    <p>Get Full-features access</p>
					<p>Resident Community | Society Management | Resident Management | Recurring Billing | Society Accounting | Secured Network | Help / Support | Utilities </p>
                </div>
                <div class="ct-u-displayTableCell ct-callToAction-button">
                    <a href="#contact" class="btn btn-lg btn-motive"><span>Contact Now</span></a>
                </div>
            </div>
        </div>
    </div>
</div> -->

<div class="clearfix"></div>
<section id="pricing" class="section"></section>
<section class="ct-mediaSection ct-mediaSection--desktop" data-type="parallax" data-stellar-background-ratio="0.3" data-bg-image="./assets/images/bg-10.jpg" data-bg-image-mobile="./assets/images/bg-10.jpg">
		<div class="container">
			<div class="ct-sectionHeader ct-u-paddingBottom70 ct-u-paddingTop90">
				<h2 class="ct-sectionHeader-title">
					<small>Our <span>Pricing</span></small>
				</h2>
				<div class="ct-sectionHeader-separator">
					<span class="minus"></span> <span class="slash">/</span> <span
						class="slash">/</span> <span class="minus"></span>
				</div>
			</div>
			<div class="row">

				<div class="col-sm-4">
					<div
						class="ct-pricingBox ct-pricingBox--graydarker ct-u-marginBoth30">
						<div class="ct-pricingBox-header">
							<h2 class="ct-pricingBox-title ct-u-hr ct-u-hr--wide">
								<small>Silver</small>
							</h2>
							<h2 class="ct-pricingBox-price">
								<b>Free</b>
							</h2>
							<h6 class="ct-pricingBox-subtitle">Per Flat Monthly</h6>
						</div>
						<svg viewBox="0 0 100 100" preserveAspectRatio="none">
                        <path d="M0,0 L 50,50 100,0 Z" />
                    </svg>
						<div class="ct-pricingBox-content">
							<ul class="ct-pricingBox-list">
								<li>Resident Community</li>
								<li>Society Management</li>
								<li>Resident Management</li>
								<li>-</li>
								<li>-</li>
								<li>-</li>
								<li>-</li>
								<li>-</li>
							</ul>
						</div>
						<!-- 
						<a href="#" class="btn btn-lg btn-graydarker"><span>Start
								Now</span></a>  -->
					</div>
				</div>
				<div class="col-sm-4">
					<div
						class="ct-pricingBox ct-pricingBox--graydarker ct-u-marginBoth30">
						<div class="ct-pricingBox-header">
							<h2 class="ct-pricingBox-title ct-u-hr ct-u-hr--wide">
								<small>Gold</small>
							</h2>
							<h2 class="ct-pricingBox-price">
								<b>Rs. 15</b>
							</h2>
							<h6 class="ct-pricingBox-subtitle">Per Flat Monthly</h6>
						</div>
						<svg viewBox="0 0 100 100" preserveAspectRatio="none">
                        <path d="M0,0 L 50,50 100,0 Z" />
                    </svg>
						<div class="ct-pricingBox-content">
							<ul class="ct-pricingBox-list">
								<li>Resident Community</li>
								<li>Society Management</li>
								<li>Resident Management</li>
								<li>Recurring Billing</li>
								<li>Society Accounting</li>
								<li>Secured Network</li>
								<li>-</li>
								<li>-</li>
							</ul>
						</div>
						<!--  <a href="#" class="btn btn-lg btn-graydarker"><span>Apply
								Now</span></a> -->
					</div>
				</div>
				<div class="col-sm-4">
					<div
						class="ct-pricingBox ct-pricingBox--graydarker ct-u-marginBoth30">
						<div class="ct-pricingBox-header">
							<h2 class="ct-pricingBox-title ct-u-hr ct-u-hr--wide">
								<small>Platinum</small>
							</h2>
							<h2 class="ct-pricingBox-price">
								<b>Rs. 20</b>
							</h2>
							<h6 class="ct-pricingBox-subtitle">Per Flat Monthly</h6>
						</div>
						<svg viewBox="0 0 100 100" preserveAspectRatio="none">
                        <path d="M0,0 L 50,50 100,0 Z" />
                    </svg>
						<div class="ct-pricingBox-content">
							<ul class="ct-pricingBox-list">
								<li>Resident Community</li>
								<li>Society Management</li>
								<li>Resident Management</li>
								<li>Recurring Billing</li>
								<li>Society Accounting</li>
								<li>Secured Network</li>
								<li>Help / Support</li>
								<li>Utilities</li>

							</ul>
						</div>
						<!--  <a href="#" class="btn btn-lg btn-graydarker"><span>Apply
								Now</span></a> -->
					</div>
				</div>
			</div>
		</div>

		<div class="container">
			<div class="ct-sectionHeader ct-u-paddingTop60 ct-u-paddingBottom70">
				<h2 class="ct-sectionHeader-title">
					<small>Our clients <span>love us</span></small>
				</h2>
				<div class="ct-sectionHeader-separator">
					<span class="minus"></span> <span class="slash">/</span> <span
						class="slash">/</span> <span class="minus"></span>
				</div>
				<p>Because we care about the needs of customers</p>
			</div>
			<div class="row">
				<div class="col-sm-6 ct-u-paddingBottom150">
					<div class="row">
						<div class="col-md-6 ct-u-paddingBottom30">
							<div class="ct-graphBox ct-graphBox--default">
								<div class="ct-graphBox-graph">
									<canvas width="150" height="150" class="ct-js-pieChart"
										data-ct-percentage="100" data-ct-middleSpace="95"
										data-ct-secondColor="#ddd" data-ct-firstColor="#ff9673"></canvas>
									<span class="h2 ct-graphBox-number"><b>1000</b></span>
								</div>
								<div class="ct-graphBox-content ct-u-paddingTop10">
									<h6
										class="ct-u-hr ct-u-hr--center text-uppercase text-center ct-fw-bold">happy
										customers</h6>
									<p class="text-center">We have a large base of satisfied
										customers, no one can give as much as we.</p>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="ct-graphBox ct-graphBox--default">
								<div class="ct-graphBox-graph">
									<canvas width="150" height="150" class="ct-js-pieChart"
										data-ct-percentage="100" data-ct-middleSpace="95"
										data-ct-secondColor="#ddd" data-ct-firstColor="#00c5f8"></canvas>
									<span class="h2 ct-graphBox-number"><b>30</b></span>
								</div>
								<div class="ct-graphBox-content ct-u-paddingTop10">
									<h6
										class="ct-u-hr ct-u-hr--center text-uppercase text-center ct-fw-bold">apartments</h6>
									<p class="text-center">Our clients trust us to support them
										whenever, wherever they would need us.</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-sm-6 ct-u-paddingBottom150">
					<div class="row">
						<div class="col-md-6 ct-u-paddingBottom30">
							<div class="ct-graphBox ct-graphBox--default">
								<div class="ct-graphBox-graph">
									<canvas width="150" height="150" class="ct-js-pieChart"
										data-ct-percentage="100" data-ct-middleSpace="95"
										data-ct-secondColor="#ddd" data-ct-firstColor="#ff9673"></canvas>
									<span class="h2 ct-graphBox-number"><b>3</b></span>
								</div>
								<div class="ct-graphBox-content ct-u-paddingTop10">
									<h6
										class="ct-u-hr ct-u-hr--center text-uppercase text-center ct-fw-bold">top
										counsultants</h6>
									<p class="text-center">We have a large base of satisfied
										customers, no one can give as much as we.</p>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="ct-graphBox ct-graphBox--default">
								<div class="ct-graphBox-graph">
									<canvas width="150" height="150" class="ct-js-pieChart"
										data-ct-percentage="100" data-ct-middleSpace="95"
										data-ct-secondColor="#ddd" data-ct-firstColor="#00c5f8"></canvas>
									<span class="h2 ct-graphBox-number"><b>200</b></span>
								</div>
								<div class="ct-graphBox-content ct-u-paddingTop10">
									<h6
										class="ct-u-hr ct-u-hr--center text-uppercase text-center ct-fw-bold">Service
										Providers</h6>
									<p class="text-center">Our clients trust us to support them
										whenever, wherever they would need us.</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<section class="section ct-u-sectionMotive">
			<div class="ct-sectionHeader ct-u-paddingBoth60">
				<h2 class="ct-sectionHeader-title">
					<small><span>Testimonial</span></small>
				</h2>
				<div class="ct-sectionHeader-separator">
					<span class="minus"></span> <span class="slash">/</span> <span
						class="slash">/</span> <span class="minus"></span>
				</div>
				<p>"One of the Best Platform for making My Society digital"</p>
				<p>Vikram (Chairman), Loadha Park, Dadar</p>
			</div>
		</section>
	</section>


<div id="faq" class="section"></div>
<section class="ct-mediaSection ct-mediaSection--desktop" data-type="pattern" data-bg-image="./assets/images/bg-08.jpg" data-bg-image-mobile="./assets/images/bg-08.jpg">
    <div class="container">
        <div class="row">
            
            <div class="col-sm-12 ct-u-paddingTop90 ct-u-paddingBottom80">
                <div class="ct-sectionHeader ct-u-marginBottom50">
            <h2 class="ct-sectionHeader-title"><small>FREQUENTLY ASKED <span>QUESTIONS</span></small></h2>
            <div class="ct-sectionHeader-separator">
                <span class="minus"></span>
                <span class="slash">/</span>
                <span class="slash">/</span>
                <span class="minus"></span>
            </div>
        </div>	

                <div class="col-sm-6">
					<div class="panel-group" id="accordion">
                    <div class="panel panel-motive">
                        <div class="panel-heading">
                            <div class="panel-title">
                                <a class="h5 collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                                    <small>What is Link Apartment?</small>
                                </a>
                            </div>
                        </div>
                        <div id="collapseOne" class="panel-collapse collapse">
                            <div class="panel-body">
                                <p>Link Apartment is a web portal that provides tools to effectively manage and easily maintain the various aspects of your residential complex, be it Apartment Complexes, Private Layouts, Row houses, Villas or even a Colony. Your Association can register with Link Apartment and create an online space for your community to manage the association activities.
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-motive">
                        <div class="panel-heading">
                            <div class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
                                    <small>I want to Register my apartment complex or layout with Link Apartment. What are my next steps?</small>
                                </a>
                            </div>
                        </div>
                        <div id="collapseTwo" class="panel-collapse collapse in">
                            <div class="panel-body">
                                <p>Please register your complex / layout <a href="https://www.LinkApartment.com/common_public/new_register_complex">here</a> by filling in the details. Soon after you submit your request, support team from Link Apartment would reach out to you to set up your complex's private, secure portal in Link Apartment in less than one business day. 
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-motive">
                        <div class="panel-heading">
                            <div class="panel-title">
                                <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseThree">
                                    <small>Our Complex is still underconstruction (OR) We are yet to form an association / society for our complex. Can we still use Link Apartment?</small>
                                </a>
                            </div>
                        </div>
                        <div id="collapseThree" class="panel-collapse collapse">
                            <div class="panel-body">
                                <p>Yes. We asbolutely understand the importance of all owners having a common platform to discuss topcis related to thier complex even before as association is formed and funds are available. Thus, we offer Link Apartment for complexes who are yet to take posession or yet to form an association free of cost. You just need to register your complex <a href="https://www.LinkApartment.com/common_public/new_register_complex">here</a> and once your association is formed you can upgrade to a to fully featured version of Link Apartment to meet the enhanced needs of the association. For more details, please visit our <a href="https://www.LinkApartment.com/pricing">pricing</a> page. 
                                </p>
                            </div>
                        </div>
                    </div>
					<div class="panel panel-motive">
                        <div class="panel-heading">
                            <div class="panel-title">
                                <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseFour">
                                    <small>What is the price for using Link Apartment?</small>
                                </a>
                            </div>
                        </div>
                        <div id="collapseFour" class="panel-collapse collapse">
                            <div class="panel-body">
                                <p>Link Apartment is free to use for complexes where owner associations are yet to be formed. For complexes with active associations or under maintenance by the property developer, we offer prices that are dependent on number of units (flats/plots/houses) in your complex. Prices start from as low as Rs. 249/- per month. Please visit our <a href="https://www.LinkApartment.com/pricing">pricing</a> page to know more details. We offer a free, no-obligation 30-day trial for all complexes. You can try the features before you subscribe to Link Apartment.
                                </p>
                            </div>
                        </div>
                    </div>
					<div class="panel panel-motive">
                        <div class="panel-heading">
                            <div class="panel-title">
                                <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseFive">
                                    <small>Should we pay after trial period, if we do not use Link Apartment after the trial?</small>
                                </a>
                            </div>
                        </div>
                        <div id="collapseFive" class="panel-collapse collapse">
                            <div class="panel-body">
                                <p>No. If you decide not to use Link Apartment after your 30-day trial, you need not pay. This is a no-obligation trial.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
					</div>
					
					<div class="col-sm-6">
					<div class="panel-group" id="accordion">
                    <div class="panel panel-motive">
                        <div class="panel-heading">
                            <div class="panel-title">
                                <a class="h5 collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseSix">
                                    <small>How can the Owners / Residents Association Management Committees use Link Apartment?</small>
                                </a>
                            </div>
                        </div>
                        <div id="collapseSix" class="panel-collapse collapse">
                            <div class="panel-body">
                                <p>Link Apartment provides a host of Administration tools/features that helps the association management committees to ensure smooth functioning of the complex. Please find the tools that are currently available by visiting at the features section <a href="https://www.LinkApartment.com/apartment-management-accounting-software">here</a>.
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-motive">
                        <div class="panel-heading">
                            <div class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseSeven">
                                    <small>How can individual Owners / Residents use Link Apartment?</small>
                                </a>
                            </div>
                        </div>
                        <div id="collapseSeven" class="panel-collapse collapse in">
                            <div class="panel-body">
                                <p>Link Apartment brings together the owners/residents on to a common platform and promotes community living. Please visit the features section <a href="https://www.LinkApartment.com/apartment-management-accounting-software">here</a> to know how you can benefit from Link Apartment as a owner/resident.
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-motive">
                        <div class="panel-heading">
                            <div class="panel-title">
                                <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseEight">
                                    <small>What type of support is offered by Link Apartment?</small>
                                </a>
                            </div>
                        </div>
                        <div id="collapseEight" class="panel-collapse collapse">
                            <div class="panel-body">
                                <p>Link Apartment helps you with initial setup to load your complex details and past data (such as member data, past expenses, assets, vehicles, parking lots), email support, training your estate manager and staff.
                                </p>
                            </div>
                        </div>
                    </div>
					<div class="panel panel-motive">
                        <div class="panel-heading">
                            <div class="panel-title">
                                <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseNine">
                                    <small>Will you refund the money if we decide not to use Link Apartment in future?</small>
                                </a>
                            </div>
                        </div>
                        <div id="collapseNine" class="panel-collapse collapse">
                            <div class="panel-body">
                                <p>In an unlikely event that you decide not to use Link Apartment, the money you have paid will be refunded on a pro-rata basis for unused period. For example, you have signed up and paid for 12 months and then decided not to use at the end of 5th month, the amount of 7 months shall be refunded. You only pay for what you use.
                                </p>
                            </div>
                        </div>
                    </div>
					<div class="panel panel-motive">
                        <div class="panel-heading">
                            <div class="panel-title">
                                <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTen">
                                    <small>Is our Data Secure and Confidential on Link Apartment?</small>
                                </a>
                            </div>
                        </div>
                        <div id="collapseTen" class="panel-collapse collapse">
                            <div class="panel-body">
                                <p>Absolutely Yes. Link Apartment uses industry standard security practices to protect your data.</p>
								<p>Link Apartment uses Secure Socket Layer(SSL) technology to encrypt the entire transmission of data between your browser and the our server.</p>
                            </div>
                        </div>
                    </div>
                </div>
					</div>
            </div>
        </div>
    </div>
</section>

<div id="contact" class="section"></div>
<div class="ct-mediaSection ct-mediaSection--desktop" data-type="pattern" data-bg-image="./assets/images/bg-01.jpg" data-bg-image-mobile="./assets/images/bg-01-mobile.jpg">
    <div class="container">
        <div id="contact" class="section row">
            <div class="col-sm-6 ct-u-paddingBottom80">
                <div class="ct-sectionHeader ct-sectionHeader--left ct-u-paddingTop70 ct-u-paddingBottom60">
                    <h2 class="ct-sectionHeader-title"><small>Get in <span>touch</span></small></h2>
                    <div class="ct-sectionHeader-separator">
                        <span class="slash">/</span>
                        <span class="slash">/</span>
                        <span class="minus"></span>
                    </div>
                    <p>If you are looking for a demo or a trial to understand Link Apartment.com features better, please call or mail on below details. Link Apartment.com will reply to you in 24 hou</p>
                </div>

                <div class="ct-iconBox ct-iconBox--type1 media ct-u-marginBottom50">
                    <div class="h3 ct-iconBox-icon media-left"><small><i class="fa fa-map-marker"></i></small></div>
                    <div class="ct-iconBox-content media-body">
                        <h6 class="ct-iconBox-header ct-u-hr ct-u-hr--left">Address</h6>
                        <h3><small class="ct-fw-lighter">203, Saurabh Tower, <br>90 Feet Road, Bhayander West, <br>Thane 401101.</small></h3>
                    </div>
                </div>
                <div class="ct-iconBox ct-iconBox--type1 media ct-u-marginBottom50">
                    <div class="h3 ct-iconBox-icon media-left"><small><i class="fa fa-phone"></i></small></div>
                    <div class="ct-iconBox-content media-body">
                        <h6 class="ct-iconBox-header ct-u-hr ct-u-hr--left">Phone</h6>
                        <h3><small class="ct-fw-lighter">+91-996-703-4657</small></h3>
                    </div>
                </div>
                <div class="ct-iconBox ct-iconBox--type1 media ct-u-marginBottom50">
                    <div class="h3 ct-iconBox-icon media-left"><small><i class="fa fa-envelope"></i></small></div>
                    <div class="ct-iconBox-content media-body">
                        <h6 class="ct-iconBox-header ct-u-hr ct-u-hr--left">Email</h6>
                        <h3><small><a href="#" class="ct-t-hover">support@linkapartment.com</a></small></h3>
                    </div>
                </div>
               
            </div>
            <div class="col-sm-6 ct-u-paddingBottom80">
                <div class="ct-sectionHeader ct-sectionHeader--left ct-u-paddingTop70 ct-u-paddingBottom60">
                    <h2 class="ct-sectionHeader-title"><small>Send us a <span>message</span></small></h2>
                    <div class="ct-sectionHeader-separator">
                        <span class="slash">/</span>
                        <span class="slash">/</span>
                        <span class="minus"></span>
                    </div>
                    <p>Write just anything and we'll respond within minutes with a ready solution.</p>
                </div>


                <form role="form" action="#" method="POST" class="validateIt">

                    <div class="row">
                        <div class="col-sm-9">
                            <div class="form-group  ct-input--type2 ct-u-marginBottom20">
                                <input id="contact_name" data-error-message="Enter your name!" placeholder="Name" type="text" required="" name="field[]" class="form-control" title="Name">
                                <label for="contact_name" class="sr-only"></label>
                            </div>
                            <div class="form-group  ct-input--type2 ct-u-marginBottom20">
                                <input id="contact_email" data-error-message="Enter your email!" placeholder="Email" required="" name="field[]" type="email" class="form-control h5-email" title="Email">
                                <label for="contact_email" class="sr-only"></label>
                            </div>
                            <div class="form-group  ct-input--type2 ct-u-marginBottom20">
                                <input id="contact_phone" placeholder="Phone" name="field[]" type="tel" class="form-control h5-phone" title="Phone">
                                <label for="contact_phone" class="sr-only"></label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group  ct-input--type2 ct-u-marginBottom20">
                        <textarea id="contact_message" data-error-message="Message is required" placeholder="Message" class="form-control" rows="6" name="field[]" required="" title="Message"></textarea>
                        <label for="contact_message" class="sr-only"></label>
                    </div>

                    <div class="clearfix"></div>

                    <button type="submit" class="btn btn-wide btn-motive"><span>Send Message</span></button>
                </form>

                <div class="successMessage alert alert-success ct-u-marginTop20" style="display:none;">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                    Message Sent.
                </div>
                <div class="errorMessage alert alert-danger ct-u-marginTop20" style="display:none;">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                    An error occured. Please try again later.
                </div>

            </div>
        </div>
    </div>
</div>


<%@include file="footer.jsp"%>

<%@include file="commonJs.jsp"%>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/index.js"></script>
</body>
</html>