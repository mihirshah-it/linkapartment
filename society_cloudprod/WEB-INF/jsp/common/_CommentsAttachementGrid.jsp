<%@page import="app.societywala.common.bo.Attachment"%>
<%@page import="java.util.List"%>
<%@include file="../common/ajaxConfig.jsp" %>
<%
Integer attachementEntityTypeId =  (Integer)request.getAttribute("attachementEntityTypeId");
Long attachementEntityId = (Long)request.getAttribute("attachementEntityId");
Integer attachementModuleTypeId = (Integer)request.getAttribute("attachementModuleTypeId");
Long attachementModuleId = (Long)request.getAttribute("attachementModuleId");

List<Attachment> attachmentBOList = (List<Attachment>)request.getAttribute("attachmentBOList");
%>

<div class="griddiv">
	<c:forEach items="${attachmentBOList}" var="attachmentBO" varStatus="counter">	
		<div class="gridFile">
		<a href="javascript:;" onclick="javascript:downloadAttachement('${counter.count}');">
	        <img class="docFileIcon" src=""/>      
	        <h4></h4>		
	    </a>
	    <input type="hidden" name="attachementOriginalName${counter.count}" id="attachementOriginalName${counter.count}" value="${attachmentBO.originalFileName}"/>
	    <input type="hidden" name="attachementPhysicalName${counter.count}" id="attachementPhysicalName${counter.count}" value="${attachmentBO.physicalFileName}"/>
	    <input type="hidden" name="attachementId${counter.count}" id="attachementId${counter.count}" value="${attachmentBO.attachementId}"/>
		<input type="hidden" name="attachementStatus${counter.count}" id="attachementStatus${counter.count}" value="uploaded"/>
	    <a href="javascript:;" onclick="javascript:downloadAttachement('${counter.count}');">${attachmentBO.originalFileName}</a>
	   	</div>
	</c:forEach>
</div>
	<input type="hidden" name="attachementEntityTypeId" id="attachementEntityTypeId" value="<%=attachementEntityTypeId%>">
	<input type="hidden" name="attachementEntityId" id="attachementEntityId" value="<%=attachementEntityId%>">
	<input type="hidden" name="attachementModuleTypeId" id="attachementModuleTypeId" value="<%=attachementModuleTypeId%>">
	<input type="hidden" name="attachementModuleId" id="attachementModuleId" value="<%=attachementModuleId%>">	
