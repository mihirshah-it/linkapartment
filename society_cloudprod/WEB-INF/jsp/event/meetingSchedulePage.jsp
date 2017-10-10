<%@page import="io.lamma.DayOfWeek"%>
<%@page import="app.societywala.event.bo.SocietyMeetingUserMappingBO"%>
<%@page import="app.societywala.event.bo.SocietyMeetingRoleMappingBO"%>
<%@page import="app.societywala.event.bo.MeetingStatusType"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="app.societywala.user.bo.UserRoleBO"%>
<%@page import="java.util.Set"%>
<%@page import="app.societywala.event.bo.SocietyMeetingBO"%>
<%@page import="app.societywala.user.bo.UserRoleType"%>
<%@include file="../common/appConfig.jsp" %>

<html>
<HEAD>
	<%@include file="../common/appMetaConfig.jsp"%>
	<TITLE><spring:message code="common.title.label.product"/> :: Meeting Schedule Details</TITLE>
</HEAD>

<%
String mainMenu = "manageEvent";
String subMenu  = "scheduleMeeting";
String wizard   = "meetingDetail";

Map<String,Object> sessionCommonModelMap = (Map<String,Object>) session.getAttribute(CommonConstant.SESSION_COMMON_MODEL_MAP);
String pageRenderMode = (String)sessionCommonModelMap.get(CommonConstant.AJAX_PAGE_RENDER_MODE);

String formSubmitAction=ctxPath+"/event/saveMeetingSchedule.htm";
SocietyMeetingBO societyMeetingBO = (SocietyMeetingBO)request.getAttribute("societyMeetingBO");
Set<SocietyMeetingRoleMappingBO> meetingRoleBOList = societyMeetingBO.getSocietyMeetingRoleMappingBOSet();

List<Long> userRoleIDList = new ArrayList<Long>();
if(meetingRoleBOList != null)
{
	for(SocietyMeetingRoleMappingBO societyMeetingRoleMappingBO : meetingRoleBOList)
	{
		userRoleIDList.add(societyMeetingRoleMappingBO.getUserRoleBO().getUserRoleId());
	}
}

Boolean isUserIsApproval = new Boolean(false);
SocietyMeetingUserMappingBO societyMeetingUserMappingBO = null;

if(request.getAttribute("isUserApproval") != null) // This will happens only if user view the purchase order from dashboard or Grid.
{
	isUserIsApproval = (Boolean)request.getAttribute("isUserApproval");
	societyMeetingUserMappingBO = (SocietyMeetingUserMappingBO)request.getAttribute("societyMeetingUserMappingBO");
}
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
		  <h1><spring:message code="event.schedule.meeeting.form.label.header"/></h1>
		  <hsCommonTag:breadCrumb pageTitle="Meeting Schedule Details" isFirstIndex="false"/>
	 </section>
	 
	 <section class="content">
	 	<div class="row">
    		<div class="col-md-12">
    				<div class="box box-primary">
    					<!--  This is use in all the meeting wizard -->
						<form id="showScheduleMeetingForm" method="post">
							 <input type="hidden" id="societyMeetingId" name="societyMeetingId">
						</form>
						<form:form cssClass="form" method="post" action="<%=formSubmitAction%>" commandName="societyMeetingBO">
						    <form:hidden path="meetingId"/>
						    <form:hidden path="meetingStatus"/>
						    <form:hidden path="sequenceNumber"/>	
						<!--  This is use in all the meeting wizard -->
						<div class="box-header with-border">
							<!-- Start Code for wizard -->
							<%@ include file="meetingWizard.jsp"%>
							<!-- End Code for wizard -->
						</div>
						<div class="box-body">
							<% if (pageRenderMode.equals(CommonConstant.CREATE_MODE) == true) { %>
						    <div class="form-group">
								<form:label cssClass="control-label required" path="isRecurrence">
								   Is Recurrence Meeting   
							  	</form:label>
							  	<form:radiobutton path="isRecurrence" value="true" onchange="javascript:showHideRecurringField();" required="required"/><spring:message code="common.label.yes"/>
							  	<form:radiobutton path="isRecurrence" value="false" onchange="javascript:showHideRecurringField();" required="required"/><spring:message code="common.label.no"/>
							</div>
							<%} %>
						    
						    <% if (pageRenderMode.equals(CommonConstant.CREATE_MODE) == false) { %>
							<div class="form-group">
								<form:label cssClass="control-label" path="sequenceNumber">
									<spring:message code="event.meeting.form.label.meetingNumber"/>
								</form:label>
								<form:label cssClass="control-label" path="sequenceNumber">
									${societyMeetingBO.sequenceNumber}
								</form:label>				
							</div>
							<% } %>
							
							<div class="form-group">
								<form:label cssClass="control-label required" path="meetingTitle">Meeting Type</form:label>
								<form:select path="meetingTypeBO" cssClass="form-control" required="required">
								   <option value="">---Select-----</option>
								   <form:options items="${meetingTypeBOList}" itemValue="meetingTypeId" itemLabel="meetingTypeName" />	
								</form:select>
							</div>
						    
						    <div class="form-group">
								<form:label cssClass="control-label required" path="chairPersonName">Meeting Chair Taker Name</form:label>
								<form:input path="chairPersonName" cssClass="form-control" required="required"/>
							</div>
						    
						   <div class="form-group">
								<form:label cssClass="control-label required" path="displaystartDay">Select Meeting Date</form:label>
								<div class="input-group date">
					                  <div class="input-group-addon">
					                    <i class="fa fa-calendar"></i>
					                  </div>
					                  <form:input cssClass="form-control pull-right datepicker" path="displaystartDay" dateFormat="dateFormat" required="required"/>
					             </div>
							</div>
							
							<div class="form-group">
								<form:label cssClass="control-label required" path="displaystartTime">Meeting Start Time</form:label>
								<form:select path="displaystartTime" cssClass="form-control" required="required">
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
								<form:label cssClass="control-label required" path="displayEndTime">Meeting End Time</form:label>
								<form:select path="displayEndTime" cssClass="form-control" required="required">
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
							
							<div id="recurreingDetails">
								<div class="form-group">
									<form:label cssClass="control-label required" path="recurrenceToDate">Meeting Recurrence To Date</form:label>
									<div class="input-group date">
					                  <div class="input-group-addon">
					                    <i class="fa fa-calendar"></i>
					                  </div>
					                  <form:input cssClass="form-control pull-right datepicker" path="recurrenceToDate" dateFormat="dateFormat" required="required"/>
					                 </div>
								</div>
								
								<div class="form-group">
									<form:label cssClass="control-label required" path="recurrenceWeek">Recurrence On Every Week Number</form:label>
									<form:select path="recurrenceWeek" cssClass="form-control" required="required">
										<form:option value="1">First</form:option>
										<form:option value="2">Second</form:option>
										<form:option value="3">Third</form:option>
										<form:option value="4">Fourth</form:option>
									</form:select>
								</div>	
								
								<div class="form-group">
									<form:label cssClass="control-label required" path="recurrenceDay">Recurrence Day</form:label>
									<form:select path="recurrenceDay" cssClass="form-control" required="required">
										<form:option value="1">Monday</form:option>
										<form:option value="2">TuesDay</form:option>
										<form:option value="3">WednesDay</form:option>
										<form:option value="4">Thursday</form:option>
										<form:option value="5">Friday</form:option>
										<form:option value="6">Saturday</form:option>
										<form:option value="7">Sunday</form:option>
									</form:select>
								</div>	
								
								<div class="form-group">
									<form:label cssClass="control-label required" path="recurrenceMonth">Recurrence On Every Month</form:label>
									<form:select path="recurrenceMonth" cssClass="form-control" required="required">
									  <% for(int i=1;i<=12;i++) { %>
										<form:option value="<%=i%>"><%=i%></form:option>
									<% }%>
									</form:select>
								</div>		
							</div> <!-- End for <div id="recurreingDetails"> -->
							
							<div class="form-group">
								<form:label cssClass="control-label" path="previousMeetingTime">
									Last Meeting Held On
								</form:label>
								<div class="input-group date">
				                  <div class="input-group-addon">
				                    <i class="fa fa-calendar"></i>
				                  </div>
				                  <form:input cssClass="form-control pull-right datepicker" path="previousMeetingTime" dateFormat="dateFormat"/>
				                 </div>								
							</div>
							
							<div class="form-group">
								<form:label cssClass="control-label required" path="meetingLocation">Location</form:label>
								<form:input path="meetingLocation" cssClass="form-control" required="required"/>
							</div>
							
						</div>
						<div class="box-footer">
							<%if (pageRenderMode.equals(CommonConstant.CREATE_MODE)) {%>
								 <button type="submit" class="btn btn-primary"><spring:message code="common.button.save"/></button>
							<%} else if (pageRenderMode.equals(CommonConstant.EDIT_MODE)) {%>
								<button type="submit" class="btn btn-primary"><spring:message code="common.button.Update"/></button>								
							<% } else if (pageRenderMode.equals(CommonConstant.VIEW_MODE) && isUserIsApproval) {%>
								<button type="button" class="btn btn-success" onclick="javascript:approvalCommentPopup('Accept','<%=MeetingStatusType.ACCEPTED%>');"><spring:message code="common.button.accept"/></button>
								<button type="button" class="btn btn-danger" onclick="javascript:approvalCommentPopup('Accept','<%=MeetingStatusType.REJECTED%>');"><spring:message code="common.button.reject"/></button>
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

<div class="modal fade" id="popupDivComment" tabindex="-1" role="dialog" aria-labelledby="Acceptance Details">
<div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
      		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        	<h4 class="modal-title" id="myModalLabel">
        		Meeting Acceptance Details	
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

</body>
<!-- JS Files --> 
<script type="text/javascript" src="<%=jsRoot%>/event/meetingWizard.js?${Server_Token_Value}"></script>
<script type="text/javascript" src="<%=jsRoot%>/event/meetingSchedulePage.js?${Server_Token_Value}"></script>
</html>