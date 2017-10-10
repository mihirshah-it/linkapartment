<%@page import="app.societywala.common.bo.StateBO"%>
<%@page import="app.societywala.account.bo.AccountLedgerSubTypeIncomeTaxDetailsBO"%>
<%@page import="app.societywala.account.bo.AccountLedgerSubTypeMailingDetailsBO"%>
<%@page import="app.societywala.incometax.bo.TDSDeducteeTypeBO"%>
<%@page import="app.societywala.incometax.bo.TDSNatureOfPaymentBO"%>
<%@page import="app.societywala.account.bo.AccountLedgerSubTypeStatutaryDetailsBO"%>
<%@page import="app.societywala.account.bo.AccountDimentionType"%>
<%@page import="app.societywala.account.bo.LedgerOpeningClosingAmountBO"%>
<%@page import="app.societywala.account.bo.AccountLedgerOtherFieldType"%>
<%@page import="app.societywala.account.bo.AccountLedgerSubTypeBO"%>
<%@page import="app.societywala.account.bo.AccountLedgerTypeHeadBO"%>
<%@page import="app.societywala.account.bo.AccountLedgerOtherFieldOptionBO"%>
<%@page import="java.util.Map"%>
<%@page import="app.societywala.account.bo.AccountLedgerHeadOtherFieldBO"%>
<%@page import="app.societywala.common.constants.CommonConstant"%>
<%@page import="java.util.List"%>
<%@include file="../common/ajaxConfig.jsp" %>
<%
Map<String,Object> sessionCommonModelMap = (Map<String,Object>) session.getAttribute(CommonConstant.SESSION_COMMON_MODEL_MAP);

String pageRenderMode = (String)sessionCommonModelMap.get(CommonConstant.PAGE_RENDER_MODE);
Boolean isAdminFlow = (Boolean)sessionCommonModelMap.get("isAdminFlow");

List<AccountLedgerHeadOtherFieldBO> assetsLookupFieldBOList =  null;
Map<Long , List<AccountLedgerOtherFieldOptionBO>> mapFieldOptionBOList = null;
AccountLedgerTypeHeadBO accountLedgerTypeHeadBO = null;
AccountLedgerSubTypeBO accountLedgerSubTypeBO = null;
Map<Long,String> mapAssetsFieldValue = null;
LedgerOpeningClosingAmountBO ledgerOpeningClosingAmount = null;
AccountLedgerSubTypeStatutaryDetailsBO accountLedgerSubTypeStatutaryDetailsBO = null;
List<TDSDeducteeTypeBO> tdsDeducteeTypeBOList = null;
List<TDSNatureOfPaymentBO> tdsNatureOfPaymentBOList = null;
AccountLedgerSubTypeMailingDetailsBO accountLedgerSubTypeMailingDetailsBO = null;
AccountLedgerSubTypeIncomeTaxDetailsBO accountLedgerSubTypeIncomeTaxDetailsBO = null;
List<StateBO> stateBOList = null;
Boolean isSystemField = null;
Boolean isReadOnly = false;

if(!isAdminFlow)
{
	assetsLookupFieldBOList =  (List<AccountLedgerHeadOtherFieldBO>)request.getAttribute("accountLedgerHeadOtherFieldBOList");
	mapFieldOptionBOList = (Map<Long , List<AccountLedgerOtherFieldOptionBO>>)request.getAttribute("mapFieldOptionBOList");
	mapAssetsFieldValue = (Map<Long,String>)request.getAttribute("mapLedgerHeadOtherFieldValue");
	ledgerOpeningClosingAmount = (LedgerOpeningClosingAmountBO)request.getAttribute("ledgerOpeningClosingAmount");
	accountLedgerSubTypeMailingDetailsBO = (AccountLedgerSubTypeMailingDetailsBO)request.getAttribute("accountLedgerSubTypeMailingDetailsBO");
	accountLedgerSubTypeIncomeTaxDetailsBO = (AccountLedgerSubTypeIncomeTaxDetailsBO)request.getAttribute("accountLedgerSubTypeIncomeTaxDetailsBO");
}
accountLedgerTypeHeadBO = (AccountLedgerTypeHeadBO)request.getAttribute("accountLedgerTypeHeadBO");
accountLedgerSubTypeBO = (AccountLedgerSubTypeBO)request.getAttribute("accountLedgerSubTypeBO");
accountLedgerSubTypeStatutaryDetailsBO = (AccountLedgerSubTypeStatutaryDetailsBO)request.getAttribute("accountLedgerSubTypeStatutaryDetailsBO");
tdsDeducteeTypeBOList = (List<TDSDeducteeTypeBO>)request.getAttribute("tdsDeducteeTypeBOList");
tdsNatureOfPaymentBOList = (List<TDSNatureOfPaymentBO>)request.getAttribute("tdsNatureOfPaymentBOList");
stateBOList = (List<StateBO>)request.getAttribute("stateBOList");
isSystemField = accountLedgerSubTypeBO.getIsSystemDefined();

if(isSystemField && !isAdminFlow)
{
	isReadOnly = true;
}

%>
<div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Ledger Details</h4>
      </div>
      <form role="form"  id="assetsDetailsForm">
		<input type="hidden" name="assetsLookupId" id="assetsLookupId" value="<%=accountLedgerTypeHeadBO.getAccountLedgerTypeHeadId()%>" />
		<input type="hidden" name="societyAssetsId" id="societyAssetsId" value="<%=accountLedgerSubTypeBO.getAccountLedgerSubTypeId()%>">
		<% if(accountLedgerSubTypeBO.getAccountLedgerSubTypeId() == null) {%>
			<input type="hidden" name="assetsStatus" id="assetsStatus" value="new">			
		<% } else { %>
			<input type="hidden" name="assetsStatus" id="assetsStatus" value="update">			
		<%} %>
		<input type="hidden" name="isSystemDefined" id="isSystemDefined" value="<%=accountLedgerSubTypeBO.getIsSystemDefined()%>">		
      <div class="modal-body">
      		<div class="form-group">
			<label class="control-label required">Name</label>
			<input type="text" id="assetsName" name="assetsName" value="<%=accountLedgerSubTypeBO.getLedgerTypeTitle() != null ? accountLedgerSubTypeBO.getLedgerTypeTitle() : ""%>" class="form-control" <%=isReadOnly ? "readonly=readonly" : "required"%>>
			</div>
			<%
			if(!isAdminFlow)
			{
				for (AccountLedgerHeadOtherFieldBO assetsLookupFieldBO : assetsLookupFieldBOList) { 
				StringBuffer classNameStrBuf = new StringBuffer("");
				StringBuffer labelClassNameStrBuf = new StringBuffer("");
				StringBuffer controlClassNameStrBuf = new StringBuffer("form-control");
				 if(assetsLookupFieldBO.getIsMandatory()) { 
					 labelClassNameStrBuf.append(" required ");
				 } else if(assetsLookupFieldBO.getFieldType().equals(AccountLedgerOtherFieldType.DATE_TEXT_BOX)){
					 controlClassNameStrBuf.append(" datepicker ");
				 }
				%>
				<div class="form-group">
				<label class="control-label <%=labelClassNameStrBuf.toString()%>"><%=assetsLookupFieldBO.getFieldName() %></label>				
				<c:set var="controlAppendStr" value="<%=controlClassNameStrBuf.toString()%>"></c:set>
				<c:set var="controlClassAppend" value="class='${controlAppendStr}'"></c:set>
				<%			
				String fieldValue="";
				if(mapAssetsFieldValue.get(assetsLookupFieldBO.getAccountLedgerHeadOtherFieldId()) != null)
				{
					fieldValue = mapAssetsFieldValue.get(assetsLookupFieldBO.getAccountLedgerHeadOtherFieldId());
				}%>
				<c:set var="fieldValue" value="<%=fieldValue%>"></c:set>
				<%
				if(assetsLookupFieldBO.getFieldType().equals(AccountLedgerOtherFieldType.TEXT_BOX)
					|| assetsLookupFieldBO.getFieldType().equals(AccountLedgerOtherFieldType.DATE_TEXT_BOX)	
				  )
				{	
				%>
					<input type="text" id="<%=assetsLookupFieldBO.getAccountLedgerHeadOtherFieldId()%>" name="<%=assetsLookupFieldBO.getAccountLedgerHeadOtherFieldId()%>" value="<%=fieldValue%>" ${controlClassAppend}>
				<% 
				} else if(assetsLookupFieldBO.getFieldType().equals(AccountLedgerOtherFieldType.DROP_DOWN_OPTION))
				{
					List<AccountLedgerOtherFieldOptionBO> tmpAssetsLookupFieldOptionBO = mapFieldOptionBOList.get(assetsLookupFieldBO.getAccountLedgerHeadOtherFieldId());
				%>
					<c:set var="tmpAssetsLookupFieldOptionBO" value="<%=tmpAssetsLookupFieldOptionBO %>"></c:set>
					<select id="<%=assetsLookupFieldBO.getAccountLedgerHeadOtherFieldId()%>" name="<%=assetsLookupFieldBO.getAccountLedgerHeadOtherFieldId()%>" ${controlClassAppend}>
						<c:forEach items="${tmpAssetsLookupFieldOptionBO}" var="tmpAssetsLookupFieldOptionBO">
						  <c:set var="tmpSelectValue" value=""></c:set>
						  <c:if test="${fieldValue eq  tmpAssetsLookupFieldOptionBO.accountLedgerHeadOtherFieldOptionId}">
						  	 <c:set var="tmpSelectValue" value="selected"></c:set>
						  </c:if>
						  <option value="${tmpAssetsLookupFieldOptionBO.accountLedgerHeadOtherFieldOptionId}" ${tmpSelectValue}>${tmpAssetsLookupFieldOptionBO.optionValue}</option>
						</c:forEach>
					</select>
				<%	
				} else if(assetsLookupFieldBO.getFieldType().equals(AccountLedgerOtherFieldType.CHECK_BOX_OPTION))
				{
				%>
					<input type="checkbox" id="<%=assetsLookupFieldBO.getAccountLedgerHeadOtherFieldId()%>" name="<%=assetsLookupFieldBO.getAccountLedgerHeadOtherFieldId()%>">
				<%	
				}else if(assetsLookupFieldBO.getFieldType().equals(AccountLedgerOtherFieldType.RADIO_OPTION))
				{
				%>
				<%	
				}			
				%>
				</div>
			
			<%} // End of for for (AccountLedgerHeadOtherFieldBO assetsLookupFieldBO : assetsLookupFieldBOList)%>
			
			<div class="form-group">
			<label class="control-label">Previous Year Closing Balance</label>
			<c:set var="closingPreviousYearBalanceVal" value="0"></c:set>
			<c:if test="${ledgerOpeningClosingAmount.closingLastYearDebitBalance != null && ledgerOpeningClosingAmount.closingLastYearDebitBalance != 0 }">
				<c:set var="closingPreviousYearBalanceVal" value="${ledgerOpeningClosingAmount.closingLastYearDebitBalance}"></c:set>						
			</c:if>
			<c:if test="${ledgerOpeningClosingAmount.closingLastYearCreditBalance != null && ledgerOpeningClosingAmount.closingLastYearCreditBalance != 0 }">
				<c:set var="closingPreviousYearBalanceVal" value="${ledgerOpeningClosingAmount.closingLastYearCreditBalance}"></c:set>								
			</c:if>
			<input type="number" id="closingPreviousYearBalance" name="closingPreviousYearBalance" value="${closingPreviousYearBalanceVal}" class="form-control">
			<select name="closingPreviousYearBalanceAccountMode" id="closingPreviousYearBalanceAccountMode" class="form-control">				
				<option value="<%=CommonConstant.DEBIT_ACCOUNT%>" <c:if test="${ledgerOpeningClosingAmount.closingLastYearDebitBalance != null &&  ledgerOpeningClosingAmount.closingLastYearDebitBalance != 0 }"> selected </c:if>>Debit</option>
				<option value="<%=CommonConstant.CREDIT_ACCOUNT%>"<c:if test="${ledgerOpeningClosingAmount.closingLastYearCreditBalance != null && ledgerOpeningClosingAmount.closingLastYearCreditBalance != 0 }"> selected </c:if>>Credit</option>
			</select>
			</div>	
			
			<div class="form-group">
				<label class="control-label required">Opening Date</label>
				<div class="input-group date">
			              <div class="input-group-addon">
			                <i class="fa fa-calendar"></i>
			              </div>
			              <input type="text" id="openingDate" name="openingDate" value='<fmt:formatDate  pattern="<%=CommonConstant.dateUIFormatter%>" value="${ledgerOpeningClosingAmount.openingDate}" />' class="form-control pull-right datepicker dateFormat" required>
		         </div>
			</div>
			
			<div class="form-group">
				<label class="control-label required">Opening Balance</label>
				<c:set var="openingBalanceVal" value="0"></c:set>
				<c:set var="openingInterestBalanceVal" value="0"></c:set>
				<c:set var="openingArrearBalanceVal" value="0"></c:set>
				<c:if test="${ledgerOpeningClosingAmount.openingDebitBalance != null && ledgerOpeningClosingAmount.openingDebitBalance != 0 }">
					<c:set var="openingBalanceVal" value="${ledgerOpeningClosingAmount.openingDebitBalance}"></c:set>						
				</c:if>
				<c:if test="${ledgerOpeningClosingAmount.openingCreditBalance != null && ledgerOpeningClosingAmount.openingCreditBalance != 0 }">
					<c:set var="openingBalanceVal" value="${ledgerOpeningClosingAmount.openingCreditBalance}"></c:set>								
				</c:if>
				<input type="number" id="openingBalance" name="openingBalance" value="${openingBalanceVal}" class="form-control" required>
				<select name="openingBalanceAccountMode" id="openingBalanceAccountMode" class="form-control">				
					<option value="<%=CommonConstant.DEBIT_ACCOUNT%>" <c:if test="${ledgerOpeningClosingAmount.openingDebitBalance != null &&  ledgerOpeningClosingAmount.openingDebitBalance != 0 }"> selected </c:if>>Debit</option>
					<option value="<%=CommonConstant.CREDIT_ACCOUNT%>"<c:if test="${ledgerOpeningClosingAmount.openingCreditBalance != null && ledgerOpeningClosingAmount.openingCreditBalance != 0 }"> selected </c:if>>Credit</option>
				</select>
			</div>
			<%
			if(accountLedgerTypeHeadBO.getAccountDimentionTypeId().equals(AccountDimentionType.MEMBER))
			{
			%>		
			<div class="form-group">
				<label class="control-label required">Opening Principal Balance</label>
				<c:set var="openingArrearBalanceVal" value="0"></c:set>
				<c:if test="${ledgerOpeningClosingAmount.openingArrearDebitBalance != null && ledgerOpeningClosingAmount.openingArrearDebitBalance != 0 }">
					<c:set var="openingArrearBalanceVal" value="${ledgerOpeningClosingAmount.openingArrearDebitBalance}"></c:set>			
				</c:if>
				<c:if test="${ledgerOpeningClosingAmount.openingArrearCreditBalance != null && ledgerOpeningClosingAmount.openingArrearCreditBalance != 0 }">
					<c:set var="openingArrearBalanceVal" value="${ledgerOpeningClosingAmount.openingArrearCreditBalance}"></c:set>				
				</c:if>
				<input type="number" id="openingArrearBalance" name="openingArrearBalance" value="${openingArrearBalanceVal}" class="form-control" required>
				<select name="openingArrearBalanceAccountMode" id="openingArrearBalanceAccountMode" class="form-control" required>				
					<option value="<%=CommonConstant.DEBIT_ACCOUNT%>" <c:if test="${ledgerOpeningClosingAmount.openingArrearDebitBalance != null &&  ledgerOpeningClosingAmount.openingArrearDebitBalance != 0 }"> selected </c:if>>Debit</option>
					<option value="<%=CommonConstant.CREDIT_ACCOUNT%>"<c:if test="${ledgerOpeningClosingAmount.openingArrearCreditBalance != null && ledgerOpeningClosingAmount.openingArrearCreditBalance != 0 }"> selected </c:if>>Credit</option>
				</select>
				<div class="buttonPanel2"><font color="red">Note : Opening Principal Balance value is part of Opening balance amount</font></div>	
			</div>
			
			<div class="form-group">
				<label class="control-label required">Opening Principal Interest Balance</label>
				<c:set var="openingInterestBalanceVal" value="0"></c:set>
				<c:if test="${ledgerOpeningClosingAmount.openingInterestDebitBalance != null  && ledgerOpeningClosingAmount.openingInterestDebitBalance != 0 }">
					<c:set var="openingInterestBalanceVal" value="${ledgerOpeningClosingAmount.openingInterestDebitBalance}"></c:set>			
				</c:if>
				<c:if test="${ledgerOpeningClosingAmount.openingInterestCreditBalance != null  && ledgerOpeningClosingAmount.openingInterestCreditBalance != 0 }">
					<c:set var="openingInterestBalanceVal" value="${ledgerOpeningClosingAmount.openingInterestCreditBalance}"></c:set>				
				</c:if>
				<input type="number" id="openingInterestBalance" name="openingInterestBalance" value="${openingInterestBalanceVal}" class="form-control" required>
				<select name="openingInterestBalanceAccountMode" id="openingInterestBalanceAccountMode" class="form-control" required >				
					<option value="<%=CommonConstant.DEBIT_ACCOUNT%>" <c:if test="${ledgerOpeningClosingAmount.openingInterestDebitBalance != null &&  ledgerOpeningClosingAmount.openingInterestDebitBalance != 0 }"> selected </c:if>>Debit</option>
					<option value="<%=CommonConstant.CREDIT_ACCOUNT%>"<c:if test="${ledgerOpeningClosingAmount.openingInterestCreditBalance != null && ledgerOpeningClosingAmount.openingInterestCreditBalance != 0 }"> selected </c:if>>Credit</option>
				</select>
				<div class="buttonPanel2"><font color="red">Note : Opening Principal Interest value is part of Opening balance amount</font></div>		
			</div>		
			
			<div class="form-group">
				<label class="control-label required">Opening Supplementary Balance</label>
				<c:set var="openingSupBalanceVal" value="0"></c:set>
				<c:if test="${ledgerOpeningClosingAmount.openingSupplementaryDebitBalance != null && ledgerOpeningClosingAmount.openingSupplementaryDebitBalance != 0 }">
					<c:set var="openingSupBalanceVal" value="${ledgerOpeningClosingAmount.openingSupplementaryDebitBalance}"></c:set>			
				</c:if>
				<c:if test="${ledgerOpeningClosingAmount.openingSupplementaryCreditBalance != null && ledgerOpeningClosingAmount.openingSupplementaryCreditBalance != 0 }">
					<c:set var="openingSupBalanceVal" value="${ledgerOpeningClosingAmount.openingSupplementaryCreditBalance}"></c:set>				
				</c:if>
				<input type="number" id="openingSupplementaryBalance" name="openingSupplementaryBalance" value="${openingSupBalanceVal}" class="form-control" required>
				<select name="openingSupplementaryBalanceAccountMode" id="openingSupplementaryBalanceAccountMode" class="form-control" required>				
					<option value="<%=CommonConstant.DEBIT_ACCOUNT%>" <c:if test="${ledgerOpeningClosingAmount.openingSupplementaryDebitBalance != null &&  ledgerOpeningClosingAmount.openingSupplementaryDebitBalance != 0 }"> selected </c:if>>Debit</option>
					<option value="<%=CommonConstant.CREDIT_ACCOUNT%>"<c:if test="${ledgerOpeningClosingAmount.openingSupplementaryCreditBalance != null && ledgerOpeningClosingAmount.openingSupplementaryCreditBalance != 0 }"> selected </c:if>>Credit</option>
				</select>
				<div class="buttonPanel2"><font color="red">Note : Opening Supplementary value is part of Opening balance amount</font></div>		
			</div>	
			
			<div class="form-group">
				<label class="control-label required">Opening Supplementary Interest Balance</label>
				<c:set var="openingSupIntBalanceVal" value="0"></c:set>
				<c:if test="${ledgerOpeningClosingAmount.openingSupplementaryInterestDebitBalance != null && ledgerOpeningClosingAmount.openingSupplementaryInterestDebitBalance != 0 }">
					<c:set var="openingSupIntBalanceVal" value="${ledgerOpeningClosingAmount.openingSupplementaryInterestDebitBalance}"></c:set>			
				</c:if>
				<c:if test="${ledgerOpeningClosingAmount.openingSupplementaryInterestCreditBalance != null && ledgerOpeningClosingAmount.openingSupplementaryInterestCreditBalance != 0 }">
					<c:set var="openingSupIntBalanceVal" value="${ledgerOpeningClosingAmount.openingSupplementaryInterestCreditBalance}"></c:set>				
				</c:if>
				<input type="number" id="openingSupplementaryInterestBalance" name="openingSupplementaryInterestBalance" value="${openingSupIntBalanceVal}" class="form-control" required>
				<select name="openingSupplementaryInterestBalanceAccountMode" id="openingSupplementaryInterestBalanceAccountMode" class="form-control" required>				
					<option value="<%=CommonConstant.DEBIT_ACCOUNT%>" <c:if test="${ledgerOpeningClosingAmount.openingSupplementaryInterestDebitBalance != null &&  ledgerOpeningClosingAmount.openingSupplementaryInterestDebitBalance != 0 }"> selected </c:if>>Debit</option>
					<option value="<%=CommonConstant.CREDIT_ACCOUNT%>"<c:if test="${ledgerOpeningClosingAmount.openingSupplementaryInterestCreditBalance != null && ledgerOpeningClosingAmount.openingSupplementaryInterestCreditBalance != 0 }"> selected </c:if>>Credit</option>
				</select>
				<div class="buttonPanel2"><font color="red">Note : Opening Supplementary Interest value is part of Opening balance amount</font></div>		
			</div>					
			<%
			}
			
		} // End of if(!isAdminFlow)
		%>
		
		<%--If Needs to show configurable TDS options <%if(accountLedgerTypeHeadBO.getHasStatutoryDetails()) {--%>
		<div class="form-group">
			<h4>Statutory Information</h4>
		</div>
		<div class="form-group">
			<label class="control-label">Is TDS Applicable</label>
			<c:set var="isTDSApplicableValue" value=""></c:set>
			<c:if test="${not empty accountLedgerSubTypeStatutaryDetailsBO and not empty accountLedgerSubTypeStatutaryDetailsBO.isTDSApplicable}">
				<c:set var="isTDSApplicableValue"  value="<%=accountLedgerSubTypeStatutaryDetailsBO.getIsTDSApplicable()%>"></c:set>	
			</c:if>
			<select id="isTDSApplicable" name="isTDSApplicable" class="form-control" <%=isReadOnly ? "readonly=readonly" : ""%>>
					  <c:set var="tmpSelectValue" value=""></c:set>	
					  <c:if test="${isTDSApplicableValue eq 'false'}">
					  	 <c:set var="tmpSelectValue" value="selected"></c:set>
					  </c:if>
					  <option value="false" ${tmpSelectValue}>No</option>
					  <c:set var="tmpSelectValue" value=""></c:set>
					  <c:if test="${isTDSApplicableValue eq 'true'}">
					  	 <c:set var="tmpSelectValue" value="selected"></c:set>
					  </c:if>
					  <option value="true" ${tmpSelectValue}>Yes</option>
			</select>					
		</div>
		
		<div class="form-group">
			<label class="control-label">Deductee Type</label>
			<c:set var="tdsDeducteeTypeIdValue" value=""></c:set>
			<c:if test="${not empty accountLedgerSubTypeStatutaryDetailsBO and not empty accountLedgerSubTypeStatutaryDetailsBO.tdsDeducteeTypeBO}">
				<c:set var="tdsDeducteeTypeIdValue"  value="<%=accountLedgerSubTypeStatutaryDetailsBO.getTdsDeducteeTypeBO().getTdsDeducteeTypeId()%>"></c:set>	
			</c:if>
			<select id="tdsDeducteeTypeId" name="tdsDeducteeTypeId" class="form-control" <%=isReadOnly ? "readonly=readonly" : ""%>>
					  <option value=""></option>
					  <c:forEach items="${tdsDeducteeTypeBOList}" var="tdsDeducteeTypeBO">
					  <c:set var="tmpSelectValue" value=""></c:set>
					  <c:if test="${tdsDeducteeTypeIdValue eq  tdsDeducteeTypeBO.tdsDeducteeTypeId}">
					  	 <c:set var="tmpSelectValue" value="selected"></c:set>
					  </c:if>
					  <option value="${tdsDeducteeTypeBO.tdsDeducteeTypeId}" ${tmpSelectValue}>${tdsDeducteeTypeBO.tdsDeducteeTypeName}</option>
					  </c:forEach>					  
			</select>					
		</div>
		
		<div class="form-group">
			<label class="control-label">Nature Of Payment</label>
			<c:set var="tdsNatureOfPaymentIdValue" value=""></c:set>
			<c:if test="${not empty accountLedgerSubTypeStatutaryDetailsBO and not empty accountLedgerSubTypeStatutaryDetailsBO.tdsNatureOfPaymentBO}">
				<c:set var="tdsNatureOfPaymentIdValue"  value="<%=accountLedgerSubTypeStatutaryDetailsBO.getTdsNatureOfPaymentBO().getTdsNatureOfPaymentId()%>"></c:set>	
			</c:if>
			<select id="tdsNatureOfPaymentId" name="tdsNatureOfPaymentId" class="form-control" <%=isReadOnly ? "readonly=readonly" : ""%>>
					  <option value=""></option>
					  <c:forEach items="${tdsNatureOfPaymentBOList}" var="tdsNatureOfPaymentBO">
					  <c:set var="tmpSelectValue" value=""></c:set>
					  <c:if test="${tdsNatureOfPaymentIdValue eq  tdsNatureOfPaymentBO.tdsNatureOfPaymentId}">
					  	 <c:set var="tmpSelectValue" value="selected"></c:set>
					  </c:if>
					  <option value="${tdsNatureOfPaymentBO.tdsNatureOfPaymentId}" ${tmpSelectValue}>${tdsNatureOfPaymentBO.paymentName}</option>
					  </c:forEach>					  
			</select>					
		</div>
		<%-- <%} Commnet end for If Statutory check--%>
		<div class="form-group">
			<label class="control-label">GST Applicable</label>
			<c:set var="isTDSApplicableValue" value=""></c:set>
			<c:if test="${not empty accountLedgerSubTypeBO and not empty accountLedgerSubTypeBO.isServiceTaxApplicable}">
				<c:set var="isServiceTaxApplicableValue"  value="<%=accountLedgerSubTypeBO.getIsServiceTaxApplicable()%>"></c:set>	
			</c:if>
			<select id="isServiceTaxApplicable" name="isServiceTaxApplicable" class="form-control" <%=isReadOnly ? "readonly=readonly" : ""%>>
					  <c:set var="tmpSelectValue" value=""></c:set>	
					  <c:if test="${isServiceTaxApplicableValue eq 'false'}">
					  	 <c:set var="tmpSelectValue" value="selected"></c:set>
					  </c:if>
					  <option value="false" ${tmpSelectValue}>No</option>
					  <c:set var="tmpSelectValue" value=""></c:set>
					  <c:if test="${isServiceTaxApplicableValue eq 'true'}">
					  	 <c:set var="tmpSelectValue" value="selected"></c:set>
					  </c:if>
					  <option value="true" ${tmpSelectValue}>Yes</option>
			</select>				
		</div>
		
		<div>
			<table class="table table-bordered">
				<tr>
                  <th>IGST(%)</th>
                  <th>CGST(%)</th>
                  <th>SGST(%)</th>                  
                </tr>
                <tr>
                  <td><input type="number" class="form-control" id="iGST" name="iGST" value="<%=accountLedgerSubTypeBO.getiGST()%>"></td>
                  <td><input type="number" class="form-control" id="cGST" name="cGST" value="<%=accountLedgerSubTypeBO.getcGST()%>"></td>
                  <td><input type="number" class="form-control" id="sGST" name="sGST" value="<%=accountLedgerSubTypeBO.getsGST()%>"></td>
                 </tr>
			</table>
		</div>
		
		
		<%if(accountLedgerTypeHeadBO.getHasMailingAddress() && !isAdminFlow) {%>
		<div class="form-group">
			<h4>Mailing Information</h4>
		</div>
		<div class="form-group">
			<label class="control-label">Name</label>
			<input type="text" id="mailingName" name="mailingName" value="<%=accountLedgerSubTypeMailingDetailsBO != null? accountLedgerSubTypeMailingDetailsBO.getMailingName() : ""%>" class="form-control" <%=isReadOnly ? "readonly=readonly" : ""%>>
		</div>
		<div class="form-group">
			<label class="control-label">Address</label>
			<input type="text" id="mailingAddress" name="mailingAddress" value="<%=accountLedgerSubTypeMailingDetailsBO != null? accountLedgerSubTypeMailingDetailsBO.getMailingAddress() : ""%>" class="form-control" <%=isReadOnly ? "readonly=readonly" : ""%>>
		</div>
		<div class="form-group">
			<label class="control-label">State</label>
			<c:set var="mailingStateIdValue" value=""></c:set>
			<c:if test="${not empty accountLedgerSubTypeMailingDetailsBO and not empty accountLedgerSubTypeMailingDetailsBO.mailingStateBO}">
				<c:set var="mailingStateIdValue"  value="<%=accountLedgerSubTypeMailingDetailsBO.getMailingStateBO().getStateId()%>"></c:set>	
			</c:if>
			<select id="mailingStateId" name="mailingStateId" class="form-control">
					  <option value=""></option>
					  <c:forEach items="${stateBOList}" var="stateBO">
					  <c:set var="tmpSelectValue" value=""></c:set>
					  <c:if test="${mailingStateIdValue eq  stateBO.stateId}">
					  	 <c:set var="tmpSelectValue" value="selected"></c:set>
					  </c:if>
					  <option value="${stateBO.stateId}" ${tmpSelectValue}>${stateBO.stateName}</option>
					  </c:forEach>					  
			</select>
		</div>
		<div class="form-group">
			<label class="control-label">PinCode</label>
			<input type="text" id="mailingPinCode" name="mailingPinCode" value="<%=accountLedgerSubTypeMailingDetailsBO != null? accountLedgerSubTypeMailingDetailsBO.getMailingPinCode() : ""%>" class="form-control" <%=isReadOnly ? "readonly=readonly" : ""%>>
		</div>
		<%} %>
		
		<%if(accountLedgerTypeHeadBO.getHasIncomeTaxDetails() && !isAdminFlow){ %>
			<div class="form-group">
				<h4>Income Tax Details</h4>
			</div>
			<div class="form-group">
			<label class="control-label">PAN/IT Number</label>
			<input type="text" id="incomeTaxPanITNumber" name="incomeTaxPanITNumber" value="<%=accountLedgerSubTypeIncomeTaxDetailsBO != null? accountLedgerSubTypeIncomeTaxDetailsBO.getPanITNumber() : ""%>" class="form-control" <%=isReadOnly ? "readonly=readonly" : ""%>>
		</div>
		<%} %>
			
	  </div> <!--  End of body -->
	  <div class="modal-footer">
	  		<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	  		<%if (pageRenderMode.equals(CommonConstant.CREATE_MODE) || pageRenderMode.equals(CommonConstant.EDIT_MODE)) {%>
	  		<button type="submit" class="btn btn-primary"><spring:message code="common.button.save"/></button>
	  		<%} %>
	  </div>
	  </form>
	</div>
</div>

<script>
	bindRestrictedDatePicker('openingDate',minJqueryDateFmtStr,maxJqueryDateFmtStr);
</script>