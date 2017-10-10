<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.text.DateFormatSymbols"%>
<%@page import="java.util.Map"%>
<%@page import="app.societywala.account.bo.LedgerOpeningClosingAmountBO"%>
<%@page import="app.societywala.account.bo.AccountLedgerSubTypeBO"%>
<%@include file="../common/appConfig.jsp" %>
<html>
<HEAD>
	<%@include file="../common/appMetaConfig.jsp"%>
	<TITLE><spring:message code="common.title.label.product"/> :: Ledger Monthly Summary</TITLE>  
	<!-- CSS Files -->	
</HEAD>
<%
String mainMenu = "manageAccount";
String subMenu  = "balanceSheet";
AccountLedgerSubTypeBO accountLedgerSubTypeBO = (AccountLedgerSubTypeBO)request.getAttribute("accountLedgerSubTypeBO");
LedgerOpeningClosingAmountBO ledgerOpeningClosingAmountBO  = (LedgerOpeningClosingAmountBO)request.getAttribute("ledgerOpeningClosingAmountBO");
Map<Integer,Double> ledgerMonthlyDebitValueMap = (Map<Integer,Double>)request.getAttribute("ledgerMonthlyDebitValueMap");
Map<Integer,Double> ledgerMonthlyCreditValueMap = (Map<Integer,Double>)request.getAttribute("ledgerMonthlyCreditValueMap");
String[] shortMonths = new DateFormatSymbols().getShortMonths();
Double openingAmount = null;
Boolean isDebitAmount = null;
Double totalDebitValue = 0D;
Double totalCreditValue = 0D;
if(ledgerOpeningClosingAmountBO.getOpeningCreditBalance() != null 
	&& ledgerOpeningClosingAmountBO.getOpeningCreditBalance() > 0  )
{
	openingAmount = ledgerOpeningClosingAmountBO.getOpeningCreditBalance();
	totalCreditValue += openingAmount;
	isDebitAmount = false;
}
else if (ledgerOpeningClosingAmountBO.getOpeningDebitBalance() != null 
		&& ledgerOpeningClosingAmountBO.getOpeningDebitBalance() > 0  ) 
{
	openingAmount = ledgerOpeningClosingAmountBO.getOpeningDebitBalance();
	totalDebitValue += openingAmount;
	isDebitAmount = true;
}
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
		  <h1>
	       		 
	      </h1>
		  <hsCommonTag:breadCrumb pageTitle="Ledger Monthly Summary" isFirstIndex="false"/>
	 </section>
	 
	 <section class="content">
	 	<div class="row">
    		<div class="col-md-12">
    				<form id="ledgerVoucherDetailsForm" name="ledgerVoucherDetailsForm" method="post">
						<input type="hidden" id="accountLedgerSubHeadId" name="accountLedgerSubHeadId">
						<input type="hidden" id="monthId" name="monthId">
					</form>
    				<div class="box box-primary">
						<div class="box-header with-border">
							Monthly Summary for Ledger :: ${accountLedgerSubTypeBO.ledgerTypeTitle}
						</div>
						<div class="box-body">
							<table class="table table-bordered table-hover dt-responsive">
								<thead>
									<tr>
										<th width="70%" class="control-label">Particular</th>
										<th width="15%" class="control-label">Debit</th>
										<th width="15%" class="control-label">Credit</th>
									</tr>
								</thead>
								<tbody>
									<% if(isDebitAmount != null){ %>
									<tr>
										<td>Opening Balance</td>
										<% if(isDebitAmount) {%>
										<td><%=numberFormatter.format(openingAmount)%></td>
										<td></td>
										<% } else { %>
										<td></td>
										<td><%=numberFormatter.format(openingAmount)%></td>
										<% } %>				
									</tr>
									<% } 
									// From March to Dec
									for (int i = 3; i < shortMonths.length-1; i++) {
							            String shortMonth = shortMonths[i];
							            Double debitValue = ledgerMonthlyDebitValueMap.get(i+1);
							            Double creditValue = ledgerMonthlyCreditValueMap.get(i+1);
							        %>
							        <tr class="trHandOverBGColour" onclick="showLedgerVoucher('${accountLedgerSubTypeBO.accountLedgerSubTypeId}','<%=i%>');">
							        	<td><%=shortMonth%></td>
							        	<td>
							        	<%if(debitValue != null && debitValue > 0){
							        		totalDebitValue +=debitValue;
							        	%>
							        		<%=numberFormatter.format(debitValue)%>
							        	<%}%>
							        	</td>
							        	<td>
							        	<%if(creditValue != null && creditValue > 0){
							        		totalCreditValue +=creditValue;
							        	%>
							        		<%=numberFormatter.format(creditValue)%>
							        	<%}%>
							        	</td>
							        </tr>	
							        <%    
									}
									
									// From Jan to Mar
									for (int i = 0; i <= 2; i++) {
							            String shortMonth = shortMonths[i];
							            Double debitValue = ledgerMonthlyDebitValueMap.get(i+1);
							            Double creditValue = ledgerMonthlyCreditValueMap.get(i+1);
							        %>
							        <tr class="trHandOverBGColour" onclick="showLedgerVoucher('${accountLedgerSubTypeBO.accountLedgerSubTypeId}','<%=i%>');">
							        	<td><%=shortMonth%></td>
							        	<td>
							        	<%if(debitValue != null && debitValue > 0){
							        		totalDebitValue +=debitValue;
							        	%>
							        		<%=numberFormatter.format(debitValue)%>
							        	<%}%>
							        	</td>
							        	<td>
							        	<%if(creditValue != null && creditValue > 0){
							        		totalCreditValue +=creditValue;
							        	%>
							        		<%=numberFormatter.format(creditValue)%>
							        	<%}%>
							        	</td>
							        </tr>	
							        <%    
									}
									%>
									
									<tr>
										<td>Total </td>
										<td><%=numberFormatter.format(totalDebitValue)%></td>
										<td><%=numberFormatter.format(totalCreditValue)%></td>
									</tr>
									<tr>
										<td>Grand Total</td>
										<td>
											<%if(totalDebitValue > totalCreditValue) {%>
												<%=numberFormatter.format((totalDebitValue - totalCreditValue)) + "Dr."%>
											<%} %>
										</td>
										<td>
											<%if(totalCreditValue > totalDebitValue) {%>
												<%=numberFormatter.format((totalCreditValue - totalDebitValue)) + "Cr."%>
											<%} %>
										</td>
									</tr>
									
								</tbody>
							</table>
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

<!-- JS Files -->  
<script src="<%=jsRoot%>/account/legderMonthlySummary.js?${Server_Token_Value}" type="text/javascript"></script>

</body>
</html>