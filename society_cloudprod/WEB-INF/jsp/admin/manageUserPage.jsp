<%@include file="../common/appConfig.jsp" %>
<html>
<HEAD>
   <%@include file="../common/appMetaConfig.jsp"%>
   <TITLE><spring:message code="common.title.label.product"/> :: Manage Users</TITLE> 
   <!-- CSS Files -->  
   
</HEAD>
<%
String mainMenu = "admin";
String subMenu  = "";
%>

<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
<%@include file="../common/header.jsp"%>
  <%@include file="../common/leftSideMenu.jsp"%>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
	<nav class="navbar-static-top">
  	<div id="subNavBar" class="navbar-collapse collapse in">
          <ul class="nav navbar-nav">
             <li>
				<a  href="javascript:;"  onclick="javascript: backURL();"><i class="fa fa-arrow-left" aria-hidden="true"></i>&nbsp;<spring:message code="common.button.back"/></a>
			</li>
		 </ul>
     </div>
     </nav>
    <!-- Content Header (Page header) -->
    <section class="content-header">
		  <h1>Manage Users</h1>
		  <hsCommonTag:breadCrumb pageTitle="Manage Users" isFirstIndex="false"/>
	 </section>
	 
	 <section class="content">
	 	<div class="row">
    		<div class="col-md-12">
    				<div class="box box-primary">
    					<form  class="form" id="userRoleForm">
							<input type="hidden" id="userId" name="userId">
						</form>
					    <div class="box-header with-border">
							
						</div>
						<div class="box-body">
							<table id="userGridDiv" class="table table-bordered table-striped table-hover dt-responsive"><!-- This will be populated by Ajax --></table>
						</div> <!--  end of body -->
						<div class="box-footer">
							
						</div>    					
    				</div>
    		</div> <!--  End of col 1 -->
    		
    	</div> <!-- End of main row -->
	 </section> <!--  end of content -->
  </div> <!-- End of content wrapper -->
  <%@include file="../common/footer.jsp"%>
  <%@include file="../common/rightSideMenu.jsp"%> 
</div> <!-- End of Wrapper -->
<!-- End Code for Footer -->
<script src="<%=jsRoot%>/admin/manageUserPage.js?${Server_Token_Value}" type="text/javascript"></script>
</body>
</html>
