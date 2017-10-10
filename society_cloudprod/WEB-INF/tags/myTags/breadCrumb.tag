 <%@tag import="app.societywala.common.impl.utilimpl.CommonUtilImpl"%>
<%@tag import="app.societywala.common.constants.CommonConstant"%>
<%@ tag import="java.util.Map" 
  import="java.util.HashMap" %>
  
 <%@ attribute name="isBreadCrumCreationRequire" required="false"%>
 <%@ attribute name="pageTitle" required="true"%>
 <%@ attribute name="isFirstIndex" required="false"%>
 <%@ attribute name="isSocietyNameDisplay" required="false"%>
 
<%
	Integer breadCrumbCurrentCount = new Integer(0);
	Boolean isBreadCrumCreationRequire = true;
	Boolean isFirstIndex = false;
	Boolean isSocietyNameDisplay = true;
	
	
	String pageTitle =  (String)jspContext.getAttribute("pageTitle");
	
	if(jspContext.getAttribute("isBreadCrumCreationRequire") != null && !((String)jspContext.getAttribute("isBreadCrumCreationRequire")).equals(""))
	{
		isBreadCrumCreationRequire = Boolean.valueOf((String)jspContext.getAttribute("isBreadCrumCreationRequire"));
	}
	
	if(jspContext.getAttribute("isFirstIndex") != null && !((String)jspContext.getAttribute("isFirstIndex")).equals(""))
	{
		isFirstIndex = Boolean.valueOf((String)jspContext.getAttribute("isFirstIndex"));
	}
	
	if(jspContext.getAttribute("isSocietyNameDisplay") != null && !((String)jspContext.getAttribute("isSocietyNameDisplay")).equals(""))
	{
		isSocietyNameDisplay = Boolean.valueOf((String)jspContext.getAttribute("isSocietyNameDisplay"));
	}
	
	if(session.getAttribute("BREAD_CRUMB_CURRENT_COUNT") != null)
	{
		breadCrumbCurrentCount =  (Integer)session.getAttribute("BREAD_CRUMB_CURRENT_COUNT");
	}

	Map<String , String[]> requestParameterMap = request.getParameterMap();
	
	if(isFirstIndex)
	{
		for(Integer i=1 ; i<=breadCrumbCurrentCount ; i++)
		{
			session.removeAttribute("BREAD_CRUMB_INDEX_"+i.toString());
		}	
		breadCrumbCurrentCount = 0;
	}else if(requestParameterMap.get("IS_BREAD_CRUM_CLICK") != null)
	{
		Boolean isBreadCrumClick = Boolean.valueOf(requestParameterMap.get("IS_BREAD_CRUM_CLICK")[0]);
		if(isBreadCrumClick && isFirstIndex.equals(Boolean.FALSE))
		{ 
			isBreadCrumCreationRequire = false;
		}
	}else if(breadCrumbCurrentCount > 1)
	{
		Map tmpBreadCrumbCurrentPageSessionDetails = (Map)session.getAttribute("BREAD_CRUMB_INDEX_"+breadCrumbCurrentCount.toString());
		String tmpTitle = (String)tmpBreadCrumbCurrentPageSessionDetails.get("PAGE_TITLE");
		if(pageTitle.equals(tmpTitle)) // Page refresh or same page load
		{
			isBreadCrumCreationRequire = false;
		}
	}
	
	

	if(isBreadCrumCreationRequire)
	{
		breadCrumbCurrentCount += 1;
		session.setAttribute("BREAD_CRUMB_CURRENT_COUNT" , breadCrumbCurrentCount);
		
		Map breadCrumbIndexSessionDetails = new  HashMap();
				
		breadCrumbIndexSessionDetails.put("REQUEST_PARAMETER_MAP", requestParameterMap);
		breadCrumbIndexSessionDetails.put("PAGE_TITLE", (String)jspContext.getAttribute("pageTitle"));
		breadCrumbIndexSessionDetails.put("REQUEST_URI", (String)request.getAttribute("javax.servlet.forward.request_uri"));
		breadCrumbIndexSessionDetails.put("REQUEST_METHOD_TYPE" , request.getMethod() );
		
		session.setAttribute("BREAD_CRUMB_INDEX_"+breadCrumbCurrentCount.toString(), breadCrumbIndexSessionDetails);
	}
	
	// Fetch Grid State Details and page state details for current page	
	Map breadCrumbCurrentPageSessionDetails = (Map)session.getAttribute("BREAD_CRUMB_INDEX_"+breadCrumbCurrentCount.toString());
	Map pageStateRequestParam = (Map)breadCrumbCurrentPageSessionDetails.get("PAGE_STATE_REQUEAT_PARAM");
	request.setAttribute("pageStateRequestParam", pageStateRequestParam);
				
	String allGridStateJsonStr = "{}";
	if(breadCrumbCurrentPageSessionDetails.get("GRID_DETAILS") != null)
	{
		allGridStateJsonStr = ((String) breadCrumbCurrentPageSessionDetails.get("GRID_DETAILS"));
	}
	
	// Fetch Grid State Details for current page
%>

<form id="breadCrumbForm">
	<input type="hidden" name="IS_BREAD_CRUM_CLICK" id="IS_BREAD_CRUM_CLICK" value="true">
    <input type="hidden" name="BREAD_CRUM_INDEX" id="BREAD_CRUM_INDEX">
</form> 
 
 <ol class="breadcrumb">
               
               <% 
               String bredCrumbBackURL = null;
               String bredCrumbBackURLMethod = null;
			   
               for(Integer i=1 ; i <=breadCrumbCurrentCount ; i++ ){ 
            	   Map breadCrumbIndexSessionDetails = (Map)session.getAttribute("BREAD_CRUMB_INDEX_"+i.toString());
            	   String title = (String)breadCrumbIndexSessionDetails.get("PAGE_TITLE");            	   
               %>
                  <!-- End Code for Bread crumb -->
            	<% if(i.equals(breadCrumbCurrentCount) == false) {
            	   bredCrumbBackURL = (String)breadCrumbIndexSessionDetails.get("REQUEST_URI");
             	   bredCrumbBackURLMethod = (String)breadCrumbIndexSessionDetails.get("REQUEST_METHOD_TYPE");
            	%>
                		<li>
                			<a href="javascript:submitBreadCrumbForm('<%=i%>', '<%=bredCrumbBackURLMethod%>' ,  '<%=bredCrumbBackURL.toString()%>');">
                    		 <%=title%>
                    		 </a>                    		
                    	</li>                    	
                    <% }else{%>
                    	<li class="active"><%=title%></li>
                    <%} %>              
              <% } // End of for loop%>
</ol>       

<%if(request.getParameter("isSaveSuccess") != null && (Boolean.parseBoolean(request.getParameter("isSaveSuccess")))){ %>
<div class="alert alert-success alert-dismissible">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <h4><i class="icon fa fa-check"></i> Information is updated successfully!</h4>                
</div>
<%}	else if(request.getParameter("isSaveSuccess") != null && (!Boolean.parseBoolean(request.getParameter("isSaveSuccess")))){ %>
<div class="alert alert-danger alert-dismissible">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <h4><i class="icon fa fa-check"></i> Oops some error happens.!</h4>                
</div>
<%}	else if(request.getParameter("isSaveAndPrintSuccess") != null && (Boolean.parseBoolean(request.getParameter("isSaveAndPrintSuccess")))){ %>
<div class="alert alert-success alert-dismissible">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <h4><i class="icon fa fa-check"></i> Information is updated successfully. Printing is processing.!</h4>                
</div>
<%} else if(request.getParameter("isSaveAndPrintSuccess") != null && (!Boolean.parseBoolean(request.getParameter("isSaveAndPrintSuccess")))){ %>
<div class="alert alert-danger alert-dismissible">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <h4><i class="icon fa fa-check"></i> Oops some error happens.!</h4>                
</div>
<%} %>
           
<script>
	var breadCrumbCurrentCountJSVar = <%=breadCrumbCurrentCount%>;
	var breadCrumbPrevCountJSVar = <%=breadCrumbCurrentCount-1%>;
	var allGridStateJsonStrVar = <%=allGridStateJsonStr%>;	
</script>

<%if(bredCrumbBackURL != null) {%>
<script>
updateBackInfoInBreadCrumb('<%=(breadCrumbCurrentCount-1)%>', '<%=bredCrumbBackURLMethod%>' ,  '<%=bredCrumbBackURL.toString()%>');
</script>
<%} %>

<% if(isSocietyNameDisplay && session != null && session.getAttribute(CommonConstant.SESSION_SELECTED_SOCIETY_ID) != null)
{
	Integer societyCurrentFiscalYearFromSession = (Integer) session.getAttribute(CommonConstant.SESSION_SELECTED_SOCIETY_CURRENT_FY);
	String fiscalYearDisplay = CommonUtilImpl.getDisplayFormatFiscalYear(societyCurrentFiscalYearFromSession);
%>
<div>
	<h4 class="text-yellow"><%=((String)session.getAttribute(CommonConstant.SESSION_SELECTED_SOCIETY_NAME))+" : (" + fiscalYearDisplay + ")"%> </h4>
</div>
<%} %>