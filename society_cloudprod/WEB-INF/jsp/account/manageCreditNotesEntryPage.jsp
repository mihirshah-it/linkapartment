<%@page import="java.util.Map"%>
<%@include file="../common/appConfig.jsp" %>

<html>
<HEAD>
	<%@include file="../common/appMetaConfig.jsp"%>
   <TITLE><spring:message code="common.title.label.product"/> :: Manage Credit Notes Entry</TITLE> 
</HEAD>
<%
String mainMenu = "manageAccount";
String subMenu  = "creditNotes";
Map<String,Object> sessionCommonModelMap = (Map<String,Object>) session.getAttribute(CommonConstant.SESSION_COMMON_MODEL_MAP);
String pageRenderMode = (String)sessionCommonModelMap.get(CommonConstant.PAGE_RENDER_MODE);
%>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
<%@include file="../common/header.jsp"%>
  <%@include file="../common/leftSideMenu.jsp"%>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
	<nav class="navbar-static-top">
  	<div id="subNavBar" class="navbar-collapse collapse in">
          <ul class="nav navbar-nav">
            <li>
            	<a  href="javascript:;"  onclick="javascript:printSelectedJournalEntryDetails();" id="print"><i class="fa fa-print" aria-hidden="true"></i>&nbsp;<spring:message code="common.button.printAll"/></a>
            </li>            
          </ul>
     </div>
     </nav>
    <!-- Content Header (Page header) -->
    <section class="content-header">
		  <h1><spring:message code="account.credit.notes.entry.form.label.header"/></h1>
		  <hsCommonTag:breadCrumb pageTitle="Manage Credit Notes Entry" isFirstIndex="true"/>
	 </section>
	 
	 <section class="content">
	 	<div class="row">
    		<div class="col-md-12">
    				<div class="box box-primary">
						<form method="post" id="voucherFormForward" name="voucherFormForward">
						   <input type="hidden" id="voucherId" name="voucherId">
						</form>	
						<div class="box-header with-border">
						<%if (pageRenderMode.equals(CommonConstant.CREATE_MODE)  || pageRenderMode.equals(CommonConstant.EDIT_MODE)) {%>	
							<button type="button" onclick="addNewJournalEntry();" class="btn btn-primary"><spring:message code="account.manage.credit.notes.entry.page.btn.add.journalEntry"/></button>
						<%}%>
						</div>
						<div class="box-body">
							<table id="societyJournalEntryGridDiv" class="table table-bordered table-striped table-hover dt-responsive"></table>
						</div>
						<div class="box-footer">
						</div>
    				</div>
    		</div> <!--  End of col 1 -->
    		
    	</div> <!-- End of main row -->
	 </section> <!--  end of content -->
  </div> <!-- End of content wrapper -->
  <%@include file="../common/footer.jsp"%>
  <%@include file="../common/rightSideMenu.jsp"%> 
</div> <!-- End of Wrapper -->

<!-- JS Files -->  
<script>
  var jpageRenderMode = '<%=pageRenderMode%>';
</script>
<script src="<%=jsRoot%>/account/manageCreditNotesEntryPage.js?${Server_Token_Value}" type="text/javascript"></script>
</body>
</html>