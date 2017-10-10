<%@page import="app.societywala.bill.bo.BillPropertyTagType"%>
<%@page import="app.societywala.bill.bo.SocietyBillTemplateFieldMappingType"%>
<%@page import="app.societywala.bill.bo.SocietyTemplateFieldBO"%>
<%@include file="../common/appConfig.jsp" %>
<html>
<HEAD>
	<%@include file="../common/appMetaConfig.jsp"%>
	<TITLE><spring:message code="common.title.label.product"/> :: Dynamic Bill Field Individual Details</TITLE>  
	<!-- CSS Files -->
	<link rel="stylesheet" type="text/css" href="<%=jqueryPath%>/multiselect/css/jquery.multiselect.css?${Server_Token_Value}" />
</HEAD>

<%
String mainMenu = "manageBills";
String subMenu = "dynamicField";
SocietyTemplateFieldBO   societyTemplateFieldBO = (SocietyTemplateFieldBO)request.getAttribute("societyTemplateFieldBO");
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
		  <hsCommonTag:breadCrumb pageTitle="Bill Field Individual Details" isFirstIndex="false"/>
	 </section>
	 
	 <section class="content">
	 	<div class="row">
    		<div class="col-md-12">
    				<form>
						<input type="hidden" id="societyTemplateFieldId" name="societyTemplateFieldId" value="${societyTemplateFieldBO.societyTemplateFiledId}">
					</form>
					<c:set var="structureTagType" value="<%=BillPropertyTagType.TAG_ON_STRUCTURE%>"></c:set>
					<c:set var="allPropertyTagType" value="<%=BillPropertyTagType.TAG_ON_ALL_PROPERTY%>"></c:set>
					<c:set var="multiplePropertyTagType" value="<%=BillPropertyTagType.TAG_ON_MULTIPLE_FLATS%>"></c:set>
					<input type="hidden" id="fieldTagTypeId" value="${societyTemplateFieldBO.propertyTagTypeId}">		
    				<div class="box box-primary">
						<div class="box-header with-border">
							<c:choose>
								<c:when test="${societyTemplateFieldBO.propertyTagTypeId eq structureTagType}">
								<label class="control-label">Select Structure</label>
								<select class="billFieldTagType" id="billFieldTagType" onchange="javascript:loadBillFieldFromBuildingStructureId();" multiple="multiple">
									<c:forEach items="${propertyStructureTypeBOList}" var="propertyStructureBO">
										<option value="${propertyStructureBO.propertyTypeId}">${propertyStructureBO.propertyStructureTypeName}</option>
									</c:forEach>
								</select>
								</c:when>
								<c:when test="${societyTemplateFieldBO.propertyTagTypeId eq allPropertyTagType or societyTemplateFieldBO.propertyTagTypeId eq multiplePropertyTagType}">
								<label class="control-label">Select Building Name</label>
								<select class="billFieldTagType" id="billFieldTagType" onchange="javascript:loadBillFieldFromBuildingId();" multiple="multiple">
									<c:forEach items="${buildingBOList}" var="buildingBO">
										<option value="${buildingBO.societyBuildingId}">${buildingBO.societyBuildingName}</option>
									</c:forEach>
								</select>				
								</c:when>					
							</c:choose>
						</div>
						<div class="box-body">
							<div id="fieldValueDiv">
							</div>
						</div>
						<div class="box-footer">
							<button type="button" class="btn btn-primary" onclick="javascript:saveBillTemplateFieldMappingValues();"><spring:message code="common.button.save"/></button>
						</div>
    				</div>
    		</div> <!--  End of col 1 -->
    		
    	</div> <!-- End of main row -->
	 </section> <!--  end of content -->
  </div> <!-- End of content wrapper -->
  <%@include file="../common/footer.jsp"%>
  <%@include file="../common/rightSideMenu.jsp"%> 
</div> <!-- End of Wrapper -->
</body>
<script>
	var jstructureTagType = <%=BillPropertyTagType.TAG_ON_STRUCTURE%>;
	var jallPropertyTagType = <%=BillPropertyTagType.TAG_ON_ALL_PROPERTY%>;
	var jmultiplePropertyTagType = <%=BillPropertyTagType.TAG_ON_MULTIPLE_FLATS%>;
</script>

<!-- JS Files -->
<script type="text/javascript" src="<%=jqueryPath%>/multiselect/js/jquery.multiselect.min.js?${Server_Token_Value}"></script>
<script src="<%=jsRoot%>/bill/individualDynamicBillFieldValueConfigurationPage.js?${Server_Token_Value}" type="text/javascript"></script>
</html>