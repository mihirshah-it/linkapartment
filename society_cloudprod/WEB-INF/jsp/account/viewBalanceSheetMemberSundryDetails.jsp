<%@page import="java.text.SimpleDateFormat"%>
<%@page import="app.societywala.account.bo.AccountLedgerStatus"%>
<%@page import="app.societywala.account.bo.AccountLedgerSubTypeBO"%>
<%@page import="java.util.Iterator"%>
<%@page import="app.societywala.account.bo.AccountDimentionType"%>
<%@page import="java.util.Date"%>
<%@page import="app.societywala.account.bo.LedgerOpeningClosingAmountBO"%>
<%@page import="app.societywala.society.bo.SocietyPropertyBO"%>
<%@page import="java.util.Map"%>
<%@page import="app.societywala.account.bo.AccountLedgerHeadConstants"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.NumberFormat"%>
<%@include file="../common/appConfig.jsp" %>
<html>
<HEAD>
   <%@include file="../common/appMetaConfig.jsp"%>
   <TITLE><spring:message code="common.title.label.product"/> :: Sundry Details</TITLE>   
</HEAD>
<%
String mainMenu = "manageAccount";
String subMenu  = "balanceSheet";
pageCode = PageCode.BALANCE_SHEET;
NumberFormat  numberFormatter = new DecimalFormat(CommonConstant.NUMBER_FORMAT);
SimpleDateFormat uiDateFormat = new SimpleDateFormat(CommonConstant.dateUIFormatter);
Long accountLedgerHeadId = (Long)request.getAttribute("accountLedgerHeadId");
Integer sundryAssetsOrLiabilityType = (Integer)request.getAttribute("sundryAssetsOrLiabilityType");
Map<Long , LedgerOpeningClosingAmountBO> memberSundryMap = (Map<Long , LedgerOpeningClosingAmountBO>) request.getAttribute("memberSundryMap");
Map<Long,AccountLedgerSubTypeBO> memberSubHeadBOMap = (Map<Long,AccountLedgerSubTypeBO>)request.getAttribute("memberSubHeadBOMap");
Date asOnDate = (Date)request.getAttribute("asOnDate");
Map<Long , SocietyPropertyBO> memberSubAccountPropertyBOMap  = null;
if(accountLedgerHeadId.equals(AccountLedgerHeadConstants.MEMBER_HEAD_SOCIETY_PROPERTY))
{
	memberSubAccountPropertyBOMap = (Map<Long , SocietyPropertyBO>)request.getAttribute("memberSubAccountPropertyBOMap");
}
Iterator<Long> memberSundryMapIterator = memberSundryMap.keySet().iterator();
Double totalAmount = 0D;
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
		  <!-- Start Code for Bread crumb -->
		<%
			StringBuffer pageTitle = new StringBuffer("");
			if(accountLedgerHeadId.equals(AccountLedgerHeadConstants.MEMBER_HEAD_SOCIETY_PROPERTY))
			{
				pageTitle.append("Member Sundry ");
			}else if(accountLedgerHeadId.equals(AccountLedgerHeadConstants.MEMBER_HEAD_SOCIETY_STAFF))
			{
				pageTitle.append("Staff Sundry ");
			}else if(accountLedgerHeadId.equals(AccountLedgerHeadConstants.MEMBER_HEAD_SOCIETY_PROPERTY))
			{
				pageTitle.append("Supplier Sundry ");
			}else if(accountLedgerHeadId.equals(AccountLedgerHeadConstants.MEMBER_HEAD_SOCIETY_PROPERTY))
			{
				pageTitle.append("Vendor Sundry ");
			}
			
			if(sundryAssetsOrLiabilityType.equals(AccountDimentionType.LIABILITY)) {
				pageTitle.append("Creditor");
			}else if(sundryAssetsOrLiabilityType.equals(AccountDimentionType.ASSETS)){
				pageTitle.append("Debitor");
			}
		%>
		  <h1><%=pageTitle.toString()%></h1>
		  <hsCommonTag:breadCrumb pageTitle="<%=pageTitle.toString()%>" isFirstIndex="false"/>
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
							<%=pageTitle.toString()%> as on date : &nbsp;<%=uiDateFormat.format(asOnDate)%>
						</div>
						<div class="box-body">
							<div class="form-group">
							<table class="table table-bordered table-hover dt-responsive">
								<thead>
								<tr>
										<th width="50%">MEMBERS NAME</th>
									
									<%if(accountLedgerHeadId.equals(AccountLedgerHeadConstants.MEMBER_HEAD_SOCIETY_PROPERTY)){
									%>
										<th width="50%">BLOCK NO</th>
									<%}
									%>
									
									<%if(sundryAssetsOrLiabilityType.equals(AccountDimentionType.ASSETS)){ %>
										<th width="50%">DEBIT AMOUNT</th>
										<th width="50%">Arrears AMOUNT</th>
										<th width="50%">Arrears INTEREST AMOUNT</th>
									<%}else if (sundryAssetsOrLiabilityType.equals(AccountDimentionType.LIABILITY)) {%>
										<th width="50%">CREDIT AMOUNT</th>
										<th width="50%">Arrears AMOUNT</th>
										<th width="50%">Arrears INTEREST AMOUNT</th>
									<%} %>
								</tr>
								</thead>
								<% while(memberSundryMapIterator.hasNext()) {
									Long ledgerSubTypeBOId = memberSundryMapIterator.next();
									LedgerOpeningClosingAmountBO ledgerOpeningClosingAmountBO = memberSundryMap.get(ledgerSubTypeBOId);
									String subHeadName = null;
									String blockNumber = null;
									Double arrearAmount = (ledgerOpeningClosingAmountBO.getOpeningArrearDebitBalance() + ledgerOpeningClosingAmountBO.getClosingArrearDebitBalance()) - (ledgerOpeningClosingAmountBO.getOpeningArrearCreditBalance() + ledgerOpeningClosingAmountBO.getClosingArrearCreditBalance());
									Double interestAmount = (ledgerOpeningClosingAmountBO.getOpeningInterestDebitBalance() + ledgerOpeningClosingAmountBO.getClosingInterestDebitBalance()) - (ledgerOpeningClosingAmountBO.getOpeningInterestCreditBalance() + ledgerOpeningClosingAmountBO.getClosingInterestCreditBalance());
									String arrearAmountSuffix = null;
									String interestAmountSuffix = null;
									if( arrearAmount >= 0)
									{
										arrearAmountSuffix = "Dr.";
									}else{
										arrearAmount = Math.abs(arrearAmount);
										arrearAmountSuffix = "Cr.";
									}
									
									if( interestAmount >= 0)
									{
										interestAmountSuffix = "Dr.";
									}else{
										interestAmount = Math.abs(interestAmount);
										interestAmountSuffix = "Cr.";
									}
									
									if(accountLedgerHeadId.equals(AccountLedgerHeadConstants.MEMBER_HEAD_SOCIETY_PROPERTY))
									{
										SocietyPropertyBO societyPropertyBO = memberSubAccountPropertyBOMap.get(ledgerOpeningClosingAmountBO.getSocietyLedgerAccountMappingBO().getAccountDimentionSubTypeId());
										AccountLedgerSubTypeBO ledgerSubTypeBO = memberSubHeadBOMap.get(ledgerOpeningClosingAmountBO.getSocietyLedgerAccountMappingBO().getAccountDimentionSubTypeId());
										blockNumber = ledgerSubTypeBO.getLedgerTypeTitle();
										if(societyPropertyBO != null)
										{
											subHeadName = societyPropertyBO.getPropertyNamePlateDetails();						
										}else
										{
											subHeadName = AccountLedgerStatus.getStatusName(ledgerSubTypeBO.getAccountLedgerStatus());
										}
									}else // If Not a Member
									{
										AccountLedgerSubTypeBO ledgerSubTypeBO = memberSubHeadBOMap.get(ledgerOpeningClosingAmountBO.getSocietyLedgerAccountMappingBO().getAccountDimentionSubTypeId());
										subHeadName = ledgerSubTypeBO.getLedgerTypeTitle();
									}
								
								%>
								<tbody>	
								<tr onclick="javascript:showLedgerMonthlySummary('<%=accountLedgerHeadId%>','<%=ledgerOpeningClosingAmountBO.getSocietyLedgerAccountMappingBO().getAccountDimentionSubTypeId()%>');" class="trHandOverBGColour" >
											<td>
												<%=subHeadName%>							
											</td>
											
											<%if(accountLedgerHeadId.equals(AccountLedgerHeadConstants.MEMBER_HEAD_SOCIETY_PROPERTY)){
											%>
											<td>
												<%=blockNumber%>
											</td>
											<%}%>
											<%if(sundryAssetsOrLiabilityType.equals(AccountDimentionType.ASSETS)){ %>
													<td align="right">
													<%=(numberFormatter.format(ledgerOpeningClosingAmountBO.getCurrentDebitBalance()))%>
													</td>
													<td align="right">
													<%=(numberFormatter.format(arrearAmount) + " " + arrearAmountSuffix)%>
													</td>
													<td align="right">
													<%=(numberFormatter.format(interestAmount) + " " + interestAmountSuffix)%>
													 </td>
													<%totalAmount+=ledgerOpeningClosingAmountBO.getCurrentDebitBalance();%>
												<%} else if(sundryAssetsOrLiabilityType.equals(AccountDimentionType.LIABILITY)) { %>
													<td align="right">
													<%=(numberFormatter.format(ledgerOpeningClosingAmountBO.getCurrentCreditBalance()))%>
													</td>
													<td align="right">
													<%=(numberFormatter.format(arrearAmount) + " " + arrearAmountSuffix)%>
													</td>
													<td align="right">
													<%=(numberFormatter.format(interestAmount) + " " + interestAmountSuffix)%>
													</td>
													<%totalAmount+=ledgerOpeningClosingAmountBO.getCurrentCreditBalance();%>
												<%} %>			
								</tr>
								<%} // end of while(memberSundryMapIterator.hasNext()) %>
								</tbody>
								<tfoot>
								<tr>
									<%if(accountLedgerHeadId.equals(AccountLedgerHeadConstants.MEMBER_HEAD_SOCIETY_PROPERTY)){%>
										<td colspan="2"><b>Total</b></td>
									<%} else {%>
										<td colspan="1"><b>Total</b></td>
									<%} %>
									<td align="right">
										<b><%=(numberFormatter.format(totalAmount))%></b>							
									</td>
								</tr>
								</tfoot>
							</table>
						</div>
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

<!-- JS Files -->  
<script src="<%=jsRoot%>/account/viewBalanceSheetMemberSundryDetails.js?${Server_Token_Value}" type="text/javascript"></script>
</body>
</html>
