<div id="header">
			<div id="logo"></div>
			<div id="demoDiv">
			<!--DEMO-->
			</div>
			<div class="loginFormDiv">
				<div id="loginDiv">
					<form id="loginForm" class="loginForm">
						<div id="message" onclick="$(this).hide()"></div>
						<label>Mobile no / Email Id</label>
						<input type="text" id="loginName" value=""></input>
						<label>Password</label>
						<input type="password" id="userPassword" value=""></input>
						<input type="button" id="loginBtn" value="Login" onclick="javascript:authenticateUser();"></input>
					</form>
					<div id="loginLinkPanel" class="loginLinkPanel">	
					<a href="javascript:openinPopup('<%=request.getContextPath()%>/user/createNewUser.htm' , 'JoinWindow')">Join</a>
					<a href="javascript:;" onclick="javascript:showForgotPasswordDiv();">Forgot Password</a>
				</div>
				<!--  <div id="registerYourSocietyDiv">Register Your Society</div>-->
				</div>
			
				<div id="forgotPasswordDiv"  style="visibility:hidden;">
					<form id="forgotPasswordForm" class="loginForm">
					<div id="message" onclick="$(this).hide()"></div>
							<label>Mobile no / Email Id</label>
							<input type="text" id="forgotUserName" name="forgotUserName" value=""></input>						
					<input type="button" id="forgotPasswordSubmitBtn" value="Submit" onclick="javascript:submitForgotPassword();"></input>
					<input type="button" id="forgotPasswordCancelBtn" value="Cancel" onclick="javascript:showLoginPasswordDiv();"></input>
					</form>		
				</div>			
			</div>		
					
</div>
<div id="menuBar">
			<div id="menuDiv">
				<a href="index.jsp" <% if(currentPage.equals("index")){%>class="selectedPage"<%}%> >Home</a>
				<a href="features.jsp" <% if(currentPage.equals("features")){%>class="selectedPage"<%}%>>Features</a>
				<a href="package.jsp" <% if(currentPage.equals("package")){%>class="selectedPage"<%}%>>Package</a>
				<a href="pricing.jsp" <% if(currentPage.equals("pricing")){%>class="selectedPage"<%}%>>Pricing</a>
				<a href="faq.jsp" <% if(currentPage.equals("faq")){%>class="selectedPage"<%}%>>FAQ</a>
				<a href="contactUs.jsp" <% if(currentPage.equals("contactUs")){%>class="selectedPage"<%}%>>ContactUs</a>
			</div>
			<div id="fb-root"></div>
				<div class="fb-like" data-href="http://www.hamarisociety.com" data-send="false" 
				data-layout="button_count" data-width="50" data-show-faces="true" data-font="arial"></div>
        	<g:plusone size="small"></g:plusone>
        	<a href="https://twitter.com/share" class="twitter-share-button" data-url="http://www.hamarisociety.com">Tweet</a>
        	<!-- <div id="linksDiv">				
				<a id="contactUsDiv" href="contactUs.jsp" class="icon contact"></a>
				<a id="siteMapDiv" 	href="siteMap.jsp" class="icon siteMap"></a>
				<a id="homeDiv" 	href="index.jsp" class="icon home"></a>
				<a id="TweeterDiv" 	href="#" class="icon tweeter"></a>				
				<a id="faceBookDiv" href="#" class="icon faceBook" title=faceBookLink></a>
			</div>-->
</div>
<!-- Google Plus Scipt Starts -->
<script type="text/javascript">
  (function() {
    var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
    po.src = 'https://apis.google.com/js/plusone.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
  })();
</script>
<!-- Google Plus Scipt End -->
<!-- facebook code -->
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/all.js#xfbml=1";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
<!-- End of facebook code -->
<!-- Script for Tweeter -->
<script>
!function(d,s,id)
	{var js,fjs=d.getElementsByTagName(s)[0];
	if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="//platform.twitter.com/widgets.js";
	fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");
</script>
<!-- End of Script of Tweeter -->
<!-- Google Analytic Code -->
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-31079131-1']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
<!-- Google Analytic code end -->