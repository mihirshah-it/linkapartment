<%@page import="app.societywala.common.bo.AttachementConstatnt"%>
<%@page import="app.societywala.common.constants.CommonConstant"%>
<script>
	blockLoadingBlock();
</script>

<%--
<div style="float: left;width: 100%;font-family: Arial;height: 22px;padding:1px;background-color: rgb(222, 222, 222);border-top: 1px solid rgb(166, 166, 166);">
		<div style="display:block;float:left;">
		<ul style="height: 22px;">
			<li style="display: block;float: left; class="selectedMainMenu">
				<a href="javascript:;" style="display: block;text-decoration: none;color: rgb(54, 54, 54);margin-left: 1px;white-space: nowrap;padding: 3px;">HamariSociety</a>
			</li>			
			<li  style="display: block;float: left;">
				<a href="javascript:;" styke="display: block;text-decoration: none;color: rgb(54, 54, 54);margin-left: 1px;white-space: nowrap;padding: 3px;">Buy/Sale</a>			
			</li>			
			<li  style="display: block;float: left; ">
				<a href="javascript:;" style="display: block;text-decoration: none;color: rgb(54, 54, 54);margin-left: 1px;white-space: nowrap;padding: 3px;">Find People</a>			
			</li>
			<li  style="display: block;float: left; ">
				<a href="javascript:;" style="display: block;text-decoration: none;color: rgb(54, 54, 54);margin-left: 1px;white-space: nowrap;padding: 3px;">Service Provider</a>			
			</li>
		</ul>
		</div>
</div>
--%>

<div id="appHeaderContainer" class="appHeaderBg">
  	<div class="center"> 
	<div class="appHeader">
		<div class="logo_img">
			<img src="<%=ctxPath%>/assets/images/logo.png" alt=""/>
		</div>
		<!--  <div class="collapsHeaderBtn" onclick="collapsHeader();" title="collapsHeader"></div> -->
		<div class="loginInfo">
			<div class="useName">Hi, <%=userDisplayName%></div>			
			<div class="settingDropDown">
				<a href="javaScript:openinPopup('<%=ctxPath%>/user/editUserDetails.htm','settingWindow')">Edit Profile</a>
				<a href="javaScript:showResetPasswordPopup();">Reset Password</a>
				<a href="<%=ctxPath%>/user/logoutUser.htm">Logout</a>
			</div>
		</div>		
	</div>
	</div>
</div>

<div id="resetPasswordPopupForm" class="popup_block">
	<div class="popUpTitle">Reset Password</div>
	<div class="infoDiv">Provide current password and new password and click on save button.</div>
	<div id="errorMsgDiv" class="error"><spring:message code="common.error.msg.mandatory"/></div>
	<form name="resetPasswordForm" id="resetPasswordForm" class="form" style="width:600px;" method="post">
		<div class="inputHolder">
			<label><spring:message code="user.label.current.password"/></label>
			<div class="mandatoryMark">*</div>
			<input type="password" class="mandatory" id="currentpassword" name="currentpassword"/>
			<div class="error mandatoryError"><spring:message code="user.error.password"/></div>		
		</div>
		<div class="inputHolder">
			<label><spring:message code="user.label.new.password"/></label>
			<div class="mandatoryMark">*</div>
			<input type="password" class="mandatory" id="newpassword" name="newpassword"/>
			<div class="error mandatoryError"><spring:message code="user.error.password"/></div>		
		</div>
		<div class="inputHolder">
			<label><spring:message code="user.label.confirm.password"/></label>
			<div class="mandatoryMark">*</div>
			<input type="password" class="mandatory" id="confirmPassword" name="confirmPassword"/>
			<div class="error mandatoryError"><spring:message code="user.error.password"/></div>		
			<div class="error" id="errorPasswordNotMatch"><spring:message code="user.error.password.not.match"/></div>
		</div>
		
		<div class="buttonPanel">
			<input type="button" name="savePassword" id="savePassword" value="<spring:message code="common.button.save"/>" onclick="javascript:saveResetPasswordForm();">			
		</div>
	</form>
</div>
