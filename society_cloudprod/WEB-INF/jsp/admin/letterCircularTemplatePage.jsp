<%@include file="../common/config.jsp" %>
<html>
<HEAD>
   <%@include file="../common/appmetaFile.jsp"%>
  
   <TITLE><spring:message code="common.title.label.product"/> :: Manage Letter Circular Templates</TITLE>
</HEAD>
<%
String mainMenu = "admin";
%>

<body>
<!-- Start Code for Header -->
<%@ include file="../common/appHeader.jsp" %>
<!-- End Code for Header -->

<!-- Start Code for Header -->
<%@ include file="../common/appMainMenu.jsp" %>
<!-- End Code for Header -->

<!-- Sub Menu / Option -->
	<div class="appSubMenuBg">
		<div class="center">
		<div class="appSubMenu">
			<ul>
					<li>
						<a  href="javascript:;"  onclick="javascript: backURL();"> << <spring:message code="common.button.back"/></a>
					</li>												
			</ul>
		</div>
		</div>
	</div>	
<!-- Sub Menu / Option -->

<form id="letterCircularTemplatForm" method="post">
	 <input type="hidden" id="letterCircularTemplatId" name="letterCircularTemplatId">
</form>

<div class="contentBg">
	<div class="center">
	<div class="content">
	
		<!-- Start Code for Bread crumb -->
		<hsCommonTag:breadCrumb pageTitle="Manage Letter Circular" isFirstIndex="false" isSocietyNameDisplay="false"/>
		<!-- End Code for Bread crumb -->
		
		<h1>Letter Circular Templates</h1>
		<p>Configure Letter Circular Templates from here</p>
		
		<div class="infoDiv">Configure Letter Circular Templates from here</div>
		
		<div class="horizontalBtnHolder">
			<div class="form" style="width: 25%;">
				<button style="margin-left: 0; width: 100%;" onclick="javascript:openCreateletterCircularFolderForm();">
					Create Category
				</button> 
			</div>
		</div>
		
		<div class="sidePanel">
			<div class="scrollUpIconDiv"></div>
			<div class="folderHolder" id="folderHolderDiv">
				
			</div>
			<div class="scrollDownIconDiv"></div>
		</div>
		<div class="gridHolder">
			<div id="uploadButtonDiv">
				<div class="info"></div>
				<a href="javascript:;" onclick="javascript:uploadFileForLetterCircular();">Upload Attachment</a>				
			</div>
			<div id="letterCircularFileListDiv">			
			</div>
		</div>
		
	</div>
	</div>
</div>

<div id="attachementPopupForm" class="popup_block">
	<div id="attachmentListDiv"></div>
	<input type="button" name="attachementSaveBtn" id="attachementSaveBtn" value="Save" onclick="javascript:saveAttachement();"/>
</div>

<div id="letterCircularFolderPopupDiv" class="popup_block">
	<form id="letterCircularFolderForm">
		<div class="inputHolder">	
	  		<label class="label">
	        	 Folder Name
	  		</label>
	  		<input type="text" class="mandatory" id="letterCircularFolderName" name="letterCircularFolderName"/>
  		</div>
  		<div class="horizontalBtnHolder">
			<input type="button" onclick="javascript:saveletterCircularFolderForm();" value="<spring:message code="common.button.saveAndClose"/>"/>	 
  		</div>
	</form>
</div>

<div id="attachementPopupForm" class="popup_block">
	<div id="attachmentListDiv"></div>
	<input type="button" name="attachementSaveBtn" id="attachementSaveBtn" value="Save" onclick="javascript:saveAttachement();"/>
</div>

<!-- Start Code for Footer -->
<%@include file="../common/appFooter.jsp" %>
<!-- End Code for Footer -->

<script>
	// This should be initialise before including file manageAllMeetingPage.js
	var attachementEntityTypeId = '<%=AttachementConstatnt.ADMIN_ENTITY%>';
	var attachementEntityId = '<%=AttachementConstatnt.ADMIN_LETTER_CIRCULAR_ENTITY_ID%>';
	var attachementModuleTypeId='<%=AttachementConstatnt.LETTER_CIRCULAR_MODULE%>';
</script>

<script src="<%=ctxPath%>/jquery/grid/js/i18n/grid.locale-en.js?${Server_Token_Value}" type="text/javascript"></script>
<script src="<%=ctxPath%>/jquery/grid/js/jquery.jqGrid.min.js?${Server_Token_Value}" type="text/javascript"></script>
<script src="<%=jsRoot%>/admin/letterCircularTemplatePage.js?${Server_Token_Value}" type="text/javascript"></script>
<script src="<%=jsRoot%>/common/attachmentUpload.js?${Server_Token_Value}" type="text/javascript"></script>

</body>

</html>