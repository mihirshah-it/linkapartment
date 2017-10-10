<!DOCTYPE html>
<%@page import="java.util.Date"%>
<%@page import="app.societywala.common.impl.utilimpl.CommonUtilImpl"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="app.societywala.common.bo.AttachementConstatnt"%>
<%@page import="app.societywala.advertise.bo.PageCode"%>
<%@page import="app.societywala.common.constants.CommonConstant"%>
<%@page import="app.societywala.user.bo.UserBO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib  prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="hsCommonTag" tagdir="/WEB-INF/tags/myTags" %>
<%
String ctxPath = request.getContextPath();
String url = request.getRequestURL().toString();
String baseURL = url.substring(0, url.length() - request.getRequestURI().length()) + ctxPath;

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
String jqueryCssPath= jqueryPath+"/"+jqueryThemeName+"/css/jquery-ui.custom.css";
String pluginPath =  ctxPath + "/plugins";

String cssRoot = ctxPath+"/css/common/"+languageCode;
String jsRoot = ctxPath+"/js";
String imgRoot = ctxPath+"/images/common/"+languageCode;

Integer pageCode = PageCode.ALL;
String formTokenID = (String)session.getAttribute("sessionCurrentTokenID");

/* Current Society Selected FY Details and minimum maximum jquery date*/
SimpleDateFormat simpleUIDateFormat = new SimpleDateFormat(CommonConstant.dateUIFormatter);
String maxJqueryDateFmtStr = null;
String minJqueryDateFmtStr = null;
Date configTodayDate = new Date();
Long currentSessionSocietyId = null;
String userMenuRenderMode = null;
if(session != null && session.getAttribute(CommonConstant.SESSION_SELECTED_SOCIETY_CURRENT_FY) != null)
{
	Integer societyCurrentFiscalYearFromSession = (Integer) session.getAttribute(CommonConstant.SESSION_SELECTED_SOCIETY_CURRENT_FY);
	Date sessionFiscalEndDate = CommonUtilImpl.returnFiscalEndDate(societyCurrentFiscalYearFromSession);
	Date sessionFiscalStartDate = CommonUtilImpl.returnFiscalStartDate(societyCurrentFiscalYearFromSession);
	minJqueryDateFmtStr = simpleUIDateFormat.format(sessionFiscalStartDate);
	if(configTodayDate.before(sessionFiscalEndDate)){
	maxJqueryDateFmtStr = simpleUIDateFormat.format(configTodayDate);
	}else {
	maxJqueryDateFmtStr = simpleUIDateFormat.format(sessionFiscalEndDate);
	}
	currentSessionSocietyId = (Long)session.getAttribute(CommonConstant.SESSION_SELECTED_SOCIETY_ID);
	userMenuRenderMode = (String)session.getAttribute(CommonConstant.USER_MENU_RENDER_MODE);
	
}
/* End : Current Society Selected FY Details and minimum maximum jquery date*/
%>
<script type="text/javascript">
var jctxPath='<%=ctxPath%>';
var jrestctxPath='<%=ctxPath%>/services/rest';
var jimgRoot='<%=imgRoot%>';
var jlanguageCode='<%=languageCode%>';
var jeditRenderMode = '<%=CommonConstant.EDIT_MODE%>';
var jviewRenderMode = '<%=CommonConstant.VIEW_MODE%>';
var jcreateRenderMode = '<%=CommonConstant.CREATE_MODE%>';
var jqueryPath='<%=jqueryPath%>';
var jsSessionId='<%=session.getId()%>';
var jsSessionUserId='<%=userId%>';
var jsUserImageContextPath='<%=CommonConstant.USER_IMAGE_CONTEXT_URL%>';
var jsFormTokenID = <%=formTokenID%>;
var minJqueryDateFmtStr = '<%=minJqueryDateFmtStr%>';
var maxJqueryDateFmtStr = '<%=maxJqueryDateFmtStr%>';
var dateFormatUI = "dd/mm/yyyy";
var dateFormatTimeUI = "d-M-Y H:i";
var dateFormatPlaceHolder="dd/mm/yyyy";
var jsPageCode;
</script>