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
DateFormat uiFormat = new SimpleDateFormat(CommonConstant.dateUIFormatter);
%>
<%
if(jsonUserReturnList.size() > 0)
{	
%>
<div class="row" >
        <div class="col-md-12">
          <div class="box box-success">
            <div class="box-header">
              <i class="fa fa-tasks" aria-hidden="true"></i><h3 class="box-title">To Do List</h3>
			  <!-- 
              <div class="box-tools">
                <div class="input-group input-group-sm" style="width: 150px;">
                  <input type="text" name="table_search" class="form-control pull-right" placeholder="Search">

                  <div class="input-group-btn">
                    <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
                  </div>
                </div>
              </div> -->
            </div>
            <!-- /.box-header -->
            <div class="box-body table-responsive no-padding .small-div-height">
              <table class="table table-hover">
                <tr>
                  <th>Task</th>
                  <th>Description</th>
                  <th>Date</th>
                  <th>Status</th>
                  <th>Action</th>
                </tr>
                <%for (int i = 0 ; i < jsonUserReturnList.size() ; i++)  {
                	JSONObject tmpJsonObj = (JSONObject)jsonUserReturnList.get(i);
        			Calendar cal = Calendar.getInstance();
        			cal.setTime(uiFormat.parse(tmpJsonObj.get("startTime").toString()));
        			
        			Calendar calEnd = Calendar.getInstance();
        			calEnd.setTime(uiFormat.parse(tmpJsonObj.get("endTime").toString()));
        			
        			Integer approvalType = (Integer)tmpJsonObj.get("approvalType");
        			Integer approvalId = (Integer)tmpJsonObj.get("approvalId");
        			
                %>
                <tr>
                  <td><%=tmpJsonObj.get("approvalTypeName")%></td>
                  <td><%=tmpJsonObj.get("approvalTitle")%> :: For Society (<%=tmpJsonObj.get("societyName")%>)</td>
                  <td><%=tmpJsonObj.get("startTime")%></td>
                  <td><span class="label label-success"><%=tmpJsonObj.get("acceptanceStatus")%></span></td>
                  <td>
                  		<span class="pull-right-container">
			              <%if(approvalType.equals(2)){ // 2 for festival %>
			              <a href='javascript:;' onclick="javascript:viewFesivalDetails('<%=approvalId%>');" title="View Festival Details"><i class="fa fa-fw fa-external-link"></i></a>
			              <!-- <small class="label pull-right bg-green">16</small>
			              <small class="label pull-right bg-red">5</small> -->
			              <%} else if(approvalType.equals(3)) { // 3 for Facility APproval%>
			              <a href='javascript:;' onclick="javascript:viewBookEventDetails('<%=approvalId%>');" title="View Facility Details"><i class="fa fa-fw fa-external-link"></i></a>
			              <%} else if(approvalType.equals(4)) {// 4 for ballot %>
			              <a href='javascript:;' onclick="javascript:doVotingBallot('<%=approvalId%>');" title= "Vote Details"><i class="fa fa-fw fa-external-link"></i></a>
			              <%} %>
			            </span>
                  </td>
                </tr>
                <%} %>               
              </table>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
    </div>
</div>
<%
}
%>