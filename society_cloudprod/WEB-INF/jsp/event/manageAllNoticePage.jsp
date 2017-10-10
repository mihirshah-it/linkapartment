<%@page import="java.util.Map"%>
<%@include file="../common/appConfig.jsp" %>

<html>
<HEAD>
	<%@include file="../common/appMetaConfig.jsp"%>
   <TITLE><spring:message code="common.title.label.product"/> :: Manage Notice</TITLE>
</HEAD>
<%
String mainMenu = "manageEvent";
String subMenu  = "notice";
Map<String,Object> sessionCommonModelMap = (Map<String,Object>) session.getAttribute(CommonConstant.SESSION_COMMON_MODEL_MAP);
String pageRenderMode = (String)sessionCommonModelMap.get(CommonConstant.PAGE_RENDER_MODE);
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
		  <h1><spring:message code="event.manage.all.notice.page.header"/></h1>
		  <hsCommonTag:breadCrumb pageTitle="Manage Notice" isFirstIndex="false"/>
	 </section>
	 
	 <section class="content">
	 	<div class="row">
    		<div class="col-md-12">
    				<form id="noticeFormForward" method="post">
							 <input type="hidden" id="noticeId" name="noticeId">
					</form>
    				<div class="box box-primary">
						<div class="box-header with-border">
							<%if (pageRenderMode.equals(CommonConstant.CREATE_MODE)  || pageRenderMode.equals(CommonConstant.EDIT_MODE)) {%>
							<button type="button" onclick="createNotice();" class="btn btn-primary"><spring:message code="event.manage.all.notice.btn.create.notice"/></button>
							<%} %>							
						</div>
						<div class="box-body">							
							<table id="societyNoticeGridDiv" class="table table-bordered table-striped table-hover dt-responsive"></table>
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
</body>

<script>
  var jpageRenderMode = '<%=pageRenderMode%>';
</script>
<!-- JS Files -->  
<script src="<%=jsRoot%>/event/manageAllNoticePage.js?${Server_Token_Value}" type="text/javascript"></script>
</body>
</html>