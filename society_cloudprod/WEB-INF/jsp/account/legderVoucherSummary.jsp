<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="app.societywala.account.bo.SocietyLedgerAccountBO"%>
<%@page import="java.util.List"%>
<%@include file="../common/appConfig.jsp" %>
<html>
<HEAD>
	<%@include file="../common/appMetaConfig.jsp"%>
	<TITLE><spring:message code="common.title.label.product"/> :: Voucher Summary</TITLE>  
	<!-- CSS Files -->
</HEAD>
<%
String mainMenu = "manageAccount";
String subMenu  = "balanceSheet";

List<SocietyLedgerAccountBO> societyLedgerAccountBOList = (List<SocietyLedgerAccountBO>)request.getAttribute("societyLedgerAccountBOList");
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
		  <h1>Ledger Voucher Summary</h1>
		  <hsCommonTag:breadCrumb pageTitle="Voucher Summary" isFirstIndex="false"/>
	 </section>
	 
	 <section class="content">
	 	<div class="row">
    		<div class="col-md-12">
    				<div class="box box-primary">
    					<form id="ledgerDetailsForm" method="post">
						 	<input type="hidden" id="voucherElementTypeId" name="voucherElementTypeId">
						 	<input type="hidden" id="voucherElementId" name="voucherElementId">
						</form>
						
						<input type="hidden" id="accountDimentionSubTypeId" value="${accountLedgerSubTypeBO.accountLedgerSubTypeId}">
					    <div class="box-header with-border">
							Ledger Voucher Summary for :: ${accountLedgerSubTypeBO.ledgerTypeTitle} from month <fmt:formatDate pattern="<%=CommonConstant.dateUIFormatter%>" value="${startDate}"/>  to month <fmt:formatDate pattern="<%=CommonConstant.dateUIFormatter%>" value="${endDate}"/>
						</div>
						<div class="box-body">
							<div id="ledgerVoucherSummaryByMonthDiv">
							<table class="table table-bordered table-striped table-hover dt-responsive">
							<thead>
								<tr>
									<th width="15%">Date</th>
									<th width="40%">Particular</th>
									<th width="15%">Receipt Number</th>
									<th width="15%">Debit</th>
									<th width="15%">Credit</th>		
								</tr>
							</thead>
							<tbody>
					    		<c:forEach items="${societyLedgerAccountBOList}" var="societyLedgerAccountBO">						
								<tr class="trHandOverBGColour" onclick="showVoucher(${societyLedgerAccountBO.societyJournalAccountBO.journalEntityTypeId} , ${societyLedgerAccountBO.societyJournalAccountBO.journalEntityId});">	
									<c:set var="totalDebitAmt" value="${societyLedgerAccountBO.debitAmount}" ></c:set>
									<c:set var="totalCreditAmt" value="${societyLedgerAccountBO.creditAmount}" ></c:set>
									<td><fmt:formatDate pattern="<%=CommonConstant.dateUIFormatter%>" value="${societyLedgerAccountBO.societyJournalAccountBO.journalCreationDate}"/></td>
									<td>${societyLedgerAccountBO.societyJournalAccountBO.narration}</td>
									<td>${societyLedgerAccountBO.societyJournalAccountBO.sequenceNumber}</td>
									<td>
							  		
									<c:choose>
										<c:when test="${totalDebitAmt eq null or totalDebitAmt <= 0}">
							  					
										</c:when>
										<c:otherwise>
												<% 
												Double tmpDebit = (Double)pageContext.getAttribute("totalDebitAmt");
											    grandTotalDebit +=  tmpDebit; 
											    %>
												<fmt:formatNumber type="number" pattern="<%=CommonConstant.NUMBER_FORMAT%>" value="${totalDebitAmt}" />				   					
										</c:otherwise>							
							    	</c:choose>				    		 
							    					    
									</td>
									<td>
									<c:choose>
										<c:when test="${totalCreditAmt eq null or totalDebitAmt <= 0}">
							  					
										</c:when>
										<c:otherwise>
												<% 
												Double tmpCredit = (Double)pageContext.getAttribute("totalCreditAmt");
											    grandTotalCredit +=  tmpCredit; 
											    %>
												<fmt:formatNumber type="number" pattern="<%=CommonConstant.NUMBER_FORMAT%>" value="${totalCreditAmt}" />
							   			</c:otherwise>							
							    </c:choose>
								</td>		
							</tr>						
							</c:forEach>
							<tr>
								<td colspan="3"><b>Grand Total</b></td>
								<td><%=numberFormatter.format(grandTotalDebit)%></td>
								<td><%=numberFormatter.format(grandTotalCredit)%></td>
							</tr>
						</tbody>			
						</table>
						</div>
					</div> <!--  end of body -->
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
<script src="<%=jsRoot%>/account/legderVoucherSummary.js?${Server_Token_Value}" type="text/javascript"></script>
</body>
</html>