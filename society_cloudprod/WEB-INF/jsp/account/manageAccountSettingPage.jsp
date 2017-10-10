<%@page import="java.util.Map"%>
<%@include file="../common/appConfig.jsp" %>
<html>
<HEAD>
   <%@include file="../common/appMetaConfig.jsp"%>
   <TITLE><spring:message code="common.title.label.product"/> :: Account Setting</TITLE>
</HEAD>
<%
String mainMenu = "manageAccount";
String subMenu = "manageAccountSetting";
Map<String,Object> sessionCommonModelMap = (Map<String,Object>) session.getAttribute(CommonConstant.SESSION_COMMON_MODEL_MAP);
String pageRenderMode = (String)sessionCommonModelMap.get(CommonConstant.PAGE_RENDER_MODE);
%>

<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
<%@include file="../common/header.jsp"%>
  <%@include file="../common/leftSideMenu.jsp"%>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
	<!-- Content Header (Page header) -->
    <section class="content-header">
		  <h1>Account Setting</h1>
		  <hsCommonTag:breadCrumb pageTitle="Account Setting" isFirstIndex="true"/>
	 </section>
	 
	 <section class="content">
	 	<div class="row">
    		<div class="col-md-12">
    				<div class="box box-primary">
						<div class="box-header with-border">
							<%if (pageRenderMode.equals(CommonConstant.CREATE_MODE)  || pageRenderMode.equals(CommonConstant.EDIT_MODE)) {%>
							<div id="accountSettingOptionsDiv">				
							<button id="currentPeriod" class="col-md-3 btn btn-default margin" onclick="javascript:manageCurrentPeriod();setSelectedButton('currentPeriod');">Current Period</button>
			    			<button id="currentSequence" class="col-md-3 btn btn-default margin" onclick="javascript:manageAccountSettingModuleSequence();setSelectedButton('currentSequence');">Current Sequence</button>
			            	<button id="carryForwardAccount" class="col-md-3 btn btn-default margin" onclick="javascript:manageCarryForward();setSelectedButton('carryForwardAccount');">Carry Forward Account</button>
			            	</div>
			            	<%} %>
						</div>
						<div class="box-body">
							<div class="accountSettingDetailsDiv" id="accountSettingDetailsDiv">
		
							</div>
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
</body>


<!-- JS Files -->  
<script>
  var jpageRenderMode = '<%=pageRenderMode%>';
</script>
<script src="<%=jsRoot%>/account/manageAccountSettingPage.js?${Server_Token_Value}" type="text/javascript"></script>
</html>