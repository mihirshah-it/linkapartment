<%@page import="app.societywala.account.bo.AccountDimentionType"%>
<%@page import="java.util.Map"%>
<%@page import="app.societywala.user.bo.UserBO"%>
<%@page import="app.societywala.user.bo.UserRoleType"%>
<%@include file="../common/appConfig.jsp" %>

<html>
<HEAD>
   <%@include file="../common/appMetaConfig.jsp"%>
   <TITLE><spring:message code="common.title.label.product"/> :: Manage Ledger</TITLE>
</HEAD>
<%
String mainMenu = "manageAccount";
String subMenu  = "manageLedgerPage";
Map<String,Object> sessionCommonModelMap = (Map<String,Object>) session.getAttribute(CommonConstant.SESSION_COMMON_MODEL_MAP);
String pageRenderMode = (String)sessionCommonModelMap.get(CommonConstant.PAGE_RENDER_MODE);
Boolean isAdminFlow = (Boolean)sessionCommonModelMap.get("isAdminFlow");
if(isAdminFlow)
{
	mainMenu = "admin";
	subMenu  = "";
}
%>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
<%@include file="../common/header.jsp"%>
  <%@include file="../common/leftSideMenu.jsp"%>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
	<!-- Content Header (Page header) -->
    <section class="content-header">
		  <h1><spring:message code="account.manage.ledgerhead.page.header"/></h1>
		  <hsCommonTag:breadCrumb pageTitle="Manage Ledger" isFirstIndex="true"/>
	 </section>
	 
	 <section class="content">
	 	<div class="row">
    		<div class="col-md-12">
    				<div class="box box-primary">
						<div class="box-header with-border">
							<form class="form" id="assetsFormForward" method="post" role="form">
							   <div class="form-group">
							   <input type="hidden" name="ledgerLookupHeadId" id="ledgerLookupHeadId">
							   <div class="col-md-4">
							   <label class="control-label">Ledger Type</label>
							   </div>
							   <div class="col-md-4">
							   <select class="form-control" id="accountDimentionType" name="accountDimentionType" onchange="showSocietyLedgerGrid();">
							   		<option value="<%=AccountDimentionType.INCOME%>">Income</option>
							   		<option value="<%=AccountDimentionType.EXPENSE%>">Expense</option>
							   		<option value="<%=AccountDimentionType.ASSETS%>">Assets</option>
							   		<option value="<%=AccountDimentionType.LIABILITY%>">Liabilities</option>
							   		<%if(!isAdminFlow) {%> 
							   		<option value="<%=AccountDimentionType.MEMBER%>">Member</option>
							   		<%} %>
							   		<option value="<%=AccountDimentionType.DUTIES_TAXES%>">Duties and Taxes</option>
							   		<%if(!isAdminFlow) {%>
							   		<option value="<%=AccountDimentionType.P_AND_L%>">Income and Expenditure</option>
							   		<%} %>
							   </select>
							   </div>							   
							   <%if(isAdminFlow){ %>
							   <div class="col-md-4">
							   	<button type="button" onclick="javascript:addLedgerHeadDetails();" class="btn btn-primary">Add</button>							   	
							   </div>
							   <%}%>
							   </div>
							   </form>
						</div> <!--  end og box header -->
						<div class="box-body">
							<table id="societyLedgerGridDiv" class="table table-bordered table-striped table-hover dt-responsive"></table>
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
	   
<div class="modal fade" id="ledgerHeadDetailsPopupDiv" tabindex="-1" role="dialog" aria-labelledby="Ledger Head Details">
</div>

<script>
var jpageRenderMode = '<%=pageRenderMode%>';
var prevAccountDimentionType = "";
var jsIsAdminFlow = '<%=isAdminFlow%>';
</script>

<%
Map pageStateRequestParam = (Map)request.getAttribute("pageStateRequestParam");
if(pageStateRequestParam != null)
{		
%>
	<script>
	prevAccountDimentionType = '<%=(String)pageStateRequestParam.get("accountDimentionType")%>';
	</script>
<%
}
%>
<!-- Page State from Session -->

<!-- JS Files -->  
<script src="<%=jsRoot%>/account/manageLedgerPage.js?${Server_Token_Value}" type="text/javascript"></script>
</body>

<script>
if(prevAccountDimentionType != '')
	{
		$("#accountDimentionType").val(prevAccountDimentionType);
	}
showSocietyLedgerGrid();
</script>

</html>