<%@page import="app.societywala.society.bo.SocietyBO"%>
<%@page import="app.societywala.common.impl.utilimpl.CommonUtilImpl"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Map"%>
<%@include file="../common/ajaxConfig.jsp" %>
<%
Map<String,Object> sessionCommonModelMap = (Map<String,Object>) session.getAttribute(CommonConstant.SESSION_COMMON_MODEL_MAP);
String pageRenderMode = (String)sessionCommonModelMap.get(CommonConstant.PAGE_RENDER_MODE);
Date todayDate = new Date();
Integer todayFiscalYear = CommonUtilImpl.returnFiscalYear(todayDate);
SocietyBO societyBO = (SocietyBO) request.getAttribute("societyBO");
Integer societyCurrentFiscalYear = societyBO.getCurrentAccountFiscalYear();
%>

<form id="societyAccountCurrentFiscalYearForm" name="societyAccountCurrentFiscalYearForm" role="form">
<div class="form-group">
	<label class="control-label required" for="currentFiscalYear">
		Current Period
	</label>
	<select class="form-control" id="currentFiscalYear" name="currentFiscalYear" required>
	<%for(int i=todayFiscalYear;i>=(todayFiscalYear-5);i--) 
	{
		String selectedValue="";
		if(i==societyCurrentFiscalYear.intValue())
		{
			selectedValue = "selected";
		}
	%>
		<option value="<%=i%>" <%=selectedValue%>><%=CommonUtilImpl.getDisplayFormatFiscalYear(i)%></option>
	<%} %>
	</select>	
</div>

<div class="form-group">
   <%if (pageRenderMode.equals(CommonConstant.CREATE_MODE)  || pageRenderMode.equals(CommonConstant.EDIT_MODE)) {%>
	<input type="submit" class="btn btn-primary" value="<spring:message code="common.button.save"/>"/>
	<%}%>						
</div>
</form>
