<%@page import="net.sf.jasperreports.j2ee.servlets.ImageServlet"%>
<%@page import="net.sf.jasperreports.engine.JasperPrint"%>
<%@page import="net.sf.jasperreports.engine.export.JRHtmlExporterParameter"%>
<%@page import="net.sf.jasperreports.engine.JRExporterParameter"%>
<%@page import="net.sf.jasperreports.engine.export.JRHtmlExporter"%>
<%@include file="../common/ajaxConfig.jsp" %>
<%
	JasperPrint jp = (JasperPrint) request.getAttribute("jp");
	request.getSession().setAttribute(ImageServlet.DEFAULT_JASPER_PRINT_SESSION_ATTRIBUTE, jp);
	JRHtmlExporter htmlExporter = new JRHtmlExporter();
	htmlExporter.setParameter(JRExporterParameter.JASPER_PRINT, jp);
	htmlExporter.setParameter(JRExporterParameter.OUTPUT_WRITER, out);
	htmlExporter.setParameter(JRHtmlExporterParameter.IMAGES_URI, "image?image=");
	htmlExporter.setParameter(JRHtmlExporterParameter.IS_USING_IMAGES_TO_ALIGN, Boolean.FALSE);
    htmlExporter.exportReport();
%>