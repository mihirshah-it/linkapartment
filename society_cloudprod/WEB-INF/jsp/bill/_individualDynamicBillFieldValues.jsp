<%@page import="app.societywala.bill.bo.BillPropertyTagType"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.NumberFormat"%>
<%@include file="../common/ajaxConfig.jsp" %>
<%@page import="java.util.Map"%>
<%@page import="app.societywala.society.bo.PropertyStructureTypeBO"%>
<%@page import="app.societywala.bill.bo.SocietyTemplateFieldMappingBO"%>
<%@page import="java.util.List"%>
<%@page import="app.societywala.bill.bo.SocietyTemplateFieldBO"%>
<%
SocietyTemplateFieldBO societyTemplateFieldBO = (SocietyTemplateFieldBO)request.getAttribute("societyTemplateFieldBO");
List<SocietyTemplateFieldMappingBO> societyTemplateFieldMappingBOList = (List<SocietyTemplateFieldMappingBO>)request.getAttribute("societyTemplateFieldMappingBOList");
Map<Long,String> fieldMappingElementTypeNameMap = (Map<Long,String>)request.getAttribute("fieldMappingElementTypeNameMap");
Map<Long,String> fieldMappingElementNameMap = (Map<Long,String>)request.getAttribute("fieldMappingElementNameMap");
NumberFormat numberFormat = new DecimalFormat(CommonConstant.NUMBER_FORMAT);
%>

	<form id="fieldMappingValueForm" name="fieldMappingValueForm">
	<input type="hidden" name="fieldMappingCounter" id="fieldMappingCounter" value="<%=societyTemplateFieldMappingBOList.size()%>">
	<input type="hidden" name="societyTemplateFieldId" id="societyTemplateFieldId" value="<%=societyTemplateFieldBO.getSocietyTemplateFiledId()%>">
	<table class="table table-condensed">
	<%
	int counter = 0;
	for(SocietyTemplateFieldMappingBO societyTemplateFieldMappingBO : societyTemplateFieldMappingBOList)
		{
			
			if( (counter%2) == 0 )
			{ %>		
				<tr>
			<% } %>
			<input type="hidden" id="societyTemplateFiledMappingId<%=(counter+1)%>" name="societyTemplateFiledMappingId<%=(counter+1)%>" value="<%=societyTemplateFieldMappingBO.getSocietyTemplateFieldMappingId()%>">			
			<td>
				<label class="control-label">
				<%if(!societyTemplateFieldBO.getPropertyTagTypeId().equals(BillPropertyTagType.TAG_ON_STRUCTURE)) {%>
    			<%=fieldMappingElementTypeNameMap.get(societyTemplateFieldMappingBO.getElementId())%>/
    			<%} %>
    			<%=fieldMappingElementNameMap.get(societyTemplateFieldMappingBO.getElementId())%>
    			</label>
    		</td>
    		<td> 
    			<input type="number" class="form-control" name="societyTemplateFiledMappingValue<%=(counter+1)%>" id="societyTemplateFiledMappingValue<%=(counter+1)%>" value="<%=societyTemplateFieldMappingBO.getAmount()==null?"":societyTemplateFieldMappingBO.getAmount()%>">
    		</td>    		
	    	<%if( (counter%2) != 0 )
			{ %>		
			 </tr>
			<% }			
    	counter++;
		} // End of for loop
	if( (counter%2) == 0 ) // If last value is even then complete the tr
			{ %>		
			 </tr>
			<% } %>
	</table>
	</form>