<%@page import="java.text.NumberFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="app.societywala.account.bo.AccountLedgerSubTypeBO"%>
<%@page import="java.util.List"%>
<%@page import="app.societywala.account.bo.LedgerOpeningClosingAmountBO"%>
<%@page import="java.util.Map"%>
<%@include file="../common/appConfig.jsp" %>
<html>
<HEAD>
	<%@include file="../common/appMetaConfig.jsp"%>
	<TITLE><spring:message code="common.title.label.product"/> :: Ledger Group Summary</TITLE>  
	<!-- CSS Files -->	
</HEAD>
<%
String mainMenu = "manageAccount";
String subMenu  = "balanceSheet";
Map<Long , LedgerOpeningClosingAmountBO> mapSocietySubOpeningClosingBO = (Map<Long , LedgerOpeningClosingAmountBO>)request.getAttribute("mapSocietySubOpeningClosingBO");
List<AccountLedgerSubTypeBO> societySubLedgerBOList = (List<AccountLedgerSubTypeBO>)request.getAttribute("societySubLedgerBOList");
Double grandTotalDebit = new Double(0);
Double grandTotalCredit = new Double(0);
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
		  <h1>Ledger Group Summary</h1>
		  <hsCommonTag:breadCrumb pageTitle="Ledger Group Summary" isFirstIndex="false"/>
	 </section>
	 
	 <section class="content">
	 	<div class="row">
    		<div class="col-md-12">
    				<form id="ledgerVoucherDetailsForm" name="ledgerVoucherDetailsForm" method="post">
						<input type="hidden" id="accountLedgerSubHeadId" name="accountLedgerSubHeadId">
					</form>
    				<div class="box box-primary">
						<div class="box-header with-border">
							Group Summary for Group :: ${accountLedgerHeadBO.ledgerHeadTitle}
						</div>
						<div class="box-body">
							<table class="table table-bordered table-hover dt-responsive">
									<thead>
										<tr>
											<td width="70%"><b>Particular</b></td>
											<td width="15%">Debit</td>
											<td width="15%">Credit</td>		
										</tr>
									</thead>
									<tbody>
									    <c:forEach items="${societySubLedgerBOList}" var="societySubLedgerBO">
										<c:if test="${(mapSocietySubOpeningClosingBO[societySubLedgerBO.accountLedgerSubTypeId] ne null ) 
												and (
														(mapSocietySubOpeningClosingBO[societySubLedgerBO.accountLedgerSubTypeId].openingDebitBalance) > 0
														 or (mapSocietySubOpeningClosingBO[societySubLedgerBO.accountLedgerSubTypeId].openingCreditBalance) > 0
														 or (mapSocietySubOpeningClosingBO[societySubLedgerBO.accountLedgerSubTypeId].closingDebitBalance) > 0
														 or (mapSocietySubOpeningClosingBO[societySubLedgerBO.accountLedgerSubTypeId].closingCreditBalance) > 0
													)}">
										<tr class="trHandOverBGColour" onclick="showLedgerMonthlySummary(${accountLedgerHeadBO.accountLedgerTypeHeadId},${societySubLedgerBO.accountLedgerSubTypeId})">	
											<c:set var="totalDebitAmt" value="${(mapSocietySubOpeningClosingBO[societySubLedgerBO.accountLedgerSubTypeId].openingDebitBalance) +  (mapSocietySubOpeningClosingBO[societySubLedgerBO.accountLedgerSubTypeId].closingDebitBalance)}" ></c:set>
											<c:set var="totalCreditAmt" value="${(mapSocietySubOpeningClosingBO[societySubLedgerBO.accountLedgerSubTypeId].openingCreditBalance) +  (mapSocietySubOpeningClosingBO[societySubLedgerBO.accountLedgerSubTypeId].closingCreditBalance)}" ></c:set>
											<td>${societySubLedgerBO.ledgerTypeTitle}</td>
											<td>
											  		
													<c:choose>
														<c:when test="${totalDebitAmt eq null or totalDebitAmt < totalCreditAmt}">
											  					
														</c:when>
														<c:otherwise>
																<% 
																Double tmpDebit = ((Double)pageContext.getAttribute("totalDebitAmt") - (Double)pageContext.getAttribute("totalCreditAmt"));
															    grandTotalDebit +=  tmpDebit; 
															    %>
																<fmt:formatNumber type="number" pattern="<%=CommonConstant.NUMBER_FORMAT%>" value="${totalDebitAmt - totalCreditAmt}" />				   					
														</c:otherwise>							
											    	</c:choose>				    		 
											    					    
											</td>
											<td>
												<c:choose>
														<c:when test="${totalCreditAmt eq null or totalDebitAmt > totalCreditAmt}">
											  					
														</c:when>
														<c:otherwise>
																<% 
																Double tmpCredit = ((Double)pageContext.getAttribute("totalCreditAmt") - (Double)pageContext.getAttribute("totalDebitAmt"));
															    grandTotalCredit +=  tmpCredit; 
															    %>
																<fmt:formatNumber type="number" pattern="<%=CommonConstant.NUMBER_FORMAT%>" value="${totalCreditAmt - totalDebitAmt}" />
											   			</c:otherwise>							
											    </c:choose>
											</td>		
										</tr>
										</c:if>
										</c:forEach>
									</tbody>
									<tfoot>
										<tr>
											<td><b>Grand Total</b></td>
											<td><%=numberFormatter.format(grandTotalDebit)%></td>
											<td><%=numberFormatter.format(grandTotalCredit)%></td>
										</tr>
									</tfoot>	
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
<!-- JS Files -->  
<script src="<%=jsRoot%>/account/legderBalanceSheetGroupSummary.js?${Server_Token_Value}" type="text/javascript"></script>
</body>
</html>