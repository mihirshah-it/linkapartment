<%@page import="app.societywala.common.constants.CommonConstant"%>
<%@page import="java.util.Map"%>
<%@page import="app.societywala.society.bo.SocietyPropertyBO"%>
<%@include file="../common/ajaxConfig.jsp" %>
<%
SocietyPropertyBO societyPropertyBO = (SocietyPropertyBO)request.getAttribute("societyPropertyBO");
Map<String,Object> sessionCommonModelMap = (Map<String,Object>) session.getAttribute(CommonConstant.SESSION_COMMON_MODEL_MAP);
String pageRenderMode = (String)sessionCommonModelMap.get(CommonConstant.PAGE_RENDER_MODE);
%>

<div class="modal-dialog" role="document">
    <div class="modal-content">
    	<div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">
        	<%if (pageRenderMode.equals(CommonConstant.CREATE_MODE) || pageRenderMode.equals(CommonConstant.EDIT_MODE)) {%>
        		Assign Members for block no <%=societyPropertyBO.getBlockNumber()%>
        	<%} else if(pageRenderMode.equals(CommonConstant.VIEW_MODE)) { %>
        		View Members for block no <%=societyPropertyBO.getBlockNumber()%>
        	<%} %>	
        </h4>
      </div> <!-- End of ./modal-header -->
      <div class="modal-body">
		<%if (pageRenderMode.equals(CommonConstant.CREATE_MODE)  || pageRenderMode.equals(CommonConstant.EDIT_MODE)) {%>
		<div class="infoDiv">Search members to join</div>
		<input type="hidden" name="propertyId" id="propertyId" value="<%=societyPropertyBO.getSocietyPropertyId()%>"/>
		<form role="form" id="memberSearchDiv">
			<div class="box box-body">
				<div class="form-group">
					<div class="col-md-4">
		     		<label for="searchUser" class="control-label required">Mobile Number or email Id</label>
		     		</div>
		     		<div class="col-md-4">
		     		<input class="form-control" type="text" name="userSearchName" id="userSearchName" required/>
		     		</div>
		     		<div class="col-md-4">
		     		<input type="submit" class="btn btn-primary" name="searchUser" id="searchUser" value="<spring:message code="society.button.search.user"/>"/>
		     		</div>
		         </div>
			</div>		
		</form>
		
		<%} %>
		
		<div id="userDetailsDiv">
		</div>
		
		<div class="infoDiv">Members List</div>
		<div class="box box-body">
	              <table id="propertyMembersGridDiv" class="table table-bordered table-striped table-hover dt-responsive">		                
	              </table>
		 </div>		
			
		</div> <!-- ./End for modal-body -->
		
		<div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div> <!-- ./End of Footer -->
    </div> <!-- ./End of modal content -->
    
</div>
<script>
   showPropertyMembersGrid(<%=societyPropertyBO.getSocietyPropertyId()%>);
</script>
