<%@page import="java.util.Map"%>
<%@page import="app.societywala.common.constants.CommonConstant"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="app.societywala.society.bo.SocietyBuildingBO"%>
<%@page import="java.util.List"%>
<%@include file="../common/appConfig.jsp" %>
<html>
<HEAD>
	<%@include file="../common/appMetaConfig.jsp"%>
	<TITLE><spring:message code="common.title.label.product"/> :: Building Details</TITLE>
</HEAD>

<%
String mainMenu = "manageSociety";
String subMenu = "propertyDetails";
String wizard   = "defineStructure";
String formSubmitAction=ctxPath+"/society/saveSocietyBuildingDetails.htm";
Map<String,Object> sessionCommonModelMap = (Map<String,Object>) session.getAttribute(CommonConstant.SESSION_COMMON_MODEL_MAP);
String pageRenderMode = (String)sessionCommonModelMap.get(CommonConstant.PAGE_RENDER_MODE);
List<SocietyBuildingBO> societyBuildingList = (List<SocietyBuildingBO>)request.getAttribute("societyBuildingList");
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
	       		<spring:message code="society.building.form.header"/>
	      </h1>
	      <%}  else if (pageRenderMode.equals(CommonConstant.EDIT_MODE))  {%>
	      <h1>
	       		<spring:message code="society.building.form.header.lable.updateBuildings"/>
	      </h1>
	      <%} else if (pageRenderMode.equals(CommonConstant.VIEW_MODE))  {%>
	      <h1>
	       		<spring:message code="society.building.form.header.lable.viewBuildings"/>
	      </h1>
	      <%} %>
	      <!-- Start Code for Bread crumb -->
	  <hsCommonTag:breadCrumb pageTitle="Building Details" isFirstIndex="false"/> 
    </section>
    
    <!-- Main content -->
    <section class="content">
    	<div class="row">
    		<div class="col-md-12">
    			<div class="box box-primary box-body">
		    	<%if (pageRenderMode.equals(CommonConstant.CREATE_MODE)  || pageRenderMode.equals(CommonConstant.EDIT_MODE)) {%>
		    	<div class="row">    		
		    		<button class="col-md-2 btn btn-primary margin" onclick="javascript:addNewBuilding();"><spring:message code="society.button.add.building"/></button>    		
		    	</div>
		    	<%} %>
		    	
		    	<form action="<%=formSubmitAction%>" method="post">
		    		<input type="hidden" name="buildingCounter" id="buildingCounter" value="<%=societyBuildingList.size()%>"/>
		    		<div id="appendBuildingDiv">
		    			<div id="tableHeaderDiv" class="row margin">
							<div class="col-md-3"><label class="required"><spring:message code="society.label.building.name"/></label></div>
							<div class="col-md-3"><label class="required"><spring:message code="society.label.building.level"/></label></div>
							<div class="col-md-3"><label class="required"><spring:message code="society.label.building.baseLevel"/></label></div>
							<div class="col-md-3"></div>
						</div>
						<c:forEach items="${societyBuildingList}" var="societyBuildingBO" varStatus="counter">
					    <div id="innerDiv${counter.count}" class="row margin">	
					     	<div class="col-md-3"><input type="text" class="form-control" name="buildingName${counter.count}" id="buildingName${counter.count}" value="${societyBuildingBO.societyBuildingName}" required/></div>
					     	<div class="col-md-3"><input type="text" class="form-control" name="buildingLevel${counter.count}" id="buildingLevel${counter.count}" value="${societyBuildingBO.countOfFloorLevels}" readonly/></div>
					    	<div class="col-md-3"> <input type="text" class="form-control" name="buildingBaseLevel${counter.count}" id="buildingBaseLevel${counter.count}" value="${societyBuildingBO.countOfBasementLevels}" readonly/></div>	
					     <input type="hidden" name="buildingId${counter.count}" id="buildingId${counter.count}" value="${societyBuildingBO.societyBuildingId}"/>
					     <input type="hidden" name="buildingStatus${counter.count}" id="buildingStatus${counter.count}" value="update"/>
						 <%if (pageRenderMode.equals(CommonConstant.CREATE_MODE) || pageRenderMode.equals(CommonConstant.EDIT_MODE))
			             {%>
					     	<div class="col-md-3"><input type="button" class="btn btn-danger" onclick="javascript:deletePersistanceBuilding('${counter.count}');" value="<spring:message code="common.button.delete"/>" /></div>
					     <%
			             }
					     %>
					    </div>
						</c:forEach>    			
		    		</div>
		    		
		    		<div class="row">  
		    			<%if (pageRenderMode.equals(CommonConstant.CREATE_MODE) || pageRenderMode.equals(CommonConstant.EDIT_MODE)) {%>
						<button class="btn btn-primary margin" type="submit">
								<spring:message code="common.button.saveAndContinue"/>
						</button>
						<%}%>
		    		</div>		    		
		    	</form>
		    	</div>
		    </div> <!-- .End of col 1 -->
		    
		  </div> <!-- End of Main Row -->
    </section>
    
   </div> <!-- ./End of content wraper -->
   
   <%@include file="../common/footer.jsp"%>
   <%@include file="../common/rightSideMenu.jsp"%> 
   
</div> <!-- ./End of wrapper -->

</body>
<!-- JS Files -->
<script type="text/javascript" src="<%=jsRoot%>/society/manageSocietyDashboard.js?${Server_Token_Value}"></script>
<script src="<%=jsRoot%>/society/manageAllBuilding.js?${Server_Token_Value}" type="text/javascript"></script>
</html>