<%@include file="../common/ajaxConfig.jsp" %>
<div id="errorMsgDiv" class="error"><spring:message code="common.error.msg.mandatory"/></div>
<form:form cssClass="form" id="tdsPaymentTaxRateDetailsBOForm" commandName="tdsPaymentTaxRateDetailsBO">

	<form:hidden path="tdsPaymentTaxRateDetailsId"/>
	
	<form:hidden path="tdsNatureOfPaymentBO.tdsNatureOfPaymentId"/>
      
  	<div class="inputHolder">	
	  	<form:label cssClass="label" path="tdsApplicableFromDate">
	         Applicable From Date
	  	</form:label>
	  	<form:input cssClass="mandatory datepicker" path="tdsApplicableFromDate"/>
  	</div>
  	
  	<div class="inputHolder">	
	  	<form:label cssClass="label" path="tdsRate">
	         TDS  Rate
	  	</form:label>
	  	<form:input cssClass="mandatory" path="tdsRate"/>
  	</div>
  	
  	<div class="inputHolder">	
	  	<form:label cssClass="label" path="tdsExcemptionLimit">
	         TDS  Excemption Limit
	  	</form:label>
	  	<form:input cssClass="mandatory" path="tdsExcemptionLimit"/>
  	</div>	
	
	<div class="inputHolder">
	  	<form:label cssClass="label" path="tdsDeducteeTypeBO">
			TDS  Deductee Type BO     
	  	</form:label>
	  	<form:select path="tdsDeducteeTypeBO">
			<form:options items="${tdsDeducteeTypeBOList}" itemValue="tdsDeducteeTypeId" itemLabel="tdsDeducteeTypeName" />
		</form:select>
	</div>
	
	<div class="horizontalBtnHolder">
		<input type="button" onclick="javascript:saveAccountStatutoryRateDetails();" value="Save"/>
	</div>
  	
</form:form>