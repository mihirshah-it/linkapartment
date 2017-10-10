<%@page import="app.societywala.user.bo.UserRoleType"%>
<%@page import="app.societywala.common.constants.CommonConstant"%>
<%@page import="java.util.Map"%>
<%@include file="../common/appConfig.jsp" %>
<html>
<HEAD>
 <%@include file="../common/appMetaConfig.jsp"%>
 <link rel="stylesheet" type="text/css" href="<%=cssRoot%>/society/manageSocietyPanelPage.css?${Server_Token_Value}" />
   <TITLE><spring:message code="common.title.label.product"/> :: Panel Details</TITLE>   
</HEAD>

<%
String mainMenu = "manageSociety";
String   subMenu = "societyPanel";
String wizard   = "definePanel";
String saveAndContinueClickAction=ctxPath+"/society/saveSocietyPanelPage.htm";
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
    	<%if (pageRenderMode.equals(CommonConstant.CREATE_MODE)) {%>
		<h1><spring:message code="society.building.panel.form.header"/></h1>
		<%} else if (pageRenderMode.equals(CommonConstant.EDIT_MODE)) {%>
		<h1><spring:message code="society.building.panel.form.headerlable.updatePanel"/></h1>
		<%} else if (pageRenderMode.equals(CommonConstant.VIEW_MODE)) {%>
	   <h1><spring:message code="society.building.panel.form.headerlable.viewPanel"/></h1>
		<%} %>
		<hsCommonTag:breadCrumb pageTitle="Panel Details" isFirstIndex="false"/> 
	</section> <!-- End of content Header -->
	
	<!-- Main content -->
    <section class="content">
    	<div class="row">
    		<div class="col-md-12">
    			<div class="row">
				<div class="col-md-3">
						<div class="box box-primary">    			
    						<div class="box-header with-border">
                  					<h3 class="box-title"><spring:message code="society.building.panel.chairman"/></h3>                  					
                  			</div>
                  			<div class="box-body userPanel-list-div userPanel" id="<%=UserRoleType.CHAIR_MAN%>">
                  				<ul class="clearfix list-unstyled"></ul>                  				
                  			</div>
						</div>
				</div>	
				<div class="col-md-3">
					<div class="box box-primary">    			
    						<div class="box-header with-border">
                  					<h3 class="box-title"><spring:message code="society.building.panel.secretary"/></h3>                  					
                  			</div>
                  			<div class="box-body userPanel-list-div userPanel" id="<%=UserRoleType.SECRETARY%>">
                  				<ul class="clearfix list-unstyled"></ul>              				
                  			</div>
					</div>				
				</div>	
				<div class="col-md-3">
					<div class="box box-primary">    			
    						<div class="box-header with-border">
                  					<h3 class="box-title"><spring:message code="society.building.panel.treasurer"/></h3>                  					
                  			</div>
                  			<div class="box-body userPanel-list-div userPanel" id="<%=UserRoleType.TRESURER%>"> 
                  				<ul class="clearfix list-unstyled"></ul>                  				
                  			</div>
					</div>					
				</div>	
				<div class="col-md-3">
					<div class="box box-primary">    			
    						<div class="box-header with-border">
                  					<h3 class="box-title"><spring:message code="society.building.panel.admin"/></h3>                  					
                  			</div>
                  			<div class="box-body userPanel-list-div" id="<%=UserRoleType.SOCIETY_ADMIN%>">
                  				                				
                  			</div>
					</div>
				</div>
				</div>	
				
				<div class="box box-primary">    			
   						<div class="box-header with-border">
                 					<h3 class="box-title"><spring:message code="society.building.panel.Members"/></h3>                  					
                 			</div>
                 			<div class="box-body no-padding userPanel-list-div userPanel" id="<%=UserRoleType.ACTIVE_MEMBER%>">
                				     				
                 			</div>
				</div>
				
				<div class="box box-primary">    			
    						<div class="box-header with-border">
                  					<h3 class="box-title"><spring:message code="society.building.panel.allOwners"/></h3>                  					
                  			</div>
                  			<div class="box-body no-padding  userPanel-list-div" id="AllMembers">                  				          				
                  			</div>						
				</div>				
				
				
				<div class="box-footer">
		             	<%if (pageRenderMode.equals(CommonConstant.CREATE_MODE)) {%>
               				<button id="saveAndFinishBtn" class="btn btn-primary" onclick="javascript:window.location='<%=saveAndContinueClickAction%>'"><spring:message code="common.button.saveAndFinish"/></button>
               				<%} else if (pageRenderMode.equals(CommonConstant.EDIT_MODE)) {%>
               				<button id="saveAndFinishBtn" class="btn btn-primary" onclick="javascript:window.location='<%=saveAndContinueClickAction%>'"><spring:message code="common.button.Update"/></button>
               				<% } %>	
              	</div>
			</div><!-- .End of col1 -->
    		
        </div> <!--  End of Main Row -->
     </section>
     
   </div>
 <!-- /.content-wrapper --> 
  <%@include file="../common/footer.jsp"%>
  <%@include file="../common/rightSideMenu.jsp"%>
 
</div>

<div class="modal fade" id="popupFormForChangeAdmin" tabindex="-1" role="dialog" aria-labelledby="Admin details">
</div>
     
</body>
</html>
<script>
  var jpageRenderMode = '<%=pageRenderMode%>';
</script>
<script type="text/javascript" src="<%=jsRoot%>/society/manageSocietyDashboard.js?${Server_Token_Value}"></script>
<script type="text/javascript" src="<%=jsRoot%>/society/manageSocietyPanelPage.js?${Server_Token_Value}"></script>
</html>