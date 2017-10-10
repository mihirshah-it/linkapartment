<%@page import="net.sf.jasperreports.j2ee.servlets.ImageServlet"%>
<%@page import="net.sf.jasperreports.engine.export.JRHtmlExporterParameter"%>
<%@page import="net.sf.jasperreports.engine.JRExporterParameter"%>
<%@page import="net.sf.jasperreports.engine.export.JRHtmlExporter"%>
<%@page import="net.sf.jasperreports.engine.JasperPrint"%>
<%@include file="../common/appConfig.jsp" %>
<%
String mainMenu = "manageReports";
String subMenu  = "monthlyBillSummary";
JasperPrint jp = (JasperPrint) request.getAttribute("jp");
String billGenerationPeriod = (String)request.getAttribute("billGenerationPeriod");
Integer billType = (Integer)request.getAttribute("billType");
request.getSession().setAttribute(ImageServlet.DEFAULT_JASPER_PRINT_SESSION_ATTRIBUTE, jp);
%>
<html>
<HEAD>
	<%@include file="../common/appMetaConfig.jsp"%>
   <TITLE><spring:message code="common.title.label.product"/> :: Monthly Summary Report</TITLE>    
</HEAD>

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
			<li>
				<a  href="javascript:;"  onclick="javascript:printMonthlySummaryBillReport('<%=billGenerationPeriod%>');"><i class="fa fa-print" aria-hidden="true"></i>&nbsp;Print</a>
			</li>
			<li>
				<a href="javascript:;"  onclick="javascript:viewMonthlySummaryBillReportPdf('<%=billGenerationPeriod%>');"><i class="fa fa-file-pdf-o" aria-hidden="true"></i>&nbsp;Pdf Download</a>
			</li>
			<li>
				<a href="javascript:;"  onclick="javascript:viewMonthlySummaryBillReportXls('<%=billGenerationPeriod%>');"><i class="fa fa-file-excel-o" aria-hidden="true"></i>&nbsp;Excel Download</a>
			</li>    
          </ul>
     </div>
     </nav>
    <!-- Content Header (Page header) -->
    <section class="content-header">
		  <h1> Monthly Summary Report   </h1>
		  <hsCommonTag:breadCrumb pageTitle="Monthly Summary Report" isFirstIndex="false"/>
	 </section>
	 
	 <section class="content">
	 	<div class="row">
    		<div class="col-md-12">
    				<form id="showSocietMonthlyBillsSummaryForm" method="post">
						 <input type="hidden" id="billGenerationPeriod" name="billGenerationPeriod">
						 <input type="hidden" id="billType" name="billType" value="<%=billType%>">
					</form>
    				<div class="box box-primary">
						<div class="box-header with-border">
						</div>
						<div class="box-body">
						<%
							JRHtmlExporter htmlExporter = new JRHtmlExporter();
							htmlExporter.setParameter(JRExporterParameter.JASPER_PRINT, jp);
							htmlExporter.setParameter(JRExporterParameter.OUTPUT_WRITER, out);
							htmlExporter.setParameter(JRHtmlExporterParameter.IMAGES_URI, "image?image=");
							htmlExporter.setParameter(JRHtmlExporterParameter.IS_USING_IMAGES_TO_ALIGN, Boolean.FALSE);
						    htmlExporter.exportReport();
						%>
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
<script src="<%=jsRoot%>/reports/monthlyBillSummaryReport.js?${Server_Token_Value}" type="text/javascript"></script>
</body>
</html>