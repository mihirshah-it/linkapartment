<%@page import="app.societywala.user.bo.UserBO"%>
<%@page import="app.societywala.common.constants.CommonConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib  prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
String ctxPath = request.getContextPath();
String jspRoot = ctxPath +"/WEB_INF/jsp";

UserBO sessionUserBO = (UserBO)session.getAttribute("userSessionBO");
String userDisplayName = "";
String languageCode="en_US";
Long userId=null;

if(sessionUserBO != null)
{
	userDisplayName =  sessionUserBO.getFullName();
	languageCode = sessionUserBO.getLocaleLanguageCode();
	userId = sessionUserBO.getUserId();
}
String jqueryThemeName="theme_start";

String jqueryPath =  ctxPath + "/jquery";
String jqueryThemePath= ctxPath + "/jquery/" + jqueryThemeName;
String jqueryCssPath= jqueryThemePath+"/css/jquery-ui.custom.css";
String jqueryJsPath=jqueryThemePath+"/js/jquery-ui.custom.min.js";

String cssRoot = ctxPath+"/css/common/"+languageCode;
String jsRoot = ctxPath+"/js";
%>

<script type="text/javascript">
var jctxPath='<%=ctxPath%>';
var jlanguageCode='<%=languageCode%>';
</script>
<script type="text/javascript" src="<%=jsRoot%>/common/common.js?${Server_Token_Value}"></script>
