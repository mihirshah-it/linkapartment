<%@page import="java.util.Map"%>
<%@include file="../common/appConfig.jsp" %>

<html>
<HEAD>
	<%@include file="../common/appMetaConfig.jsp"%>
   <TITLE><spring:message code="common.title.label.product"/> :: Manage Facility</TITLE>
</HEAD>

<%
String mainMenu = "manageSociety";
String subMenu  = "facility";
Map<String,Object> sessionCommonModelMap = (Map<String,Object>) session.getAttribute(CommonConstant.SESSION_COMMON_MODEL_MAP);
String pageRenderMode = (String)sessionCommonModelMap.get(CommonConstant.PAGE_RENDER_MODE);
Long societyId=(Long)sessionCommonModelMap.get("societyID");
%>

<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
<%@include file="../common/header.jsp"%>
  <%@include file="../common/leftSideMenu.jsp"%>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
	<!-- Content Header (Page header) -->
    <section class="content-header">
		  <h1>Manage Facility</h1>
		  <hsCommonTag:breadCrumb pageTitle="Manage Facility" isFirstIndex="true"/>
	 </section>
	 
	 <section class="content">
	 	<div class="row">
    		<div class="col-md-12">
    				<form id="facilityForm" method="post">
						 <input type="hidden" id="facilityId" name="facilityId">
					</form>
    				<div class="box box-primary">
						<div class="box-header with-border">
							<% if (pageRenderMode.equals(CommonConstant.CREATE_MODE) || pageRenderMode.equals(CommonConstant.EDIT_MODE)){ %>
							<button type="button" onclick="javascript:createNewFacility();" class="btn btn-primary">Create New Facility</button>
							<%}%>
						</div>
						<div class="box-body">
							<table id="facilityGridDiv" class="table table-bordered table-striped table-hover dt-responsive"></table>
						</div>
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
<script>
  var jpageRenderMode = '<%=pageRenderMode%>';
</script>
<!-- JS Files -->  
<script src="<%=jsRoot%>/society/manageFacility.js?${Server_Token_Value}" type="text/javascript"></script>
</body>
</html>