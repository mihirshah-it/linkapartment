<%@page import="app.societywala.society.bo.SocietyBO"%>
<%@page import="app.societywala.account.bo.AccountLedgerSubTypeBO"%>
<%@page import="app.societywala.account.bo.AccountLedgerTypeHeadBO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="app.societywala.account.bo.AccountLedgerHeadConstants"%>
<%@page import="app.societywala.account.bo.AccountDimentionType"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.Iterator"%>
<%@page import="app.societywala.account.bo.LedgerOpeningClosingAmountBO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@include file="../common/appConfig.jsp" %>

<html>
<HEAD>
   <%@include file="../common/appMetaConfig.jsp"%>
   <TITLE><spring:message code="common.title.label.product"/> :: Balance Sheet Duty Tax Details</TITLE>
</HEAD>
<%
String mainMenu = "manageAccount";
String subMenu  = "balanceSheet";
pageCode = PageCode.BALANCE_SHEET;

Integer dutyTaxAssetsOrLiabilityType = (Integer)request.getAttribute("dutyTaxAssetsOrLiabilityType");
Map<Long , List<LedgerOpeningClosingAmountBO>> accountHeadMap = (Map<Long , List<LedgerOpeningClosingAmountBO>> )request.getAttribute("accountHeadMap");
Map<Long , LedgerOpeningClosingAmountBO> accountHeadOpeningClosingBalanceMap = (Map<Long , LedgerOpeningClosingAmountBO>) request.getAttribute("accountHeadOpeningClosingBalanceMap");
Map<Long , AccountLedgerTypeHeadBO> headLedgerName = (Map<Long , AccountLedgerTypeHeadBO>)request.getAttribute("headLedgerName");
Map<Long , AccountLedgerSubTypeBO> subHeadLedgerName = (Map<Long , AccountLedgerSubTypeBO>)request.getAttribute("subHeadLedgerName");
SimpleDateFormat uiDateFormat = new SimpleDateFormat(CommonConstant.dateUIFormatter);
Date asOnDate = (Date)request.getAttribute("asOnDate");
Double totalAmount = 0D;
NumberFormat  numberFormatter = new DecimalFormat(CommonConstant.NUMBER_FORMAT);
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
		  <h1><spring:message code="account.manage.balancesheet.page.header"/></h1>
		  <hsCommonTag:breadCrumb pageTitle="Duty Tax Details" isFirstIndex="false"/>
	 </section>
	 
	 <section class="content">
	 	<div class="row">
    		<div class="col-md-12">
    				<form id="ledgerDetailsForm" name="ledgerDetailsForm" method="post">
						<input type="hidden" id="accountLedgerHeadId" name="accountLedgerHeadId">
						<input type="hidden" id="accountDimentionTypeId" name="accountDimentionTypeId">
						<input type="hidden" id="sundryAssetsOrLiabilityType" name="sundryAssetsOrLiabilityType">
					</form>
					
					<form id="ledgerVoucherDetailsForm" name="ledgerVoucherDetailsForm" method="post">
						<input type="hidden" id="accountLedgerSubHeadId" name="accountLedgerSubHeadId">
					</form>
    				<div class="box box-primary">
						<div class="box-header with-border">
							<spring:message code="account.viewBalanceSheet.label.viewBalanceSheetAsOn"/> &nbsp;<%=uiDateFormat.format(asOnDate)%>
						</div>
						<div class="box-body">
						<div class="form-group">
						<table class="table table-bordered table-hover dt-responsive">
							<thead>
							<tr>
								<th width="50%">Account Head</th>
								<% if(dutyTaxAssetsOrLiabilityType.equals(AccountDimentionType.LIABILITY)){ %>
								<th width="50%">Credit</th>
								<%} else if(dutyTaxAssetsOrLiabilityType.equals(AccountDimentionType.ASSETS)){ %>
								<th width="50%">Debit</th>
								<% } %>
							<tr>
							</thead>
							<tbody>
							<%
								Iterator<Long> accountMapItr = accountHeadMap.keySet().iterator();
										
								while(accountMapItr.hasNext())
								{
									Long key = accountMapItr.next();
									List<LedgerOpeningClosingAmountBO> ledgerAmountBOList =accountHeadMap.get(key);
									AccountLedgerTypeHeadBO headNameBO =  headLedgerName.get(key);
									String headName = headNameBO.getLedgerHeadTitle();
									
									String subHeadName = null;
									Boolean isHeadPrinted = false;
									Boolean isChildGroupExpanded = true;
									Boolean isOpeningBalancePrintRequired = true;
									String subHeadClickFunction = null;
									
									for(int i=0 ; i <ledgerAmountBOList.size() ;i++)
									{
										LedgerOpeningClosingAmountBO ledgerOpeningClosingAmountBO = ledgerAmountBOList.get(i);
										Double currentLedgerBalance = null;
										if(dutyTaxAssetsOrLiabilityType.equals(AccountDimentionType.LIABILITY))
										{
											currentLedgerBalance = ledgerOpeningClosingAmountBO.getCurrentCreditBalance();
										}else if(dutyTaxAssetsOrLiabilityType.equals(AccountDimentionType.ASSETS))
										{
											currentLedgerBalance = ledgerOpeningClosingAmountBO.getCurrentDebitBalance();
										}							
										totalAmount+=currentLedgerBalance;
										subHeadName = "Add : " + subHeadLedgerName.get(ledgerOpeningClosingAmountBO.getSocietyLedgerAccountMappingBO().getAccountDimentionSubTypeId()).getLedgerTypeTitle();
										subHeadClickFunction = "javascript:showLedgerMonthlySummary("+ledgerOpeningClosingAmountBO.getSocietyLedgerAccountMappingBO().getAccountDimentionHeadTypeId() +", "+ledgerOpeningClosingAmountBO.getSocietyLedgerAccountMappingBO().getAccountDimentionSubTypeId()+");";
										
										if(!isHeadPrinted)
										{
								%>
										<tr onclick="javascript:viewBalanceSheetLedger('<%=headNameBO.getAccountLedgerTypeHeadId()%>','<%=headNameBO.getAccountDimentionTypeId()%>','<%=isChildGroupExpanded%>');" class="trHandOverBGColour" >
											<td>
												<b><%=headName%></b>						
											</td>
											<td>
											</td>
										</tr>
										<%						 
										} // ENd of if(!isHeadPrinted)
										%>
										<tr class="trHandOverBGColour" onclick="<%=subHeadClickFunction%>" >
											<td>
												<%=subHeadName%>							
											</td>
											<td align="right">
												<%=(numberFormatter.format(currentLedgerBalance))%>								
											</td>					
										</tr>					
									<%
										isHeadPrinted = true;
									}// End of for loop
								} // End of accountMapItr
								%>
								</tbody>
								<tfoot>	
								<tr>
									<td>
											<b>Total</b>
									</td>
									<td align="right">
											<b><%=(numberFormatter.format(totalAmount))%></b>
									</td>		
								</tr>
								</tfoot>	
						</table>
						</div> <!--  end of form-div -->
						</div> <!-- end of body -->
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
<!-- JS Files -->  
<script src="<%=jsRoot%>/account/viewBalanceSheetPage.js?${Server_Token_Value}" type="text/javascript"></script>
</body>
</html>