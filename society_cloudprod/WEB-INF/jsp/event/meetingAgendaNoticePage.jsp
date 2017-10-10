<%@page import="java.util.Map"%>
<%@page import="java.util.Set"%>
<%@page import="app.societywala.event.bo.MeetingAgendaDetailsBO"%>
<%@page import="java.util.List"%>
<%@page import="app.societywala.event.bo.SocietyMeetingBO"%>
<%@include file="../common/appConfig.jsp" %>

<html>
<HEAD>
	<%@include file="../common/appMetaConfig.jsp"%>
	<TITLE><spring:message code="common.title.label.product"/> :: Meeting Agenda Notice Details</TITLE>
	<!-- CSS Files -->
</HEAD>

<%
String mainMenu = "manageEvent";
String subMenu  = "scheduleMeeting";
String wizard   = "agendaDetail";

Map<String,Object> sessionCommonModelMap = (Map<String,Object>) session.getAttribute(CommonConstant.SESSION_COMMON_MODEL_MAP);
String pageRenderMode = (String)sessionCommonModelMap.get(CommonConstant.AJAX_PAGE_RENDER_MODE);

String formSubmitAction = ctxPath+"/event/saveMeetingAgendaNoticeDetails.htm";

SocietyMeetingBO societyMeetingBO = (SocietyMeetingBO)request.getAttribute("societyMeetingBO");
List<MeetingAgendaDetailsBO> agendaDetailsBOList = societyMeetingBO.getSocietyMeetingAgendaDetailsBOSet();
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
            	<a  href="javascript:;"  onclick="javascript:meetingAgendaNoticeDetailsPdf('<%=societyMeetingBO.getMeetingId()%>');"><i class="fa fa-print" aria-hidden="true"></i>&nbsp;<spring:message code="common.button.print"/></a>
            </li>            
          </ul>
     </div>
     </nav>
    <!-- Content Header (Page header) -->
    <section class="content-header">
		  <h1>Meeting Agenda Notice Details</h1>
		  <hsCommonTag:breadCrumb pageTitle="Agenda Notice Details" isFirstIndex="false"/>
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
						<form id="meetingAgendaNoticePrintForm" method="post">
							 <input type="hidden" id="meetingAgendaNoticePrintMeetingId" name="meetingAgendaNoticePrintMeetingId">
						</form>
						<form class="form" method="post" action="<%=formSubmitAction%>" id="meetingAgendaForm">
						<input type="hidden" name="meetingId" id="meetingId" value="<%=societyMeetingBO.getMeetingId()%>"/>
						<input type="hidden" name="agendaCounter" id="agendaCounter" value="<%=agendaDetailsBOList.size()%>"/>
						<div class="box-header with-border">
							<%@ include file="meetingWizard.jsp" %>
							<%if (pageRenderMode.equals(CommonConstant.CREATE_MODE) || pageRenderMode.equals(CommonConstant.EDIT_MODE))
						    {
						    %>	
							<button type="button" onclick="javascript:addNewAgenda();" class="btn btn-primary">Add Agenda</button>
							<%
						    }
							%>
						</div>
						<div class="box-body">
							<table id="appendNoticeAgendaTable" class="table table-hover dt-responsive">
							    <tbody id="appendNoticeAgendaTableBody">
								<c:forEach items="${societyMeetingBO.societyMeetingAgendaDetailsBOSet}" var="societyMeetingAgendaDetailsBO" varStatus="counter">
								   <tr id="innerDiv${counter.count}">
									 <td valign="middle" width="15%">
									 	<a href="javascript:;" class="up"><i class="fa fa-fw fa-chevron-circle-up"></i></a>
				            			<a href="javascript:;" class="down"><i class="fa fa-chevron-circle-down"></i></a>
				            		</td>
									 <td width="70%">
								     	<textarea name="agendaDetails" required>${societyMeetingAgendaDetailsBO.agendaDetails}</textarea>
								     </td>
								     <td valign="middle" width="15%">
										<input type="hidden" name="meetingAgendaDetailsId" value="${societyMeetingAgendaDetailsBO.meetingAgendaDetailsId}"/>
								     	<input type="hidden" name="agendaStatus" id="agendaStatus" value="update"/>
								     	<%if (pageRenderMode.equals(CommonConstant.CREATE_MODE) || pageRenderMode.equals(CommonConstant.EDIT_MODE))
						             	{%>
								      		<button type="button" onclick="javascript:deletePersistanceAgenda('${counter.count}');" class="btn btn-danger"><spring:message code="common.button.delete"/></button>
								     	<%
						             	}else{
								     	%>
								     		&nbsp;
								     	<%}%>
								     </td>
								   </tr>
								</c:forEach>
								</tbody>
						</table>
						<div class="form-group">
							<label class="control-label">
								Note :
							</label>
							<textarea id="noticeNote" name="noticeNote"><c:out value="<%=societyMeetingBO.getMeetingNoticeNotes()%>"/></textarea>			
						</div>
						</div>
						<div class="box-footer">
							<%if (pageRenderMode.equals(CommonConstant.CREATE_MODE)) {%>
								<button type="submit" class="btn btn-primary"><spring:message code="common.button.save"/></button>								
							<%} else if (pageRenderMode.equals(CommonConstant.EDIT_MODE)) {%>
								<button type="submit" class="btn btn-primary"><spring:message code="common.button.Update"/></button>								
							<% } %>
						</div>
						</form>
    				</div>
    		</div> <!--  End of col 1 -->
    		
    	</div> <!-- End of main row -->
	 </section> <!--  end of content -->
  </div> <!-- End of content wrapper -->
  <%@include file="../common/footer.jsp"%>
  <%@include file="../common/rightSideMenu.jsp"%> 
</div> <!-- End of Wrapper -->

</body>
<script type="text/javascript" src="<%=jsRoot%>/event/meetingWizard.js?${Server_Token_Value}"></script>
<script type="text/javascript" src="<%=jsRoot%>/event/meetingAgendaNoticePage.js?${Server_Token_Value}"></script>
</html>