<%@page import="app.societywala.user.bo.UserRoleType"%>
<%@page import="app.societywala.common.constants.CommonConstant"%>
<%@page import="java.util.Map"%>
<%@include file="../common/appConfig.jsp" %>
<html>
<HEAD>
 <%@include file="../common/appMetaConfig.jsp"%>
 <link rel="stylesheet" type="text/css" href="<%=cssRoot%>/society/manageSocietyPanelPage.css?${Server_Token_Value}" />
   <TITLE><spring:message code="common.title.label.product"/> :: My Team Details</TITLE>   
</HEAD>

<%
String mainMenu = "";
String   subMenu = "";
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
    	<h1>My Team Details</h1>
		<hsCommonTag:breadCrumb pageTitle="My Team Details" isFirstIndex="true" isSocietyNameDisplay="false"/> 
	</section> <!-- End of content Header -->
	<section class="content">
    	<div class="row">
    		<div class="col-md-12">
			<div class="box box-primary">    			
				<div class="box-header with-border">
					<div>
						<button class="btn btn-primary margin" onclick="javascript:searchUserPopupPage();">Add Team Member</button>
		          	</div> 
		         </div>
		          <div class="box-body">   
		          		<div class="box-body no-padding" id="AllMembers"> 			
 						                 				          				
               			</div>						
				  </div>
				  			
				  <div class="box-footer">
				  </div>              					
		    </div>
    		</div>
  		</div>
  	</section>
  	</div>
  <!-- /.content-wrapper --> 
  <%@include file="../common/footer.jsp"%>
  <%@include file="../common/rightSideMenu.jsp"%>
</div>

<div class="modal fade" id="popupFormForAddTeam" tabindex="-1" role="dialog" aria-labelledby="Team Member Details">
</div>

</body>
<script type="text/javascript" src="<%=jsRoot%>/user/manageMyTeam.js?${Server_Token_Value}"></script>

</html>