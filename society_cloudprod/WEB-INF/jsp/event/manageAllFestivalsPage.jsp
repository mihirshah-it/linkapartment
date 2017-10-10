<%@page import="java.util.Map"%>
<%@include file="../common/appConfig.jsp" %>

<html>
<HEAD>
	<%@include file="../common/appMetaConfig.jsp"%>
   <TITLE><spring:message code="common.title.label.product"/> :: Manage Festival</TITLE> 
   <!-- CSS Files -->
</HEAD>
<%
String mainMenu = "manageEvent";
String subMenu  = "scheduleFestival";
Map<String,Object> sessionCommonModelMap = (Map<String,Object>) session.getAttribute(CommonConstant.SESSION_COMMON_MODEL_MAP);
String pageRenderMode = (String)sessionCommonModelMap.get(CommonConstant.PAGE_RENDER_MODE);
%>

<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
<%@include file="../common/header.jsp"%>
  <%@include file="../common/leftSideMenu.jsp"%>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
	<!-- Content Header (Page header) -->
    <section class="content-header">
		  <h1><spring:message code="event.festival.celebration.page.header"/></h1>
		  <hsCommonTag:breadCrumb pageTitle="Manage Festival" isFirstIndex="true"/>
	 </section>
	 
	 <section class="content">
	 	<div class="row">
    		<div class="col-md-12">
    				<form id="showFestivalForm" method="post">
						 <input type="hidden" id="festivalId" name="festivalId">
					</form>
    				<div class="box box-primary">
						<div class="box-header with-border">
							<div class="col-md-4">
							<label class="control-label"><spring:message code="common.label.selectYear"/></label>
							</div>
							<div class="col-md-4">
							<select class="form-control" id="periodYear" onchange="javascript:showAllFestivalForSelectedYearGrid();">
								<c:forEach items="${festivalYearList}" var="periodYear" varStatus="counter">
									<option value="${periodYear}">${periodYear}</option>
								</c:forEach>
							</select>
							</div>
							<div class="col-md-4">
							<button type="button" onclick="newFestivalCelebration();" class="btn btn-primary"><spring:message code="event.btn.new.festival.celebration"/></button>
							</div>
						</div>
						<div class="box-body">
							<table id="societyFestivalGridDiv" class="table table-bordered table-striped table-hover dt-responsive"></table>
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

<script>
  var jpageRenderMode = '<%=pageRenderMode%>';
</script>
<!-- JS Files -->  
<script src="<%=jsRoot%>/event/manageAllFestivalsPage.js?${Server_Token_Value}" type="text/javascript"></script>
</body>
</html>