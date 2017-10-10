<%@page import="java.util.Map"%>
<%@page import="app.societywala.event.bo.ComplaintCategoryType"%>
<%@page import="app.societywala.event.bo.ComplaintStatusType"%>
<%@page import="app.societywala.event.bo.ComplaintBO"%>
<%@include file="../common/appConfig.jsp" %>

<html>
<HEAD>
	<%@include file="../common/appMetaConfig.jsp"%>
	<TITLE><spring:message code="common.title.label.product"/> :: Ticket Details</TITLE>
	<!-- CSS Files -->
	<style>
		.jqte_editor{height:350px;max-height:500px;}
	</style>
</HEAD>

<%
String mainMenu = "manageEvent";
String subMenu  = "helpDesk";
ComplaintBO complaintBO = (ComplaintBO)request.getAttribute("complaintBO");
Map<String,Object> sessionCommonModelMap = (Map<String,Object>) session.getAttribute(CommonConstant.SESSION_COMMON_MODEL_MAP);
String formSubmitAction=ctxPath+"/event/complaintsDetailsPageSave.htm";
String pageRenderMode = null;
if(sessionCommonModelMap.get(CommonConstant.PAGE_RENDER_MODE) != null)
{
	pageRenderMode = (String)sessionCommonModelMap.get(CommonConstant.PAGE_RENDER_MODE);
}
if(sessionCommonModelMap.get(CommonConstant.AJAX_PAGE_RENDER_MODE) != null)
{
	pageRenderMode = (String)sessionCommonModelMap.get(CommonConstant.AJAX_PAGE_RENDER_MODE);
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
		  <h1>Ticket Details</h1>
		  <hsCommonTag:breadCrumb pageTitle="Ticket Details" isFirstIndex="false" isSocietyNameDisplay="false"/>
	 </section>
	 
	 <section class="content">
	 	<div class="row">
    		<div class="col-md-12">
    				<div class="box box-primary">
    					<form:form method="post" action="<%=formSubmitAction%>" commandName="complaintBO">
    					<form:hidden path="complaintId"/>
					    <div class="box-header with-border">
							<%if(complaintBO.getComplaintId() != null) {%>
								<form:label cssClass="control-label required" path="categoryId">Status</form:label>
								<form:select cssClass="form-control" path="status" required="required">
									<form:option value="<%=ComplaintStatusType.NEW%>" label="<%=ComplaintStatusType.getStatusName(ComplaintStatusType.NEW)%>"></form:option>
									<form:option value="<%=ComplaintStatusType.ASSIGNED%>" label="<%=ComplaintStatusType.getStatusName(ComplaintStatusType.ASSIGNED)%>"></form:option>
									<form:option value="<%=ComplaintStatusType.CLOSED%>" label="<%=ComplaintStatusType.getStatusName(ComplaintStatusType.CLOSED)%>"></form:option>
									<form:option value="<%=ComplaintStatusType.RE_OPEN%>" label="<%=ComplaintStatusType.getStatusName(ComplaintStatusType.RE_OPEN)%>"></form:option>
								</form:select>
							<%} %>
						</div>
						<div class="box-body">
							<div class="form-group">
								<form:label cssClass="control-label required" path="categoryId">Category</form:label>
								<form:select cssClass="form-control" path="categoryId" required="required">
									<option value=""></option>
									<form:option value="<%=ComplaintCategoryType.DATA_CORRECTION%>" label="<%=ComplaintCategoryType.getCategoryName(ComplaintCategoryType.DATA_CORRECTION)%>"></form:option>
									<form:option value="<%=ComplaintCategoryType.MAINT_BILLING%>" label="<%=ComplaintCategoryType.getCategoryName(ComplaintCategoryType.MAINT_BILLING)%>"></form:option>
									<form:option value="<%=ComplaintCategoryType.PARKING%>" label="<%=ComplaintCategoryType.getCategoryName(ComplaintCategoryType.PARKING)%>"></form:option>
									<form:option value="<%=ComplaintCategoryType.SECURITY%>" label="<%=ComplaintCategoryType.getCategoryName(ComplaintCategoryType.SECURITY)%>"></form:option>
									<form:option value="<%=ComplaintCategoryType.COMMON_FACILITY%>" label="<%=ComplaintCategoryType.getCategoryName(ComplaintCategoryType.COMMON_FACILITY)%>"></form:option>
									<form:option value="<%=ComplaintCategoryType.OTHER%>" label="<%=ComplaintCategoryType.getCategoryName(ComplaintCategoryType.OTHER)%>"></form:option>
								</form:select>								
							</div>
							<div class="form-group">
								<form:label cssClass="control-label required" path="propertyBO">Select Your Property</form:label>
								<form:select cssClass="form-control" path="propertyBO" required="required">
								   <form:options items="${userSocietyPropertyBOList}" itemValue="societyPropertyId" itemLabel="blockNumber"/>
								</form:select>				
							</div>
							<div class="form-group">
								<form:label cssClass="control-label" path="isUrgent">Is Urgent</form:label>
								<form:checkbox  path="isUrgent"/>
							</div>
							
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<form:label cssClass="control-label required" path="details">Description</form:label>
										<form:textarea cssClass="form-control"  path="details" required="required"/>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<form:label cssClass="control-label" path="comments">Comment</form:label>
										<div class="pull-right">
										<button type="button" onclick="javascript:addComment();" class="btn btn-primary">Add Comment</button>
										</div>
										<form:textarea cssClass="form-control"  path="comments"/>
									</div>
								</div>								
							</div>							
						</div> <!--  end of body -->
						<div class="box-footer">
							<%if (pageRenderMode.equals(CommonConstant.CREATE_MODE)) {%>
								<button type="submit" class="btn btn-primary"><spring:message code="common.button.save"/></button>								
							<%} else if (pageRenderMode.equals(CommonConstant.EDIT_MODE)) {%>
								<button type="submit" class="btn btn-primary"><spring:message code="common.button.Update"/></button>								
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
<script type="text/javascript">
var jsuserDisplayName = '<%=userDisplayName%>';
</script>
<script type="text/javascript" src="<%=jsRoot%>/event/complaintDetails.js?${Server_Token_Value}"></script>
<!-- JS Files -->  
</html>