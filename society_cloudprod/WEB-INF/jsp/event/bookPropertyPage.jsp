<%@page import="app.societywala.event.bo.BookPropertyBO"%>
<%@page import="app.societywala.event.bo.PropertyBookingStatus"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Map"%>
<%@include file="../common/appConfig.jsp" %>

<html>
<HEAD>
	<%@include file="../common/appMetaConfig.jsp"%>
	<TITLE><spring:message code="common.title.label.product"/> :: Book Society Facility</TITLE>
	<!-- CSS Files -->
</HEAD>

<%
String mainMenu = "manageEvent";
String subMenu  = "bookFacility";
BookPropertyBO bookPropertyBO  = (BookPropertyBO)request.getAttribute("bookProperyBO");
Map<String,Object> sessionCommonModelMap = (Map<String,Object>) session.getAttribute(CommonConstant.SESSION_COMMON_MODEL_MAP);
String pageRenderMode = null;
if(sessionCommonModelMap.get(CommonConstant.PAGE_RENDER_MODE) != null)
{
	pageRenderMode = (String)sessionCommonModelMap.get(CommonConstant.PAGE_RENDER_MODE);
}
if(sessionCommonModelMap.get(CommonConstant.AJAX_PAGE_RENDER_MODE) != null)
{
	pageRenderMode = (String)sessionCommonModelMap.get(CommonConstant.AJAX_PAGE_RENDER_MODE);
}

Boolean isUserIsApproval = new Boolean(false);
if(request.getAttribute("isUserApproval") != null) // This will happens only if user view the purchase order from dashboard or Grid.
{
	isUserIsApproval = (Boolean)request.getAttribute("isUserApproval");	
}

SimpleDateFormat dateFormater = new SimpleDateFormat(CommonConstant.dateUIFormatter);

String formSubmitAction=ctxPath+"/event/bookPropertyForEvent.htm";
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
		  <h1><spring:message code="event.book.property.form.label.header"/></h1>
		  <hsCommonTag:breadCrumb pageTitle="Book Society Facility" isFirstIndex="false"/>
	 </section>
	 
	 <section class="content">
	 	<div class="row">
    		<div class="col-md-12">
    				<div class="box box-primary">
    					<form:form cssClass="form" method="post" action="<%=formSubmitAction%>" commandName="bookProperyBO">
    					<form:hidden path="bookPropertyId"/>
	    				<form:hidden path="bookingStatus"/>
						<div class="box-header with-border">
						</div>
						<div class="box-body">
							 <div class="form-group">
								<form:label cssClass="control-label required" path="societyFacilityBO">Select Society Premises</form:label>
								<form:select cssClass="form-control" path="societyFacilityBO" required="required">
								   <form:options items="${societyFacilityBOList}" itemValue="facilityId" itemLabel="facilityName"/>
								</form:select>								
							</div>
							
							<div class="form-group">
								<label class="control-label required" for="startTime">Start Time</label>
								<input type="text" class="form-control datepickertime" id="startTime" name="startTime" value="<%=(bookPropertyBO.getBookStartDate()!=null)?bookPropertyBO.getBookStartDate():""%>" required="required"/>
							</div>
							
							<div class="form-group">
								<label class="control-label required" for="endTime">End Time</label>
								<input type="text" class="form-control datepickertime" id="endTime" name="endTime" value="<%=(bookPropertyBO.getBookEndDate()!=null)?bookPropertyBO.getBookEndDate():""%>" required="required"/>
							</div>
							
							<div class="form-group">
								<form:label cssClass="control-label required" path="purpose">Purpose</form:label>
								<form:textarea cssClass="form-control" path="purpose" required="required"/>
							</div>
							
							<div class="form-group">
								<form:label cssClass="control-label required" path="bookBySocietyPropertyBO">Select Your Property</form:label>
								<form:select cssClass="form-control" path="bookBySocietyPropertyBO" required="required">
								   <form:options items="${userSocietyPropertyBOList}" itemValue="societyPropertyId" itemLabel="blockNumber"/>
								</form:select>
							</div>
						</div>
						<div class="box-footer">
							<%if (pageRenderMode.equals(CommonConstant.CREATE_MODE)) {%>
								<button type="submit" class="btn btn-primary"><spring:message code="common.button.save"/></button>								
							<%} else if (pageRenderMode.equals(CommonConstant.EDIT_MODE)) {%>
								<button type="submit" class="btn btn-primary"><spring:message code="common.button.Update"/></button>								
							<% } else if (pageRenderMode.equals(CommonConstant.VIEW_MODE) && isUserIsApproval) {%>
								<button type="button" class="btn btn-success" onclick="javascript:approvalCommentPopup('Approve','<%=PropertyBookingStatus.BOOKING_APPROVE%>');"><spring:message code="common.button.accept"/></button>
								<button type="button" class="btn btn-danger" onclick="javascript:approvalCommentPopup('Reject','<%=PropertyBookingStatus.BOOKING_REJECT%>');"><spring:message code="common.button.reject"/></button>
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

<div class="modal fade" id="popupDivComment" tabindex="-1" role="dialog" aria-labelledby="Facility Approval Comment">
<div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
      		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        	<h4 class="modal-title" id="myModalLabel">
        		Facility Approval Details	
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
<script type="text/javascript" src="<%=jsRoot%>/event/bookPropertyPage.js?${Server_Token_Value}"></script>
</html>