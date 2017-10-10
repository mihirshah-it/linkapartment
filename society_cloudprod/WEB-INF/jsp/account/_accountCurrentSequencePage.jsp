<%@page import="java.util.List"%>
<%@page import="app.societywala.common.bo.SocietyModuleSequenceBO"%>
<%@page import="app.societywala.common.bo.SequenceConstant"%>
<%@page import="app.societywala.society.bo.SocietyBO"%>
<%@page import="app.societywala.common.impl.utilimpl.CommonUtilImpl"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Map"%>
<%@include file="../common/ajaxConfig.jsp" %>
<%
Map<String,Object> sessionCommonModelMap = (Map<String,Object>) session.getAttribute(CommonConstant.SESSION_COMMON_MODEL_MAP);
String pageRenderMode = (String)sessionCommonModelMap.get(CommonConstant.PAGE_RENDER_MODE);

List<Integer> sequenceModuleIdList = (List<Integer>)request.getAttribute("sequenceModuleIdList");
Map<Integer,SocietyModuleSequenceBO> sequenceModuleIdBOMap = (Map<Integer,SocietyModuleSequenceBO>) request.getAttribute("sequenceModuleIdBOMap");
Map<Integer, String> sequenceModuleIdNameMap = (Map<Integer, String>)request.getAttribute("sequenceModuleIdNameMap");

%>

<form id="accountSettingModuleSequenceForm" name="accountSettingModuleSequenceForm">
			<%  for(int i = 0 ; i<sequenceModuleIdList.size(); i++ ) { 
				Integer moduleId = sequenceModuleIdList.get(i);
				SocietyModuleSequenceBO societyModuleSequenceBO = sequenceModuleIdBOMap.get(moduleId);
			%>
			<div class="form-group">
				<label class="control-label required" for="SequenceModule_<%=moduleId%>">
					<%=sequenceModuleIdNameMap.get(moduleId)%>
				</label>
				<%if(societyModuleSequenceBO == null || societyModuleSequenceBO.getCurrentUtilizeSequenceNumber() == 0) { %>
					<input class="form-control" type="number" name="SequenceModule_<%=moduleId%>" id="SequenceModule_<%=moduleId%>" value="0" required>
				<%}else{ %>
					<input class="form-control" type="number" name="SequenceModule_<%=moduleId%>" id="SequenceModule_<%=moduleId%>" value="<%=societyModuleSequenceBO.getCurrentUtilizeSequenceNumber()%>" readonly="readonly">					
				<%} %>
			</div>
			<%} %>
			<div class="form-group">
		    <%if (pageRenderMode.equals(CommonConstant.CREATE_MODE)  || pageRenderMode.equals(CommonConstant.EDIT_MODE)) {%>		    
			<input type="submit"  class="btn btn-primary" value="Save"/>
			<%}%>						
			</div>
</form>