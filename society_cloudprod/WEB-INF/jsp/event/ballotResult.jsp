<%@page import="java.util.List"%>
<%@page import="app.societywala.event.bo.BallotResponseBO"%>
<%@page import="app.societywala.event.bo.BallotPositionBO"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Date"%>
<%@page import="app.societywala.event.bo.BallotBO"%>
<%@page import="java.util.Map"%>
<%@include file="../common/appConfig.jsp" %>
<html>
<HEAD>
	<%@include file="../common/appMetaConfig.jsp"%>
	<TITLE><spring:message code="common.title.label.product"/> :: Ballot Result Details</TITLE>
</HEAD>

<%
String mainMenu = "manageEvent";
String subMenu  = "secretBallot";
Map<String,Object> sessionCommonModelMap = (Map<String,Object>) session.getAttribute(CommonConstant.SESSION_COMMON_MODEL_MAP);
String pageRenderMode = (String)sessionCommonModelMap.get(CommonConstant.AJAX_PAGE_RENDER_MODE);
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
		  <h1>Ballot Result Details</h1>
		  <hsCommonTag:breadCrumb pageTitle="Ballot Result" isFirstIndex="false"/>
	 </section>
	 
	 <section class="content">
	 	<div class="row">
    		<div class="col-md-12">
    				<div class="box box-primary">
    					<input type="hidden" name="ballotId" id="ballotId" value="<%=ballotBO.getBallotId()%>">
					    <div class="box-header with-border">
							Result of  :: <%=ballotBO.getBallotName()%>
						</div>
						<div class="box-body">
							<% for(BallotPositionBO positionBO : ballotPositionBO) {
								counter++;
							%> 
							<div class="panel box box-default">
							       <div class="box-header with-border">
							         <h4 class="box-title">
							           <a data-toggle="collapse" data-parent="#noticeAccordion" href="#collapse<%=counter%>">
							             <%=positionBO.getPosition()%>
							           </a>
							         </h4>
							       </div>
							       <div id="collapse<%=counter%>" class="panel-collapse collapse in">
							         <div class="box-body">
							           	<canvas id="positionId_<%=positionBO.getBallotPositionId()%>"></canvas>
							         </div>
							       </div>
							</div>
							<%} %>
						</div> <!--  end of body -->
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
</body>
<!-- JS Files --> 
<script type="text/javascript" src="<%=jsRoot%>/event/ballotResult.js?${Server_Token_Value}"></script>
</html>