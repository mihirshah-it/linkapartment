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

<!-- The fileinput-button span is used to style the file input field as button -->
  <span class="btn btn-success fileinput-button">
        <i class="icon-plus icon-white"></i>
        <span>Select files...</span>
        <!-- The file input field used as target for the file upload widget -->
        <input id="fileupload" type="file" name="files[]" multiple>
  </span>
  <br>
  <br>
  <!-- The global progress bar -->
  <div id="progressBarDiv" style="display: none;"><div id="progressBarLabel" class="progress-label">0%</div></div>

<form name="attachementForm" id="attachementForm" method="post">

	<div id="uploadedFilesDiv">
		<table class="table table-bordered">
		<thead>
			<tr>
				<th>Attachment Name</th>
				<th>Uploaded By</th>
				<th>Uploaded Date</th>
				<th>Download</th>
				<th>Action</th>					
			</tr>
		</thead>
		<tbody id="uploadedFilesTableBody">
		<c:forEach items="${attachmentBOList}" var="attachmentBO" varStatus="counter">
			   <tr id="attachementInnerTr${counter.count}">
			   	 	<td>${attachmentBO.originalFileName}</td>
					<td>${attachmentBO.uploadedByUserBO.fullName}</td>
					<td><fmt:formatDate pattern="<%=CommonConstant.dateUIFormatterWithTime%>" value="${attachmentBO.uploadedTime}"/></td>
					<td>
			        	<a href="javascript:;" onclick="javascript:downloadAttachement('${counter.count}');">Download</a>			        	
			        </td>
			        <td>
			       		<c:if test="${attachmentBO.uploadedByUserBO.userId eq userSessionBO.userId}">
			        		<input type="button" class="deleteButton" onclick="javascript:deletePersistanceAttachement(${counter.count});" value="Delete"/>
			        	</c:if>
			        </td>
			        <input type="hidden" name="attachementOriginalName${counter.count}" id="attachementOriginalName${counter.count}" value="${attachmentBO.originalFileName}"/>
			        <input type="hidden" name="attachementPhysicalName${counter.count}" id="attachementPhysicalName${counter.count}" value="${attachmentBO.physicalFileName}"/>
			        <input type="hidden" name="attachementId${counter.count}" id="attachementId${counter.count}" value="${attachmentBO.attachementId}"/>
					<input type="hidden" name="attachementStatus${counter.count}" id="attachementStatus${counter.count}" value="uploaded"/>        			    
			   </tr>
		</c:forEach>
		</tbody>
		</table>
	</div>
	
	<input type="hidden" name="attachementCounter" id="attachementCounter" value="<%=attachmentBOList.size()%>">
	<input type="hidden" name="attachementEntityTypeId" id="attachementEntityTypeId" value="<%=attachementEntityTypeId%>">
	<input type="hidden" name="attachementEntityId" id="attachementEntityId" value="<%=attachementEntityId%>">
	<input type="hidden" name="attachementModuleTypeId" id="attachementModuleTypeId" value="<%=attachementModuleTypeId%>">
	<input type="hidden" name="attachementModuleId" id="attachementModuleId" value="<%=attachementModuleId%>">	
</form> 
    