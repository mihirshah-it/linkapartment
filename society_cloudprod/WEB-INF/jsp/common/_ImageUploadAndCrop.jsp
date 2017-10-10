<%@include file="../common/ajaxConfig.jsp" %>
<%
Integer attachementEntityTypeId =  (Integer)request.getAttribute("attachementEntityTypeId");
Long attachementEntityId = (Long)request.getAttribute("attachementEntityId");
Integer attachementModuleTypeId = (Integer)request.getAttribute("attachementModuleTypeId");
Long attachementModuleId = (Long)request.getAttribute("attachementModuleId");
%>

<!-- The fileinput-button span is used to style the file input field as button -->
  <span class="btn btn-success fileinput-button">
        <i class="icon-plus icon-white"></i>
        <span>Select files...</span>
        <!-- The file input field used as target for the file upload widget -->
        <input id="cropImageUpload" type="file" name="files[]">
  </span>
  <br>
  <br>
  <!-- The global progress bar -->
 
 <div id="progressBarDiv" style="display: none;"><div id="progressBarLabel" class="progress-label">0%</div></div>
 
<form name="imageCropForm" id="imageCropForm" method="post">

	<div id="uploadedFileDiv">
	</div>
	<input type="hidden" name="attachementCounter" id="attachementCounter" value="1">
	<input type="hidden" name="attachementEntityTypeId" id="attachementEntityTypeId" value="<%=attachementEntityTypeId%>">
	<input type="hidden" name="attachementEntityId" id="attachementEntityId" value="<%=attachementEntityId%>">
	<input type="hidden" name="attachementModuleTypeId" id="attachementModuleTypeId" value="<%=attachementModuleTypeId%>">
	<input type="hidden" name="attachementModuleId" id="attachementModuleId" value="<%=attachementModuleId%>">
		
</form> 
    