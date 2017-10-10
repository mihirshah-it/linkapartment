<%@page import="app.societywala.account.bo.AccountLedgerHeadConstants"%>
<%@page import="app.societywala.common.impl.utilimpl.CommonUtilImpl"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Map"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="app.societywala.society.bo.SocietyPolicyBO"%>
<%@page import="app.societywala.common.constants.CommonConstant"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="app.societywala.bill.bo.PropertyBillBO"%>
<%@page import="app.societywala.bill.bo.PropertyBillDetailBO"%>
<%@page import="java.util.List"%>
<%@page import="app.societywala.society.bo.SocietyBO"%>
<%@include file="../common/appConfig.jsp" %>
<html>
<HEAD>
   <%@include file="../common/appMetaConfig.jsp"%>
   <TITLE><spring:message code="common.title.label.product"/> :: Bill Details</TITLE>  
   <!-- CSS Files -->  
   <script>
   	var jsInterestSubLedgerId =  <%=AccountLedgerHeadConstants.INCOME_TYPE_SUB_HEAD_BILL_INTEREST_AMOUNT%>;
   	var jsServiceTaxLedgerId =  <%=AccountLedgerHeadConstants.TAX_DUTY_SUB_HEAD_IGST_TAX%>;   	
   </script>    
</HEAD>

<%
String mainMenu = "manageBills";
String subMenu = "viewBill";
pageCode = PageCode.BILL_DETAILS;
SocietyBO societyBO = (SocietyBO)request.getAttribute("societyBO");
List<PropertyBillDetailBO> propertyBillDetailBOList = (List<PropertyBillDetailBO>)request.getAttribute("propertyBillDetailBOList");
PropertyBillBO propertyBillBO = (PropertyBillBO)request.getAttribute("propertyBillBO");

SimpleDateFormat dateFormat = new SimpleDateFormat(CommonConstant.dateUIFormatter);
SimpleDateFormat monthYearFormat = new  SimpleDateFormat(CommonConstant.monthYearUISpaceFormatter);

String billDueDate = ((SocietyPolicyBO)request.getAttribute("billDueDatePolicyBO")).getPolicyValue();
String billPenatlyAmount = ((SocietyPolicyBO)request.getAttribute("billPenaltyPolicyBO")).getPolicyValue();
Boolean isBillPenaltyInPercentage =  ((SocietyPolicyBO)request.getAttribute("billPenaltyPolicyBO")).getIsValueInPercentage();
String billPenaltyUOM = "%";
if(!isBillPenaltyInPercentage)
{
	billPenaltyUOM = "Rs";
}
NumberFormat  numberFormatter = new DecimalFormat(CommonConstant.NUMBER_FORMAT);

Map<String,Object> sessionCommonModelMap = (Map<String,Object>) session.getAttribute(CommonConstant.SESSION_COMMON_MODEL_MAP);
String pageRenderMode = (String)sessionCommonModelMap.get(CommonConstant.PAGE_RENDER_MODE);
String formSubmitAction=ctxPath+"/bill/saveSocietyPropertyDetailBillPage.htm";

// If bill is not a currnet month bill or last freez fiscal year then open this page in View mode for any cases.  
Integer societyLastAuditFreezFiscalYear =  (Integer)request.getAttribute("societyLastAuditFreezFiscalYear");
Date societyCurrentFiscalDate = null;
if(societyLastAuditFreezFiscalYear != null)
{
	societyCurrentFiscalDate = CommonUtilImpl.returnFiscalStartDate(societyLastAuditFreezFiscalYear+1);
}
Date societyLastBillGenerationToDate = societyBO.getLastBillGenerationToPeriod();
if(societyLastBillGenerationToDate != null)
{
	if(propertyBillBO.getPropertyBillInfoBO().getBillToPeriod().before(societyLastBillGenerationToDate))
	{
		pageRenderMode = CommonConstant.VIEW_MODE;
	}
}else if(societyCurrentFiscalDate != null)
{
	if(propertyBillBO.getPropertyBillInfoBO().getBillToPeriod().before(societyCurrentFiscalDate))
	{
		pageRenderMode = CommonConstant.VIEW_MODE;
	}
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
            	<a  href="javascript:;"  onclick="javascript:printPropertyBillReceipt();" id="print"><i class="fa fa-print" aria-hidden="true"></i>&nbsp;<spring:message code="common.button.print"/></a>
            </li>            
          </ul>
     </div>
     </nav>
    <!-- Content Header (Page header) -->
    <section class="content-header">
		  <h1><spring:message code="bill.viewBill.form.header"/></h1>
		  <hsCommonTag:breadCrumb pageTitle="Bill Details" isFirstIndex="false"/>
	 </section>
	 
	 <section class="content">
	 	<div class="row">
    		<div class="col-md-12">
    				<form id="billReceiptForm" method="post">
						 <input type="hidden" id="voucherId" name="voucherId" value="<%=propertyBillBO.getPropertybillId()%>">
					</form>
    				<div class="box box-primary">
    					<form class="form" method="post" action="<%=formSubmitAction%>" id="billDetailsForm" name="billDetailsForm" role="form">
    					<input type="hidden" name="propertyBillBOID" id="propertyBillBOID" value="<%=propertyBillBO.getPropertybillId()%>"/>
						<input type="hidden" name="billFieldCounter" id="billFieldCounter" value="<%=propertyBillDetailBOList.size()%>"/>
    										
						<div class="box-header with-border">
							<div class="row">
								<div class="col-md-6">
									<div class="row">
										<div class="col-md-6"><label class="control-label">Bill No :</label></div>
										<div class="col-md-6"><%=propertyBillBO.getDisplaySequenceNumber() %></div>
									</div>
									<div class="row">
										<div class="col-md-6"><label class="control-label">Name :</label></div>
										<div class="col-md-6"><%=propertyBillBO.getBillTitle() %></div>
									</div>
									<div class="row">
										<div class="col-md-6"><label class="control-label">Block No :</label></div>
										<div class="col-md-6"><%=propertyBillBO.getPropertyBO().getBlockNumber() %></div>
									</div>
								</div>
								<div class="col-md-6">
									<div class="row">
										<div class="col-md-6"><label class="control-label">Bill Generation Date :</label></div>
										<div class="col-md-6"><%=dateFormat.format(propertyBillBO.getPropertyBillInfoBO().getBillGenerationDate()) %></div>
									</div>
									<div class="row">
										<%
							 			StringBuffer billGeneraionMonthBuffer = new  StringBuffer(monthYearFormat.format(propertyBillBO.getPropertyBillInfoBO().getBillFromPeriod()));
							 			if(!monthYearFormat.format(propertyBillBO.getPropertyBillInfoBO().getBillFromPeriod()).equals(monthYearFormat.format(propertyBillBO.getPropertyBillInfoBO().getBillToPeriod())))
							 			{
							 				billGeneraionMonthBuffer.append(" - " + monthYearFormat.format(propertyBillBO.getPropertyBillInfoBO().getBillToPeriod()));
							 			}  
							 			%>
										<div class="col-md-6"><label class="control-label">Bill for the month of :</label></div>
										<div class="col-md-6"><%=billGeneraionMonthBuffer.toString()%></div>
									</div>									
								</div>
							</div>
						</div>
						
						<div class="box-body">
							
							<%if (pageRenderMode.equals(CommonConstant.CREATE_MODE)  || pageRenderMode.equals(CommonConstant.EDIT_MODE)) {%>
							<div class="row">
							<button type="button" class="btn btn-primary margin" onclick="javascript:showAddPropertyBillDetailFieldPopup();">Add Field</button>
							</div>
							<%} %>							
							<div class="row">
								<div class="col-md-6">
									<table class="leftTable table table-bordered" id="leftBillTable">
										<thead >
											<tr>
												<th>Particular</th>
												<th>Rs.</th>												
											</tr>
										</thead>
										<tbody>
										<c:forEach items="${propertyBillDetailBOList}" var="propertyBillDetailBO" varStatus="counter">
									 		<tr id="propertyBillDetailBOTR${counter.count}">
									 			<td><label class="control-label">${propertyBillDetailBO.accountLedgerSubTypeBO.ledgerTypeTitle}</label></td>
									 			<td align="right">
									 			<%if (pageRenderMode.equals(CommonConstant.VIEW_MODE)) {%>
									 				<fmt:formatNumber type="number" pattern="<%=CommonConstant.NUMBER_FORMAT%>" value="${propertyBillDetailBO.billTemplateFieldValue}" />
									 			<%}else  if (pageRenderMode.equals(CommonConstant.EDIT_MODE)) {%>
									 				<input class="form-control" type="number" name="propertyBillDetailBOValue${counter.count}" id="propertyBillDetailBOValue${counter.count}" value="${propertyBillDetailBO.billTemplateFieldValue}" onblur="javascript:computeTotal();">
									 				<a href="javascript:deletePersistanceBillDetailBO(${counter.count});">Delete</a>
									 				<input type="hidden" name="propertyBillDetailId${counter.count}" id="propertyBillDetailId${counter.count}" value="${propertyBillDetailBO.propertyBillDetailId}">
									 				<input type="hidden" name="propertyBillDetailFieldLedgerId${counter.count}" id="propertyBillDetailFieldLedgerId${counter.count}" value="${propertyBillDetailBO.accountLedgerSubTypeBO.accountLedgerSubTypeId}">
									 				<input type="hidden" name="propertyBillDetailBOStatus${counter.count}" id="propertyBillDetailBOStatus${counter.count}" value="update">
									 			<%} %>				
									 			</td> 			
									 		</tr>
								 		</c:forEach>
								 		</tbody>
									</table>
								</div>
								<div class="col-md-6">
									<table class="rightTable table table-bordered">
										<thead>
											<tr>
												<th>Particular</th>
												<th>Rs.</th>
											</tr>
										</thead>
										<tbody>
											<tr>
									 			<td><label class="control-label">current Month Bill:</label></td>
									 			<td align="right" id="currentMonthBillAmountTD"><fmt:formatNumber type="number" pattern="<%=CommonConstant.NUMBER_FORMAT%>" value="${propertyBillBO.currentPeriodBillAmount}" /></td>
									 		</tr>
									 		<c:if test="${propertyBillBO.previousBillDueAmt > 0}">
									 		<tr>
									 			<td><label class="control-label">Previous Dues:</label></td>
									 			<td align="right" id="previousBillDueAmtTD">
									 				<fmt:formatNumber type="number" pattern="<%=CommonConstant.NUMBER_FORMAT%>" value="${propertyBillBO.previousBillDueAmt}" />
									 			</td>
									 		</tr>
									 		</c:if>
									 		<c:if test="${propertyBillBO.interestAmount > 0}">
									 		<tr>
									 			<td><label class="control-label">Interest Amount :</label></td>
									 			<td align="right">
									 				<%if (pageRenderMode.equals(CommonConstant.VIEW_MODE)) {%>
										 				<fmt:formatNumber type="number" pattern="<%=CommonConstant.NUMBER_FORMAT%>" value="${propertyBillBO.interestAmount}" />
										 			<%}else  if (pageRenderMode.equals(CommonConstant.EDIT_MODE)) {%>
									 				<input class="form-control" type="number" name="interestAmt" id="interestAmt" value="${propertyBillBO.interestAmount}" onblur="javascript:computeTotal();">
									 				<%} %>
									 			</td>
									 		</tr>
									 		</c:if>
									 		<c:if test="${propertyBillBO.totalIGST > 0}">
									 		<tr>
									 			<td><label class="control-label">IGST 18%:</label></td>
									 			<td align="right">
									 				<%if (pageRenderMode.equals(CommonConstant.VIEW_MODE)) {%>
										 				<fmt:formatNumber type="number" pattern="<%=CommonConstant.NUMBER_FORMAT%>" value="${propertyBillBO.totalIGST}" />
										 			<%}else  if (pageRenderMode.equals(CommonConstant.EDIT_MODE)) {%>
									 				<input class="form-control" type="number" name="iGSTAmt" id="iGSTAmt" value="${propertyBillBO.totalIGST}" onblur="javascript:computeTotal();">
									 				<%} %>
									 				
									 			</td>
									 		</tr>
									 		</c:if>
									 		
									 		<c:if test="${propertyBillBO.previousAdvanceAmt > 0}">
									 		<tr>
									 			<td><label class="control-label">Previous Advance:</label></td>
									 			<td align="right" id="previousAdvanceAmtTD">
									 				<fmt:formatNumber type="number" pattern="<%=CommonConstant.NUMBER_FORMAT%>" value="${propertyBillBO.previousAdvanceAmt}" />
									 			</td>
									 		</tr>	
									 		<tr>
									 			<td><label class="control-label">Advance Deducted:</label></td>
									 			<td align="right" id="previousBillAdvanceAmtDeductedTD">
									 				<c:if test="${propertyBillBO.previousAdvanceAmt >= propertyBillBO.currentPeriodBillAmount}">
									 					<fmt:formatNumber type="number" pattern="<%=CommonConstant.NUMBER_FORMAT%>" value="${propertyBillBO.currentPeriodBillAmount}" />
									 				</c:if>
									 				<c:if test="${propertyBillBO.previousAdvanceAmt < propertyBillBO.currentPeriodBillAmount}">
									 					<fmt:formatNumber type="number" pattern="<%=CommonConstant.NUMBER_FORMAT%>" value="${propertyBillBO.previousAdvanceAmt}" />
									 				</c:if>
									 			</td>
									 		</tr>
									 		</c:if>			 		
									 		<tr>
									 			<td><label class="control-label">Total Pending:</label></td>
									 			<td align="right" id="billTotalAmountTD"><fmt:formatNumber type="number" pattern="<%=CommonConstant.NUMBER_FORMAT%>" value="${propertyBillBO.billTotalAmount}" /></td>
									 		</tr>
									 		<tr>
									 			<td><label class="control-label">Net Payable Amt :</label></td>
									 			<c:if test="${propertyBillBO.billTotalAmount > 0}">
									 			<td align="right" id="billNetTotalAmountTD"><fmt:formatNumber type="number" pattern="<%=CommonConstant.NUMBER_FORMAT%>" value="${propertyBillBO.billTotalAmount}" /></td>
									 			</c:if>
									 			<c:if test="${propertyBillBO.billTotalAmount < 0}">
									 			<td align="right" id="billNetTotalAmountTD"><fmt:formatNumber type="number" pattern="<%=CommonConstant.NUMBER_FORMAT%>" value="0" /></td>
									 			</c:if>
									 		</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<div class="box-footer">
							<% if (pageRenderMode.equals(CommonConstant.EDIT_MODE)) {%>
                				<button type="submit" class="btn btn-primary" ><spring:message code="common.button.Update"/></button>
                			<% } %>	
						</div>
						</form> <!-- End of bilDetailsForm -->
    				</div> <!-- End of box -->
    		</div> <!--  End of col 1 -->
    		
    	</div> <!-- End of main row -->
	 </section> <!--  end of content -->
  </div> <!-- End of content wrapper -->
  <%@include file="../common/footer.jsp"%>
  <%@include file="../common/rightSideMenu.jsp"%> 
</div> <!-- End of Wrapper -->


<div class="modal fade" id="addPropertyBillDetailFieldPopupForm" tabindex="-1" role="dialog" aria-labelledby="Bill Field">
</div>

<!-- End Code for Footer -->
<script src="<%=jsRoot%>/bill/societyPropertyDetailBillPage.js?${Server_Token_Value}" type="text/javascript"></script>
<script src="<%=jsRoot%>/bill/propertyBillReceiptPage.js?${Server_Token_Value}" type="text/javascript"></script>
</body>

</html>

