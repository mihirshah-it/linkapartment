<%@page import="app.societywala.account.bo.AccountLedgerHeadConstants"%>
<%@page import="app.societywala.account.bo.AccountDimentionType"%>
<%@page import="app.societywala.account.bo.AccountLedgerOtherFieldOptionBO"%>
<%@page import="java.util.Map"%>
<%@page import="app.societywala.account.bo.AccountLedgerHeadOtherFieldBO"%>
<%@page import="app.societywala.account.bo.AccountLedgerTypeHeadBO"%>
<%@page import="app.societywala.account.bo.AccountLedgerSubTypeBO"%>
<%@page import="java.util.List"%>
<%@include file="../common/appConfig.jsp" %>
<html>
<HEAD>
	<%@include file="../common/appMetaConfig.jsp"%>
	<TITLE><spring:message code="common.title.label.product"/> :: Ledger Details</TITLE>	
</HEAD>

<%
String mainMenu = "manageAccount";
String subMenu  = "manageLedgerPage";
AccountLedgerTypeHeadBO accountLedgerTypeHeadBO = (AccountLedgerTypeHeadBO)request.getAttribute("accountLedgerTypeHeadBO");
Boolean isPropertyMemberHead = false;
Boolean isAddNewLedgerButtonRequire = true;
if(accountLedgerTypeHeadBO.getAccountDimentionTypeId().equals(AccountDimentionType.MEMBER) && accountLedgerTypeHeadBO.getAccountLedgerTypeHeadId().equals(AccountLedgerHeadConstants.MEMBER_HEAD_SOCIETY_PROPERTY))
{
	isPropertyMemberHead = true;
	isAddNewLedgerButtonRequire = false;
}
else if(accountLedgerTypeHeadBO.getAccountDimentionTypeId().equals(AccountDimentionType.P_AND_L))
{
	isAddNewLedgerButtonRequire = false;
}
Map<String,Object> sessionCommonModelMap = (Map<String,Object>) session.getAttribute(CommonConstant.SESSION_COMMON_MODEL_MAP);
String pageRenderMode = (String)sessionCommonModelMap.get(CommonConstant.PAGE_RENDER_MODE);
Boolean isAdminFlow = (Boolean)sessionCommonModelMap.get("isAdminFlow");
if(isAdminFlow)
{
	mainMenu = "admin";
	subMenu  = "";
	pageRenderMode = CommonConstant.EDIT_MODE;
}

%>
<script>
	globalJsIsPropertyMemberHead = <%=isPropertyMemberHead%>;
	globalJsLedgerHeadID = <%=accountLedgerTypeHeadBO.getAccountLedgerTypeHeadId()%>;
	jsIsAdminFlow = '<%=isAdminFlow%>';
	var jpageRenderMode = '<%=pageRenderMode%>';
</script>

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
		  <h1><spring:message code="account.society.ledger.society.form.header"/></h1>
		  <hsCommonTag:breadCrumb pageTitle="Ledger Details" isFirstIndex="false"/>
	 </section>
	 
	 <section class="content">
	 	<div class="row">
    		<div class="col-md-12">
    				<input type="hidden" id="assetsLookupId" name="assetsLookupId" value="<%=accountLedgerTypeHeadBO.getAccountLedgerTypeHeadId()%>">
    				<div class="box box-primary">
						<div class="box-header with-border">
							<div class="box-title">
							<spring:message code="account.society.ledger.form.info.message" arguments="<%=accountLedgerTypeHeadBO.getLedgerHeadTitle()%>"/>
							</div>
						</div>
						<div class="box-body">
							<% if(isAddNewLedgerButtonRequire){ %>
							<div class="form-group">
								<button class="btn btn-primary" onclick="javascript:addNewAssets('<%=accountLedgerTypeHeadBO.getAccountLedgerTypeHeadId()%>');">
										<spring:message code="account.society.ledger.button.add.ledger"/>
								</button>
							</div>
							<% } %>
							<div id="societyAssetsDetailsDiv">
							</div>
							<table id="societyPropertyLedgerGridDiv" class="table table-bordered table-striped table-hover dt-responsive"><!-- This will be populated by Ajax --></table>
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

<div class="modal fade" id="assetsDetailsFormDiv" tabindex="-1" role="dialog" aria-labelledby="property details">
</div>

</body>
<!-- JS Files -->

<script src="<%=jsRoot%>/account/manageSocietyAssetsPage.js?${Server_Token_Value}" type="text/javascript"></script>
</html>