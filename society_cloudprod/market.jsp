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
    <%@include file="commonJs.jsp"%>
</head>

<body class="cssAnimate boats ct-navbar--toFixed ct-navbar--toMotive">
	 <!-- Preloader -->
<!--<div class="ct-preloader-container">                                           
    <div class='ct-preloader'><div><div><div><div><div><div><div><div><div><div></div></div></div></div></div></div></div></div></div></div></div>
</div>-->

<%@include file="topbar.jsp"%>

<form id="providerDetailsForm" name="providerDetailsForm" method="post" >
	<input type="hidden" id="providerId" name="providerId"/>
</form>

<div class="ct-u-paddingTop60 ct-u-sectionBorder">
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <div class="form-group ct-widget-search ct-u-marginBottom30">
                    <input placeholder="Search..." type="text" name="field[]" class="form-control">
                    <button type="submit"><i class="fa fa-search fa-fw"></i></button>
                </div>

                <div class="ct-widget ct-widget-categories ct-u-marginBottom30">
                    <h3 class="ct-widget-header">Categories</h3>
                    <div class="ct-widget-content" id="categoryListDiv">
                        
                    </div>
                </div>
               
            </div>

            <div class="col-md-8 ct-u-paddingBottom150">
                <div class="ct-blog ct-u-paddingBottom50" id="serviceProviderDiv">                    
                </div>              
				
                <!--
                 Pagination
                 <div class="ct-pagination">
                    <ul>
                        <li><a href="#">1</a></li>
                        <li><span>2</span></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">5</a></li>
                    </ul>
                    <span>Page <a href="#">2</a> of <a href="#">5</a></span>
                </div> -->

            </div>
        </div>
    </div>
</div>

<%@include file="footer.jsp"%>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/index.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/market/market.js"></script>
</body>
</html>