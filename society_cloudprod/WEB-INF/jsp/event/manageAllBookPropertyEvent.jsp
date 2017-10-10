<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Map"%>
<%@include file="../common/appConfig.jsp" %>

<html>
<HEAD>
	<%@include file="../common/appMetaConfig.jsp"%>
   <TITLE><spring:message code="common.title.label.product"/> :: Manage Event Booking</TITLE>
   
</HEAD>
<script>
var jsSocietyLastBillGenerationDate = '';
</script>
<%
String mainMenu = "manageEvent";
String subMenu  = "bookFacility";
Map<String,Object> sessionCommonModelMap = (Map<String,Object>) session.getAttribute(CommonConstant.SESSION_COMMON_MODEL_MAP);
String pageRenderMode = (String)sessionCommonModelMap.get(CommonConstant.PAGE_RENDER_MODE);
Date societyLastBillGenerationDate = (Date)request.getAttribute("societyLastBillGenerationDate");
SimpleDateFormat simpleDateFormat = new SimpleDateFormat(CommonConstant.dateUIFormatter);
if(societyLastBillGenerationDate != null)
{
%>
<script>
	jsSocietyLastBillGenerationDate = '<%=simpleDateFormat.format(societyLastBillGenerationDate)%>';
</script>
<%	
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
		  <h1><spring:message code="event.manage.all.book.property.page.header"/></h1>
		  <hsCommonTag:breadCrumb pageTitle="Manage Facility Booking" isFirstIndex="true"/>
	 </section>
	 
	 <section class="content">
	 	<div class="row">
    		<div class="col-md-12">
    				<div class="box box-primary">
						<%	if(societyLastBillGenerationDate != null)
						{
						%>
						<div class="box-header">
						Last bill is generated on date '<%=simpleDateFormat.format(societyLastBillGenerationDate)%>', you can not cancel the booking before of this date.
						</div> 
						<%
						}
						%>															
						
						<div class="box-header with-border">
							<button type="button" onclick="javascript:bookPropertyForEvent();" class="btn btn-primary"><spring:message code="event.btn.book.propery.forEvent"/></button>
						</div>
						<div class="box-body">
							<table id="societyPropertyBookedEventGridDiv" class="table table-bordered table-striped table-hover dt-responsive"></table>
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

<script src="<%=jsRoot%>/event/manageAllBookPropertyEvent.js?${Server_Token_Value}" type="text/javascript"></script>
</body>
</html>