<div id="quickAction" class="box box-danger">
	<div class="box-header with-border">
           <h3 class="box-title">Quick Link
           </h3>
    </div>
	<div class="box-body">
		  <%if(currentSessionSocietyId != null) {%>
          <a class="btn btn-block btn-social btn-bitbucket" href="<%=ctxPath%>/event/bookPropertyPage.htm">
            <i class="fa fa-fw fa-bank"></i> Book Facility
          </a>
           <a class="btn btn-block btn-social btn-google" href="<%=ctxPath%>/event/complaintsDetailsPage.htm">
            <i class="fa fa-question"></i> Help Desk
          </a>
           <a class="btn btn-block btn-social btn-flickr" href="<%=ctxPath%>/event/pollDetails.htm">
                <i class="fa fa-bar-chart"></i> Poll
           </a>
          <a class="btn btn-block btn-social btn-dropbox">
                <i class="fa fa-briefcase"></i> Documents
           </a>
            <a class="btn btn-block btn-social btn-github">
                <i class="fa fa-user"></i> Gate Pass
           </a>
           <%}%>
	</div>
</div>
<div id="advertisement"></div>
<%@include file="../common/chat.jsp"%>