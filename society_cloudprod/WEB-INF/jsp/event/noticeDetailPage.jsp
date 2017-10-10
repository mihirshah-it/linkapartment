<%@page import="app.societywala.event.bo.NoticeRoleMappingBO"%>
<%@page import="app.societywala.event.bo.SocietyNoticeBO"%>
<%@page import="app.societywala.user.bo.UserRoleBO"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="app.societywala.user.bo.UserRoleType"%>
<%@include file="../common/appConfig.jsp" %>

<html>
<HEAD>
	<%@include file="../common/appMetaConfig.jsp"%>
	<TITLE><spring:message code="common.title.label.product"/> :: Notice Details</TITLE>
	<!-- CSS Files -->
</HEAD>

<%
String mainMenu = "manageEvent";
String subMenu  = "notice";

Map<String,Object> sessionCommonModelMap = (Map<String,Object>) session.getAttribute(CommonConstant.SESSION_COMMON_MODEL_MAP);
String pageRenderMode = (String)sessionCommonModelMap.get(CommonConstant.AJAX_PAGE_RENDER_MODE);
String formSubmitAction=ctxPath+"/event/saveNoticeFormPage.htm";

SocietyNoticeBO societyNoticeBO = (SocietyNoticeBO)request.getAttribute("societyNoticeBO"); 
Set<NoticeRoleMappingBO> noticeRoleBOList = societyNoticeBO.getNoticeRoleMapping();
List<Long> userRoleIDList = new ArrayList<Long>();
if(noticeRoleBOList != null)
{
	for(NoticeRoleMappingBO noticeRoleMappingBO : noticeRoleBOList)
	{
		userRoleIDList.add(noticeRoleMappingBO.getUserRoleBO().getUserRoleId());
	}
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
		  <h1><spring:message code="event.notice.form.label.header"/></h1>
		  <hsCommonTag:breadCrumb pageTitle="Notice Details" isFirstIndex="false"/>
	 </section>
	 
	 <section class="content">
	 	<div class="row">
    		<div class="col-md-12">
    				<div class="box box-primary">
    					<form:form method="post" action="<%=formSubmitAction%>" commandName="societyNoticeBO">
					    <form:hidden path="noticeId"/>
					    <form:hidden path="noticeStatus"/>
						<div class="box-header with-border">
						</div>
						<div class="box-body">
							<div class="form-group">
								<form:label cssClass="control-label required" path="noticeSubject"><spring:message code="event.notice.form.label.subject"/></form:label>
								<form:input cssClass="form-control" path="noticeSubject" required="required"/>
							</div>
							
							<div class="form-group">
								<form:label cssClass="control-label required" path="noticeDescription"><spring:message code="event.notice.form.label.description"/></form:label>
								<form:textarea path="noticeDescription" required="required"/>
							</div>
							
							<div class="form-group">
								<form:label cssClass="control-label required" path="noticeShowStartTime"><spring:message code="event.notice.form.label.show.start.time"/></form:label>
								<div class="input-group date">
				                  <div class="input-group-addon">
				                    <i class="fa fa-calendar"></i>
				                  </div>
				                  <form:input cssClass="form-control pull-right datepicker" path="noticeShowStartTime" dateFormat="dateFormat" required="required"/>
				                 </div>
							</div>
							
							<div class="form-group">
								<form:label cssClass="control-label required" path="noticeShowEndTime"><spring:message code="event.notice.form.label.show.end.time"/></form:label>
								<div class="input-group date">
				                  <div class="input-group-addon">
				                    <i class="fa fa-calendar"></i>
				                  </div>
				                  <form:input cssClass="form-control pull-right datepicker" path="noticeShowEndTime" dateFormat="dateFormat" required="required"/>
				                 </div>
							</div>
							
							<div class="form-group">
								<label class="control-label required"><spring:message code="event.notice.form.label.for.member.type"/></label>
								<%
					            String selected = null;;
								if(userRoleIDList != null && userRoleIDList.contains(UserRoleType.SOCIETY_PANEL)) {
									selected = "checked";
								}else{
									selected="";
								}
								%>
								<input type="checkbox" id="forMembers"  name= "forMembers" value="<%=UserRoleType.SOCIETY_PANEL%>" <%=selected %> required> All Society Panel Members
								<%
								if(userRoleIDList != null && userRoleIDList.contains(UserRoleType.ACTIVE_MEMBER)) {
									selected = "checked";
								}else{
									selected="";
								}
								%>
								<input type="checkbox" id="forMembers" name= "forMembers" value="<%=UserRoleType.ACTIVE_MEMBER%>" <%=selected %> required> All Society Panel Active Members
								<%
								if(userRoleIDList != null && userRoleIDList.contains(UserRoleType.SOCIETY_ALL_MEMBERS)) {
									selected = "checked";
								}else{
									selected="";
								}
								%>
								<input type="checkbox" id="forMembers" name= "forMembers" value="<%=UserRoleType.SOCIETY_ALL_MEMBERS%>" <%=selected %> required> All Society Members
							</div>
						</div> <!--  End of box body -->
						<div class="box-footer">
							<%if (pageRenderMode.equals(CommonConstant.CREATE_MODE)) {%>
								<button  class="btn btn-primary" type="submit">
										<spring:message code="common.button.save"/>
								</button>
							<%}else if (pageRenderMode.equals(CommonConstant.EDIT_MODE)) {%>
								<button class="btn btn-primary" type="submit">
									<spring:message code="common.button.Update"/>
								</button>
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

</body>
<script type="text/javascript" src="<%=jsRoot%>/event/noticeDetailPage.js?${Server_Token_Value}"></script>
<!-- JS Files -->  
</html>