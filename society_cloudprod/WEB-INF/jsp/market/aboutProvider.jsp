<%@page import="app.societywala.advertise.bo.AdvertiseDetailsBO"%>
<%@include file="/config.jsp" %>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]>
<html class="no-js ie8" lang="en"> <![endif]-->
<!--[if IE 9 ]>
<html class="no-js ie9" lang="en"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html class="no-js" lang="en" xmlns="http://www.w3.org/1999/xhtml"> <!--<![endif]-->
<head lang="en">
    <%@include file="/metaFile.jsp"%>
    <%@include file="/commonJs.jsp"%>
</head>
<%
AdvertiseDetailsBO advertiseDetailsBO = (AdvertiseDetailsBO)request.getAttribute("advertiseDetailsBO");
%>

<body class="cssAnimate boats">
<%@include file="/topbar.jsp"%>
	<section class="ct-mediaSection ct-mediaSection--desktop ct-u-paddingTop60 ct-u-paddingBottom40" data-height="553" data-type="parallax" data-stellar-background-ratio="0.2" data-bg-image="./assets/images/demo-content/boats/mediaHeader-02.jpg" data-bg-image-mobile="./assets/images/demo-content/boats/mediaHeader-02.jpg">
	        <div class="ct-mediaSection-inner ct-mediaSection-inner--bottom text-center ct-u-paddingBottom20" data-stellar-ratio="0.7">
	            <h2 class="ct-fw-lighter ct-u-hr ct-u-hr--wide ct-u-marginBottom10"><%=advertiseDetailsBO.getProviderName()%></h2>
	            <h2 class="ct-u-marginBottom20"><small class="ct-fw-lighter ct-u-colorMotive"><%=advertiseDetailsBO.getAboutProvider()%></small></h2>
	            <a href="#" class="ct-iconButton ct-u-marginBottom15"><i class="fa fa-arrow-down animated bounce"></i></a>
	            <h6 class="text-uppercase ct-fw-bold">from <span class="ct-t-fontDefault ct-u-colorMotive ct-u-size50">$350</span> per day</h6>
	        </div>
	</section>


	<div class="ct-u-paddingBottom150 ct-u-sectionBorder">
        <div class="container">
            <div class="row">

                <div class="col-md-4 col-md-push-8 ct-u-paddingTop50">
                    <form class="ct-form-group ct-u-marginBottom30 input-daterange input-group" id="datepicker">
                        <input type="text" class="form-control" placeholder="Check In Date" name="start"  title="from"/>
                        <input type="text" class="form-control" placeholder="Check Out Date" name="end"  title="to"/>
                    </form>

                    <div class="clearfix"></div>

                    <div class="ct-widget ct-widget-checkbox-2items ct-u-marginBottom30">
                        <h3 class="ct-widget-header">Crew and captain</h3>
                        <form id="ct-js-driverCheckbox" class="ct-js-radio-group ct-widget-content">
                            <div class="ct-u-displayTableVertical">
                                <div class="ct-u-displayTableCell">
                                    <div class="ct-checkbox ct-checkbox--rounded">
                                        <input data-price="2100" name="Driver" id="checkbox5" type="radio" checked>
                                        <label for="checkbox5" class="checkbox-inline">With crew</label>
                                    </div>
                                </div>
                                <div class="ct-u-displayTableCell">
                                    <div class="ct-checkbox ct-checkbox--rounded">
                                        <input data-price="0" name="Driver" id="checkbox6" type="radio">
                                        <label for="checkbox6" class="checkbox-inline">Without crew</label>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>

                    <div class="ct-widget ct-u-marginBottom30">
                        <h3 class="ct-widget-header">Number of guests</h3>
                        <form class="ct-widget-content">
                            <select class="ct-select ct-js-selectize" title="Driver">
                                <option value="1">5 people</option>
                                <option value="2">4 people</option>
                                <option value="3">3 people</option>
                                <option value="4">2 people</option>
                                <option value="5">1 person</option>
                            </select>
                        </form>
                    </div>

                    <div class="ct-widget ct-u-marginBottom30">
                        <h3 class="ct-widget-header">Extras</h3>
                        <form class="ct-widget-content ct-js-checkbox-group">
                            <div class="ct-checkbox ct-u-marginBottom10">
                                <input data-price="450" name="Hostess" id="checkbox1" type="checkbox" checked="checked">
                                <label for="checkbox1" class="checkbox-inline">Hostess</label>
                            </div>
                            <div class="ct-checkbox ct-u-marginBottom10">
                                <input data-price="200" name="Champagne" id="checkbox2" type="checkbox" checked="checked">
                                <label for="checkbox2" class="checkbox-inline">Champagne</label>
                            </div>
                            <div class="ct-checkbox ct-u-marginBottom10">
                                <input data-price="725" name="Sea-food-and-caviar" id="checkbox3" type="checkbox">
                                <label for="checkbox3" class="checkbox-inline">Sea food and caviar</label>
                            </div>
                            <div class="ct-checkbox">
                                <input data-price="50" name="Non-alcoholic-drinks" id="checkbox4" type="checkbox">
                                <label for="checkbox4" class="checkbox-inline">Non-alcoholic drinks</label>
                            </div>
                        </form>
                    </div>

                    <div id="ct-js-checkoutBox" class="ct-widget ct-widget-pricing ct-u-marginBottom30">
                        <h3 class="ct-widget-header ct-widget-header--dark">Pricing <span id="datepickerOutput" class="pull-right">0 days</span></h3>
                        <div class="ct-widget-content">
                            <ul id="ct-js-checkout-list" class="ct-widget-list">
                                <li data-name="Car-Price" data-itemPrice="350">Boat price<span class="pull-right data-currency">$0</span></li>
                                <li data-name="ct-js-driverCheckbox">Crew and captain<span class="pull-right">0</span></li>
                                <li data-name="Hostess">Hostess<span class="pull-right">0</span></li>
                                <li data-name="Sea-food-and-caviar">Sea food and caviar<span class="pull-right">0</span></li>
                                <li data-name="Non-alcoholic-drinks">Non-alcoholic drinks<span class="pull-right">0</span></li>
                                <li data-name="Champagne">Champagne<span class="pull-right">0</span></li>
                                <li data-name="Parking-fee">Harbour fee<span class="pull-right">$90</span></li>
                            </ul>
                            <h4 class="ct-checkout-error"><small>Please select a date</small></h4>
                        </div>
                        <h3 class="ct-widget-footer">Total <span id="ct-js-checkout-price" class="ct-widget-price pull-right">$0</span></h3>
                    </div>

                    <a href="#" class="btn btn-lg btn-wide btn-motive"><span>Book this boat now</span></a>
                </div>

                <div class="col-md-8 col-md-pull-4 ct-u-paddingTop50">
                    <div id="synced-1" class="ct-slick--synced">
                        <div class="ct-slick ct-js-slick ct-js-slick-for" data-items="1" data-arrows="false" data-draggable="false" data-touchMove="false">
                            <div class="item"><img src="assets/images/demo-content/boats/synced-01.jpg" alt=""/></div>
                            <div class="item"><img src="assets/images/demo-content/boats/synced-02.jpg" alt=""/></div>
                            <div class="item"><img src="assets/images/demo-content/boats/synced-03.jpg" alt=""/></div>
                            <div class="item"><img src="assets/images/demo-content/boats/synced-04.jpg" alt=""/></div>
                            <div class="item"><img src="assets/images/demo-content/boats/synced-05.jpg" alt=""/></div>
                            <div class="item"><img src="assets/images/demo-content/boats/synced-01.jpg" alt=""/></div>
                            <div class="item"><img src="assets/images/demo-content/boats/synced-02.jpg" alt=""/></div>
                            <div class="item"><img src="assets/images/demo-content/boats/synced-03.jpg" alt=""/></div>
                            <div class="item"><img src="assets/images/demo-content/boats/synced-04.jpg" alt=""/></div>
                            <div class="item"><img src="assets/images/demo-content/boats/synced-05.jpg" alt=""/></div>
                        </div>
                        <div class="ct-slick ct-js-slick ct-js-slick-nav" data-items="5" data-centerMode="true" data-centerPadding="0" data-asNavFor="#synced-1 .ct-js-slick-for" data-focusOnSelect="true">
                            <div class="item"><img src="assets/images/demo-content/boats/synced-01.jpg" alt=""/></div>
                            <div class="item"><img src="assets/images/demo-content/boats/synced-02.jpg" alt=""/></div>
                            <div class="item"><img src="assets/images/demo-content/boats/synced-03.jpg" alt=""/></div>
                            <div class="item"><img src="assets/images/demo-content/boats/synced-04.jpg" alt=""/></div>
                            <div class="item"><img src="assets/images/demo-content/boats/synced-05.jpg" alt=""/></div>
                            <div class="item"><img src="assets/images/demo-content/boats/synced-01.jpg" alt=""/></div>
                            <div class="item"><img src="assets/images/demo-content/boats/synced-02.jpg" alt=""/></div>
                            <div class="item"><img src="assets/images/demo-content/boats/synced-03.jpg" alt=""/></div>
                            <div class="item"><img src="assets/images/demo-content/boats/synced-04.jpg" alt=""/></div>
                            <div class="item"><img src="assets/images/demo-content/boats/synced-05.jpg" alt=""/></div>
                        </div>
                    </div>

                    <div class="tabpanel ct-u-paddingTop50 ct-u-paddingBottom60">
                        <!-- Nav tabs -->
                        <ul class="nav nav-tabs" role="tablist">
                            <li role="presentation" class="active"><a href="#description" role="tab" data-toggle="tab">Description</a></li>
                            <li role="presentation"><a href="#amenities" role="tab" data-toggle="tab">Amenities</a></li>
                            <li role="presentation"><a href="#details" role="tab" data-toggle="tab">Technical Details</a></li>
                        </ul>

                        <!-- Tab panes -->
                        <div class="tab-content">
                            <!-- Tab #1 -->
                            <div role="tabpanel" class="tab-pane fade in active" id="description">
                                <h3 class="ct-fw-lighter ct-u-marginBoth50">20 people max, 5 cabins, 3 beds, 1 bathroom</h3>

                                <h6 class="ct-u-hr ct-u-hr--left ct-fw-bold text-uppercase">Charter Superyacht Core2015</h6>
                                <p class="ct-u-marginBottom50">The luxurious superyacht Core2015 is the culmination of the dreams of her Owner. She is a classically styled motor yacht which is absolutely perfect for large charters, especially with the very versatile cabin arrangements as well as a dining room that can seat as many as 20 guests and is bathed in natural light through its large atrium which is created by the glass bottomed Jacuzzi above.</p>

                                <h6 class="ct-u-hr ct-u-hr--left ct-fw-bold text-uppercase">Core2015's Accommodation</h6>
                                <p>Core2015 can sleep up to a maximum of twenty guests in her eleven stateroom layout which includes nine double staterooms, two twin staterooms and two convertibles. She accommodates for nineteen crew to ensure a relaxed and luxurious charter experience.</p>

                                <p>Texts from <a href="http://www.superyachts.com/yacht-charter/sherakhan-1422/">http://www.superyachts.com/yacht-charter/sherakhan-1422/</a></p>
                            </div>

                            <!-- Tab #2 -->
                            <div role="tabpanel" class="tab-pane fade" id="amenities">

                                <h3 class="ct-fw-lighter ct-u-marginTop50 ct-u-marginBottom20 ct-u-paddingBottom15 ct-u-borderBottom">Main features</h3>
                                <div class="row">
                                    <div class="col-md-3 col-xs-6">
                                        <ul class="ct-simpleList list-unstyled ct-u-marginBottom0">
                                            <li><i class="fa fa-check"></i><span>Air conditioner</span></li>
                                            <li><i class="fa fa-check"></i><span>Heating</span></li>
                                            <li class="disabled"><i class="fa fa-close"></i><span>Hot water</span></li>
                                        </ul>
                                    </div>
                                    <div class="col-md-3 col-xs-6">
                                        <ul class="ct-simpleList list-unstyled ct-u-marginBottom0">
                                            <li><i class="fa fa-check"></i><span>Refrigirator</span></li>
                                            <li><i class="fa fa-check"></i><span>Jacuzzi</span></li>
                                            <li class="disabled"><i class="fa fa-close"></i><span>Heating</span></li>
                                        </ul>
                                    </div>
                                    <div class="clearfix visible-xs"></div>
                                    <div class="col-md-3 col-xs-6">
                                        <ul class="ct-simpleList list-unstyled ct-u-marginBottom0">
                                            <li><i class="fa fa-check"></i><span>Electric grill</span></li>
                                            <li><i class="fa fa-check"></i><span>Showers</span></li>
                                            <li><i class="fa fa-check"></i><span>Generator</span></li>
                                        </ul>
                                    </div>
                                    <div class="col-md-3 col-xs-6">
                                        <ul class="ct-simpleList list-unstyled ct-u-marginBottom0">
                                            <li><i class="fa fa-check"></i><span>Microwave oven</span></li>
                                            <li class="disabled"><i class="fa fa-close"></i><span>External showers</span></li>
                                            <li class="disabled"><i class="fa fa-close"></i><span>Dinghy</span></li>
                                        </ul>
                                    </div>
                                    <div class="clearfix visible-xs"></div>
                                </div>

                                <h3 class="ct-fw-lighter ct-u-marginTop50 ct-u-marginBottom20 ct-u-paddingBottom15 ct-u-borderBottom">Entertainment</h3>
                                <div class="row">
                                    <div class="col-md-3 col-xs-6">
                                        <ul class="ct-simpleList list-unstyled ct-u-marginBottom0">
                                            <li><i class="fa fa-check"></i><span>Game console</span></li>
                                            <li><i class="fa fa-check"></i><span>Scuba diving</span></li>
                                         </ul>
                                    </div>
                                    <div class="col-md-3 col-xs-6">
                                        <ul class="ct-simpleList list-unstyled ct-u-marginBottom0">
                                            <li><i class="fa fa-check"></i><span>Cinema</span></li>
                                            <li><i class="fa fa-check"></i><span>Shark feeding</span></li>
                                       </ul>
                                    </div>
                                    <div class="clearfix visible-xs"></div>
                                    <div class="col-md-3 col-xs-6">
                                        <ul class="ct-simpleList list-unstyled ct-u-marginBottom0">
                                            <li><i class="fa fa-check"></i><span>Belly dancers</span></li>
                                            <li><i class="fa fa-check"></i><span>Mermaids</span></li>
                                        </ul>
                                    </div>
                                    <div class="col-md-3 col-xs-6">
                                        <ul class="ct-simpleList list-unstyled ct-u-marginBottom0">
                                            <li><i class="fa fa-check"></i><span>Board games</span></li>
                                            <li class="disabled"><i class="fa fa-close"></i><span>CD and DVD</span></li>
                                       </ul>
                                    </div>
                                    <div class="clearfix visible-xs"></div>
                                </div>

                                <h3 class="ct-fw-lighter ct-u-marginTop50 ct-u-marginBottom20 ct-u-paddingBottom15 ct-u-borderBottom">Other features</h3>
                                <div class="row">
                                    <div class="col-md-3 col-xs-6">
                                        <ul class="ct-simpleList list-unstyled ct-u-marginBottom0">
                                            <li><i class="fa fa-check"></i><span>Life raft</span></li>
                                            <li class="disabled"><i class="fa fa-close"></i><span>Sonar</span></li>
                                        </ul>
                                    </div>
                                    <div class="col-md-3 col-xs-6">
                                        <ul class="ct-simpleList list-unstyled ct-u-marginBottom0">
                                            <li><i class="fa fa-check"></i><span>Auto pilot</span></li>
                                            <li class="disabled"><i class="fa fa-close"></i><span>Whale harpoon</span></li>
                                        </ul>
                                    </div>
                                    <div class="clearfix visible-xs"></div>
                                    <div class="col-md-3 col-xs-6">
                                        <ul class="ct-simpleList list-unstyled ct-u-marginBottom0">
                                            <li><i class="fa fa-check"></i><span>GPS navigation</span></li>
                                            <li><i class="fa fa-check"></i><span>Safety kit</span></li>
                                        </ul>
                                    </div>
                                    <div class="col-md-3 col-xs-6">
                                        <ul class="ct-simpleList list-unstyled ct-u-marginBottom0">
                                            <li><i class="fa fa-check"></i><span>Motor navigation</span></li>
                                        </ul>
                                    </div>
                                    <div class="clearfix visible-xs"></div>
                                </div>

                             </div>

                            <!-- Tab #3 -->
                            <div role="tabpanel" class="tab-pane fade" id="details">
                                <h3 class="ct-fw-lighter ct-u-marginBoth50">Technical Details</h3>
                                <h6 class="ct-u-hr ct-u-hr--left ct-fw-bold text-uppercase">Equipment</h6>
                                <p class="ct-u-marginBottom50">
                                    TENDERS & TOYS
                                    2 x 30ft inflatable tenders type 90 EFB with 350hp YaCHa inboard engine.
                                    1 x Classic Runnerboat with 360hp SRYreN inboard engine.
                                    5 x YaCHa Waverunners
                                    1 x YaCHa Jetskis
                                    570ft/25m floating trampoline
                                    6 x kayak
                                    AMENITIES
                                    A glass bottomed Jacuzzi for 5
                                    A sauna and fully equipped spa room</p>
                            </div>
                        </div>

                    </div>
                    <div class="ct-socialSection">
                        <div class="ct-socialSection-backButton ct-u-sectionGrayDarker ct-u-textRight">
                            <a class="h6 text-uppercase ct-fw-bold" href="rent-now.html">Go back
                    <span class="ct-iconButton ct-iconButton--larger animated ct-u-margin10x9" data-fx="fadeIn">
                        <i class="fa fa-arrow-left animated" data-fx="bounceInRight" data-time="100"></i>
                    </span>
                            </a>
                        </div>
                        <div class="ct-socialSection-socialContainer ct-u-sectionMotive">
                            <ul class="ct-socials ct-socials--type3">
                                <li>Share</li>
                                <li><a data-toggle="tooltip" data-placement="top" title="facebook" href="#"><i class="fa fa-facebook-square"></i></a></li>
                                <li><a data-toggle="tooltip" data-placement="top" title="twitter" href="#"><i class="fa fa-twitter"></i></a></li>
                                <li><a data-toggle="tooltip" data-placement="top" title="google plus" href="#"><i class="fa fa-google-plus"></i></a></li>
                                <li><a data-toggle="tooltip" data-placement="top" title="linkedin" href="#"><i class="fa fa-linkedin"></i></a></li>
                                <li><a data-toggle="tooltip" data-placement="top" title="pinterest" href="#"><i class="fa fa-pinterest"></i></a></li>
                                <li><a data-toggle="tooltip" data-placement="top" title="digg" href="#"><i class="fa fa-digg"></i></a></li>
                                <li><a data-toggle="tooltip" data-placement="top" title="users" href="#"><i class="fa fa-users"></i></a></li>
                                <li><a data-toggle="tooltip" data-placement="top" title="yahoo" href="#"><i class="fa fa-yahoo"></i></a></li>
                                <li><a data-toggle="tooltip" data-placement="top" title="email" href="#"><i class="fa fa-envelope"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

<%@include file="/footer.jsp"%>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/index.js"></script>
</body>
</html>