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

<section class="ct-mediaSection ct-mediaSection--desktop ct-u-paddingTop60 ct-u-paddingBottom40" data-height="340" data-type="parallax" data-stellar-background-ratio="0.3" data-bg-image="./assets/images/demo-content/boats/bg-02.jpg" data-bg-image-mobile="./assets/images/demo-content/boats/bg-01-mobile.jpg">
    <div class="ct-mediaSection-inner ct-mediaSection-inner--bottom" data-stellar-ratio="0.7"><h2 class="ct-fw-lighter ct-u-hr ct-u-hr--wide text-center"></h2></div>
</section>

<form class="ct-u-sectionBorder">
    <div class="container">
        <div class="row">
            <div class="col-md-6 ct-u-paddingTop80">
                <div class="ct-sectionHeader ct-sectionHeader--left ct-u-marginBottom70">
                    <h2 class="ct-sectionHeader-title"><small><span>User </span> information</small></h2>
                    <div class="ct-sectionHeader-separator">
                    	<span class="minus"></span>
                        <span class="slash">/</span>
                        <span class="slash">/</span>
                        <span class="minus"></span>
                    </div>
                    <p>The information in your account does more than just identify you</p>
                </div>

                <div class="row ct-u-paddingBottom40">
                    <div class="col-sm-6 ct-u-paddingBottom30">
                        <div class="form-group">
                            <label for="first_name">Title</label>
                            <input id="first_name" class="form-control form-control--type2">
                        </div>
                    </div>
                    <div class="col-sm-6 ct-u-paddingBottom30">
                        <div class="form-group">
                            <label for="last_name">First Name</label>
                            <input id="last_name" class="form-control form-control--type2">
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="address-line1">Middle Name</label>
                    <input id="address-line1" class="form-control form-control--type2">
                </div>

                <div class="form-group">
                    <label for="address-line2">Family Name</label>
                    <input id="address-line2" class="form-control form-control--type2">
                </div>

                <div class="form-group">
                    <label for="city">Full Name</label>
                    <input id="city" class="form-control form-control--type2">
                </div>

                <div class="row">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="state">Marital Status</label>
                             <select class="ct-select ct-js-selectize ct-u-marginBottom20 ct-js-billing" title="Select a country...">
                       				<option value="">Select a country...</option>
                       				<option value="AF">Afghanistan</option>
                      				<option value="AX">&Aring;land Islands</option>
                      				<option value="AL">Albania</option>
                      				<option value="DZ">Algeria</option>
                       				<option value="AS">American Samoa</option>
                        			<option value="AD">Andorra</option>
                        	</select>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="postal">Annivarsary Date</label>
                            <input id="postal" class="form-control form-control--type2">
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="username" class="required">Mobile Number</label>
                    <input id="username" required class="form-control form-control--type2">
                </div>

                <div class="form-group">
                    <label for="email" class="required">Email Address</label>
                    <input id="email" required class="form-control form-control--type2">
                </div>

                <div class="form-group">
                    <label for="password" class="required">Password</label>
                    <input id="password" type="password" required class="form-control form-control--type2">
                </div>

                <div class="form-group">
                    <label for="password-confirm" class="required">Please re-enter Password</label>
                    <input id="password-confirm" type="password" required class="form-control form-control--type2">
                </div>
            </div>
		</div>
	</div>
</form>	

<%@include file="footer.jsp"%>

</div>

<%@include file="commonJs.jsp"%>

</body>
</html>