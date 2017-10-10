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
 
 
 
        <div id="breadCrumb">
            <ol class="breadcrumb">
               <% for(Integer i=1 ; i <=breadCrumbCurrentCount ; i++ ){ 
            	   Map breadCrumbIndexSessionDetails = (Map)session.getAttribute("BREAD_CRUMB_INDEX_"+i.toString());
            	   String title = (String)breadCrumbIndexSessionDetails.get("PAGE_TITLE");
            	   String url = (String)breadCrumbIndexSessionDetails.get("REQUEST_URI");
            	   String methodType = (String)breadCrumbIndexSessionDetails.get("REQUEST_METHOD_TYPE");
               %>
                <li>
                	<% if(i.equals(breadCrumbCurrentCount) == false) {%>
                		<form name="breadCrumnForm<%=i%>" id="breadCrumnForm<%=i%>" action="<%=url.toString()%>" method="<%=methodType%>">
                    		<a href="javascript:document.getElementById('breadCrumnForm<%=i%>').submit();"><%=title%></a>
                    		<input type="hidden" name="IS_BREAD_CRUM_CLICK" id="IS_BREAD_CRUM_CLICK" value="true">
                    		<input type="hidden" name="BREAD_CRUM_INDEX" id="BREAD_CRUM_INDEX" value="<%=i%>">
                    	</form>
                    <% }else{%>
                    	<%=title%>
                    <%} %>
                </li>
              <% } // End of for loop%>
                
            </ol>
        </div>

<script>
	var breadCrumbCurrentCountJSVar = <%=breadCrumbCurrentCount%>;
	var breadCrumbPrevCountJSVar = <%=breadCrumbCurrentCount-1%>;
	var allGridStateJsonStrVar = <%=allGridStateJsonStr%>;
</script>
<div class="chevronOverlay main">
</div>
<% if(isSocietyNameDisplay && session != null && session.getAttribute(CommonConstant.SESSION_SELECTED_SOCIETY_ID) != null) {
	Integer societyCurrentFiscalYearFromSession = (Integer) session.getAttribute(CommonConstant.SESSION_SELECTED_SOCIETY_CURRENT_FY);
	String fiscalYearDisplay = CommonUtilImpl.getDisplayFormatFiscalYear(societyCurrentFiscalYearFromSession);
%>
<div align="center">
	<label style="text-align: center; font-weight: bold; font-size: medium; color: #F58634;"> <%=((String)session.getAttribute(CommonConstant.SESSION_SELECTED_SOCIETY_NAME))+" : (" + fiscalYearDisplay + ")"%> </label>
</div>
<%} %>
<div>
		<script>
				/*
				inEffectDuration:  600,   // in effect duration in miliseconds
				stayTime:         3000,   // time in miliseconds before the item has to disappear
				text:               '',   // content of the item
				sticky:          false,   // should the toast item sticky or not?
				type:         'notice',   // notice, warning, error, success
				position:  'top-right',   // top-left, top-center, top-right, middle-left, middle-center, middle-right
		                      // Position of the toast container holding different toast.
		                      // Position can be set only once at the very first call,
		                      // changing the position after the first call does nothing
				closeText:         '',    // text which will be shown as close button,
		                      // set to '' when you want to introduce an image via css
				close:            null    // callback function when the toastmessage is closed
			*/
			$().toastmessage({
	   		 text     : 'Information is updated successfully',
	    	 sticky   : true,
	    	 position : 'top-left',
	    	 type     : 'success',
	         close    : function () {}
			});
		</script>
		
		<%if(request.getParameter("isSaveSuccess") != null && (Boolean.parseBoolean(request.getParameter("isSaveSuccess")))){ %>
		<script>		
			$().toastmessage('showSuccessToast', 'Information is updated successfully');
		</script>
		<%}	else if(request.getParameter("isSaveSuccess") != null && (!Boolean.parseBoolean(request.getParameter("isSaveSuccess")))){ %>
		<script>		
			$().toastmessage('showErrorToast', 'Oops some error happens.');
		</script>	
		<%}	else if(request.getParameter("isSaveAndPrintSuccess") != null && (Boolean.parseBoolean(request.getParameter("isSaveAndPrintSuccess")))){ %>
		<script>		
			$().toastmessage('showSuccessToast', 'Information is updated successfully. Printing is processing.');
		</script>	
		<%} else if(request.getParameter("isSaveAndPrintSuccess") != null && (!Boolean.parseBoolean(request.getParameter("isSaveAndPrintSuccess")))){ %>
		<script>		
			$().toastmessage('showErrorToast', 'Oops some error happens.');
		</script>	
		<%} %>
		
</div>