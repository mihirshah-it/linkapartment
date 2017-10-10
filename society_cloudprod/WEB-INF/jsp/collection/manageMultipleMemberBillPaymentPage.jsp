<%@page import="java.util.Map"%>
<%@page import="app.societywala.common.impl.utilimpl.CommonUtilImpl"%>
<%@include file="../common/appConfig.jsp" %>

<html>
<HEAD>
	<%@include file="../common/appMetaConfig.jsp"%>
   <TITLE><spring:message code="common.title.label.product"/> :: All Member Receipt Page</TITLE>
</HEAD>
<%
String mainMenu = "manageAccount";
String subMenu  = "billPayment";
Map<String,Object> sessionCommonModelMap = (Map<String,Object>) session.getAttribute(CommonConstant.SESSION_COMMON_MODEL_MAP);
String pageRenderMode = (String)sessionCommonModelMap.get(CommonConstant.PAGE_RENDER_MODE);
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
		  <h1>Manage Member Receipt Page</h1>
		  <hsCommonTag:breadCrumb pageTitle="Multiple Member Receipt Page" isFirstIndex="false"/>
	 </section>
	 
	 <section class="content">
	 	<div class="row">
    		<div class="col-md-12">
    				<form method="post" id="voucherFormForward" name="voucherFormForward">
						<input type="hidden" name="paymentReceiptId" id="paymentReceiptId">
					   <input type="hidden" id="voucherId" name="voucherId">
					</form>
    				<div class="box box-primary">
						<div class="box-header with-border">
							<div class="form-group">
									<div class="col-md-4">
									<label class="control-label">Select Fiscal Year</label>
									</div>
									<div class="col-md-4">
									<select class="form-control" id="periodYear" onchange="javascript:showPropertyBillPaymentDetailsGrid();">
										<c:forEach items="${memeberBillPaymentYearList}" var="periodYear" varStatus="counter">
											<option value="${periodYear}"><%=CommonUtilImpl.getDisplayFormatFiscalYear((Integer)pageContext.getAttribute("periodYear"))%></option>
										</c:forEach>
									</select>
									</div>
									<div class="col-md-4">	
									<%if(!pageRenderMode.equals(CommonConstant.VIEW_MODE)){ %>
									<button type="button" class="btn btn-primary" onclick="javascript:addNewReceipt();">Add Member Receipt</button>
									<%} %>
									</div>
							</div>
						</div>
						<div class="box-body">
							<table id="societyMultipleMemberBillPaymentGridDiv" class="table table-bordered table-striped table-hover dt-responsive"></table>
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
	
<script>
  var jpageRenderMode = '<%=pageRenderMode%>';
</script>  
<script src="<%=jsRoot%>/collection/manageMultipleMemberBillPaymentPage.js?${Server_Token_Value}" type="text/javascript"></script>
</body>
</html>