<%@page import="app.societywala.event.bo.PollBO"%>
<%@page import="java.util.Map"%>
<%@include file="../common/appConfig.jsp" %>
<html>
<HEAD>
	<%@include file="../common/appMetaConfig.jsp"%>
	<TITLE><spring:message code="common.title.label.product"/> :: Poll Details</TITLE>
</HEAD>

<%
String mainMenu = "manageEvent";
String subMenu  = "";
Map<String,Object> sessionCommonModelMap = (Map<String,Object>) session.getAttribute(CommonConstant.SESSION_COMMON_MODEL_MAP);
String pageRenderMode = (String)sessionCommonModelMap.get(CommonConstant.AJAX_PAGE_RENDER_MODE);
String formSubmitAction = ctxPath+"/event/savePollDetails.htm";
PollBO pollBO = (PollBO)request.getAttribute("pollBO");
Integer totalOptionsCount = pollBO.getPollOptionBOSet().size();
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
		  <h1>Poll Details</h1>
		  <hsCommonTag:breadCrumb pageTitle="Poll Details" isFirstIndex="false"/>
	 </section>
	 
	 <section class="content">
	 	<div class="row">
    		<div class="col-md-12">
    				<div class="box box-primary">
    					<form:form cssClass="form" method="post" action="<%=formSubmitAction%>" commandName="pollBO">
	    				<form:hidden path="pollId"/>
	    				<input type="hidden" name="pollOptionBOCounter" id="pollOptionBOCounter" value="<%=totalOptionsCount%>"/>
					    <div class="box-header with-border">
							
						</div>
						<div class="box-body">
							 <div class="form-group">
								<form:label cssClass="control-label required" path="pollTitle">Title</form:label>
								<form:input cssClass="form-control" path="pollTitle" required="required"/>									
							</div>
							<div class="form-group">
								<table id="pollOptionBOTable" class="table table-hover dt-responsive">
									<thead>
									<tr>
										<th><label class="control-label required">options</label></th>
									</tr>
									</thead>
									<tbody>
									<c:forEach items="${pollBO.pollOptionBOSet}" var="pollOptionBO" varStatus="counter">
									<tr id="pollOptionBOTR${counter.count}">
										<td><input class="form-control" type="text" id="pollOptionBO${counter.count}" name="pollOptionBO${counter.count}" value="${pollOptionBO.pollOption}" required> </td>
										<td>
											<a href="javascript:;" onclick="javascript:deletePollOption('${counter.count}');">Delete</a>
											<input type="hidden" id="pollOptionBOStatus${counter.count}" name="pollOptionBOStatus${counter.count}" value="update">
										</td>										
									</tr>
									</c:forEach>
									</tbody>
									<tfoot>
										<tr>
											<td><a href="javascript:;" onclick="javascript:addNewPollOption()">Add Option</a></td>
										</tr>
									</tfoot>
								</table>
								
							<div class="form-group">
								<form:label cssClass="control-label" path="isAllowMultipleVote">Allow Multiple Vote</form:label>
								<form:checkbox path="isAllowMultipleVote"/>
							</div>
							
							<div class="form-group">
								<form:label cssClass="control-label" path="isOneVotePerFlat">Only One Vote per Flat</form:label>
								<form:checkbox path="isOneVotePerFlat"/>
							</div>
							
							<div class="form-group">
								<form:label cssClass="control-label required" path="expireDate">Poll Last Date</form:label>
								<div class="input-group date">
				                  <div class="input-group-addon">
				                    <i class="fa fa-calendar"></i>
				                  </div>
				                  <form:input cssClass="form-control pull-right datepicker" path="expireDate" dateFormat="dateFormat" required="required"/>
				                </div>								
							</div>
							
							<c:set var="societyPanel" value="<%=UserRoleType.SOCIETY_PANEL%>"/>
							<c:set var="allMember" value="<%=UserRoleType.SOCIETY_ALL_MEMBERS%>"/>
							
							<div class="form-group">
								<form:label cssClass="control-label" path="postToMemberType">Poll For</form:label>
								<form:select cssClass="form-control" path="postToMemberType">
									<form:option value="${societyPanel}">Society Panel</form:option>
									<form:option value="${allMember}">All Member</form:option>
								</form:select>			
							</div>							
						</div><!--  end of table -->
					</div> <!--  end of body -->
					<div class="box-footer">
						<button type="submit" class="btn btn-primary">Post Poll</button>							
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
<!-- JS Files --> 
<script type="text/javascript" src="<%=jsRoot%>/event/pollDetails.js?${Server_Token_Value}"></script>
</html>