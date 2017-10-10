<%@page import="app.societywala.common.constants.CommonConstant"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@include file="../common/ajaxConfig.jsp" %>
<%@page import="java.util.List"%>
<%
List<Date> generatedBillPeriodList = (List<Date>)request.getAttribute("generatedBillPeriodList");
SimpleDateFormat monthYearFormat = new SimpleDateFormat(CommonConstant.monthYearUIFormatter);
%>
<label><spring:message code="bill.showBill.label.selectMonth"/></label>
<select class="form-control" id="period" onchange="javascript:showPropertyBillDetailsGrid();">
    <% for(int i=0; i<generatedBillPeriodList.size();i++)
       { 
    	Date period = generatedBillPeriodList.get(i);
    %>
		<option value="<%=period%>"> <%=monthYearFormat.format(period)%> </option>
	<%
	   } 
	%>
</select>