<%@page import="java.util.Map"%>
<%@include file="../common/ajaxConfig.jsp" %>
<%
Map<String,Object> sessionCommonModelMap = (Map<String,Object>) session.getAttribute(CommonConstant.SESSION_COMMON_MODEL_MAP);
String pageRenderMode = (String)sessionCommonModelMap.get(CommonConstant.PAGE_RENDER_MODE);
if(sessionCommonModelMap.get(CommonConstant.AJAX_PAGE_RENDER_MODE) != null)
{
	pageRenderMode = (String)sessionCommonModelMap.get(CommonConstant.AJAX_PAGE_RENDER_MODE);
}
%>
<div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Ledger Head Details</h4>
      </div>
      <form:form cssClass="form" method="post" commandName="accountLedgerHeadBO" id="accountLedgerHeadForm">
		<form:hidden path="accountLedgerTypeHeadId"/>
		<form:hidden path="accountTypeId"/>
		<form:hidden path="accountDimentionTypeId"/>
		<form:hidden path="isSystemDefined"/>
		<form:hidden path="captureDataAutomatic"/>	
      <div class="modal-body">
      	<div class="form-group">
			<form:label cssClass="control-label required" path="ledgerHeadTitle">Head Name</form:label>
			<form:input cssClass="form-control"  path="ledgerHeadTitle" htmlEscape="true" required="required"/>
		</div>
		<div class="form-group">
				<form:label cssClass="control-label" path="hasMailingAddress">Mailing Address Required</form:label>
				<form:radiobutton path="hasMailingAddress" value="false"/><spring:message code="common.label.no"/>
				<form:radiobutton path="hasMailingAddress" value="true"/><spring:message code="common.label.yes"/>
		</div>
		<div class="form-group">
				<form:label cssClass="control-label" path="hasIncomeTaxDetails">Income Tax Details Required</form:label>
				<form:radiobutton path="hasIncomeTaxDetails" value="false"/><spring:message code="common.label.no"/>
				<form:radiobutton path="hasIncomeTaxDetails" value="true"/><spring:message code="common.label.yes"/>
		</div>
		<div class="form-group">
				<form:label cssClass="control-label" path="hasStatutoryDetails">Statutory Details Required</form:label>
				<form:radiobutton path="hasStatutoryDetails" value="false"/><spring:message code="common.label.no"/>
				<form:radiobutton path="hasStatutoryDetails" value="true"/><spring:message code="common.label.yes"/>
		</div>
      </div>
      <div class="modal-footer">
      	<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <%if (pageRenderMode.equals(CommonConstant.CREATE_MODE)  || pageRenderMode.equals(CommonConstant.EDIT_MODE)) {%>
			<button type="submit" class="btn btn-primary"><spring:message code="common.button.saveAndClose"/></button>
	  	<%} %>
      </div>
      </form:form>
    </div>
</div>