<%@page import="app.societywala.event.bo.BallotType"%>
<%@page import="java.util.Set"%>
<%@page import="app.societywala.event.bo.BallotPositionBO"%>
<%@page import="app.societywala.event.bo.BallotNominationBO"%>
<%@page import="app.societywala.event.bo.BallotBO"%>
<%@include file="../common/appConfig.jsp" %>

<html>
<HEAD>
	<%@include file="../common/appMetaConfig.jsp"%>
	<TITLE><spring:message code="common.title.label.product"/> :: Ballot Details</TITLE>
	<!-- CSS Files -->
</HEAD>

<%
String mainMenu = "manageEvent";
String subMenu  = "bookFacility";
BallotBO ballotBO = (BallotBO)request.getAttribute("ballotBO");
Set<BallotPositionBO> ballotPositionBO = ballotBO.getBallotPositionBOSet();
int counter = 0;
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
		  <h1>Ballot Details</h1>
		  <hsCommonTag:breadCrumb pageTitle="Ballot Vote Details" isFirstIndex="false"/>
	 </section>
	 
	 <section class="content">
	 	<div class="row">
    		<div class="col-md-12">
    				<div class="box">
    					<form id="balloResponseForm" name="balloResponseForm" method="post">
    					<input type="hidden" id="ballotId" name="ballotId" value="<%=ballotBO.getBallotId()%>"/>
    					<input type="hidden" id="totalCount" name="totalCount" value="<%=ballotPositionBO.size()%>"/>
					    <div class="box-header with-border">
							 <%=ballotBO.getBallotName()%> : <%=BallotType.returnBallotTypeName(ballotBO.getBallotType())%>
						</div>
						<div class="box-body">
							<div class="box-group" id="accordion">
				                <!-- we are adding the .panel class so bootstrap.js collapse plugin detects it -->
				                <%for(BallotPositionBO positionBO  : ballotPositionBO) {
				                	Set<BallotNominationBO> ballotNominationBOs = positionBO.getBallotNominationBOSet();
				                	counter ++;
				                	
				                %>
				                <div class="panel box box-primary">
				                  <div class="box-header with-border">
				                    <h4 class="box-title">
				                      <a data-toggle="collapse" data-parent="#accordion" href="#collapse<%=counter%>">
				                        <%=positionBO.getPosition()%>
				                      </a>
				                    </h4>
				                  </div>
				                  <div id="collapse<%=counter%>" class="panel-collapse collapse in">
				                    <div class="box-body">
				                    <input type="hidden" name="positionId<%=counter%>" id="positionId<%=counter%>" value="<%=positionBO.getBallotPositionId()%>"/>
				                      <ul class="todo-list ui-sortable">
							                <% for(BallotNominationBO ballotNominationBO : ballotNominationBOs){ 
							                	String nominationuserProfileImageThumb = ctxPath+"/images/common/en_US/avatar120x120.jpg";
							                	if(ballotNominationBO.getNominationUserBO().getProfileImageFileName() != null)
							                	    {
							                			 String directorySeperator = CommonConstant.DIRECTORY_SEPERATOR;
							                			 String finalAttachementDirectoryLocation = CommonConstant.USER_IMAGE_CONTEXT_URL+"/Thumbnail/"+ AttachementConstatnt.getEntityFolderName(AttachementConstatnt.USER_ENTITY) +"/" +ballotNominationBO.getNominationUserBO().getUserId()+"/"+AttachementConstatnt.getImageModuleFolderName(AttachementConstatnt.IMG_USER_PROFILE_MODULE);
							                			 nominationuserProfileImageThumb = finalAttachementDirectoryLocation + "/" + ballotNominationBO.getNominationUserBO().getProfileImageFileName();
							                		}
							                %>
							                <li>
							                  <%if(ballotBO.getBallotType().equals(BallotType.EC_ELECTION)){ %>
							                  	<input type="radio"   id="nominationPosition<%=counter%>" name="nominationPosition<%=counter%>" value="<%=ballotNominationBO.getBallotNominationId()%>" required>
							                  <%} else if(ballotBO.getBallotType().equals(BallotType.MC_ELECTION)){ %>
							                  	<input type="checkbox"   id="nominationPosition<%=counter%>" name="nominationPosition<%=counter%>" value="<%=ballotNominationBO.getBallotNominationId()%>" required>
							                  <%} %>
							                  <img src="<%=nominationuserProfileImageThumb%>" alt="user image" class="online" height="100px;">
							                  <!-- checkbox -->
							                  <!-- todo text -->
							                  <span class="text"><%=ballotNominationBO.getNominationUserBO().getFullName()%></span>							                  
							                </li>
							                <%} %>							                							                
							              </ul>
				                    </div>
				                  </div>
				                </div> <!-- End of child accordian -->
				                <% 
				                } // end of position bo loop %>
				              </div> <!--  end of body -->
				            </div>
				        <div class="box-footer">
							<button type="submit" class="btn btn-primary">Submit</button>
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
<script type="text/javascript" src="<%=jsRoot%>/event/ballotVoting.js?${Server_Token_Value}"></script>
</html>