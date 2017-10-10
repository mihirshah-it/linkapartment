<%@include file="../common/ajaxConfig.jsp" %>
<%@page import="app.societywala.common.constants.CommonConstant"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Set"%>
<%@page import="app.societywala.event.bo.PollOptionBO"%>
<%@page import="app.societywala.event.bo.PollBO"%>
<%@page import="java.util.List"%>
<%
List<PollBO> pollBOList = (List<PollBO>)request.getAttribute("pollBOList");
DateFormat dateFormat = new SimpleDateFormat(CommonConstant.dateUIFormatterWithTime);
int counter = 0;
%>
<div class="box-group" id="pollAccordion">
		<%for(PollBO pollBO : pollBOList) {
			counter ++;
			%>
			<input type="hidden" id="pollId<%=counter%>" name="pollId<%=counter%>" value="<%=pollBO.getPollId()%>">
           <div class="panel box box-default">
		       <div class="box-header with-border">
		         <a data-toggle="collapse" data-parent="#pollAccordion" href="#pollCollapse<%=counter%>">
		         <h4 class="box-title">		           
		             <%=pollBO.getPollTitle()%>		           	           		           
		         </h4>
		         <div class="pull-right">
		         <small class="label label-danger"><i class="fa fa-clock-o"></i> <%=dateFormat.format(pollBO.getExpireDate())%></small>
		         </div>
		         </a>	
		       </div>
		       <div id="pollCollapse<%=counter%>" class="panel-collapse collapse">
		         <div class="box-body">		           
		           <!-- The poll -->
		           <ul class="todo-list ui-sortable">
		                <%
		                Set<PollOptionBO> optionBOList = pollBO.getPollOptionBOSet();
		                for(PollOptionBO optionBO : optionBOList)
		                {
		                  if(pollBO.getIsAllowMultipleVote()){		
		                %>
		                	<li><input type="checkbox" value="<%=optionBO.getSequenceNumber()%>" id="pollOption<%=counter%>" name="pollOption<%=counter%>"><%=optionBO.getPollOption()%></li>
		                <%} else{ %>
		                	<li><input type="radio" value="<%=optionBO.getSequenceNumber()%>" id="pollOption<%=counter%>" name="pollOption<%=counter%>"><%=optionBO.getPollOption()%></li>
		                <%} // 
		         		} // end for option for loop %>		               
		            </ul>
		         </div>
		         <div class="box-footer">
		         	<div class="pull-right">
                    <button type="button" class="btn btn-primary btn-sm btn-flat" onclick="submitPoll('<%=counter%>');">Submit</button>
                  	</div>
		         </div>
		      </div>
         </div>
        <%} %>
        <button type="button" class="btn btn-success" onclick="javascript:window.location='<%=ctxPath%>/event/pollDetails.htm';"><i class="fa fa-plus"></i></button>
</div>

<script type="text/javascript">
	$("#pollCount").text('<%=(counter>0)?counter:""%>');
	$("#pollCount").attr('data-original-title','<%=(counter>0)?"Total "+counter+" open poll":""%>');
</script>