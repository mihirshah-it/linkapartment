<%@page import="app.societywala.bill.bo.PropertyBillType"%>
<%@page import="app.societywala.bill.bo.BillPropertyTagType"%>
<%@page import="app.societywala.bill.bo.TemplateFieldAmountRule"%>
<%@page import="app.societywala.bill.bo.TemplateFieldRepetationRule"%>
<%@page import="app.societywala.bill.bo.BillTemplateBO"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.List"%>
<%@include file="../common/appConfig.jsp" %>
<html>
<HEAD>
	<%@include file="../common/appMetaConfig.jsp"%>
	<TITLE><spring:message code="common.title.label.product"/> :: Dynamic Bill Field Details</TITLE>  
	<!-- CSS Files -->
	<link rel="stylesheet" type="text/css" href="<%=jqueryPath%>/multiselect/css/jquery.multiselect.css?${Server_Token_Value}" />	
</HEAD>

<%
String mainMenu = "manageBills";
String subMenu = "dynamicField";
String formSubmitAction=ctxPath+"/bill/saveDynamicBillTemplateField.htm";
%>

<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
<%@include file="../common/header.jsp"%>
  <%@include file="../common/leftSideMenu.jsp"%>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
		  <h1><spring:message code="bill.templates.timeSpecificField.form.header"/></h1>
		  <hsCommonTag:breadCrumb pageTitle="Dynamic Bill Field Details" isFirstIndex="false"/>
	 </section>
	 
	 <section class="content">
	 	<div class="row">
    		<div class="col-md-12">
    				<div class="box box-primary">
    					<form:form cssClass="form" method="post" action="<%=formSubmitAction%>" commandName="societyTemplateFieldBO" role="form">
		    			<form:hidden path="societyTemplateFiledId"/>
						<input type="hidden" name="selectedPropertyIds" id="selectedPropertyIds"/>
						<div class="box-header with-border">
							<div class="form-group">
						    	<form:label cssClass="control-label required" path="billType"><spring:message code="bill.templates.timeSpecificField.form.lbl.field.bill.type"/></form:label>
								<form:select cssClass="form-control" path="billType" required="required">
									<form:option value=""></form:option>
									<form:option value="<%=PropertyBillType.MAINTAINANCE_BILL%>"><%=PropertyBillType.returnPropertyBillTypeName(PropertyBillType.MAINTAINANCE_BILL) %></form:option>
									<form:option value="<%=PropertyBillType.SUPPLEMENTARY_BILL%>"><%=PropertyBillType.returnPropertyBillTypeName(PropertyBillType.SUPPLEMENTARY_BILL) %></form:option>
								</form:select>            
							</div>
						</div>
						<div class="box-body">
							<div class="form-group">
						    	<label class="control-label required" id="repetationRuleIDLbl" for="repetationRuleID">
									<spring:message code="bill.templates.timeSpecificField.form.lbl.field.type"/>
								</label>
								<div class="row col-md-12">
								<form:radiobutton  path="repetationRuleID" value="<%=TemplateFieldRepetationRule.ONCE_FOR_THIS_MONTH_AND_YEAR %>"/><spring:message code="bill.templates.timeSpecificField.form.lbl.field.type.month.option"/>
								<form:radiobutton path="repetationRuleID" value="<%=TemplateFieldRepetationRule.REPEAT_FOR_ALL_YEAR_THIS_MONTH %>"/><spring:message code="bill.templates.timeSpecificField.form.lbl.field.type.recursive.option"/>
								</div>            
							</div>
							<div class="form-group">
								<label class="control-label required" for="monthDetail">
									<spring:message code="common.label.month"/>
								</label>
								<div class="row col-md-12">
								<select id="monthDetail" name="monthDetail" multiple="multiple">
									<c:forEach items="${months}" var="monthName">
										<c:set var="monthSelected" value=""/>
								 		<c:forEach  items="${exstingMonthDetailsList}" var="exstingMonthDetails" >
								 				<c:if test="${exstingMonthDetails eq  monthName}">
								 					<c:set var="monthSelected" value="selected"/>
								 				</c:if>
								 		</c:forEach>
								 		<option value="${monthName}" ${monthSelected}>${monthName}</option>						
									</c:forEach>
								</select>
								</div>
							</div>
							<div id="yearDiv">
								<div class="row"> <!-- Line Break -->
								</div>
								<div class="form-group">
								<form:label cssClass="control-label required" path="yearDetail">
									<spring:message code="common.label.year"/>
								</form:label>
								<form:input cssClass="form-control" path="yearDetail"/>
								</div>
							</div>
							<div class="form-group">
								<form:label cssClass="control-label required " path="incomeSubTypeMasterBO">
									<spring:message code="bill.templates.timeSpecificField.form.lbl.field.name"/>
								</form:label>								
								<form:hidden  path="incomeSubTypeMasterBO.accountLedgerSubTypeId" htmlEscape="true" />
							    <form:input cssClass="form-control" path="incomeSubTypeMasterBO.ledgerTypeTitle" required="required"/>
							</div>
							<div class="form-group">
								<form:label cssClass="control-label required" path="amountRule">
									Amount Rule
								</form:label>
								<form:select path="amountRule" cssClass="form-control" required="required">
									<form:option value="<%=null%>"></form:option>
									<form:option value="<%=TemplateFieldAmountRule.SAME_AMOUNT%>">Same Amount for Property Structure</form:option>
									<form:option value="<%=TemplateFieldAmountRule.DIFFERENT_AMOUNT%>">Different Amount for Property Structure</form:option>
								</form:select>
							</div>
							<div class="form-group">
								<form:label cssClass="control-label required" path="amount">
									<spring:message code="bill.templates.timeSpecificField.form.lbl.field.amount"/>
								</form:label>
								<form:input cssClass="form-control" path="amount" required="required" number="number"/>
							</div>
							<div class="form-group">
								<form:label cssClass="control-label required" path="templateFieldDescription">
									<spring:message code="bill.templates.timeSpecificField.form.lbl.field.description"/>
								</form:label>
								<form:input cssClass="form-control" path="templateFieldDescription" required="required"/>
							</div>
							<div class="form-group">
									<label class="control-label"><spring:message code="bill.templates.timeSpecificField.form.lbl.field.property.structure"/></label>
									<div class="row col-md-12">
									<select name="propertyStructure" id="propertyStructure"  multiple="multiple">
										<c:set var="propertyTagTypeAllPropertyValue" value="<%=BillPropertyTagType.TAG_ON_ALL_PROPERTY%>"/>
										<c:set var="propertyStructureSelected" value=""/>
										<c:if test="${societyTemplateFieldBO.propertyTagTypeId eq propertyTagTypeAllPropertyValue }">
										   <c:set var="propertyStructureSelected" value="selected"/>
										</c:if>
										<option value="-2" ${propertyStructureSelected}>All Property</option>
										
										<c:set var="propertyTagTypeMultiplePropertyValue" value="<%=BillPropertyTagType.TAG_ON_MULTIPLE_FLATS%>"/>
										<c:set var="propertyStructureSelected" value=""/>
										<c:if test="${societyTemplateFieldBO.propertyTagTypeId eq propertyTagTypeMultiplePropertyValue }">
										   <c:set var="propertyStructureSelected" value="selected"/>
										</c:if>
									 	<option value="-1" ${propertyStructureSelected}><spring:message code="bill.templates.timeSpecificField.form.lbl.field.propertyTagType.option"/></option>
									 	
									 	<c:forEach items="${propertyStructureTypeBOList}" var="propertyStructureTypeBO">
									 		<c:set var="propertyStructureSelected" value=""/>
									 		<c:if test="${societyTemplateFieldBO.propertyTagTypeId ne propertyTagTypeMultiplePropertyValue and societyTemplateFieldBO.propertyTagTypeId ne propertyTagTypeAllPropertyValue}">
									 			<c:forEach  items="${existingFieldMappingElementIdList}" var="existingFieldMappingElementId" >
									 				<c:if test="${existingFieldMappingElementId eq  propertyStructureTypeBO.propertyTypeId}">
									 					<c:set var="propertyStructureSelected" value="selected"/>
									 				</c:if>
									 			</c:forEach>
									 		</c:if>
									 		<option value="${propertyStructureTypeBO.propertyTypeId}" ${propertyStructureSelected}>${propertyStructureTypeBO.propertyStructureTypeName}</option>
									 	</c:forEach>
									</select>
									</div>
							</div>
							<div>
								<table id="allSocietyPropertyGridDiv" class="table table-bordered table-striped table-hover dt-responsive">
								</table>
							</div>
						</div> <!--  End of box body -->
						<div class="box-footer">
							<button type="submit" class="btn btn-primary" onclick="javascript:setPropertyORStructureIds();"><spring:message code="common.button.save"/></button>
                		</div>
						</form:form>
						
    				</div> <!--  End of Box -->
    		</div> <!--  End of col 1 -->
    		
    	</div> <!-- End of main row -->
	 </section> <!--  end of content -->
  </div> <!-- End of content wrapper -->
  <%@include file="../common/footer.jsp"%>
  <%@include file="../common/rightSideMenu.jsp"%> 
</div> <!-- End of Wrapper -->
</body>
<!-- JS Files -->
<script type="text/javascript" src="<%=jqueryPath%>/multiselect/js/jquery.multiselect.min.js?${Server_Token_Value}"></script>
<script src="<%=jsRoot%>/bill/createDynamicBillTemplateField.js?${Server_Token_Value}" type="text/javascript"></script>
<script>
repetationRuleIDClicks();
</script>
</html>