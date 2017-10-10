<%@page import="app.societywala.user.bo.PropertyStaffBO"%>
<%@page import="java.util.Map"%>
<%@include file="../common/appConfig.jsp" %>

<html>
<HEAD>
   <%@include file="../common/appMetaConfig.jsp"%>
   <TITLE><spring:message code="common.title.label.product"/> :: Property Staff Mapping</TITLE>
</HEAD>
<%
String mainMenu = "manageSociety";
String subMenu  = "propertyStaff";
String wizard   = "propertyStaffMappingDetail";
Map<String,Object> sessionCommonModelMap = (Map<String,Object>) session.getAttribute(CommonConstant.SESSION_COMMON_MODEL_MAP);
String pageRenderMode = (String)sessionCommonModelMap.get(CommonConstant.PAGE_RENDER_MODE);
PropertyStaffBO propertyStaffBO = (PropertyStaffBO)request.getAttribute("propertyStaffBO"); 
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
		  <h1><spring:message code="user.manage.property.staff.mapping.page.header"/></h1>
		  <hsCommonTag:breadCrumb pageTitle="Property Staff Mapping" isFirstIndex="false"/>
	 </section>
	 
	 <section class="content">
	 	<div class="row">
    		<div class="col-md-12">
    				<!-- Start Code for wizard -->
					<%@ include file="propertyStaffWizard.jsp" %>
					<!-- End Code for wizard -->
    				<div class="box box-primary">
    					<form id="propertyStaffFormForward" method="post">
							   <input type="hidden" name="propertyStaffId" id="propertyStaffId" value="<%=propertyStaffBO.getPropertyStaffId()%>">
						</form>
					    <div class="box-header with-border">
					    	<%if (pageRenderMode.equals(CommonConstant.CREATE_MODE)  || pageRenderMode.equals(CommonConstant.EDIT_MODE)) {%>	
								<button class="btn btn-primary" onclick="javascript:showPropertyStaffMappingPopup();"><spring:message code="user.manage.property.staff.mapping.btn.add.property"/></button>											
							<%} %>							
						</div>
						<div class="box-body">
							<table id="propertyStaffMappingGridDiv" class="table table-bordered table-striped table-hover dt-responsive"></table>
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

<div class="modal fade" id="popupPropertyMappingFormDiv" tabindex="-1" role="dialog" aria-labelledby="Staff Mapping">
</div>

<!-- JS Files -->  
<script>
  var jpageRenderMode = '<%=pageRenderMode%>';
  var propertyStaffId = '<%=propertyStaffBO.getPropertyStaffId()%>'
</script>
<script src="<%=jsRoot%>/user/managePropertyStaffMappingPage.js?${Server_Token_Value}" type="text/javascript"></script>
<script src="<%=jsRoot%>/user/propertyStaffWizard.js?${Server_Token_Value}" type="text/javascript"></script>
</body>
</html>