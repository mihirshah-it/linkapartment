<%@page import="app.societywala.account.bo.PaymentGatewayProvider"%>
<%@page import="app.societywala.common.bo.PaymentModeBOType"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Enumeration"%>
<%@page import="app.societywala.bill.bo.ClearanceStatus"%>
<%@page import="java.util.Map"%>
<%@include file="../common/appConfig.jsp" %>
<%
   pageCode = PageCode.DASHBOARD;
   Map<String,Object> sessionCommonModelMap = (Map<String,Object>) session.getAttribute(CommonConstant.SESSION_COMMON_MODEL_MAP);
   String pageRenderMode = (String)sessionCommonModelMap.get(CommonConstant.PAGE_RENDER_MODE);
   String mainMenu = "dashboard";
   String subMenu  = "";
   String paymentPayUURL=CommonConstant.PAYU_URL+"/_payment";
   String paymentPayUSURL = baseURL + "/collection/payUMemberNetBankingSuccessPayment.htm";
   String paymentPayUFURL = baseURL + "/collection/payUMemberNetBankingFailurePayment.htm";
%>

<html>
<HEAD>
	<%@include file="../common/appMetaConfig.jsp"%>
	<link rel="stylesheet" type="text/css" href="<%=cssRoot%>/eventList.css?${Server_Token_Value}" /> 
	<TITLE><spring:message code="common.title.label.product"/> :: Dashboard</TITLE>
	<!-- CSS Files -->	
	<style type="text/css">
	@media screen and (min-width: 1024px) {
    .small-div-height{
    height:300px;
    overflow-y: auto; overflow-x: auto;
      }
	}      
	
	@media screen and (max-width: 800px) {
	.small-div-height{
	    height:200px;
	    overflow-y: auto; overflow-x: auto;
	   }
	}
	
	@media screen and (max-width: 600px) {
	.small-div-height{
	        height:100px;
	        overflow-y: auto; overflow-x: auto;
	       }
	}
	
	
	@media screen and (min-width: 1024px) {
    .large-div-height{
    height:700px;
    overflow-y: auto; overflow-x: auto;
      }
	}      
	
	@media screen and (max-width: 800px) {
	.large-div-height{
	    height:400px;
	    overflow-y: auto; overflow-x: auto;
	   }
	}
	
	@media screen and (max-width: 600px) {
	.large-div-height{
	        height:200px;
	        overflow-y: auto; overflow-x: auto;
	       }
	}
	</style>
	
</HEAD>

<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
<%@include file="../common/header.jsp"%>
  <%@include file="../common/leftSideMenu.jsp"%>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
	<!-- Content Header (Page header) -->
    <section class="content-header">
		  <h1>Dashboard</h1>
		  <hsCommonTag:breadCrumb pageTitle="Dashboard" isFirstIndex="true" isSocietyNameDisplay="false"/>
	 </section>
	 
	 <section class="content">
	 	<div class="row">
    		<%if(currentSessionSocietyId != null) {%>
    		<div class="col-md-9">
    				<form id="approvalForm" name="approvalForm" method="post">
					  <input type="hidden" name="approvalId" id="approvalId">
					  <input type="hidden" name="isRequestFromDashboard" id="isRequestFromDashboard" value="true">
					</form>
					
					<form id="showScheduleMeetingForm" method="post">
						 <input type="hidden" id="societyMeetingId" name="societyMeetingId">
						 <input type="hidden" name="isRequestFromDashboard" id="isRequestFromDashboard" value="true">
					</form>
					
					<form id="propertyBillReceiptForm" name="propertyBillReceiptForm" method="post">
					  <input type="hidden" name="paymentReceiptId" id="paymentReceiptId">
					  <input type="hidden" name="isRequestFromDashboard" id="isRequestFromDashboard" value="true">
					</form>
					
					<form id="noticeFormForward" name="noticeFormForward" method="post">
					  <input type="hidden" name="noticeId" id="noticeId">
					  <input type="hidden" name="isRequestFromDashboard" id="isRequestFromDashboard" value="true">
					</form>
					
					<form id="ballotForm" name="ballotForm" method="post">
					  <input type="hidden" name="ballotId" id="ballotId">
					  <input type="hidden" name="isRequestFromDashboard" id="isRequestFromDashboard" value="true">
					</form>
					
					
					
				<div class="row">
					<div class="col-md-5">
    				<div class="box box-success">
						<div class="box-header with-border">
						     <span class="glyphicon glyphicon-bullhorn"></span><h3 class="box-title">Notice Board</h3>
						     <%if (pageRenderMode.equals(CommonConstant.CREATE_MODE)  || pageRenderMode.equals(CommonConstant.EDIT_MODE)) {%>
						     <div class="pull-right box-tools">
						     <button type="button" class="btn btn-block btn-default" onclick="window.location.href='<%=ctxPath%>/event/manageAllNoticePage.htm'"><i class="fa fa-plus"></i></button>
						     </div>
						     <%} %>
						 </div>
					    <!-- /.box-header -->
					    <div class="box-body  small-div-height">
					           <div class="box-group" id="noticeAccordion">
                					
                				</div>
                		</div>
                	</div>
                	</div>
                	
                	<div class="col-md-7">
			      		<div class="box box-info">
			      			<div class="box-header with-border">
						     <span class="fa fa-calendar"></span><h3 class="box-title">Calendar</h3>
						     </div>
			      			<div class="box-body  small-div-height" id="eventDiv">
			      			
			      			</div>
			      		</div>
			      	</div>
			      </div>
			      
			      <div id="approvalDetails">			      	
			      </div>
			      
			      <div class="row">
			      	<div class="col-md-6">
			      		<%@include file="../event/_activityDashboard.jsp" %>
			      	</div> <!--  End of Activity -->
			      	<div class="col-md-6">
					      <div class="box box-danger">
					            <div class="box-header with-border">
					              <i class="fa fa-money" aria-hidden="true"></i><h3 class="box-title">Bill Details</h3>
					            </div>
					            <!-- /.box-header -->
					            <div class="box-body">
					              <table id="societyPropertyBillGridDiv" class="table table-condensed dt-responsive"></table>
					            </div>
					            <!-- /.box-body -->
					      </div><!-- Bill Details -->
			      	
					      <div class="box box-success">
					            <div class="box-header with-border">
					              <i class="fa fa-print" aria-hidden="true"></i><h3 class="box-title">Receipt Details</h3>
					            </div>
					            <!-- /.box-header -->
					            <div class="box-body">
					               <table id="propertyBillPaymentReceiptGridDiv" class="table table-condensed dt-responsive"></table>					              
					            </div>
					            <!-- /.box-body -->
					      </div><!-- Receipt Board -->
					  </div><!-- Receipt Board Col -->
			      </div> <!--  End of Row 1 -->
			      
			      <div class="row">
			      		
			      </div> <!--  End of Row 2 -->
    		</div> <!--  End of col 1 -->
    		<%}else {%>
    		<div class="col-md-9">
    			You do not have any access to society. Please contact your society panel or consultant.
    		</div>
    		<%} %>
    		<div class="col-md-3">
		    	<%@include file="../common/rightSideContent.jsp"%>		       	
        	</div> 	<!-- .End of col 2 -->
    	</div> <!-- End of main row -->
	 </section> <!--  end of content -->
  </div> <!-- End of content wrapper -->
  <%@include file="../common/footer.jsp"%>
  <%@include file="../common/rightSideMenu.jsp"%> 
</div> <!-- End of Wrapper -->

<div class="modal fade" id="popupFormBillPaymentDetails" tabindex="-1" role="dialog" aria-labelledby="Net Payment Details">
<div class="modal-dialog" role="document">
    <div class="modal-content">
    	  <form name="paymentForm" id="paymentForm" method="post" action="<%=paymentPayUURL%>" class="form">
			<input type="hidden" id="key" name="key"/>
		 	<input type="hidden" id="hash" name="hash"/>
	      	<input type="hidden" id="txnid" name="txnid"/>
	      	<input type="hidden" id="productinfo" name="productinfo"/>
		  	<input type="hidden" id="service_provider" name="service_provider" value="<%=PaymentGatewayProvider.getPaymentGatewayProviderName(PaymentGatewayProvider.PAYU_MONEY)%>" />
		  	<input type="hidden" id="surl" name="surl" value="<%=paymentPayUSURL%>" />
		  	<input type="hidden" id="furl" name="furl" value="<%=paymentPayUFURL%>" />
		  	<input type="hidden" name="propertyId1" id="propertyId1"/>
		  	<input type="hidden" name="propertySupplementarybillId1" id="propertySupplementarybillId1"/>
		  	<input type="hidden" name="propertybillId1" id="propertybillId1"/>
		  	<input type="hidden" name="amount" id="amount"/>
		  	<input type="hidden" name="totalPaymentAmount" id="totalPaymentAmount"/>
		  	<input type="hidden" name="incomeToSocietyAssetsBO" id="incomeToSocietyAssetsBO"/>	
		  	<input type="hidden" name="societyId" id="societyId"/>
	    	 <%-- 
		  	<input type="hidden" id="udf2" name="udf2"/>
		  	<input type="hidden" name="chequeOrDDNumber" id="chequeOrDDNumber"/>
		  	<input type="hidden" name="paymentDate" id="paymentDate"/>
		  	<input type="hidden" name="isPropertyBasedEntry" id="isPropertyBasedEntry" value="true"/>
		  	<input type="hidden" name="journalEntryToFieldCounter" id="journalEntryToFieldCounter" value="1"/>
		  	<input type="hidden" name="journalEntryToDetailsStatus1" id="journalEntryToDetailsStatus1" value="new"/>
		  	<input type="hidden" name="paymentMode" id="paymentMode" value="<%=PaymentModeBOType.NET_BANKING%>"/> 
		  	<input type="text" class="mandatory" id="narration" name="narration"/>
		  	<input type="hidden" name="paymentFromBankName" id="paymentFromBankName" value="<%=PaymentGatewayProvider.getPaymentGatewayProviderName(PaymentGatewayProvider.PAYU_MONEY)%>"/>
		  	--%>
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">Bill Payment</h4>
		  </div> <!--  end of header -->
		  <div class="modal-body">
		  	<div class="form-group">	
		  	<label class="control-label required" for="paymentArrearAmount1">
		         Principle Amount
		  	</label>
		  	<input type="number" class="form-control" id="paymentArrearAmount1" name="paymentArrearAmount1" required/>
	  		</div>
	  		<div class="form-group">	
			  	<label class="control-label required" for="paymentInterestAmount1">
			         Interest Amount
			  	</label>
			  	<input type="number" class="form-control" id="paymentInterestAmount1" name="paymentInterestAmount1" required/>
	  		</div>
		 	<div class="form-group">	
			  	<label class="control-label required" for="paymentAmount1">
			         Supplementary Amount
			  	</label>
			  	<input type="number" class="form-control" id="paymentAmount1" name="paymentAmount1" required/>
	  		</div>
	  		<div class="form-group">	
			  	<label class="control-label required" for="paymentAmount1">
			         Supplementary Interest Amount
			  	</label>
			  	<input type="number" class="form-control" id="supplementaryPaymentInterestAmount1" name="supplementaryPaymentInterestAmount1" required/>
	  		</div>  		
	  		<div class="form-group">	
			  	<label class="control-label required" for="firstname">
			         First Name
			  	</label>
			  	<input type="text" class="form-control" id="firstname" name="firstname" required/>  	
	  		</div>
	  		<div class="form-group">	
			  	<label class="control-label required" for="email">
			        Email Id
			  	</label>
			  	<input type="email" class="form-control" id="email" name="email" required/>
	  		</div>
	  		<div class="form-group">	
			  	<label class="control-label required" for="phone">
			        Mobile Number
			  	</label>
			  	<input type="number" class="form-control" id="phone" name="phone" required/>
	  		</div>
		  </div>
		  <div class="modal-footer">
		  	<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        <button type="button" id="payUButton" name="payUButton" onclick="savePropertyBillPaymentPayUMoney();" class="btn btn-primary">Pay By PayUMoney</button>
			<button type="submit" class="btn btn-primary" style="visibility: hidden;">Submit Pay</button>
		  </div>
		  </form>
	</div>
</div>
</div>
<!-- JS Files -->  
<script type="text/javascript">
var jsPaymentPayUURL = '<%=paymentPayUURL%>';
</script>

<script type="text/javascript" src="<%=jsRoot%>/common/dashboard.js?${Server_Token_Value}"></script>
</body>
</html>