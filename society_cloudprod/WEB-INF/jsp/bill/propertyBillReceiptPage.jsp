<%@page import="net.sf.jasperreports.j2ee.servlets.ImageServlet"%>
<%@page import="net.sf.jasperreports.engine.export.JRHtmlExporterParameter"%>
<%@page import="net.sf.jasperreports.engine.JRExporterParameter"%>
<%@page import="net.sf.jasperreports.engine.export.JRHtmlExporter"%>
<%@page import="net.sf.jasperreports.engine.JasperPrint"%>
<%@include file="../common/appConfig.jsp" %>
<%
String mainMenu = "manageBills";
String subMenu  = "viewBill";
pageCode = PageCode.BILL_DETAILS;
JasperPrint jp = (JasperPrint) request.getAttribute("jp");
Long propertyBillId = (Long)request.getAttribute("propertyBillId");
request.getSession().setAttribute(ImageServlet.DEFAULT_JASPER_PRINT_SESSION_ATTRIBUTE, jp);
%>
<html>
<HEAD>
	<%@include file="../common/appMetaConfig.jsp"%>
   <TITLE><spring:message code="common.title.label.product"/> :: Bill Details</TITLE>    
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
            	<a  href="javascript:;"  onclick="javascript:printPropertyBillReceipt();" id="print"><i class="fa fa-print" aria-hidden="true"></i>&nbsp;<spring:message code="common.button.print"/></a>
            </li>            
          </ul>
     </div>
     </nav>
    <!-- Content Header (Page header) -->
    <section class="content-header">
		  <h1><spring:message code="bill.viewBill.form.header"/></h1>
		  <hsCommonTag:breadCrumb pageTitle="Bill Details" isFirstIndex="false"/>
	 </section>
	 
	 <section class="content">
	 	<div class="row">
    		<div class="col-md-12">
    			<form id="billReceiptForm" method="post">
					 <input type="hidden" id="voucherId" name="voucherId" value="<%=propertyBillId%>">
				</form>
				<div class="box box-primary">
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
			</div><!--  End of col 1 -->
			
		</div> <!-- Main Row --> 
	</section>
	</div> <!-- End of content wrapper -->
  <%@include file="../common/footer.jsp"%>
  <%@include file="../common/rightSideMenu.jsp"%> 
</div> <!-- End of Wrapper -->
</body>
<script src="<%=jsRoot%>/bill/propertyBillReceiptPage.js?${Server_Token_Value}" type="text/javascript"></script>
</body>
</html>