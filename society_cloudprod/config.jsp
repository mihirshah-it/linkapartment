<!DOCTYPE html>
<%
String ctxPath = request.getContextPath();
String jqueryThemeName="theme_start";
String url = request.getRequestURL().toString();
String baseURL = url.substring(0, url.length() - request.getRequestURI().length()) + ctxPath;
//...
String jqueryPath =  ctxPath + "/jquery";
String jqueryThemePath= ctxPath + "/jquery/" + jqueryThemeName;
String jqueryCssPath= jqueryThemePath+"/css/jquery-ui.custom.css";
String jqueryJsPath=jqueryThemePath+"/js/jquery-ui.custom.min.js";
String languageCode="en_US";
String cssRoot = ctxPath+"/css/common/"+languageCode;
String jsRoot = ctxPath+"/js";
String imgRoot = ctxPath+"/images";
%>

<script type="text/javascript">
	var jctxPath='<%=ctxPath%>';
	var jrestctxPath='<%=ctxPath%>/services/rest';
	var jimgRoot='<%=imgRoot%>';
	var jlanguageCode='<%=languageCode%>';
	var jqueryPath='<%=jqueryPath%>';
</script>