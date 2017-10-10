<%@page import="java.text.SimpleDateFormat"%>
<%@page import="app.societywala.society.bo.IRegisterOwnerType"%>
<%@page import="java.util.List"%>
<%@include file="../common/ajaxConfig.jsp" %>
<%
 UserBO userBO = (UserBO)request.getAttribute("userBO");
SimpleDateFormat dateFormat = new SimpleDateFormat(CommonConstant.dateUIFormatter);
 if(userBO != null)
 {
 %>
  <input type="hidden" name="memberUserId" id="memberUserId" value="<%=userBO.getUserId()%>">
  <div class="form-group">
		<label class="control-label required">
			<spring:message code="iregister.details.form.lbl.member.type"/>       
	  	</label>
	  	<select id="memberTypeId" name="memberTypeId" class="form-control" required>
	  	    <option value="<%=IRegisterOwnerType.MEMBER%>"><%=IRegisterOwnerType.getIRegisterOwnerTypeName(IRegisterOwnerType.MEMBER)%></option>
			<option value="<%=IRegisterOwnerType.ASSOCIATE_MEMBER%>"><%=IRegisterOwnerType.getIRegisterOwnerTypeName(IRegisterOwnerType.ASSOCIATE_MEMBER)%></option>
			<option value="<%=IRegisterOwnerType.JOINT_MEMBER%>"><%=IRegisterOwnerType.getIRegisterOwnerTypeName(IRegisterOwnerType.JOINT_MEMBER)%></option>
		</select>
	</div>
	<div class="form-group">	
	  	<label class="control-label required"><spring:message code="iregister.details.form.lbl.member.full.name"/></label> 
	    <input type="text" class="form-control" name="memberName" id="memberName" value="<%=userBO.getFullName()%>" required/>	    
  	</div>
  	<c:if test="${not empty userBO.birthDate}">
  		<input type="hidden" id="userBirthDate" name="userBirthDate" value="<%=dateFormat.format(userBO.getBirthDate())%>"/>
  	</c:if>  	
  	<div class="form-group">
  		<button type="button" class="btn btn-primary" onclick="javascript:addNewMemberInRegister();"><spring:message code="iregister.details.form.btn.addmemeber.to.register"/></button>
      	<button type="button" class="btn btn-default" onclick="javascript:clearIRegisterSearchUser();">Clear</button>
  	</div>
<%
}
else
{
%>
	 No User Found.
<%
}
%>
