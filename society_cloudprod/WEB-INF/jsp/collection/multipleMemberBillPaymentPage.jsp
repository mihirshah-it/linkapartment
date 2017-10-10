<%@include file="../common/appConfig.jsp" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Map"%>
<%@page import="app.societywala.account.bo.JournalEntityType"%>
<%@page import="app.societywala.account.bo.JournalEntryDetailsType"%>
<html>
<HEAD>
   <%@include file="../common/appMetaConfig.jsp"%>
   <TITLE><spring:message code="common.title.label.product"/> :: Member Receipt Details</TITLE>  
</HEAD>
<%
String mainMenu = "manageAccount";
String subMenu  = "billPayment";
SimpleDateFormat dateFormat = new SimpleDateFormat(CommonConstant.dateUIFormatter);
Map<String,Object> sessionCommonModelMap = (Map<String,Object>) session.getAttribute(CommonConstant.SESSION_COMMON_MODEL_MAP);
String pageRenderMode = (String)sessionCommonModelMap.get(CommonConstant.AJAX_PAGE_RENDER_MODE);
Long billPaymentId = null;
if(request.getAttribute("propertyBillPaymentId") != null)
{
	billPaymentId = (Long)request.getAttribute("propertyBillPaymentId");
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
            <% if (pageRenderMode.equals(CommonConstant.VIEW_MODE) == false) { %>
			<li>
				<a  href="javascript:;"  onclick="javascript: addNewReceipt();"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp; Add Member Receipt</a>
			</li>
			<%} %>  
          </ul>
     </div>
     </nav>
    <!-- Content Header (Page header) -->
    <section class="content-header">
		 <h1>Member Receipt Details</h1>
		  <hsCommonTag:breadCrumb pageTitle="Member Receipt Details" isFirstIndex="false"/>
	 </section>
	 
	 <section class="content">
	 	<div class="row">
    		<div class="col-md-12">
    					<div id="memberBillReceiptFormDiv">
						</div>
					
    		</div> <!--  End of col 1 -->
    		
    	</div> <!-- End of main row -->
	 </section> <!--  end of content -->
  </div> <!-- End of content wrapper -->
  <%@include file="../common/footer.jsp"%>
  <%@include file="../common/rightSideMenu.jsp"%> 
</div> <!-- End of Wrapper -->

<div class="modal fade" id="addJournalDetailFieldPopupForm" tabindex="-1" role="dialog" aria-labelledby="To Details">
</div>

<script type="text/javascript">
	var journalEntityType = '<%=JournalEntityType.BILL_PAYMENT%>';	
	var journalDetailsTypeTO = '<%=JournalEntryDetailsType.TO%>';
	var jsMultipleEntryModePage = 'true';
	var jpageRenderMode='<%=pageRenderMode%>';
</script>
<script src="<%=jsRoot%>/collection/multipleMemberBillPaymentPage.js?${Server_Token_Value}" type="text/javascript"></script>
<script src="<%=jsRoot%>/collection/manageBillPaymentPage.js?${Server_Token_Value}" type="text/javascript"></script>
<script type="text/javascript">
if(jpageRenderMode == jcreateRenderMode)
{	
	createMultiplePropertyBillPaymentDetailsForm();
}else if(jpageRenderMode == jeditRenderMode)
{
	editMultiplePropertyBillPaymentDetailsForm('<%=billPaymentId%>');
}	
</script>
</body>
</html>