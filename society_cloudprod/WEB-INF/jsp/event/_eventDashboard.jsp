<%@include file="../common/ajaxConfig.jsp" %>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.Calendar"%>
<%@page import="app.societywala.common.constants.CommonConstant"%>
<%@page import="java.text.SimpleDateFormat"%>

<%@page import="java.util.Date"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="net.sf.json.JSONArray"%>
<%
JSONArray jsonUserReturnList = (JSONArray)request.getAttribute("rows");
DateFormat uiFormat = new SimpleDateFormat(CommonConstant.dateTimeUIFormatter);
DateFormat timeFormat  = new SimpleDateFormat(CommonConstant.timeUIFormatter);
%>

<ul class="event-list">
	  <%for (int i = 0 ; i < jsonUserReturnList.size() ; i++)  {
			JSONObject tmpJsonObj = (JSONObject)jsonUserReturnList.get(i);
			Calendar cal = Calendar.getInstance();
			cal.setTime(uiFormat.parse((String)tmpJsonObj.get("startTime")));
			
			Calendar calEnd = Calendar.getInstance();
			calEnd.setTime(uiFormat.parse((String)tmpJsonObj.get("endTime")));	
			
			Integer eventType = (Integer)tmpJsonObj.get("eventType");
		%>
		<li>
			<time datetime="<%=cal.getTime().toString()%>">
				<span class="day"><%=cal.get(Calendar.DATE)%></span>
				<span class="month"><%=cal.getDisplayName(Calendar.MONTH, Calendar.SHORT, Locale.ENGLISH)%></span>
				<span class="year"><%=cal.get(Calendar.YEAR)%></span>	
				<span class="timing"><%=timeFormat.format(cal.getTime())%>-<%= timeFormat.format(calEnd.getTime())%></span>							
			</time>
			<div class="info">
				<h2 class="title"><%=tmpJsonObj.get("eventTitle")%></h2>
				<p class="desc">For Society <%=tmpJsonObj.get("societyName")%>. Location : <%=tmpJsonObj.get("eventLocation")%> </p>
				<ul><li><span class="label label-success"><%=tmpJsonObj.get("acceptanceStatus")%></span></li></ul>
			</div>			
			<div class="social">
				<ul>
					<%if(eventType.equals(1)){ // 1 is for Meeting %>
					<li><a href="javascript:;" onclick="viewMeetingDetails('<%=tmpJsonObj.get("eventId")%>');" title="View Meeting Details"><i class="fa fa-fw fa-external-link"></i></a></li>
	  					<% if(tmpJsonObj.get("eventCreatedById").toString().equals(userId.toString())) {%>
	  				<li><a href="javascript:;" onclick="editMeetingDetails('<%=tmpJsonObj.get("eventId")%>');" title="Edit Meeting Details"><i class="fa fa-fw fa-edit"></i></a></li>
	  					<%} 
	  				} else if(eventType.equals(2)){ // 2 is for Festival%>	  				
	  				<li><a href="javascript:;" onclick="viewFesivalDetails('<%=tmpJsonObj.get("eventId")%>');" title="View Festival Details"><i class="fa fa-fw fa-external-link"></i></a></li>
	  				<%} %>
				</ul>
			</div>
		</li>
		<%} %>
</ul>