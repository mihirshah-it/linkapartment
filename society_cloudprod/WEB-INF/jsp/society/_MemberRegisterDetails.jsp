<%@page import="app.societywala.society.bo.IRegisterOwnerType"%>
<%@page import="java.util.Map"%>
<%@page import="app.societywala.common.constants.CommonConstant"%>
<%@page import="app.societywala.society.bo.SocietyPropertyIRegisterBO"%>
<%@include file="../common/ajaxConfig.jsp" %>
<%
SocietyPropertyIRegisterBO iRegisterBO = (SocietyPropertyIRegisterBO)request.getAttribute("iRegisterBO");
Map<String,Object> sessionCommonModelMap = (Map<String,Object>) session.getAttribute(CommonConstant.SESSION_COMMON_MODEL_MAP);
String pageRenderMode = (String)sessionCommonModelMap.get(CommonConstant.PAGE_RENDER_MODE);
%>

<div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">
        		<%if (pageRenderMode.equals(CommonConstant.CREATE_MODE)  || pageRenderMode.equals(CommonConstant.EDIT_MODE)) {%>
				Register of Members for block no <%=iRegisterBO.getPropertyBO().getBlockNumber() %>
				<%}else if (pageRenderMode.equals(CommonConstant.VIEW_MODE)) { %>
				View Register of Members for block no <%=iRegisterBO.getPropertyBO().getBlockNumber() %>
				<%} %>
        </h4>
      </div>
      <div class="modal-body">
      		<form id="userRegisterSearchForm">
      		<div id="memberSearchDiv">
				<div class="form-group">
					<label class="control-label">Mobile Number or email Id</label>
					<input type="text" class="form-control" name="userSearchName" id="userSearchName"/>
					<button type="submit" class="btn btn-primary"><spring:message code="society.button.search.user"/></button>					
				</div>
			</div>
			</form>
			<div id="userIRegisterDetailsDiv"></div>			
      </div>
      <form:form cssClass="form" id="iRegisterForm" commandName="iRegisterBO">
      <form:hidden  path="propertyBO.societyPropertyId"/>
	  <input type="hidden" id="iRegisterFormMemberCount" name="iRegisterFormMemberCount" value="0">
	  <div class="modal-body">	  	
	  		<div id="appendMemberDiv" class="form-group"> 
			<table class="table table-bordered dt-responsive" id="appendMemberTable">
				<thead>
					<tr>
						<th>Member Name</th>
						<th>Member Type</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${iRegisterOwnerBOList}" var="iRegisterOwnerBO" varStatus="counter">
						<c:set var="ownerTypeId" value="${iRegisterOwnerBO.ownerShipTypeId}"></c:set>
					   <tr>
					     	<td><label class="control-label">${iRegisterOwnerBO.ownerUserBO.fullName}</label></td>
					     	<td><label class="control-label"><%=IRegisterOwnerType.getIRegisterOwnerTypeName((Integer)pageContext.getAttribute("ownerTypeId"))%></label></td>
					     	<td>&nbsp;</td>
					   </tr>
					</c:forEach>
				</tbody>
			</table>
			</div>
			
			<div class="form-group">	
			  	<form:label cssClass="control-label required" path="dateOfAdmission">
			         Date Of Admission
			  	</form:label>
			  	<div class="input-group date">
	                  <div class="input-group-addon">
	                    <i class="fa fa-calendar"></i>
	                  </div>
	                  <form:input cssClass="form-control pull-right datepicker" path="dateOfAdmission" dateFormat="dateFormat" required="required"/>
	             </div>			  				  	
		  	</div>
		  	
		  	<div class="form-group">	
			  	<form:label cssClass="control-label required" path="dateOfPaymentOfEnteranceFees">
			         Date Of Payment of Entrance Fee
			  	</form:label>
			  	<div class="input-group date">
	                  <div class="input-group-addon">
	                    <i class="fa fa-calendar"></i>
	                  </div>
	                  <form:input cssClass="form-control pull-right datepicker" path="dateOfPaymentOfEnteranceFees" dateFormat="dateFormat" required="required"/>
	             </div>			  			  	
		  	</div>
		  	
			
			<div class="form-group">	
			  	<form:label cssClass="control-label" path="nameOfNomination">
			         Name of Nomination
			  	</form:label>
			  	<form:input path="nameOfNomination" class="form-control"/>
		  	</div>
		  	
		  	<div class="form-group">	
			  	<form:label cssClass="control-label" path="addressOfNomination">
			         Address of Nomination
			  	</form:label>
			  	<form:input path="addressOfNomination" class="form-control"/>
		  	</div>
		  	
		  	<div class="form-group">	
			  	<form:label cssClass="control-label" path="dateOfNomination">
			         Date of Nomination
			  	</form:label>
			  	<div class="input-group date">
	                  <div class="input-group-addon">
	                    <i class="fa fa-calendar"></i>
	                  </div>
	                  <form:input cssClass="form-control pull-right datepicker" path="dateOfNomination" dateFormat="dateFormat"/>
	             </div>
		  	</div>
	  	
	  </div>
	  <div class="modal-footer">
	  		<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      		<button type="submit" class="btn btn-primary"><spring:message code="common.button.saveAndClose"/></button>
	  </div>
	</form:form>
	</div>
</div>