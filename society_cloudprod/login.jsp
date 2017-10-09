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

<section id="loginDiv" class="ct-mediaSection ct-mediaSection--desktop ct-u-paddingTop50" data-type="pattern" data-bg-image="./assets/images/demo-content/boats/bg-05.jpg" data-bg-image-mobile="./assets/images/demo-content/boats/bg-05.jpg">
        <div class="ct-mediaSection-inner">
            <div class="container">
            	<li class=" onepage pull-left logo-menu">
           			<a href="#home">
                		<div class="ct-textEffect"><img src="assets/images/logo.png" alt="Link Logo"></div>
           			</a>
         		</li>
                <h2 class="ct-fw-lighter ct-u-hr ct-u-hr--wide text-center">login to your account</h2>

                <div class="row">
                    <div class="col-sm-6 ct-u-paddingTop30 ct-u-paddingBottom150">
                        <form class="ct-panel" id="loginForm">
                            <div class="ct-panel-inner">
                                <div class="form-group">
                                    <label for="loginName" class="required">Mobile Number or Email</label>
                                    <input id="loginName" required class="form-control form-control--type2">
                                </div>
                                <div class="form-group">
                                    <label for="userPassword" class="required">Password</label>
                                    <input id="userPassword" type="password" class="form-control form-control--type2" required>
                                </div>
                                <div class="ct-panel-meta">
                                    <button type="button" class="btn btn-motive" onclick="javascript:authenticateUser();" id="loginBtn"><span>Login</span></button>
                                    <div class="ct-checkbox text-center">
                                        <input id="remember" type="checkbox">
                                        <label for="remember" class="checkbox-inline text-lowercase">Remember me</label>
                                    </div>
                                    <a href="javascript:;" onclick="javascript:showForgotPasswordDiv();">Forgot password?</a>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </form>
                    </div>
                    
                  
                    
                    <div class="col-sm-6 ct-u-paddingTop30 ct-u-paddingBottom150">
                        <div class="ct-panel text-center">
                            <div class="ct-panel-inner">
                                <h2 class="ct-u-marginBottom30"><small class="ct-fw-300">Don't Have <span class="ct-fw-bold">an account?</span></small></h2>
                                <a href="javascript:;" onclick="javascript:openinPopup('<%=request.getContextPath()%>/user/createNewUser.htm' , 'JoinWindow');" class="btn btn-motive"><span>Sign Up Now</span></a>
                                <a href="javascript:;" onclick="window.location='<%=request.getContextPath()%>';" class="btn btn-motive"><span>Back To Home</span></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
 </section>
 
 
 <section id="forgotPasswordDiv" style="display:none;" class="ct-mediaSection ct-mediaSection--desktop ct-u-paddingTop50" data-type="pattern" data-bg-image="./assets/images/demo-content/boats/bg-05.jpg" data-bg-image-mobile="./assets/images/demo-content/boats/bg-05.jpg">
        <div class="ct-mediaSection-inner">
            <div class="container">
                <h2 class="ct-fw-lighter ct-u-hr ct-u-hr--wide text-center">Forgot your account</h2>

                <div class="row">
                    <div class="col-sm-6 ct-u-paddingTop30 ct-u-paddingBottom150">
                        <form class="ct-panel" id="forgotPasswordForm">
                            <div class="ct-panel-inner">
                                <div class="form-group">
                                    <label for="forgotUserName" class="required">Mobile Number or Email</label>
                                    <input id="forgotUserName" required class="form-control form-control--type2">
                                </div>
                                
                                <div class="ct-panel-meta">
                                    <button type="button" class="btn btn-motive" onclick="javascript:submitForgotPassword();"><span>Submit</span></button>                                    
                                    <a href="javascript:;" onclick="javascript:showLoginPasswordDiv();">Cancel</a>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </form>
                    </div>                
                  
                    
                    <div class="col-sm-6 ct-u-paddingTop30 ct-u-paddingBottom150">
                        <div class="ct-panel text-center">
                            <div class="ct-panel-inner">
                                <h2 class="ct-u-marginBottom30"><small class="ct-fw-300">Don't Have <span class="ct-fw-bold">an account?</span></small></h2>
                                <a href="javascript:openinPopup('<%=request.getContextPath()%>/user/createNewUser.htm' , 'JoinWindow');" class="btn btn-motive"><span>Sign Up Now</span></a>
                                <a href="javascript:;" onclick="window.location='<%=request.getContextPath()%>';" class="btn btn-motive"><span>Back To Home</span></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
 </section>
   


<%@include file="footer.jsp"%>

<%@include file="commonJs.jsp"%>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/index.js"></script>
</body>
</html>