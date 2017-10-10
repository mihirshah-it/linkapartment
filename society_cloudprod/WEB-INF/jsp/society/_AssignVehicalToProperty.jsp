<%@page import="app.societywala.common.constants.CommonConstant"%>
<%@page import="java.util.Map"%>
<%@page import="app.societywala.common.bo.PolicyMasterBO"%>
<%@page import="java.util.List"%>
<%@page import="app.societywala.society.bo.SocietyPropertyBO"%>
<%@include file="../common/ajaxConfig.jsp" %>
<%
SocietyPropertyBO societyPropertyBO = (SocietyPropertyBO)request.getAttribute("societyPropertyBO");
List<PolicyMasterBO> vehicalTypeBOList = (List<PolicyMasterBO>)request.getAttribute("vehicalTypeList");
pageContext.setAttribute("vehicalTypeBOList" , vehicalTypeBOList);
Map<String,Object> sessionCommonModelMap = (Map<String,Object>) session.getAttribute(CommonConstant.SESSION_COMMON_MODEL_MAP);
String pageRenderMode = (String)sessionCommonModelMap.get(CommonConstant.PAGE_RENDER_MODE);
%>

<div class="modal-dialog" role="document">
    <div class="modal-content">
    	<div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">
        	<%if (pageRenderMode.equals(CommonConstant.CREATE_MODE) || pageRenderMode.equals(CommonConstant.EDIT_MODE)) {%>
        		Assign Vehicle for block no <%=societyPropertyBO.getBlockNumber() %>
        	<%} else if(pageRenderMode.equals(CommonConstant.VIEW_MODE)) { %>
        		 View Vehicle for block no <%=societyPropertyBO.getBlockNumber() %>
        	<%} %>	
        </h4>
      </div> <!-- End of ./modal-header -->
      <div class="modal-body">
      	<%if (pageRenderMode.equals(CommonConstant.CREATE_MODE)  || pageRenderMode.equals(CommonConstant.EDIT_MODE)) {%>
		<div class="infoDiv"><spring:message code="vehical.details.form.info"/></div>
		<input type="hidden" name="propertyId" id="propertyId" value="<%=societyPropertyBO.getSocietyPropertyId()%>"/>
		<form role="form" id="userVehicalForm">
			<div class="box box-body">
				<div class="form-group">
					<div class="row">
						<div class="col-md-6">
			     		<label for="vehicalType" class="control-label required"><spring:message code="vehical.details.form.lbl.vehicaltype"/></label>
			     		<select name="vehicalType" id="vehicalType" class="form-control" required>
			                 <c:forEach items="${vehicalTypeBOList}" var="vehicalTypeBO">
			        		     <option value="${vehicalTypeBO.policyMasterId}">${vehicalTypeBO.policyName}</option>
			        		 </c:forEach>
	         			</select>
			     		</div>
			     		
			     		<div class="col-md-6">
			     		<label for="vehicalNumber" class="control-label required"><spring:message code="vehical.details.form.lbl.vehicalnumber"/></label>
			     		<input  type="text" id="vehicalNumber" name="vehicalNumber" class="form-control" required>
			     		</div>
		     		</div>
		     		
		     		<div class="row">
						<div class="col-md-6">
			     		<label for="vehicalAllotmentPlace" class="control-label required"><spring:message code="vehical.details.form.lbl.vehical.parking.allotment.place"/></label>
			     		<input  type="text" id="vehicalAllotmentPlace" name="vehicalAllotmentPlace" class="form-control" required>
			     		</div>		     		
		     		</div>		     		
		         </div>
			</div>	
			<div class="box-footer">
				<input type="submit" class="btn btn-primary" name="addVehical" id="addVehical" value="Add Vehicle"/>
			</div>	
		</form>
		
		<%} %>
		
		<div class="infoDiv">Vehicle List</div>
		<div class="box box-body">
	              <table id="propertyVehicalGridDiv" class="table table-bordered table-striped table-hover dt-responsive">		                
	              </table>
		 </div>		
			
		</div> <!-- ./End for modal-body -->
		
		<div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div> <!-- ./End of Footer -->
    </div> <!-- ./End of modal content -->
    
</div>
<script>
    showPropertyVehicalGrid('<%=societyPropertyBO.getSocietyPropertyId()%>');
</script>
