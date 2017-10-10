<%@page import="app.societywala.society.bo.SocietyBuildingBO"%>
<%@page import="java.util.List"%>
<%@page import="app.societywala.user.bo.PropertyStaffBO"%>
<%@include file="../common/ajaxConfig.jsp" %>
<%
PropertyStaffBO propertyStaffBO = (PropertyStaffBO)request.getAttribute("propertyStaffBO");
List<SocietyBuildingBO> buildingBOList = (List<SocietyBuildingBO>)request.getAttribute("buildingBOList");
%>

<div class="modal-dialog" role="document">
    <div class="modal-content">
      <form class="form" id="popupPropertyMappingForm" name="popupPropertyMappingForm">
      <input type="hidden" name="propertyStaffId" id="propertyStaffId" value="<%=propertyStaffBO.getPropertyStaffId()%>"/>
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">
        	Add Property for staff :: <%=propertyStaffBO.getStaffName()%>	
        </h4>
      </div>      
      <div class="modal-body">
      	<div class="form-group">	
		  	<label class="control-label required">Building Name</label>  
		  	<select id="propertyBuildingId" class="form-control" required>
		  		<c:set var="buildingBOList" value="<%=buildingBOList%>"></c:set>
		  		<c:forEach items="${buildingBOList}" var="buildingBO">
		  			<option value="${buildingBO.societyBuildingId}">${buildingBO.societyBuildingName}</option>
		  		</c:forEach>
		  	</select>
	  	</div>	  	
	  	<div class="form-group">	
		  	<label class="control-label required">Block Number</label>
		    <input type="hidden"  id="propertyBlockNumberId" name="propertyBlockNumberId"/>
			<input type="text" class="form-control" id="propertyBlockNumber" name="propertyBlockNumber" required/>
	  	</div>	  	
	  	<div class="form-group">	
		  	<label class="control-label required">Working From Date</label>
		  	<div class="input-group date">
                  <div class="input-group-addon">
                    <i class="fa fa-calendar"></i>
                  </div>
                  <input class="form-control pull-right datepicker dateFormat" id="workingFromDate" name="workingFromDate" required/>
             </div>
	  	</div>
      </div>      
      <div class="modal-footer">
      	<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      	<button type="submit" class="btn btn-primary"><spring:message code="common.button.saveAndClose"/></button>
      </div>
      </form>
   </div>
</div>