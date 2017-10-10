<%@page import="app.societywala.bill.bo.PropertyBillType"%>
<%@page import="app.societywala.common.impl.utilimpl.CommonUtilImpl"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page import="org.joda.time.Months"%>
<%@page import="org.joda.time.DateTime"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="app.societywala.society.bo.SocietyBO"%>
<%@page import="app.societywala.bill.bo.BillPolicyType"%>
<%@include file="../common/appConfig.jsp" %>
<html>
<HEAD>
	<%@include file="../common/appMetaConfig.jsp"%>
	<TITLE><spring:message code="common.title.label.product"/> :: Generate Bill</TITLE>
</HEAD>

<%

String mainMenu = "manageBills";
String subMenu = "generateBill";
String wizard   = "";
Integer memberBillType = (Integer)request.getAttribute("memberBillType");
SocietyBO societyBO = (SocietyBO)request.getAttribute("societyBO");
SimpleDateFormat simpleMonthYearformat =  new SimpleDateFormat(CommonConstant.monthYearUISpaceFormatter);
SimpleDateFormat simpleDateFormat = new SimpleDateFormat(CommonConstant.dateUIFormatter);
SimpleDateFormat dbDateFormat = new SimpleDateFormat(CommonConstant.dateDBParser);
Date todayDate = new Date();
Date lastBillGeneraionDate = null;
Date lastBillGenerationFromPeriod = null;
Date lastBillGenerationToPeriod = null;
if(memberBillType.equals(PropertyBillType.MAINTAINANCE_BILL))
{
	 lastBillGeneraionDate = societyBO.getLastBillGenerationDate();
	 lastBillGenerationFromPeriod = societyBO.getLastBillGenerationforPeriod();
	 lastBillGenerationToPeriod=societyBO.getLastBillGenerationToPeriod();
}else if(memberBillType.equals(PropertyBillType.SUPPLEMENTARY_BILL))
{
	 lastBillGeneraionDate = societyBO.getLastSupplementaryBillGenerationDate();
	 lastBillGenerationFromPeriod = societyBO.getLastSupplementaryBillGenerationforPeriod();
	 lastBillGenerationToPeriod=societyBO.getLastSupplementaryBillGenerationToPeriod();
	 subMenu = "supGenerateBill";
}
Date newBillGenerationFromPeriod=new Date(); // Default set to current date for From and To date

String lastBillGeneraionMonth = "";
String lastBillGeneraionDateStr = "";
String lastBillGenerationFromDateDBStr = "";

Boolean showAllBillPeriodForFY = false;
Date fiscalStartDate = CommonUtilImpl.returnFiscalStartDate(societyBO.getCurrentAccountFiscalYear());
Calendar fiscalStartCalDate = Calendar.getInstance();
fiscalStartCalDate.setTime(fiscalStartDate);

if(lastBillGenerationToPeriod != null && lastBillGenerationFromPeriod != null && lastBillGeneraionDate != null)
{
   	StringBuffer lastBillGeneraionMonthBuffer = new  StringBuffer(simpleMonthYearformat.format(lastBillGenerationFromPeriod));
   	if(!simpleMonthYearformat.format(lastBillGenerationFromPeriod).equals(simpleMonthYearformat.format(lastBillGenerationToPeriod)))
   	{
   		lastBillGeneraionMonthBuffer.append(" - " + simpleMonthYearformat.format(lastBillGenerationToPeriod));
   	}
	lastBillGeneraionMonth = lastBillGeneraionMonthBuffer.toString();
	lastBillGeneraionDateStr = simpleDateFormat.format(lastBillGenerationFromPeriod);
	lastBillGenerationFromDateDBStr = dbDateFormat.format(lastBillGenerationFromPeriod);
}else 
{
	showAllBillPeriodForFY = true;
}


Boolean isEnableBillGenerateButton = true;
Integer generateBillsforTotalMonths = 1;
if( lastBillGenerationToPeriod != null) 
{
	Calendar calNewBillGenerationFromPeriod = Calendar.getInstance();
	calNewBillGenerationFromPeriod.setTime(lastBillGenerationToPeriod);
	calNewBillGenerationFromPeriod.add(Calendar.MONTH,1);
	newBillGenerationFromPeriod = calNewBillGenerationFromPeriod.getTime();
	
	DateTime start = new DateTime().withDate(lastBillGenerationToPeriod.getYear(), lastBillGenerationToPeriod.getMonth()+1, lastBillGenerationToPeriod.getDate());
	DateTime end = new DateTime().withDate(todayDate.getYear(), todayDate.getMonth()+1, todayDate.getDate());
	Months months = Months.monthsBetween(start, end);
	generateBillsforTotalMonths = months.getMonths();
	if(generateBillsforTotalMonths == 0 || lastBillGenerationToPeriod.after(todayDate))
	{
		isEnableBillGenerateButton = false;
	}	
}

Boolean isLastBillCanDelete = (Boolean)request.getAttribute("isLastBillCanDelete");

if(fiscalStartCalDate.getTime().getTime() > newBillGenerationFromPeriod.getTime())
{
	showAllBillPeriodForFY = true;
	isLastBillCanDelete = false;
}
%>

<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
<%@include file="../common/header.jsp"%>
  <%@include file="../common/leftSideMenu.jsp"%>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
		  <h1><spring:message code="bill.btn.form.header"/></h1>
		  <hsCommonTag:breadCrumb pageTitle="Generate Bill" isFirstIndex="true"/>
	 </section>
	 
	 <section class="content">
	 	<div class="row">
    		<div class="col-md-12">
    				<div class="box box-primary">
    					<form class="form" id="billGenerationForm" name="billGenerationForm" role="form">
    					<input type="hidden" name="memberBillType" id="memberBillType" value="<%=memberBillType%>">
						<div class="box-header with-border">
							<% if(lastBillGeneraionDate != null || lastBillGenerationToPeriod != null) {%>
							<div class="form-group">
										<label><spring:message code="bill.btn.form.lable.lastBill"/>"<%=lastBillGeneraionDateStr%>" for Month of "<%=lastBillGeneraionMonth%>"</label>
									</div>
									<div class="row">
										<div class="col-md-6">
										<a href="javascript:showBillsForPeriod();"><spring:message code="bill.btn.form.lable.clickHereToSeeLastBill"/></a>
										</div>
										
									<%if(isLastBillCanDelete){%>
										<div class="col-md-6">
										<a class="textLink"  style="color:red;" href="javascript:deleteLastBillsForPeriod();">Click here to delete last generated Bill</a>
										<input type="hidden" value="<%=lastBillGenerationFromDateDBStr%>" id="period" name="period"/>
										</div>
									<%} %>									
							</div>
							<%} %>
						</div>
						<div class="box-body">
							<%// if(lastBillGeneraionDate != null || lastBillGenerationToPeriod != null) {%>									
									<div class="form-group">
								    	<label class="control-label required" for="newBillGenerationFromPeriod">Bill From Period</label>
								    	<%if(showAllBillPeriodForFY || memberBillType.equals(PropertyBillType.SUPPLEMENTARY_BILL) ) {%>
										<select id="newBillGenerationFromPeriod" name="newBillGenerationFromPeriod" class="form-control" required>
											<%for(int i=0;i<12;i++){ %>
											<option value="<%=simpleDateFormat.format(fiscalStartCalDate.getTime())%>"><%=simpleMonthYearformat.format(fiscalStartCalDate.getTime())%></option>
											<%
											fiscalStartCalDate.add(Calendar.MONTH , 1);
											} // End of For loop
											%>					
										</select>
										<%}else{ %>
										<label class="form-control"><%=simpleMonthYearformat.format(newBillGenerationFromPeriod)%></label>
										<input type="hidden" id="newBillGenerationFromPeriod" name="newBillGenerationFromPeriod" value="<%=simpleDateFormat.format(newBillGenerationFromPeriod)%>">
										<%} %>												                  
									</div>
									<div class="form-group">
								    	<label class="control-label required" for="billGenerationDuration">Bill For Total Month</label>
								    	<select id="billGenerationDuration" name="billGenerationDuration" class="form-control">
											<option value="<%=BillPolicyType.BILL_FOR_EVERY_ONE_MONTH%>">1</option>
											<option value="<%=BillPolicyType.BILL_FOR_EVERY_TWO_MONTH%>">2</option>
											<option value="<%=BillPolicyType.BILL_FOR_EVERY_THREE_MONTH%>">3</option>
											<option value="<%=BillPolicyType.BILL_FOR_EVERY_FOUR_MONTH%>">4</option>
											<option value="<%=BillPolicyType.BILL_FOR_EVERY_SIX_MONTH%>">6</option>
											<option value="<%=BillPolicyType.BILL_FOR_ONCE_IN_A_YEAR%>">12</option>
										</select>												                  
									</div>
									<%if(memberBillType.equals(PropertyBillType.SUPPLEMENTARY_BILL)) { %>
									<div class="form-group">
								    	<label class="control-label required" for="billGenerationDuration">Bill Due Days</label>
								    	<input type="number" id="billDueDays" name="billDueDays" class="form-control" required>												                  
									</div>
									<div class="form-group">
								    	<label class="control-label" for="billGenerationDuration">Bill Notes</label>
								    	<textarea id="billNotes" name="billNotes"></textarea>												                  
									</div>
									<%} %>
								
							<%//} %>
						</div>
						<%if (isEnableBillGenerateButton) {%>
						<div class="box-footer">
							<button type="button" id="genrateButton" onclick="javascript:generateBillForCurrentPeriod();" class="btn btn-primary" ><spring:message code="bill.btn.generate.bill"/></button>
              			</div>
						<% } %>
						</form>
    				</div> <!--  End of Box -->
    		</div> <!--  End of col 1 -->
    		
    	</div> <!-- End of main row -->
	 </section> <!--  end of content -->
  </div> <!-- End of content wrapper -->
  <%@include file="../common/footer.jsp"%>
  <%@include file="../common/rightSideMenu.jsp"%> 
</div> <!-- End of Wrapper -->
</body>
<script src="<%=jsRoot%>/bill/generateSocietyBillPage.js?${Server_Token_Value}" type="text/javascript"></script>
</html>