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
   <TITLE><spring:message code="common.title.label.product"/> :: Balance Sheet</TITLE>
</HEAD>
<%
String mainMenu = "manageAccount";
String subMenu  = "balanceSheet";
pageCode = PageCode.BALANCE_SHEET;
Map<Long , List<LedgerOpeningClosingAmountBO>> liablityMap = (Map<Long , List<LedgerOpeningClosingAmountBO>> )request.getAttribute("liablityMap");
Map<Long , LedgerOpeningClosingAmountBO> liabilityOpeningClosingBalanceMap = (Map<Long , LedgerOpeningClosingAmountBO>) request.getAttribute("liabilityOpeningClosingBalanceMap");
Map<Long , List<LedgerOpeningClosingAmountBO>> assetsMap = (Map<Long , List<LedgerOpeningClosingAmountBO>> )request.getAttribute("assetsMap");
Map<Long , LedgerOpeningClosingAmountBO> assetsOpeningClosingBalanceMap = (Map<Long , LedgerOpeningClosingAmountBO>) request.getAttribute("assetsOpeningClosingBalanceMap");
Map<Long , AccountLedgerTypeHeadBO> headLedgerName = (Map<Long , AccountLedgerTypeHeadBO>)request.getAttribute("headLedgerName");
Map<Long , AccountLedgerSubTypeBO> subHeadLedgerName = (Map<Long , AccountLedgerSubTypeBO>)request.getAttribute("subHeadLedgerName");
SimpleDateFormat uiDateFormat = new SimpleDateFormat(CommonConstant.dateUIFormatter);
Date asOnDate = (Date)request.getAttribute("asOnDate");
Double liablityTotalAmount = 0D;
Double assetsTotalAmount = 0D;
NumberFormat  numberFormatter = new DecimalFormat(CommonConstant.NUMBER_FORMAT);
SocietyBO societyBO = (SocietyBO)request.getAttribute("societyBO");
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
				<a  href="javascript:;"  onclick="javascript: printBalanceSheet('<%=societyBO.getCurrentAccountFiscalYear()%>' , '<%=uiDateFormat.format(asOnDate)%>');"><i class="fa fa-file-pdf-o" aria-hidden="true"></i>&nbsp;PDF Download</a>
			</li>
			<li>
            	<a  href="javascript:;"  onclick="javascript:printBalanceSheetXls('<%=societyBO.getCurrentAccountFiscalYear()%>' , '<%=uiDateFormat.format(asOnDate)%>');" id="print"><i class="fa fa-file-excel-o" aria-hidden="true"></i>&nbsp;Excel Download</a>
            </li>            
          </ul>
     </div>
     </nav>
    <!-- Content Header (Page header) -->
    <section class="content-header">
		 <h1><spring:message code="account.manage.balancesheet.page.header"/></h1>
		  <hsCommonTag:breadCrumb pageTitle="Balance Sheet" isFirstIndex="true"/>
	 </section>
	 
	 <section class="content">
	 	<div class="row">
    		<div class="col-md-12">
    				<div class="box box-primary">
    					<form id="ledgerDetailsForm" name="ledgerDetailsForm" method="post">
							<input type="hidden" id="accountLedgerHeadId" name="accountLedgerHeadId">
							<input type="hidden" id="accountDimentionTypeId" name="accountDimentionTypeId">
							<input type="hidden" id="sundryAssetsOrLiabilityType" name="sundryAssetsOrLiabilityType">
							<input type="hidden" id="dutyTaxAssetsOrLiabilityType" name="dutyTaxAssetsOrLiabilityType">
						</form>
						<form id="ledgerVoucherDetailsForm" name="ledgerVoucherDetailsForm" method="post">
							<input type="hidden" id="accountLedgerSubHeadId" name="accountLedgerSubHeadId">
						</form>
						<div class="box-header with-border">
							<spring:message code="account.viewBalanceSheet.label.viewBalanceSheetAsOn"/> &nbsp;<%=uiDateFormat.format(asOnDate)%>
						</div>
						<div class="box-body">
							<div class="form-group">
							<table class="table table-bordered table-striped table-hover dt-responsive">
								<thead>
								<tr>
									<th width="50%"><label class="control-label">Liabilities</label></th>
									<th width="50%"><label class="control-label">Assets</label></th>
								<tr>
								</thead>
								<tbody>
								<tr>
									<td  valign="top">	
										<table class="table table-condensed table-hover table-bordered">
								
							<%
										Iterator<Long> liablityMapItr = liablityMap.keySet().iterator();
											
											while(liablityMapItr.hasNext())
											{
										Long key = liablityMapItr.next();
										List<LedgerOpeningClosingAmountBO> ledgerAmountBOList =liablityMap.get(key);
										AccountLedgerTypeHeadBO headNameBO =  headLedgerName.get(key);
										String headName = headNameBO.getLedgerHeadTitle();
										
										String subHeadName = null;
										Boolean isHeadPrinted = false;
										Boolean isChildGroupExpanded = true;
										Boolean isOpeningBalancePrintRequired = true;
										String subHeadClickFunction = null;
										
										if(headNameBO.getAccountDimentionTypeId().equals(AccountDimentionType.P_AND_L))
										{
											isChildGroupExpanded = false;
										}
										for(int i=0 ; i <ledgerAmountBOList.size() ;i++)
										{
											LedgerOpeningClosingAmountBO ledgerOpeningClosingAmountBO = ledgerAmountBOList.get(i);
											// If Opening Debit is higher and closing credit is higher, then closingLedgerCreditBalance value will be extrcted from opening debit with current debit. This might also produce negative value.
											Double closingLedgerCreditBalance = ledgerOpeningClosingAmountBO.getClosingCreditBalance() - (ledgerOpeningClosingAmountBO.getOpeningDebitBalance() + ledgerOpeningClosingAmountBO.getClosingDebitBalance());
											if(key.equals(AccountLedgerHeadConstants.ACCOUNT_HEAD_Advances_Due) && ledgerOpeningClosingAmountBO.getSocietyLedgerAccountMappingBO().getAccountDimentionTypeId().equals(AccountDimentionType.MEMBER))
											{
												headName = "Current Liability & Provisions";
												isOpeningBalancePrintRequired = false;
												closingLedgerCreditBalance = closingLedgerCreditBalance + liabilityOpeningClosingBalanceMap.get(key).getOpeningCreditBalance(); 
												if(ledgerOpeningClosingAmountBO.getSocietyLedgerAccountMappingBO().getAccountDimentionHeadTypeId().equals(AccountLedgerHeadConstants.MEMBER_HEAD_SOCIETY_PROPERTY))
												{
													subHeadName = "Member";
												}else if(ledgerOpeningClosingAmountBO.getSocietyLedgerAccountMappingBO().getAccountDimentionHeadTypeId().equals(AccountLedgerHeadConstants.MEMBER_HEAD_SOCIETY_STAFF))
												{
													subHeadName = "Staff";
												}else if(ledgerOpeningClosingAmountBO.getSocietyLedgerAccountMappingBO().getAccountDimentionHeadTypeId().equals(AccountLedgerHeadConstants.MEMBER_HEAD_SOCIETY_SUPPLIER))
												{
													subHeadName = "Supplier";
												}if(ledgerOpeningClosingAmountBO.getSocietyLedgerAccountMappingBO().getAccountDimentionHeadTypeId().equals(AccountLedgerHeadConstants.MEMBER_HEAD_SOCIETY_VENDER))
												{
													subHeadName = "Vendor";
												}		
												
												subHeadClickFunction = "javascript:showMemberSundryDetails("+ledgerOpeningClosingAmountBO.getSocietyLedgerAccountMappingBO().getAccountDimentionHeadTypeId() +", "+AccountDimentionType.LIABILITY+");";
											}
											else if(key.equals(AccountLedgerHeadConstants.LIABILITY_HEAD_AUTHORISED_SHARE_CAPITAL))
											{
												subHeadName = "Issued and paid up Share Capital, Share of Rs. 50 each";
												
												subHeadClickFunction = "javascript:showLedgerMonthlySummary("+ledgerOpeningClosingAmountBO.getSocietyLedgerAccountMappingBO().getAccountDimentionHeadTypeId() +", "+ledgerOpeningClosingAmountBO.getSocietyLedgerAccountMappingBO().getAccountDimentionSubTypeId()+");";
											}
											else if(key.equals(AccountLedgerHeadConstants.ACCOUNT_HEAD_Advances_Due) && ledgerOpeningClosingAmountBO.getSocietyLedgerAccountMappingBO().getAccountDimentionTypeId().equals(AccountDimentionType.DUTIES_TAXES))
											{
												headName = "Current Liability & Provisions";
												isOpeningBalancePrintRequired = false;
												closingLedgerCreditBalance = closingLedgerCreditBalance + liabilityOpeningClosingBalanceMap.get(key).getOpeningCreditBalance(); 
												subHeadName = "Duty Tax Payable";
												subHeadClickFunction = "javascript:showTaxDetails('"+AccountDimentionType.LIABILITY+"');";
											}
											else
											{
												if(closingLedgerCreditBalance < 0)
													{
													subHeadName = "Minus : " + subHeadLedgerName.get(ledgerOpeningClosingAmountBO.getSocietyLedgerAccountMappingBO().getAccountDimentionSubTypeId()).getLedgerTypeTitle();
													}
												else
													{
													subHeadName = "Add : " + subHeadLedgerName.get(ledgerOpeningClosingAmountBO.getSocietyLedgerAccountMappingBO().getAccountDimentionSubTypeId()).getLedgerTypeTitle();
													}
												subHeadClickFunction = "javascript:showLedgerMonthlySummary("+ledgerOpeningClosingAmountBO.getSocietyLedgerAccountMappingBO().getAccountDimentionHeadTypeId() +", "+ledgerOpeningClosingAmountBO.getSocietyLedgerAccountMappingBO().getAccountDimentionSubTypeId()+");";
											}
											if(!isHeadPrinted)
											{
									%>
											<tr onclick="javascript:viewBalanceSheetLedger('<%=headNameBO.getAccountLedgerTypeHeadId()%>','<%=headNameBO.getAccountDimentionTypeId()%>','<%=isChildGroupExpanded%>');" class="trHandOverBGColour" >
												<td>
													<b><%=headName%></b>						
												</td>
												<td>
												</td>
												<td>
												</td>
											</tr>
											<%
												if(liabilityOpeningClosingBalanceMap.get(key).getOpeningCreditBalance() > 0 && isOpeningBalancePrintRequired == true) 
														 {
											%>
											 <tr>
												<%
													if(key.equals(AccountLedgerHeadConstants.LIABILITY_HEAD_AUTHORISED_SHARE_CAPITAL)){
												%>
												<td>
													Authorised Share Capital 													
												</td>
												<td >
													&nbsp;
												</td>
												<td align="right" style="border-bottom-style: double;">
													<%=societyBO.getTotalShareCapitalAllocated() != null ? numberFormatter.format(societyBO.getTotalShareCapitalAllocated()) : numberFormatter.format(0)%>
												</td>
												<%
													}else{
												%>
												<td>
													Opening Balance													
												</td>
												<td align="right">
													<%=(numberFormatter.format(liabilityOpeningClosingBalanceMap.get(key).getOpeningCreditBalance()))%>
												</td>
												<td>
												</td>
												<%
													} // End of else for if(key.equals(AccountLedgerHeadConstants.LIABILITY_HEAD_AUTHORISED_SHARE_CAPITAL))
															} // End condition of if(liabilityOpeningClosingBalanceMap.get(key).getOpeningCreditBalance() > 0)
												%>
											</tr>
										<%
											} // ENd of if(!isHeadPrinted)
										%>
											<tr class="trHandOverBGColour" onclick="<%=subHeadClickFunction%>" >
												<td>
													<%=subHeadName%>							
												</td>
												<td align="right">
													<%
														if(!key.equals(AccountLedgerHeadConstants.LIABILITY_HEAD_AUTHORISED_SHARE_CAPITAL)){
													%>
														<%=(numberFormatter.format(Math.abs(closingLedgerCreditBalance)))%>
													<%
														}
													%>
												</td>
												<td align="right">
													<%
														if(i == ledgerAmountBOList.size()-1)
														{
													%>							
													<%=(numberFormatter.format(liabilityOpeningClosingBalanceMap.get(key).getClosingCreditBalance()))%>
													<%
														liablityTotalAmount+=liabilityOpeningClosingBalanceMap.get(key).getClosingCreditBalance();
														}
													%>	
												</td>					
											</tr>					
										<%
																isHeadPrinted = true;
																}// End of for loop
																
																	} // End of Liablity Map
															%>					
										</table>
									</td>
									<td valign="top">
									<!-- End of liability Rendering -->
									<!-- Start of Assets Rendering -->
									<table class="table table-condensed table-hover table-bordered">
								
							<%
										Iterator<Long> assetsMapItr = assetsMap.keySet().iterator();
											while(assetsMapItr.hasNext())
											{
										Long key = assetsMapItr.next();
										List<LedgerOpeningClosingAmountBO> ledgerAmountBOList =assetsMap.get(key);
										AccountLedgerTypeHeadBO headNameBO = headLedgerName.get(key);
										String headName =  headNameBO.getLedgerHeadTitle();
										String subHeadName = null;
										String subHeadClickFunction = null;
										Boolean isHeadPrinted = false;
										Boolean isChildGroupExpanded = true;
										if(headNameBO.getAccountDimentionTypeId().equals(AccountDimentionType.P_AND_L))
										{
											isChildGroupExpanded = false;
										}
										for(int i=0 ; i <ledgerAmountBOList.size() ;i++)
										{
											LedgerOpeningClosingAmountBO ledgerOpeningClosingAmountBO = ledgerAmountBOList.get(i);
											if(key.equals(AccountLedgerHeadConstants.ACCOUNT_HEAD_Advances_Due) && ledgerOpeningClosingAmountBO.getSocietyLedgerAccountMappingBO().getAccountDimentionTypeId().equals(AccountDimentionType.MEMBER))
											{
												headName = "Current Assets";
												if(ledgerOpeningClosingAmountBO.getSocietyLedgerAccountMappingBO().getAccountDimentionHeadTypeId().equals(AccountLedgerHeadConstants.MEMBER_HEAD_SOCIETY_PROPERTY))
												{
													subHeadName = "Member";
												}else if(ledgerOpeningClosingAmountBO.getSocietyLedgerAccountMappingBO().getAccountDimentionHeadTypeId().equals(AccountLedgerHeadConstants.MEMBER_HEAD_SOCIETY_STAFF))
												{
													subHeadName = "Staff";
												}else if(ledgerOpeningClosingAmountBO.getSocietyLedgerAccountMappingBO().getAccountDimentionHeadTypeId().equals(AccountLedgerHeadConstants.MEMBER_HEAD_SOCIETY_SUPPLIER))
												{
													subHeadName = "Supplier";
												}if(ledgerOpeningClosingAmountBO.getSocietyLedgerAccountMappingBO().getAccountDimentionHeadTypeId().equals(AccountLedgerHeadConstants.MEMBER_HEAD_SOCIETY_VENDER))
												{
													subHeadName = "Vendor";
												}
												subHeadClickFunction = "javascript:showMemberSundryDetails("+ledgerOpeningClosingAmountBO.getSocietyLedgerAccountMappingBO().getAccountDimentionHeadTypeId() +", "+AccountDimentionType.ASSETS+");";
											}
											else if(key.equals(AccountLedgerHeadConstants.ACCOUNT_HEAD_Advances_Due) && ledgerOpeningClosingAmountBO.getSocietyLedgerAccountMappingBO().getAccountDimentionTypeId().equals(AccountDimentionType.DUTIES_TAXES))
											{
												headName = "Current Assets";
												subHeadName = "Advance Payable to Duty Tax";
												subHeadClickFunction = "javascript:showTaxDetails('"+AccountDimentionType.ASSETS+"');";
											}
											else
											{
												subHeadName = subHeadLedgerName.get(ledgerOpeningClosingAmountBO.getSocietyLedgerAccountMappingBO().getAccountDimentionSubTypeId()).getLedgerTypeTitle();
												subHeadClickFunction = "javascript:showLedgerMonthlySummary("+ledgerOpeningClosingAmountBO.getSocietyLedgerAccountMappingBO().getAccountDimentionHeadTypeId() +", "+ledgerOpeningClosingAmountBO.getSocietyLedgerAccountMappingBO().getAccountDimentionSubTypeId()+");";
											}
											if(!isHeadPrinted)
											{
									%>
											<tr  onclick="javascript:viewBalanceSheetLedger('<%=headNameBO.getAccountLedgerTypeHeadId()%>','<%=headNameBO.getAccountDimentionTypeId()%>','<%=isChildGroupExpanded%>');" class="trHandOverBGColour" >
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
											<tr class="trHandOverBGColour" onclick="<%=subHeadClickFunction%>">
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
													<%=(numberFormatter.format(assetsOpeningClosingBalanceMap.get(key).getClosingDebitBalance()))%>
													<%
													assetsTotalAmount+=assetsOpeningClosingBalanceMap.get(key).getClosingDebitBalance();
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
								<%if(liablityTotalAmount > assetsTotalAmount) {	%>
								<tr>
									<td align="right">				
											
									</td>
									<td align="right" style="color: red;">
											<b>Difference in opening amount <%=(numberFormatter.format(liablityTotalAmount-assetsTotalAmount))%></b>
									</td>
								</tr>	
								<%
								assetsTotalAmount+=liablityTotalAmount-assetsTotalAmount;
								} 
								if(liablityTotalAmount < assetsTotalAmount) {%>
								<tr>
									<td align="right" style="color: red;">				
											<b>Difference in opening amount <%=(numberFormatter.format(assetsTotalAmount-liablityTotalAmount))%></b>
									</td>
									<td align="right">
											
									</td>
								</tr>	
								<%
								liablityTotalAmount+=assetsTotalAmount-liablityTotalAmount;
								} 
								%>
								<tr>
									<td align="right">
											<b><%=(numberFormatter.format(liablityTotalAmount))%></b>
									</td>
									<td align="right">
											<b><%=(numberFormatter.format(assetsTotalAmount)) %></b>
									</td>
								</tr>
								</tfoot>	
							</table>
							</div> <!-- End of form-group -->
						</div> <!--  End of box-body -->
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

<!-- End Code for Footer -->
<!-- JS Files -->  
<script src="<%=jsRoot%>/account/viewBalanceSheetPage.js?${Server_Token_Value}" type="text/javascript"></script>
</body>
</html>

