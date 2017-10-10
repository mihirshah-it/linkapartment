<%@page import="app.societywala.bill.bo.SocietyPropertyPaymentBO"%>
<%@page import="app.societywala.bill.bo.PropertyPaymentDetailsBO"%>
<%@page import="app.societywala.common.impl.utilimpl.CommonUtilImpl"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="app.societywala.bill.bo.PropertyBillBO"%>
<%@page import="app.societywala.common.constants.CommonConstant"%>
<%@page import="app.societywala.account.bo.JournalEntityType"%>
<%@page import="app.societywala.account.bo.JournalEntryDetailsType"%>
<%@page import="java.util.Map"%>
<%@include file="../common/ajaxConfig.jsp" %>
<%
Map<String,Object> sessionCommonModelMap = (Map<String,Object>) session.getAttribute(CommonConstant.SESSION_COMMON_MODEL_MAP);
String pageRenderMode = (String)sessionCommonModelMap.get(CommonConstant.AJAX_PAGE_RENDER_MODE);
SocietyPropertyPaymentBO billPaymentBO = (SocietyPropertyPaymentBO)request.getAttribute("billPaymentBO");
Boolean isPropertyBasedEntry = (Boolean)request.getAttribute("isPropertyBasedEntryPage");
List<PropertyPaymentDetailsBO> journalEntryToDetailsList = (List<PropertyPaymentDetailsBO>)request.getAttribute("journalEntryToDetailsList");
%>
      <div class="box box-primary">
      <form:form cssClass="form" id="billPaymentForm" commandName="billPaymentBO">
	  <form:hidden path="societyPropertyPaymentId"/>
	  <form:hidden path="societyBO"/>
	  <form:hidden path="isPropertyBasedEntry"/>
	  <form:hidden path="incomeToSocietyAssetsBO"/>
            
      	<% if (pageRenderMode.equals(CommonConstant.CREATE_MODE) == false) { %>
      	<div class="box-header with-border">
		<div class="form-group">
			<form:label cssClass="control-label" path="sequenceNumber">
				Member Receipt No.
			</form:label>
			<form:label cssClass="control-label" path="sequenceNumber">
				${billPaymentBO.sequenceNumber}
			</form:label>
		</div>
		</div> <!--  end of ./Box Header -->
		<% } %>
		<div class="box-body">
		<div class="form-group">
		  	<div class="col-md-6">
		  	<form:label cssClass="control-label required" path="paymentMode">
			         Payment Mode
			</form:label>
			<form:select cssClass="form-control" path="paymentMode" onchange="javascript:showHideChequeOrCashRelatedDiv();" required="required">
					<form:options items="${paymentModeBOList}" itemValue="paymentModeId" itemLabel="payMentModeName" />
			</form:select>
		  	</div>
		  	
		  	<div class="col-md-6" id="bankAccountAssetsBODiv">
		  		<label class="control-label required"><spring:message code="collection.receipt.form.label.income.to.assets.bank.name"/></label>
					<select class="form-control" id="bankAssetsBOList" name="bankAssetsBOList" required>
						<c:forEach var="societyAssetsBankBO" items="${soceityAssetsBankBOList}">
							<c:set var="selectedVar" value=""></c:set>
							<c:if test="${societyAssetsBankBO.accountLedgerSubTypeId eq billPaymentBO.incomeToSocietyAssetsBO.accountLedgerSubTypeId}">
								<c:set var="selectedVar" value="selected=\"selected\""></c:set>						
							</c:if>
							<option value="${societyAssetsBankBO.accountLedgerSubTypeId}" ${selectedVar}>${societyAssetsBankBO.ledgerTypeTitle}</option>				
						</c:forEach>
					</select>			
			  </div>
			  
			  <div class="col-md-6" id="cashOnHandAccountAssetsBODiv">
				<label class="control-label required"><spring:message code="collection.receipt.form.label.income.to.assets.cash.account.name"/></label>
					<select class="form-control" id="cashAssetsBOList" name="cashAssetsBOList" required>
						<c:forEach var="societyAssetsCashBO" items="${soceityAssetsCashBOList}">
							<c:set var="selectedVar" value=""></c:set>
							<c:if test="${societyAssetsCashBO.accountLedgerSubTypeId eq billPaymentBO.incomeToSocietyAssetsBO.accountLedgerSubTypeId}">
								<c:set var="selectedVar" value="selected=\"selected\""></c:set>						
							</c:if>
							<option value="${societyAssetsCashBO.accountLedgerSubTypeId}" ${selectedVar}>${societyAssetsCashBO.ledgerTypeTitle}</option>				
						</c:forEach>
					</select>			
			  </div>
		  </div>
		  <div class="form-group">
		  		<div class="col-md-6" id="chequeOrDDNumberDiv">
			  	<form:label cssClass="control-label required" path="chequeOrDDNumber">
			         Cheque/DD Number
			  	</form:label>
			  	<form:input cssClass="form-control" path="chequeOrDDNumber" required="required"/>
			  	</div>
			  
			  <div class="col-md-6" id="paymentFromBankNameDiv">
				  	<form:label cssClass="control-label required" path="paymentFromBankName">
				         From Bank Name
				  	</form:label>
				  	<form:input cssClass="form-control" path="paymentFromBankName" required="required"/>
			  </div>	  
		  </div>
		  <div class="form-group">
		  		<div class="col-md-6">
					  <form:label cssClass="control-label required" path="paymentDate">Receipt Date</form:label>
					  <div class="input-group date">
			              <div class="input-group-addon">
			                <i class="fa fa-calendar"></i>
			              </div>
			              <form:input cssClass="form-control pull-right datepicker" path="paymentDate" dateFormat="dateFormat" required="required" onchange="javascript:updateClearanceDate();"/>
		              </div>
	           </div>
		  		<div  class="col-md-6">
				<form:label cssClass="control-label" path="narration">
	         		Narration
			  	</form:label>
			  	<form:input cssClass="form-control" path="narration"/>
			  	</div>
	       </div>
	       
	       <div class="form-group">
	       		<div class="col-md-12">
	       		<input type="hidden" name="journalEntryToFieldCounter" id="journalEntryToFieldCounter" value="<%=journalEntryToDetailsList.size()%>"/>
	       		<table id="journalEntryToTbl" class="table table-bordered table-striped table-hover dt-responsive">
					<thead>
						<%if(!isPropertyBasedEntry) {%>
						<tr>
							<td colspan="6">
								<input class="btn btn-primary" type="button" value="<spring:message code="account.journal.entry.form.page.lable.to"/>" onclick="javascript:showAddPropetyPaymentDetailFieldPopup('<%=JournalEntryDetailsType.TO%>');">
							</td>
						</tr>
						<%}%>
						<tr>
							<%if(!isPropertyBasedEntry) {%>
							<td width="15%" >
								<label class="control-label">All (Gain/Giver/Given)</label>
							</td>	
							<%} %>
							<td width="15%">
								<label class="control-label required">Maint. Bill Amount</label>
							</td>
							<td width="15%">
								<label class="control-label required">Maint. Interest Amount</label>
							</td>
							<td width="15%">
								<label class="control-label required">Supple. Bill Amount</label>
							</td>
							<td width="15%">
								<label class="control-label required">Supple. Interest Amount</label>
							</td>
							<td width="15%">
								<label class="control-label">Total Amount</label>
							</td>		
							<%if(!isPropertyBasedEntry) {%>
							<td width="15%">								
							</td>
							<%} %>	
						</tr>					
					</thead>
					<tbody>
						<c:forEach items="${journalEntryToDetailsList}" var="journalEntryToDetails" varStatus="counter">
					 		<tr id="journalEntryToDetailsBOTR${counter.count}">
					 			<%if(!isPropertyBasedEntry) {%>
					 			<td width="20%"><label class="control-label">${journalEntryToDetails.societyPropertyBO.propertySubAccountLedgerBO.ledgerTypeTitle}</label></td>
					 			<%} %>
					 			<td align="right">
					 			<%if (pageRenderMode.equals(CommonConstant.VIEW_MODE)) {%>
					 				<fmt:formatNumber type="number" pattern="<%=CommonConstant.NUMBER_FORMAT%>" value="${journalEntryToDetails.paymentAmount}" />
					 			<%}else  if (pageRenderMode.equals(CommonConstant.EDIT_MODE) || pageRenderMode.equals(CommonConstant.CREATE_MODE) ) {%>
					 				<input type="number" class="form-control" name="paymentArrearAmount${counter.count}" id="paymentArrearAmount${counter.count}" value="${journalEntryToDetails.paymentArrearAmount > 0 ? journalEntryToDetails.paymentArrearAmount : 0}" onblur="computeTotal('<%=JournalEntryDetailsType.TO%>');" required>
					 				<c:if test="${journalEntryToDetails.paymentArrearAmount < 0 }">
					 					<label class="text-red"> Advanced Arrears Paid  ${journalEntryToDetails.paymentArrearAmount * -1}</label>
					 				</c:if>					 							 				
					 			<%} %>				
					 			</td>	
					 			<td>
					 			<%if (pageRenderMode.equals(CommonConstant.VIEW_MODE)) {%>
					 				<fmt:formatNumber type="number" pattern="<%=CommonConstant.NUMBER_FORMAT%>" value="${journalEntryToDetails.paymentInterestAmount}" />
					 			<%}else  if (pageRenderMode.equals(CommonConstant.EDIT_MODE) || pageRenderMode.equals(CommonConstant.CREATE_MODE)) {%>
					 				<input type="number" class="form-control" name="paymentInterestAmount${counter.count}" id="paymentInterestAmount${counter.count}" value="${journalEntryToDetails.paymentInterestAmount > 0 ? journalEntryToDetails.paymentInterestAmount : 0 }" onblur="computeTotal('<%=JournalEntryDetailsType.TO%>');" required>
					 				<c:if test="${journalEntryToDetails.paymentInterestAmount < 0 }">
					 					<label class="text-red"> Advanced Interest Paid  ${journalEntryToDetails.paymentInterestAmount * -1}</label>
					 				</c:if>					 							 				
					 			<%} %>
					 			</td>
					 			<td align="right">
					 			<%if (pageRenderMode.equals(CommonConstant.VIEW_MODE)) {%>
					 				<fmt:formatNumber type="number" pattern="<%=CommonConstant.NUMBER_FORMAT%>" value="${journalEntryToDetails.paymentAmount}" />
					 			<%}else  if (pageRenderMode.equals(CommonConstant.EDIT_MODE) || pageRenderMode.equals(CommonConstant.CREATE_MODE) ) {%>
					 				<input type="number" class="form-control" name="paymentAmount${counter.count}" id="paymentAmount${counter.count}" value="${journalEntryToDetails.paymentAmount > 0 ? journalEntryToDetails.paymentAmount : 0}" onblur="computeTotal('<%=JournalEntryDetailsType.TO%>');" required>
					 				<c:if test="${journalEntryToDetails.paymentAmount < 0 }">
					 					<label class="text-red"> Advanced Supple. Bill Paid  ${journalEntryToDetails.paymentAmount * -1}</label>
					 				</c:if>					 							 				
					 			<%} %>				
					 			</td>
					 			<td align="right">
					 			<%if (pageRenderMode.equals(CommonConstant.VIEW_MODE)) {%>
					 				<fmt:formatNumber type="number" pattern="<%=CommonConstant.NUMBER_FORMAT%>" value="${journalEntryToDetails.supplementaryPaymentInterestAmount}" />
					 			<%}else  if (pageRenderMode.equals(CommonConstant.EDIT_MODE) || pageRenderMode.equals(CommonConstant.CREATE_MODE) ) {%>
					 				<input type="number" class="form-control" name="supplementaryPaymentInterestAmount${counter.count}" id="supplementaryPaymentInterestAmount${counter.count}" value="${journalEntryToDetails.supplementaryPaymentInterestAmount > 0 ? journalEntryToDetails.supplementaryPaymentInterestAmount : 0}" onblur="computeTotal('<%=JournalEntryDetailsType.TO%>');" required>
					 				<c:if test="${journalEntryToDetails.supplementaryPaymentInterestAmount < 0 }">
					 					<label class="text-red"> Advanced Supple. Interest Paid  ${journalEntryToDetails.supplementaryPaymentInterestAmount * -1}</label>
					 				</c:if>					 							 				
					 			<%} %>				
					 			</td>
					 			<td>
					 				<label class="control-label" id="totalToFieldTD${counter.count}">${journalEntryToDetails.paymentAmount + journalEntryToDetails.paymentInterestAmount}</label>					 				
					 			</td>
					 			<%if(!isPropertyBasedEntry) {%>
								<td>
									<a href="javascript:deletePersistanceJournalEntryDetailBO('${counter.count}','<%=JournalEntryDetailsType.TO%>');">Delete</a>
								</td>
								<%} %>	
					 			<% if (pageRenderMode.equals(CommonConstant.EDIT_MODE)) {%>
					 			<input type="hidden" name="journalEntryToDetails${counter.count}" id="journalEntryToDetails${counter.count}" value="${journalEntryToDetails.propertyPaymentDetailsId}">		
					 			<input type="hidden" name="journalEntryToDetailsStatus${counter.count}" id="journalEntryToDetailsStatus${counter.count}" value="update">
					 			<% } else if (pageRenderMode.equals(CommonConstant.CREATE_MODE))  {%>
					 			<input type="hidden" name="journalEntryToDetails${counter.count}" id="journalEntryToDetails${counter.count}" value="">		
					 			<input type="hidden" name="journalEntryToDetailsStatus${counter.count}" id="journalEntryToDetailsStatus${counter.count}" value="new">
					 			<%}%>
					 			<input type="hidden" name="propertybillId${counter.count}" id="propertybillId${counter.count}" value="${journalEntryToDetails.propertyBillBO.propertybillId}">
					 			<c:set var="supplementaryBillId" value=""/>
					 			<c:if test="${not empty journalEntryToDetails.propertySupplementaryBillBO}">
					 				<c:set var="supplementaryBillId" value="${journalEntryToDetails.propertySupplementaryBillBO.propertybillId}"/>
					 			</c:if>
					 			<input type="hidden" name="propertySupplementarybillId${counter.count}" id="propertySupplementarybillId${counter.count}" value="${supplementaryBillId}">
					 			<input type="hidden" name="propertyId${counter.count}" id="propertyId${counter.count}" value="${journalEntryToDetails.societyPropertyBO.societyPropertyId}">
					 		</tr>
				 		</c:forEach>
					</tbody>
					</table>		
					<%
					String dispalyStyle = "display:none;";
					if(!isPropertyBasedEntry) {
						dispalyStyle = "display:show;";
					}%>					
					<table style="<%=dispalyStyle%>" class="table table-bordered table-striped table-hover dt-responsive">
						<tr>
							 <td width="20%">
							 	<label class="control-label">Total</label>
							 </td>
							 <td width="20%">
							 	&nbsp;
							 </td>
							 <td width="20%">
							 	&nbsp;
							 </td>
							 <td width="20%">
							 	&nbsp;
							 </td>
							 <td width="20%">
							 	<label id="totalToFieldTD" class="control-label"></label>
							 	<form:hidden path="totalPaymentAmount"/>
							 </td>
							 <td width="20%">
								&nbsp;	
							 </td>
						</tr>
					</table>
	       		</div>
	       </div> <!-- End of Table Div start -->
   		
      </div> <!--  End of .Box Body -->
      <div class="box-footer">
        <%if (pageRenderMode.equals(CommonConstant.CREATE_MODE)  || pageRenderMode.equals(CommonConstant.EDIT_MODE)) {%>
			<button type="submit" class="btn btn-primary">Add Receipt</button>
			<button type="button" onclick="clearPaymentForm();" class="btn btn-default">Clear Value</button>
	  	<%} %>
      </div> <!--  End of box footer -->      
      </form:form>
    </div>
<script>
computeTotal('<%=JournalEntryDetailsType.TO%>');
showHideChequeOrCashRelatedDiv();
bindRestrictedDatePicker('paymentDate',minJqueryDateFmtStr,maxJqueryDateFmtStr);
bindRestrictedDatePicker('paymentClearationDate',minJqueryDateFmtStr,maxJqueryDateFmtStr);
</script>