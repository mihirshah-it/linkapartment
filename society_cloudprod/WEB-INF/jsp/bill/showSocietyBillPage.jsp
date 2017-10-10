<%@page import="app.societywala.bill.bo.PropertyBillType"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="app.societywala.common.impl.utilimpl.CommonUtilImpl"%>
<%@include file="../common/appConfig.jsp" %>
<html>
<HEAD>
   <%@include file="../common/appMetaConfig.jsp"%>
   <TITLE><spring:message code="common.title.label.product"/> :: View Bill</TITLE>  
</HEAD>
<%
String mainMenu = "manageBills";
String subMenu  = "viewBill";
Map<String,Object> sessionCommonModelMap = (Map<String,Object>) session.getAttribute(CommonConstant.SESSION_COMMON_MODEL_MAP);
String pageRenderMode = (String)sessionCommonModelMap.get(CommonConstant.PAGE_RENDER_MODE);
%>

<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
<%@include file="../common/header.jsp"%>
  <%@include file="../common/leftSideMenu.jsp"%>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
  	<!-- Top Action -->
  	<nav class="navbar-static-top">
  	<div id="subNavBar" class="navbar-collapse collapse in">
          <ul class="nav navbar-nav">
            <li>
            	<a  href="javascript:;"  onclick="javascript:printSelectedMonthlyBillDetails();"><i class="fa fa-print" aria-hidden="true"></i>&nbsp;<spring:message code="common.button.printAll"/></a>
            </li>            
          </ul>
     </div>
     </nav>
     
  	<!-- Top Action -->
  	
    <!-- Content Header (Page header) -->
    <section class="content-header with-border">
		  <h1><spring:message code="bill.showBill.form.header"/></h1>
		  <hsCommonTag:breadCrumb pageTitle="View Bill" isFirstIndex="true"/>
	 </section>
	 
	 <section class="content">
	 	<div class="row">
    		<div class="col-md-12">
    				<form id="showSocietBillsForm">
					 <input type="hidden" id="voucherId" name="voucherId">
					</form>
					<form id="generateSocietyBillPage">
					</form>
    				<div class="box box-primary">
						<div class="box-header  with-border">
							<div class="col-md-4">
								<label><spring:message code="bill.showBill.label.selectFiscalYear"/></label>
								<select class="form-control" id="periodYear" onchange="javascript:loadBillPeriodMonthByYear();">
									<c:forEach items="${generatedBillPeriodYearList}" var="periodYear" varStatus="counter">
										<option value="${periodYear}"><%=CommonUtilImpl.getDisplayFormatFiscalYear((Integer)pageContext.getAttribute("periodYear"))%></option>
									</c:forEach>
								</select>
							</div>
							
							<div class="col-md-4">
								<label>Bill Type</label>
								<select class="form-control" id="billType" name="billType"  onchange="javascript:loadBillPeriodMonthByYear();">
									<option value="<%=PropertyBillType.MAINTAINANCE_BILL%>"><%=PropertyBillType.returnPropertyBillTypeName(PropertyBillType.MAINTAINANCE_BILL)%></option>
									<option value="<%=PropertyBillType.SUPPLEMENTARY_BILL%>"><%=PropertyBillType.returnPropertyBillTypeName(PropertyBillType.SUPPLEMENTARY_BILL)%></option>
								</select>
							</div>			
							<div id="monthPeriod" class="col-md-4">
								<!-- This will be populated by Ajax -->
							</div>
						</div>
						<div class="box-body">
							<table id="societyPropertyBillsGridDiv" class="table table-bordered table-striped table-hover dt-responsive">
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
<script>
  var jpageRenderMode = '<%=pageRenderMode%>';
</script>

<!-- Page State from Session Variable is used in js file -->

<script>
var prevYearSelected = "";
var prevMonthSelected = "";
</script>

<%
Map pageStateRequestParam = (Map)request.getAttribute("pageStateRequestParam");
if(pageStateRequestParam != null)
{		
%>
	<script>
	prevYearSelected = '<%=(Integer)pageStateRequestParam.get("periodYear")%>';
	prevMonthSelected = '<%=(String)pageStateRequestParam.get("period")%>';
	</script>
<%
}
%>
<!-- Page State from Session -->
<script src="<%=jsRoot%>/bill/showSocietyBillPage.js?${Server_Token_Value}" type="text/javascript"></script>
</body>
<script>
if(prevYearSelected != '')
	{
		$("#periodYear").val(prevYearSelected);
	}
	
loadBillPeriodMonthByYear();
</script>
</html>