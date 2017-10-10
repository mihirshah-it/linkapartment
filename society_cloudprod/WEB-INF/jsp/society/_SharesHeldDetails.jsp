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
			<input type="hidden" id="iRegisterBOId" name="iRegisterBOId" value="<%=iRegisterBO.getiRegisterId() != null ?  iRegisterBO.getiRegisterId() : "-1"%>"/>
			<input type="hidden" id="societyPropertyId" name="societyPropertyId" value="<%=iRegisterBO.getPropertyBO().getSocietyPropertyId()%>"/> 
			
				<table id="memberIRegisterShareHeldGridDiv" class="table table-bordered table-striped table-hover dt-responsive"></table>			
				<script>
					showShareHoldGrid();
				</script>			
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		</div>
	</div>
</div>