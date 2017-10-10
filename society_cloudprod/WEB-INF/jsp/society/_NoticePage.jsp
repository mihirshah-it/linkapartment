<%@page import="java.text.SimpleDateFormat"%>
<%@page import="app.societywala.common.constants.CommonConstant"%>
<%@page import="java.text.DateFormat"%>
<%@page import="app.societywala.event.bo.SocietyNoticeBO"%>
<%@page import="java.util.List"%>
<%
List<SocietyNoticeBO> societyNoticeBOList = (List<SocietyNoticeBO>)request.getAttribute("societyNoticeBOList");
int counter = 0;
DateFormat dateFormat = new SimpleDateFormat(CommonConstant.dateUIFormatter);
if(societyNoticeBOList.size() > 0)
{
for(SocietyNoticeBO noticeBO : societyNoticeBOList)
{
	counter++;
%>
<div class="panel box box-default">
       <div class="box-header with-border">
         <h4 class="box-title">
           <a data-toggle="collapse" data-parent="#noticeAccordion" href="#collapse<%=counter%>">
             <%=noticeBO.getSocietyBO().getSocietyName()%> ::: <%=noticeBO.getNoticeSubject()%> :: <%=dateFormat.format(noticeBO.getNoticeCreationDate())%>
           </a>
         </h4>
       </div>
       <div id="collapse<%=counter%>" class="panel-collapse collapse <%=(counter==1)?"in":""%>">
         <div class="box-body">
           <%=noticeBO.getNoticeDescription()%>
         </div>
       </div>
</div>
<%}
}else {
%>
<div class="box-body">
	No any notice published
</div>
<%}%>