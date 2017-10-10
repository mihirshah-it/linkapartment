<%@page import="java.util.Iterator"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="app.societywala.account.bo.AccountLedgerSubTypeBO"%>
<%@page import="app.societywala.account.bo.AccountLedgerTypeHeadBO"%>
<%@page import="app.societywala.account.bo.LedgerOpeningClosingAmountBO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@include file="../common/appConfig.jsp" %>
<html>
<HEAD>
   <%@include file="../common/appMetaConfig.jsp"%>
   <TITLE><spring:message code="common.title.label.product"/> :: Profit and Loss Details</TITLE>   
</HEAD>
<%
String mainMenu = "manageAccount";
String subMenu  = "balanceSheet";
pageCode = PageCode.BALANCE_SHEET;
Map<Long , List<LedgerOpeningClosingAmountBO>> incomeMap = (Map<Long , List<LedgerOpeningClosingAmountBO>> )request.getAttribute("incomeMap");
Map<Long , LedgerOpeningClosingAmountBO> incomeOpeningClosingBalanceMap = (Map<Long , LedgerOpeningClosingAmountBO>) request.getAttribute("incomeOpeningClosingBalanceMap");
Map<Long , List<LedgerOpeningClosingAmountBO>> expensesMap = (Map<Long , List<LedgerOpeningClosingAmountBO>> )request.getAttribute("expensesMap");
Map<Long , LedgerOpeningClosingAmountBO> expensesOpeningClosingBalanceMap = (Map<Long , LedgerOpeningClosingAmountBO>) request.getAttribute("expensesOpeningClosingBalanceMap");
Map<Long , AccountLedgerTypeHeadBO> headLedgerName = (Map<Long , AccountLedgerTypeHeadBO>)request.getAttribute("headLedgerName");
Map<Long , AccountLedgerSubTypeBO> subHeadLedgerName = (Map<Long , AccountLedgerSubTypeBO>)request.getAttribute("subHeadLedgerName");
SimpleDateFormat uiDateFormat = new SimpleDateFormat(CommonConstant.dateUIFormatter);
Date asOnDate = (Date)request.getAttribute("asOnDate");
Double expensesTotalAmount = 0D;
Double incomeTotalAmount = 0D;
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
		  <hsCommonTag:breadCrumb pageTitle="Profit and Loss Details" isFirstIndex="false"/>
	 </section>
	 
	 <section class="content">
	 	<div class="row">
    		<div class="col-md-12">
    				<form id="ledgerDetailsForm" name="ledgerDetailsForm" method="post">
						<input type="hidden" id="accountLedgerHeadId" name="accountLedgerHeadId">
						<input type="hidden" id="accountDimentionTypeId" name="accountDimentionTypeId">
					</form>
					
					<form id="ledgerVoucherDetailsForm" name="ledgerVoucherDetailsForm" method="post">
						<input type="hidden" id="accountLedgerSubHeadId" name="accountLedgerSubHeadId">
					</form>
    				<div class="box box-primary">
						<div class="box-header with-border">
							Income & Expenditure as on &nbsp;<%=uiDateFormat.format(asOnDate)%>
						</div>
						<div class="box-body">
						<div class="form-group">
							<table class="table table-bordered table-striped table-hover dt-responsive">
								<thead>
								<tr>
									<th width="50%">Expenditure</th>
									<th width="50%">Income</th>
								<tr>
								</thead>
								<tbody>
								<tr>
									<td  valign="top">	
										<table class="table table-condensed table-hover table-bordered">
								
							<%
								Iterator<Long> expensesMapItr = expensesMap.keySet().iterator();
								
								while(expensesMapItr.hasNext())
								{
									Long key = expensesMapItr.next();
									List<LedgerOpeningClosingAmountBO> ledgerAmountBOList =expensesMap.get(key);
									AccountLedgerTypeHeadBO headNameBO =  headLedgerName.get(key);
									String headName = headNameBO.getLedgerHeadTitle();
									
									String subHeadName = null;
									Boolean isHeadPrinted = false;
									for(int i=0 ; i <ledgerAmountBOList.size() ;i++)
									{
										LedgerOpeningClosingAmountBO ledgerOpeningClosingAmountBO = ledgerAmountBOList.get(i);
										subHeadName = subHeadLedgerName.get(ledgerOpeningClosingAmountBO.getSocietyLedgerAccountMappingBO().getAccountDimentionSubTypeId()).getLedgerTypeTitle();
										if(!isHeadPrinted)
										{
										%>
											<tr>
												<td>
													<b><%=headName%></b>						
												</td>
												<td>
												</td>
												<td>
												</td>
											</tr>					
										<%
										}%>
											<tr onclick="javascript:showLedgerMonthlySummary('<%=headNameBO.getAccountLedgerTypeHeadId()%>','<%=ledgerOpeningClosingAmountBO.getSocietyLedgerAccountMappingBO().getAccountDimentionSubTypeId()%>');" class="trHandOverBGColour" >
												<td>
													<%=subHeadName%>							
												</td>
												<td align="right">
													<%=(numberFormatter.format(ledgerOpeningClosingAmountBO.getCurrentDebitBalance()))%>
												</td>
												<td align="right">
													<%if(i == ledgerAmountBOList.size()-1)
													{
													%>							
													<%=(numberFormatter.format(expensesOpeningClosingBalanceMap.get(key).getClosingDebitBalance()))%>
													<%
													expensesTotalAmount+=expensesOpeningClosingBalanceMap.get(key).getClosingDebitBalance();
													%>
													
													<%
													}							
													%>	
												</td>					
											</tr>					
										<%				
										isHeadPrinted = true;
									}// End of for loop
									
								} // End of Expenses Map
							
							%>					
										</table>	
									</td>
									<td valign="top">
									<!-- End of expenses Rendering -->
									<!-- Start of Income Rendering -->
									<table class="table table-condensed table-hover table-bordered">
								
							<%
								Iterator<Long> incomeMapItr = incomeMap.keySet().iterator();
								while(incomeMapItr.hasNext())
								{
									Long key = incomeMapItr.next();
									List<LedgerOpeningClosingAmountBO> ledgerAmountBOList =incomeMap.get(key);
									AccountLedgerTypeHeadBO headNameBO = headLedgerName.get(key);
									String headName =  headNameBO.getLedgerHeadTitle();
									String subHeadName = null;
									Boolean isHeadPrinted = false;
									for(int i=0 ; i <ledgerAmountBOList.size() ;i++)
									{
										LedgerOpeningClosingAmountBO ledgerOpeningClosingAmountBO = ledgerAmountBOList.get(i);
										subHeadName = subHeadLedgerName.get(ledgerOpeningClosingAmountBO.getSocietyLedgerAccountMappingBO().getAccountDimentionSubTypeId()).getLedgerTypeTitle();
										
										if(!isHeadPrinted)
										{
										%>
											<tr>
												<td>
													<b><%=headName%></b>						
												</td>
												<td>
												</td>
												<td>
												</td>
											</tr>					
										<%
										}%>
											<tr onclick="javascript:showLedgerMonthlySummary('<%=headNameBO.getAccountLedgerTypeHeadId()%>','<%=ledgerOpeningClosingAmountBO.getSocietyLedgerAccountMappingBO().getAccountDimentionSubTypeId()%>');" class="trHandOverBGColour">
												<td>
													<%=subHeadName%>							
													
												</td>							
												<td align="right">
													<%=(numberFormatter.format(ledgerOpeningClosingAmountBO.getCurrentCreditBalance()))%>
												</td>
												<td align="right">
													<%if(i == ledgerAmountBOList.size()-1)
													{
													%>
													<%=(numberFormatter.format(incomeOpeningClosingBalanceMap.get(key).getClosingCreditBalance()))%>
													<%
													incomeTotalAmount+=incomeOpeningClosingBalanceMap.get(key).getClosingCreditBalance();
													}
													%>
												</td>
											</tr>					
										<%				
										isHeadPrinted = true;
									}// End of for loop
									
								} // End of while iterator loop
							
							%>				
										</table>	
									</td>
								</tr>
								</tbody>
								<tfoot>
								<tr>
									<td align="right">
											<b><%=(numberFormatter.format(expensesTotalAmount))%></b>
									</td>
									<td align="right">
											<b><%=(numberFormatter.format(incomeTotalAmount))%></b>
									</td>
								</tr>
								</tfoot>	
							</table>
							</div> <!--  End of form-group -->
						</div> <!--  End of box body -->
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
<script src="<%=jsRoot%>/account/viewProfitLossBalanceSheetPage.js?${Server_Token_Value}" type="text/javascript"></script>
</body>
</html>