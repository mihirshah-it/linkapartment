<%@page import="java.util.Iterator"%>
<%@page import="app.societywala.event.bo.BallotNominationBO"%>
<%@page import="java.util.Set"%>
<%@page import="app.societywala.event.bo.BallotPositionBO"%>
<%@page import="java.util.List"%>
<%@page import="app.societywala.event.bo.BallotPostMemberType"%>
<%@page import="app.societywala.event.bo.BallotBO"%>
<%@page import="java.util.Map"%>
<%@include file="../common/appConfig.jsp" %>
<html>
<HEAD>
	<%@include file="../common/appMetaConfig.jsp"%>
	<TITLE><spring:message code="common.title.label.product"/> :: EC Ballot Details</TITLE>
</HEAD>

<%
String mainMenu = "manageEvent";
String subMenu  = "secretBallot";
Map<String,Object> sessionCommonModelMap = (Map<String,Object>) session.getAttribute(CommonConstant.SESSION_COMMON_MODEL_MAP);
String pageRenderMode = (String)sessionCommonModelMap.get(CommonConstant.AJAX_PAGE_RENDER_MODE);
String formSubmitAction = ctxPath+"/event/saveBallotDetails.htm";
BallotBO ballotBO = (BallotBO)request.getAttribute("ballotBO");
List<UserBO> userBOList = (List<UserBO>)request.getAttribute("userBOList");
Set<BallotPositionBO> ballotPositionBO = ballotBO.getBallotPositionBOSet();
Iterator<BallotPositionBO> posit = null;
SimpleDateFormat dateFormat = new SimpleDateFormat(CommonConstant.dateTimeUIFormatter);
if(ballotPositionBO != null && ballotPositionBO.size() > 0)
{
	posit = ballotPositionBO.iterator();
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
		  <h1>EC Election Ballot Details</h1>
		  <hsCommonTag:breadCrumb pageTitle="EC Ballot Details" isFirstIndex="false"/>
	 </section>
	 
	 <section class="content">
	 	<div class="row">
    		<div class="col-md-12">
    				<div class="box box-primary">
    					<form:form cssClass="form" method="post" action="<%=formSubmitAction%>" commandName="ballotBO">
					    <form:hidden path="ballotId"/>
					    <form:hidden path="ballotType"/>
					    <form:hidden path="sequenceNumber"/>
					    <form:hidden path="ballotStatus"/>
					    <div class="box-header with-border">
							
						</div>
						<div class="box-body">						
						 <div class="form-group">
							<form:label cssClass="control-label required" path="ballotName">Name of Ballot</form:label>
							<form:input cssClass="form-control" path="ballotName" required="required"/>							
						</div>
						<div class="form-group">
							<form:label cssClass="control-label" path="ballotDescription">Description</form:label>
							<form:input cssClass="form-control" path="ballotDescription"/>		
						</div>
						<div class="form-group">
							<form:label cssClass="control-label required" path="ballotStartTime">Start Time</form:label>
							<input type="text" class="datepickertime form-control" id="ballotStartTime" name="ballotStartTime" required="required" value="<%=ballotBO.getBallotStartTime()!=null?dateFormat.format(ballotBO.getBallotStartTime()):""%>"  />			
						</div>
						<div class="form-group">
							<form:label cssClass="control-label required" path="ballotStartTime">Close Time</form:label>
							<input type="text" class="datepickertime form-control" id="ballotCloseTime" name="ballotCloseTime" required="required" value="<%=ballotBO.getBallotCloseTime()!=null?dateFormat.format(ballotBO.getBallotCloseTime()):""%>"/>			
						</div>
						<div class="form-group">
							<form:label cssClass="control-label" path="isOneVotePerFlat">Only One Vote per Flat</form:label>
							<form:checkbox path="isOneVotePerFlat"/>
						</div>
						
						<c:set var="allMember" value="<%=BallotPostMemberType.ALL_MEMBER%>"/>
						<c:set var="allOwner" value="<%=BallotPostMemberType.ALL_OWNER%>"/>
						
						<div class="form-group">
							<form:label cssClass="control-label" path="postToMemberType">Participants</form:label>
							<form:select path="postToMemberType" cssClass="form-control">
								<form:option value="${allMember}">All Residents</form:option>
								<form:option value="${allOwner}">All Owners</form:option>
							</form:select>			
						</div>
						
						<div class="form-group">
							<table class="table table-bordered table-striped table-hover dt-responsive">
							<thead>
								<tr>
									<th>&nbsp;</th>
									<th>Post</th>
									<th>Nominee 1</th>
									<th>Nominee 2</th>
									<th>Nominee 3</th>
									<th>Nominee 4</th>
									<th>Nominee 5</th>
								</tr>
							</thead>
							<tbody>
							<%for(int i=1 ; i<=10 ; i++) {
								Set<BallotNominationBO> ballotNominationBOSet = null;
								BallotPositionBO positionBO = null;
								Iterator<BallotNominationBO> nomit = null;
								if(posit != null && posit.hasNext())
								{
									positionBO = posit.next();
									ballotNominationBOSet = positionBO.getBallotNominationBOSet();
									nomit = ballotNominationBOSet.iterator();
								}
							%>
							<tr>
								<td>
									<label class="control-label"><%=i%></label>									
								</td>
								<td>
									<input type="hidden" name="positionId<%=i%>" id="positionId<%=i%>" value="<%=(positionBO != null)?positionBO.getBallotPositionId():""%>">
									<input class="form-control" type="text" name="position<%=i%>" id="position<%=i%>" value="<%=(positionBO != null)?positionBO.getPosition():""%>"/>
								</td>
								<%for(int j=1 ; j<=5 ; j++) {
									BallotNominationBO nominationBO = null;
									if(nomit != null && nomit.hasNext())
									{
										nominationBO = nomit.next();
									}									
								%>
								<td>
									<input type="hidden" name="nominationId<%=i%>_<%=j%>" id="nominationId<%=i%>_<%=j%>" value="<%=(nominationBO != null) ? nominationBO.getBallotNominationId() : "" %>">
									<select id="nomination<%=i%>_<%=j%>" name="nomination<%=i%>_<%=j%>" class="form-control">
										<option value=""></option>
										<%for (int k=0 ; k<userBOList.size() ; k++) {
											UserBO user = userBOList.get(k);
											String selected = "";
											if(nominationBO != null && nominationBO.getNominationUserBO().getUserId().equals(user.getUserId()))
											{
												selected = "selected";
											}
										%>
										<option value="<%=user.getUserId()%>" <%=selected%>><%=user.getFullName()%> </option>
										<%} %>
									</select>
								</td>
								<%} %>
							</tr>
							<%}%>
							</tbody>
						</table>
						</div>
						</div> <!--  end of body -->
						<div class="box-footer">
							<%if (pageRenderMode.equals(CommonConstant.CREATE_MODE) || pageRenderMode.equals(CommonConstant.EDIT_MODE)) {%>
								<button type="submit" class="btn btn-primary"><spring:message code="common.button.save"/></button>
							<%} %>
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
<script type="text/javascript" src="<%=jsRoot%>/event/ecElectionDetailsPage.js?${Server_Token_Value}"></script>
</html>