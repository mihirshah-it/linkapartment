<%@page import="app.societywala.common.bo.AttachementConstatnt"%>
<%@page import="java.util.Map"%>
<%@include file="../common/appConfig.jsp" %>

<html>
<HEAD>
	<%@include file="../common/appMetaConfig.jsp"%>
   <TITLE><spring:message code="common.title.label.product"/> :: Manage Meeting</TITLE> 
</HEAD>
<%
String mainMenu = "manageEvent";
String subMenu  = "scheduleMeeting";
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
	<nav class="navbar-static-top">
  	<div id="subNavBar" class="navbar-collapse collapse in">
          <ul class="nav navbar-nav">
             <li>
				<a  href="javascript:;"  onclick="javascript: backURL();"><i class="fa fa-arrow-left" aria-hidden="true"></i>&nbsp;<spring:message code="common.button.back"/></a>
			</li>
			<li>
            	<a  href="javascript:;"  onclick="javascript: meetingBulkPrintPopup();" id="print"><i class="fa fa-print" aria-hidden="true"></i>&nbsp;Bulk Print</a>
            </li>            
          </ul>
     </div>
     </nav>
    <!-- Content Header (Page header) -->
    <section class="content-header">
		  <h1><spring:message code="event.manage.all.meeting.page.header"/></h1>
		  <hsCommonTag:breadCrumb pageTitle="Manage Meeting" isFirstIndex="false"/>
	 </section>
	 
	 <section class="content">
	 	<div class="row">
    		<div class="col-md-12">
    				<div class="box box-primary">
    					<!--  This is use in all the meeting wizard -->
						<form id="showScheduleMeetingForm" method="post">
							 <input type="hidden" id="societyMeetingId" name="societyMeetingId">
						</form>
						<!--  This is use in all the meeting wizard -->
						<div class="box-header with-border">
							<div class="col-md-4">
							<label class="control-label"><spring:message code="common.label.selectYear"/></label>
							</div>
							<div class="col-md-4">
							<select class="form-control" id="periodYear" onchange="javascript:showAllMeetingsForSelectedYearGrid();">
								<c:forEach items="${scheduleMeetingYearList}" var="periodYear" varStatus="counter">
									<option value="${periodYear}">${periodYear}</option>
								</c:forEach>
							</select>
							</div>
							<div class="col-md-4">
								<button type="button" onclick="javascript:scheduleNewMeeting();" class="btn btn-primary"><spring:message code="event.btn.schedule.meeting"/></button>
							</div>
						</div>
						<div class="box-body">
							<table id="societyMeetingsGridDiv" class="table table-bordered table-striped table-hover dt-responsive"></table>
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
	
<div class="modal fade" id="popupBulkPrintMeetingForm" tabindex="-1" role="dialog" aria-labelledby="Bulk Printing details">
<div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Bulk Print Meetings</h4>
	  </div>
	  <form class="form" name="bulkPrintPopupForm" id="bulkPrintPopupForm">
	  <div class="modal-body">
	  	<div class="form-group">
			<label class="control-label required">
			   From Date		      
		  	</label>
		  	<div class="input-group date">
                  <div class="input-group-addon">
                    <i class="fa fa-calendar"></i>
                  </div>
                  <input class="form-control pull-right datepicker dateFormat" id="fromDate" name="fromDate" required/>
             </div>		  	
		</div>
		
		<div class="form-group">
			<label class="control-label required">
			   To Date		      
		  	</label>
		  	<div class="input-group date">
                  <div class="input-group-addon">
                    <i class="fa fa-calendar"></i>
                  </div>
                  <input class="form-control pull-right datepicker dateFormat" id="toDate" name="toDate" required/>
             </div>		  	
		</div>
		
		<div class="form-group">
			<label class="control-label required">
			   Meeting Type		      
		  	</label>
		  	<select class="form-control" name="meetingTypeId" id="meetingTypeId" >
		  	<c:forEach items="${meetingTypeBOList}" var="meetingTypeBO">
		  	 	<option value="${meetingTypeBO.meetingTypeId}">${meetingTypeBO.meetingTypeName}</option>	  	   
		  	</c:forEach>	
		  	</select>
		</div>
	  </div>
	  <div class="modal-footer">
	  	<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	  	<button type="submit" class="btn btn-primary">Print</button>	  		
	  </div>
	  </form>
	</div>
</div>
</div>
	
<div class="modal fade" id="attachementPopupForm" tabindex="-1" role="dialog" aria-labelledby="Upload Meeting Attachement">
	<div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="attachementPopupFormInfo">        	    		
        </h4>
      </div>
      <div class="modal-body">
        	<div class="box box-body">
        		<div id="attachmentListDiv"></div>
        	</div>
       </div>
       <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" name="attachementSaveBtn" id="attachementSaveBtn" onclick="javascript:saveAttachement();" class="btn btn-primary"><spring:message code="common.button.saveAndClose"/></button>
	  </div>
    </div>
    </div> 
</div>

<!-- JS Files -->  
<script>
	// This should be initialise before including file manageAllMeetingPage.js
	var attachementEntityTypeId = '<%=AttachementConstatnt.SOCIETY_ENTITY%>';
	var attachementEntityId = '<%=societyId%>';
	var attachementModuleTypeId='<%=AttachementConstatnt.SCHEDULE_MEETING_MODULE%>';
	var jpageRenderMode = '<%=pageRenderMode%>';
</script>
<script src="<%=jsRoot%>/event/meetingWizard.js?${Server_Token_Value}" type="text/javascript" ></script>
<script src="<%=jsRoot%>/event/manageAllMeetingPage.js?${Server_Token_Value}" type="text/javascript"></script>
<script src="<%=jsRoot%>/common/attachmentUpload.js?${Server_Token_Value}" type="text/javascript"></script>
</body>
</html>