<%@page import="app.societywala.society.bo.FacilityCostType"%>
<%@page import="app.societywala.society.bo.FacilityBO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@include file="../common/appConfig.jsp" %>
<html>
<HEAD>
	<%@include file="../common/appMetaConfig.jsp"%>
	<TITLE><spring:message code="common.title.label.product"/> :: Facility Details</TITLE>
</HEAD>
<%
String mainMenu = "manageSociety";
String subMenu  = "facility";
Map<String,Object> sessionCommonModelMap = (Map<String,Object>) session.getAttribute(CommonConstant.SESSION_COMMON_MODEL_MAP);
String pageRenderMode = (String)sessionCommonModelMap.get(CommonConstant.PAGE_RENDER_MODE);
String formSubmitAction = ctxPath+"/society/saveFacilityDetails.htm";
FacilityBO facilityBO =  (FacilityBO) request.getAttribute("facilityBO");
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
		  <h1>Facility Details</h1>
		  <hsCommonTag:breadCrumb pageTitle="Facility Details" isFirstIndex="false"/>
	 </section>
	 
	 <section class="content">
	 	<div class="row">
    		<div class="col-md-12">
    				<form:form cssClass="form" method="post" action="<%=formSubmitAction%>" commandName="facilityBO">
	    			<form:hidden path="facilityId"/>
    				<div class="box box-primary">
						<div class="box-header with-border">
						</div>
						<div class="box-body">
						<div class="form-group">
							<form:label cssClass="control-label required" path="facilityName">Name</form:label>
							<form:input cssClass="form-control" path="facilityName" required="required"/>							
						</div>
						<div class="form-group">
							<form:label cssClass="control-label" path="facilityDescription">Description</form:label>
							<form:input cssClass="form-control" path="facilityDescription"/>		
						</div>
						
						<div class="form-group">
							<form:label cssClass="control-label required" path="costType">Cost Type</form:label>
							<form:select cssClass="form-control" path="costType" required="required">
								<form:option value="<%=FacilityCostType.FREE%>">No Cost</form:option>
								<form:option value="<%=FacilityCostType.DAILY_BASIS%>">Daily Basis</form:option>
								<form:option value="<%=FacilityCostType.HOURLY_BASIS%>">Hourly Basis</form:option>
							</form:select>			
						</div>		
						
						<div class="form-group">
							<form:label cssClass="control-label" path="isMemberCanUse">For Member Usage</form:label>
							<form:checkbox path="isMemberCanUse"/>
						</div>
						
						<div class="form-group">
							<form:label cssClass="control-label" path="memberUseCost">Member Cost (Rs.)</form:label>
							<form:input cssClass="form-control" path="memberUseCost" number="number"/>		
						</div>
						
						
						<div class="form-group">
							<form:label cssClass="control-label" path="isOutsideMemberCanUse">For Outside Member Usage</form:label>
							<form:checkbox path="isOutsideMemberCanUse"/>
						</div>
						
						<div class="form-group">
							<form:label cssClass="control-label" path="ousideMemberUseCost">Outside Member Cost (Rs.)</form:label>
							<form:input cssClass="form-control" path="ousideMemberUseCost" number="number"/>		
						</div>
						</div>
						<div class="box-footer">
							<% if (pageRenderMode.equals(CommonConstant.CREATE_MODE) || pageRenderMode.equals(CommonConstant.EDIT_MODE)){ %>
							 <button type="submit" class="btn btn-primary"><spring:message code="common.button.save"/></button>
							 <%} %>
						</div>
    				</div>
    				</form:form>
    		</div> <!--  End of col 1 -->
    		
    	</div> <!-- End of main row -->
	 </section> <!--  end of content -->
  </div> <!-- End of content wrapper -->
  <%@include file="../common/footer.jsp"%>
  <%@include file="../common/rightSideMenu.jsp"%> 
</div> <!-- End of Wrapper -->
</body>
<!-- JS Files --> 
<script src="<%=jsRoot%>/society/facilityDetailsPage.js?${Server_Token_Value}" type="text/javascript"></script>
</html>