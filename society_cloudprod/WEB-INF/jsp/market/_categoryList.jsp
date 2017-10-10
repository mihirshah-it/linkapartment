<%@page import="app.societywala.advertise.bo.Category"%>
<%@page import="java.util.List"%>
<%@include file="../common/ajaxConfig.jsp" %>
<c:forEach items="${categoryList}" var="category">
	<a href="javascript:;" onclick="javascript:getServicesProvider(${category.categoryId})"><p class="ct-fw-600 ct-u-marginBottom10">${category.categoryName}</p></a>
</c:forEach>