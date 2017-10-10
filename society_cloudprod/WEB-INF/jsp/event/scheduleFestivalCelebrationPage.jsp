<%@page import="app.societywala.event.bo.FestivalStatusType"%>
<%@page import="app.societywala.event.bo.FestivalApprovalStatus"%>
<%@page import="java.util.Map"%>
<%@page import="app.societywala.common.bo.FoodTypeBO"%>
<%@page import="app.societywala.common.bo.FoodDietOptionBO"%>
<%@page import="java.util.List"%>
<%@page import="app.societywala.event.bo.FestivalContributionCostUOM"%>
<%@page import="app.societywala.event.bo.SocietyFestivalBO"%>
<%@include file="../common/appConfig.jsp" %>

<html>
<HEAD>
	<%@include file="../common/appMetaConfig.jsp"%>
	<TITLE><spring:message code="common.title.label.product"/> :: Festival Celebration Details</TITLE>
	<!-- CSS Files -->
</HEAD>

<%
String mainMenu = "manageEvent";
String subMenu  = "scheduleFestival";

Map<String,Object> sessionCommonModelMap = (Map<String,Object>) session.getAttribute(CommonConstant.SESSION_COMMON_MODEL_MAP);
String pageRenderMode = (String)sessionCommonModelMap.get(CommonConstant.AJAX_PAGE_RENDER_MODE);

String saveFestivalDetails=ctxPath+"/event/saveFestivalDetail.htm";

Boolean isUserIsApproval = new Boolean(false);

if(request.getAttribute("isUserApproval") != null) // This will happens only if user view the purchase order from dashboard or Grid.
{
	isUserIsApproval = (Boolean)request.getAttribute("isUserApproval");	
}

SocietyFestivalBO societyFestivalBO = (SocietyFestivalBO)request.getAttribute("societyFestivalBO");

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
		  <h1><spring:message code="event.festival.schedule.form.label.header"/></h1>
		  <hsCommonTag:breadCrumb pageTitle="Festival Celebration Details" isFirstIndex="false"/>
	 </section>
	 
	 <section class="content">
	 	<div class="row">
    		<div class="col-md-12">
    				<div class="box box-primary">
    					<form:form cssClass="form" method="post" id="festivalForm" name="festivalForm"  action="<%=saveFestivalDetails%>" commandName="societyFestivalBO">
					    <form:hidden path="festivalId"/>
					    <form:hidden path="festivalStatus"/>
						<div class="box-header with-border">
						</div>
						<div class="box-body">
						<div class="form-group">
							<form:label cssClass="control-label required" path="festivalName">Festival Title</form:label>
							<form:input cssClass="form-control" path="festivalName" required="required"/>
						</div>		
						
						<div class="form-group">
							<form:label cssClass="control-label required" path="displaystartDay">Select Festival Date</form:label>
							<div class="input-group date">
			                  <div class="input-group-addon">
			                    <i class="fa fa-calendar"></i>
			                  </div>
			                  <form:input cssClass="form-control pull-right datepicker" path="displaystartDay" dateFormat="dateFormat" required="required"/>
			                 </div>
						</div>
						
						<div class="form-group">
							<form:label cssClass="control-label required" path="displaystartTime">Festival Start Time</form:label>
							<form:select cssClass="form-control"  path="displaystartTime" required="required">
							  <% for(int i=0;i<24;i++) {
							      String displayTime = i+"";
								  if(i<10)
								  {
									  displayTime = "0"+i;
								  }
							  %>
							   <form:option value="<%=i%>"><%=displayTime%></form:option>
							   <% } %>
							</form:select>
						</div>
						
						<div class="form-group">
							<form:label cssClass="control-label required" path="displayEndTime">Festival End Time</form:label>
							<form:select cssClass="form-control" path="displayEndTime" required="required">
							    <% for(int i=0;i<24;i++) {
							      String displayTime = i+"";
								  if(i<10)
								  {
									  displayTime = "0"+i;
								  }
							  %>
							   <form:option value="<%=i%>"><%=displayTime%></form:option>
							   <% } %>
							 </form:select>
						</div>
						
						<div class="form-group">
							<form:label cssClass="control-label required" path="festivalLocation">Festival Location</form:label>
							<form:input cssClass="form-control" path="festivalLocation" required="required"/>				
						</div>
						
						<div class="form-group">
							<form:label cssClass="control-label required" path="festivalContributionCost">Festival Contribution Cost</form:label>
							<form:input cssClass="form-control" path="festivalContributionCost" required="required"/>
						</div>
						
						<div class="form-group">
							<form:label cssClass="control-label required" path="festivalContributionCostUOM">Festival Contribution Type</form:label>
							<form:select cssClass="form-control" path="festivalContributionCostUOM" required="required">
							      <form:option value="<%=FestivalContributionCostUOM.COST_PER_MEMBER%>"><%=FestivalContributionCostUOM.getCostContributionUOMName(FestivalContributionCostUOM.COST_PER_MEMBER) %></form:option>
							      <form:option value="<%=FestivalContributionCostUOM.COST_PER_PROPERTY%>"><%=FestivalContributionCostUOM.getCostContributionUOMName(FestivalContributionCostUOM.COST_PER_PROPERTY)%></form:option>
							 </form:select>
						</div>
						
						<div class="form-group">
							<form:label cssClass="control-label required" path="foodDietOption">Festival Diet Option</form:label>
							<form:checkboxes items="${foodDietOptionBOList}" itemLabel="foodDietName" itemValue="foodDietId"  path="foodDietOption" required="required"/>
						</div>
						
						<div class="form-group">
							<form:label cssClass="control-label required" path="foodDietOption">Festival Food Type</form:label>
							<form:checkboxes items="${foodTypeBOList}" itemLabel="foodTypeName" itemValue="foodTypeId"  path="foodTypeOptions" required="required"/>
						</div>
						
						
						<div class="form-group">
							<form:label cssClass="control-label required" path="festivalFormSubmissionLastDate">Form Submission Last Date</form:label>
							<div class="input-group date">
			                  <div class="input-group-addon">
			                    <i class="fa fa-calendar"></i>
			                  </div>
			                  <form:input cssClass="form-control pull-right datepicker" path="festivalFormSubmissionLastDate" dateFormat="dateFormat" required="required"/>
			                 </div>							
						</div>
						
						<div class="form-group">
							<form:label cssClass="control-label" path="festivalSchduleDescription">Schedule Details</form:label>
							<form:textarea cssClass="form-control" path="festivalSchduleDescription"/>								
						</div>
						
						<div class="form-group">
							<form:label cssClass="control-label" path="festivalNote">Note</form:label>
							<form:textarea cssClass="form-control" path="festivalNote"/>								
						</div>
						</div>
						<div class="box-footer">
							<%if (pageRenderMode.equals(CommonConstant.CREATE_MODE)) {%>
								<button type="submit" class="btn btn-primary"><spring:message code="common.button.save"/></button>								
							<%} else if (pageRenderMode.equals(CommonConstant.EDIT_MODE)) {%>
								<button type="submit" class="btn btn-primary"><spring:message code="common.button.Update"/></button>								
							<% } else if (pageRenderMode.equals(CommonConstant.VIEW_MODE) && isUserIsApproval && (!societyFestivalBO.getFestivalStatus().equals(FestivalStatusType.PUBLISHED))) {%>
								<input type="button" class="btn btn-success" value="<spring:message code="common.button.approve"/>" onclick="javascript:approvalCommentPopup('Approve','<%=FestivalApprovalStatus.APPROVED%>');">
								<input type="button" class="btn btn-danger" value="<spring:message code="common.button.reject"/>" onclick="javascript:approvalCommentPopup('Reject','<%=FestivalApprovalStatus.REJECTED%>');">
							<% } if (pageRenderMode.equals(CommonConstant.VIEW_MODE) ||  societyFestivalBO.getFestivalStatus().equals(FestivalStatusType.PUBLISHED)) { %>
								<input type="button" class="btn btn-primary" value="Register" onclick="javascript:registrationPopup();">
							<% } %>	
						</div>
						</form:form>
    				</div>
    		</div> <!--  End of col 1 -->
    		
    	</div> <!-- End of main row -->
	 </section> <!--  end of content -->
  </div> <!-- End of content wrapper -->
  <%@include file="../common/footer.jsp"%>
  <%@include file="../common/rightSideMenu.jsp"%> 
</div> <!-- End of Wrapper -->


<div class="modal fade" id="popupDivComment" tabindex="-1" role="dialog" aria-labelledby="User Approval Comment">
<div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
      		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        	<h4 class="modal-title" id="myModalLabel">
        		Approval Details	
        	</h4>
	  </div>
	  <div class="modal-body">
	  	<input type="hidden" id="approvalActionType" name="approvalActionType">
	  	<div class="form-group">
			<label class="control-label required">Comment</label>
			<textarea name="userComment" id="userComment"></textarea>				
		</div>
	  </div>
	  <div class="modal-footer">
	  	<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	  	<button type="button" class="btn btn-primary" data-dismiss="modal" id="approvalCommentSubmit" onclick="submitApprovalAction();"></button>
	  </div>
	</div>
</div>
</div>

<div class="modal fade" id="popupDivFestivalEntollment" tabindex="-1" role="dialog" aria-labelledby="Register Form">
</div>

</body>
<!-- JS Files -->  
<script type="text/javascript" src="<%=jsRoot%>/event/scheduleFestivalCelebrationPage.js?${Server_Token_Value}"></script>
</html>