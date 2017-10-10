<%@page import="app.societywala.common.constants.CommonConstant"%>
<%@page import="java.util.Map"%>
<%@page import="app.societywala.society.bo.SocietyBuildingBO"%>
<%@page import="java.util.List"%>
<%@include file="../common/appConfig.jsp" %>
<html>
<HEAD>
	<%@include file="../common/appMetaConfig.jsp"%>
   <TITLE><spring:message code="common.title.label.product"/> :: Property Details</TITLE>
   <style type="text/css">
   .modal .modal-dialog { width: 90%; }
   </style>  
</HEAD>

<%
String mainMenu = "manageSociety";
String subMenu  = "propertyDetails";
String wizard   = "addMember";
String saveAndContinueClickAction=ctxPath+"/society/saveBuildingPropertyPage.htm";
List<SocietyBuildingBO> societyBuildingList = (List<SocietyBuildingBO>)request.getAttribute("societyBuildingList");
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
	      <h1>
	       		<spring:message code="society.building.property.form.header"/>
	      </h1>
	      <%}  else if (pageRenderMode.equals(CommonConstant.EDIT_MODE))  {%>
	      <h1>
	       		<spring:message code="society.building.property.form.header.lable.updateProperty"/>
	      </h1>
	      <%} else if (pageRenderMode.equals(CommonConstant.VIEW_MODE))  {%>
	      <h1>
	       		<spring:message code="society.building.property.form.header.lable.viewProperty"/>
	      </h1>
	      <%} %>
	      <!-- Start Code for Bread crumb -->
	  <hsCommonTag:breadCrumb pageTitle="Property Details" isFirstIndex="false"/> 
    </section>
		
	<!-- Main content -->
    <section class="content">
    	<div class="row">
    		<div class="col-md-12">
    			<div class="box box-primary">			    	
			    	<div class="box-header">
			    		<%if (pageRenderMode.equals(CommonConstant.CREATE_MODE)  || pageRenderMode.equals(CommonConstant.EDIT_MODE)) {%>
			    		<div class="row">  		
			    		<button class="col-md-3 btn btn-primary margin" onclick="javascript:configureBuilding();">Configure Building</button>
			    		<button class="col-md-3 btn btn-primary margin" onclick="javascript:addNewLevel();">Add Level</button>
			            <button class="col-md-3 btn btn-danger margin" onclick="javascript:deleteBuildingLevelId();">Delete Last Level</button>
			            </div>
			            <%} %>
			            <div class="row">
			            	  <div class="col-md-6">		
			                  <label for="buildingName" class="control-label"><spring:message code="society.property.lable.buildingName"/></label>
			                  <select class="form-control" id="buildingName" onchange="javascript:populateBuildingLevelId();">
			                    <c:forEach items="${societyBuildingList}" var="societyBuildingBO" varStatus="counter">
									<option value="${societyBuildingBO.societyBuildingId}">${societyBuildingBO.societyBuildingName}</option>
								</c:forEach>
			                  </select>
			                  </div>
			                  
			                  <div class="col-md-6">
			                  <label for="levelName" class="control-label">Level/Basement</label>                  
			                  <select class="form-control" id="levelName" onchange="javascript:showPropertyGridByLevelId();">
			                    
			                  </select>                  
			                 </div>
			            </div>            
			    	</div>
			    	
					 <!-- /.col -->
			         <div class="box-header with-border">
				          	<div class="row" id="buildingLevelPropertyGridDetails">
				           	 <div class="info box-title col-md-7"></div>
				           	 <div class="links col-md-5 btn-group"></div>
				    		</div>
				    </div>
				     <!-- /.box -->
					<div class="box-body">
					        <table id="buildingLevelPropertyGridDiv" class="table table-bordered table-striped table-hover dt-responsive">
					         </table>
					         
					        <table id="buildingLevelClosedPropertyGridDiv" class="table table-bordered table-striped table-hover dt-responsive">
					         </table>
					 </div>
					 <!-- /.box-body -->
			         
			         <div class="box-footer">
			                  	<%if (pageRenderMode.equals(CommonConstant.CREATE_MODE)) {%>
                				<button type="button" class="btn btn-primary" onclick="javascript:window.location='<%=saveAndContinueClickAction%>'"><spring:message code="common.button.saveAndContinue"/></button>
                				<%} else if (pageRenderMode.equals(CommonConstant.EDIT_MODE)) {%>
                				<button type="button" class="btn btn-primary" onclick="javascript:window.location='<%=saveAndContinueClickAction%>'"><spring:message code="common.button.Update"/></button>
                				<% } %>	
              		  </div>
			          
			          </div><!-- /.box -->
			</div> <!-- /.col -->
			       
			
		</div> <!-- End of main row -->
	</section>
	
</div>
 <!-- /.content-wrapper --> 
  <%@include file="../common/footer.jsp"%>
  <%@include file="../common/rightSideMenu.jsp"%>
 
</div>

<div class="modal fade" id="popupForm" tabindex="-1" role="dialog" aria-labelledby="property details">
</div>


<div class="modal fade" id="popupAssignMemberForm" tabindex="-1" role="dialog" aria-labelledby="Access details">
</div>

<div class="modal fade" id="popupAssignVehicalForm" tabindex="-1" role="dialog" aria-labelledby="Vehical details">
</div>

<div class="modal fade" id="popupManageIRegisterForm" tabindex="-1" role="dialog" aria-labelledby="Registe Member details">
</div>

<div class="modal fade" id="popupManageMemberRegisterForm" tabindex="-1" role="dialog" aria-labelledby="Member Register details">
</div>

<div class="modal fade" id="popupManageMemberSharesDetailsForm" tabindex="-1" role="dialog" aria-labelledby="Share Hold details">
</div>

<div class="modal fade" id="popupManageMemberSharesTransferDetailsForm" tabindex="-1" role="dialog" aria-labelledby="Share Transfer details">
s</div>

<!-- JS Files -->  
<script>
  var jpageRenderMode = '<%=pageRenderMode%>';
</script>
<script type="text/javascript" src="<%=jsRoot%>/society/manageSocietyDashboard.js?${Server_Token_Value}"></script>
<script src="<%=jsRoot%>/society/manageBuildingPropertyPage.js?${Server_Token_Value}" type="text/javascript"></script>
</body>
</html>