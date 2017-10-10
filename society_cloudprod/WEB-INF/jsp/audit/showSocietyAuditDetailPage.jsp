<%@page import="com.sun.org.apache.xpath.internal.operations.Bool"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Map"%>
<%@include file="../common/config.jsp" %>
<html>
<HEAD>
   <%@include file="../common/appmetaFile.jsp"%>
   <TITLE><spring:message code="common.title.label.product"/></TITLE>  
   <!-- CSS Files -->  
   <link rel="stylesheet" type="text/css" href="<%=cssRoot%>/audit/showSocietyAuditDetailPage.css?${Server_Token_Value}" />     
</HEAD>

<%
String mainMenu = "manageAccount";
Map<String,Map<String,Map<String,Double>>> incomeAuditMap = (Map<String,Map<String,Map<String,Double>>>)request.getAttribute("incomeAuditMap");
Map<String,Map<String,Map<String,Double>>> liabilitiesAuditMap = (Map<String,Map<String,Map<String,Double>>>)request.getAttribute("liabilitiesAuditMap");
Map<String,Map<String,Map<String,Double>>> expenditureAuditMap = (Map<String,Map<String,Map<String,Double>>>)request.getAttribute("expenditureAuditMap");
Map<String,Map<String,Map<String,Double>>> assetsAuditMap = (Map<String,Map<String,Map<String,Double>>>)request.getAttribute("assetsAuditMap");
List societyAuditMemberArrearsDetailsList = (List)request.getAttribute("societyAuditMemberArrearsDetailsList");
String currentTimeLineName = (String)request.getAttribute("currentTimeLine");
String previousTimeLineName = (String)request.getAttribute("previousTimeLine");

%>

<body>
<!-- Start Code for Header -->
<%@ include file="../common/appHeader.jsp" %>
<!-- End Code for Header -->

<!-- Start Code for Header -->
<%@ include file="../common/appMainMenu.jsp" %>
<!-- End Code for Header -->

<div class="contentBg">
	<div class="center">
	<div class="content">
		<h1><spring:message code="audit.viewAudit.form.header"/></h1>
		<p><spring:message code="audit.viewAudit.form.subHeader"/></p>
		
		<div class="infoDiv"><spring:message code="audit.viewAudit.label.viewAuditFor"/> &nbsp;<%=currentTimeLineName%></div>
		
		<div class="billContainer" id="auditPrintDiv">
		     
		    <div class="payeeInfoHolder">
		    </div>
	        
	        <!-- Start of Income Audit -->	
			<div class="perticulars">
			   <table class="leftTable" border=1px; cellPadding=10px;>
			 		<tr>
			 			<th width="40%">Income</th>
			 			<th width="30%" colspan="2"><%=currentTimeLineName%></th>
			 			<th width="30%" colspan="2"><%=previousTimeLineName%></th>
			 		</tr>
			 	
			    <%
			    Iterator incomeHeadTypeIterator =  incomeAuditMap.keySet().iterator();
			    Double incomeHeadTypeGrandTotalForCurrent = new Double(0);
			    Double incomeHeadTypeGrandTotalForPrevious = new Double(0);
			    while(incomeHeadTypeIterator.hasNext()) 
			    {	   
			     String incomeHeadTypeKeyName = (String) incomeHeadTypeIterator.next();
			     Double incomeHeadTypeTotalForCurrent = new Double(0);
			     Double incomeHeadTypeTotalForPrevious = new Double(0);
			    %>
			     	<tr>
				 		<td><b><%=incomeHeadTypeKeyName%></b></td>
				 		<td width="15%"></td>
				 		<td width="15%"></td>
				 		<td width="15%"></td>
				 		<td width="15%"></td>
				 	</tr>
			    <%
			     Map<String,Map<String,Double>> incomeHeadTypeMap =  incomeAuditMap.get(incomeHeadTypeKeyName);
			   	 Iterator incomeSubHeadTypeIterator = incomeHeadTypeMap.keySet().iterator();
			   	   while(incomeSubHeadTypeIterator.hasNext()) 
				   {
			   		String incomeSubHeadTypeKeyName = (String) incomeSubHeadTypeIterator.next();
			   		Map<String,Double> incomeSubHeadTypeMap = incomeHeadTypeMap.get(incomeSubHeadTypeKeyName);
			   		Double currentTimeLineValue = incomeSubHeadTypeMap.get(currentTimeLineName);
			   		Double previousTimeLineValue = incomeSubHeadTypeMap.get(previousTimeLineName);
			   		
			   	%>	
			   		<tr>
				 		<td><%=incomeSubHeadTypeKeyName%></td>
			    		<%if(currentTimeLineValue != null){
			    			incomeHeadTypeTotalForCurrent += currentTimeLineValue;
			    			incomeHeadTypeGrandTotalForCurrent += currentTimeLineValue;
			    		%>
			    		<td align="right"><%=currentTimeLineValue%></td>
			    		<% } else { %>
				 		<td></td>		
				 		<% } %>
				 		<td></td>		 		
				 		<%if(previousTimeLineValue != null){ 
				 			incomeHeadTypeTotalForPrevious += previousTimeLineValue;
				 			incomeHeadTypeGrandTotalForPrevious += previousTimeLineValue;
				 		%>
			    		<td align="right"><%=previousTimeLineValue%></td>
			    		<% } else { %>
			    		<td></td>
			    		<% } %>
			    		<td></td>
			   	   </tr>
			   	<%		
				   } // End of while(incomeSubHeadTypeIterator.hasNext())
			    %>
			       <tr bgcolor="LightGrey">
				 		<td><b>Total</b></td>
			    		<td></td>
			    		<td align="right"><b><%=incomeHeadTypeTotalForCurrent%></b></td>
			    		<td></td>		
				 		<td align="right"><b><%=incomeHeadTypeTotalForPrevious%></b></td>
			    		
			   	   </tr>
			    <%   		   
			    } // End of While  incomeHeadTypeIterator
			 	%>
			 	<tr bgcolor="LightGrey">
				 		<td><b>Total<b></td>
			    		<td></td>
			    		<td align="right"><b><%=incomeHeadTypeGrandTotalForCurrent%></b></td>
			    		<td></td>		
				 		<td align="right"><b><%=incomeHeadTypeGrandTotalForPrevious%></b></td>			    		
			   	 </tr>
			 	</table>
			</div>
			
			
			<!-- End Of Income -->
			
			
			<!-- Start of Expenditure -->
			
			<div class="perticulars">
			   <table class="leftTable" border=1px; cellPadding=10px;>
			 		<tr>
			 			<th width="40%">Expenditure</th>
			 			<th width="30%" colspan="2"><%=currentTimeLineName%></th>
			 			<th width="30%" colspan="2"><%=previousTimeLineName%></th>
			 		</tr>
			 	
			    <%
			    Iterator expenditureHeadTypeIterator =   expenditureAuditMap.keySet().iterator();
			    Double expenditureHeadTypeGrandTotalForCurrent = new Double(0);
			    Double expenditureHeadTypeGrandTotalForPrevious = new Double(0);
			    while(expenditureHeadTypeIterator.hasNext()) 
			    {	   
			     String expenditureHeadTypeKeyName = (String) expenditureHeadTypeIterator.next();
			     Double expenditureHeadTypeTotalForCurrent = new Double(0);
			     Double expenditureHeadTypeTotalForPrevious = new Double(0);
			    %>
			     	<tr>
				 		<td><b><%=expenditureHeadTypeKeyName%></b></td>
				 		<td width="15%"></td>
				 		<td width="15%"></td>
				 		<td width="15%"></td>
				 		<td width="15%"></td>
				 	</tr>
			    <%
			     Map<String,Map<String,Double>> expenditureHeadTypeMap =  expenditureAuditMap.get(expenditureHeadTypeKeyName);
			   	 Iterator expenditureSubHeadTypeIterator = expenditureHeadTypeMap.keySet().iterator();
			   	   while(expenditureSubHeadTypeIterator.hasNext()) 
				   {
			   		String expenditureSubHeadTypeKeyName = (String) expenditureSubHeadTypeIterator.next();
			   		Map<String,Double> expenditureSubHeadTypeMap = expenditureHeadTypeMap.get(expenditureSubHeadTypeKeyName);
			   		Double currentTimeLineValue = expenditureSubHeadTypeMap.get(currentTimeLineName);
			   		Double previousTimeLineValue = expenditureSubHeadTypeMap.get(previousTimeLineName);
			   		
			   	%>	
			   		<tr>
				 		<td><%=expenditureSubHeadTypeKeyName%></td>
			    		<%if(currentTimeLineValue != null){
			    			expenditureHeadTypeTotalForCurrent += currentTimeLineValue;
			    			expenditureHeadTypeGrandTotalForCurrent += currentTimeLineValue;
			    		%>
			    		<td align="right"><%=currentTimeLineValue%></td>
			    		<% } else { %>
				 		<td></td>		
				 		<% } %>
				 		<td></td>		 		
				 		<%if(previousTimeLineValue != null){ 
				 			expenditureHeadTypeTotalForPrevious += previousTimeLineValue;
				 			expenditureHeadTypeGrandTotalForPrevious += previousTimeLineValue;
				 		%>
			    		<td align="right"><%=previousTimeLineValue%></td>
			    		<% } else { %>
			    		<td></td>
			    		<% } %>
			    		<td></td>
			   	   </tr>
			   	<%		
				   } // End of while(incomeSubHeadTypeIterator.hasNext())
			    %>
			       <tr bgcolor="LightGrey">
				 		<td><b>Total</b></td>
			    		<td></td>
			    		<td align="right"><b><%=expenditureHeadTypeTotalForCurrent%></b></td>
			    		<td></td>		
				 		<td align="right"><b><%=expenditureHeadTypeTotalForPrevious%></b></td>			    		
			   	   </tr>
			    <%   		   
			    } // End of While  incomeHeadTypeIterator
			 	%>
			 	<tr bgcolor="LightGrey">
				 		<td><b>Total<b></td>
			    		<td></td>
			    		<td align="right"><b><%=expenditureHeadTypeGrandTotalForCurrent%></b></td>
			    		<td></td>		
				 		<td align="right"><b><%=expenditureHeadTypeGrandTotalForPrevious%></b></td>			    		
			   	 </tr>
			 	</table>
			</div>
			
		    <!-- End of Expenditure -->
		    
		    
		    <!-- Start of Liability Audit -->	
			<div class="perticulars">
			   <table class="leftTable" border=1px; cellPadding=10px;>
			 		<tr>
			 			<th width="40%">Liabilities</th>
			 			<th width="30%" colspan="2"><%=currentTimeLineName%></th>
			 			<th width="30%" colspan="2"><%=previousTimeLineName%></th>
			 		</tr>
			 	
			    <%
			    Iterator liabilitiesHeadTypeIterator =  liabilitiesAuditMap.keySet().iterator();
			    Double liabilitiesHeadTypeGrandTotalForCurrent = new Double(0);
			    Double liabilitiesHeadTypeGrandTotalForPrevious = new Double(0);
			    while(liabilitiesHeadTypeIterator.hasNext()) 
			    {	   
			     String liabilitiesHeadTypeKeyName = (String) liabilitiesHeadTypeIterator.next();
			     Double liabilitiesHeadTypeTotalForCurrent = new Double(0);
			     Double liabilitiesHeadTypeTotalForPrevious = new Double(0);
			    %>
			     	<tr>
				 		<td><b><%=liabilitiesHeadTypeKeyName%></b></td>
				 		<td width="15%"></td>
				 		<td width="15%"></td>
				 		<td width="15%"></td>
				 		<td width="15%"></td>
				 	</tr>
			    <%
			     Map<String,Map<String,Double>> liabilitiesHeadTypeMap =  liabilitiesAuditMap.get(liabilitiesHeadTypeKeyName);
			   	 Iterator liabilitiesSubHeadTypeIterator = liabilitiesHeadTypeMap.keySet().iterator();
			   	   while(liabilitiesSubHeadTypeIterator.hasNext()) 
				   {
			   		String liabilitiesSubHeadTypeKeyName = (String) liabilitiesSubHeadTypeIterator.next();
			   		Map<String,Double> liabilitiesSubHeadTypeMap = liabilitiesHeadTypeMap.get(liabilitiesSubHeadTypeKeyName);
			   		Double currentTimeLineValue = liabilitiesSubHeadTypeMap.get(currentTimeLineName);
			   		Double previousTimeLineValue = liabilitiesSubHeadTypeMap.get(previousTimeLineName);
			   		
			   	%>	
			   		<tr>
				 		<td><%=liabilitiesSubHeadTypeKeyName%></td>
			    		<%if(currentTimeLineValue != null){
			    			liabilitiesHeadTypeTotalForCurrent += currentTimeLineValue;
			    			liabilitiesHeadTypeGrandTotalForCurrent += currentTimeLineValue;
			    		%>
			    		<td align="right"><%=currentTimeLineValue%></td>
			    		<% } else { %>
				 		<td></td>		
				 		<% } %>
				 		<td></td>		 		
				 		<%if(previousTimeLineValue != null){ 
				 			liabilitiesHeadTypeTotalForPrevious += previousTimeLineValue;
				 			liabilitiesHeadTypeGrandTotalForPrevious += previousTimeLineValue;
				 		%>
			    		<td align="right"><%=previousTimeLineValue%></td>
			    		<% } else { %>
			    		<td></td>
			    		<% } %>
			    		<td></td>
			   	   </tr>
			   	<%		
				   } // End of while(liabilitiesSubHeadTypeIterator.hasNext())
			    %>
			       <tr bgcolor="LightGrey">
				 		<td><b>Total</b></td>
			    		<td></td>
			    		<td align="right"><b><%=liabilitiesHeadTypeTotalForCurrent%></b></td>
			    		<td></td>		
				 		<td align="right"><b><%=liabilitiesHeadTypeTotalForPrevious%></b></td>
			    		
			   	   </tr>
			    <%   		   
			    } // End of While  liabilitiesHeadTypeIterator
			 	%>
			 	<tr bgcolor="LightGrey">
				 		<td><b>Total<b></td>
			    		<td></td>
			    		<td align="right"><b><%=liabilitiesHeadTypeGrandTotalForCurrent%></b></td>
			    		<td></td>		
				 		<td align="right"><b><%=liabilitiesHeadTypeGrandTotalForPrevious%></b></td>			    		
			   	 </tr>
			 	</table>
			</div>
			
			
			<!-- End Of liability -->
		    
		    
		    <!-- Start of Assets Audit -->	
			<div class="perticulars">
			   <table class="leftTable" border=1px; cellPadding=10px;>
			 		<tr>
			 			<th width="40%">Assets</th>
			 			<th width="30%" colspan="2"><%=currentTimeLineName%></th>
			 			<th width="30%" colspan="2"><%=previousTimeLineName%></th>
			 		</tr>
			 	
			    <%
			    Iterator assetsHeadTypeIterator =  assetsAuditMap.keySet().iterator();
			    Double assetsHeadTypeGrandTotalForCurrent = new Double(0);
			    Double assetsHeadTypeGrandTotalForPrevious = new Double(0);
			    while(assetsHeadTypeIterator.hasNext()) 
			    {	   
			     String assetsHeadTypeKeyName = (String) assetsHeadTypeIterator.next();
			     Double assetsHeadTypeTotalForCurrent = new Double(0);
			     Double assetsHeadTypeTotalForPrevious = new Double(0);
			    %>
			     	<tr>
				 		<td><b><%=assetsHeadTypeKeyName%></b></td>
				 		<td width="15%"></td>
				 		<td width="15%"></td>
				 		<td width="15%"></td>
				 		<td width="15%"></td>
				 	</tr>
			    <%
			     Map<String,Map<String,Double>> assetsHeadTypeMap =  assetsAuditMap.get(assetsHeadTypeKeyName);
			   	 Iterator assetsSubHeadTypeIterator = assetsHeadTypeMap.keySet().iterator();
			   	   while(assetsSubHeadTypeIterator.hasNext()) 
				   {
			   		String assetsSubHeadTypeKeyName = (String) assetsSubHeadTypeIterator.next();
			   		Map<String,Double> assetsSubHeadTypeMap = assetsHeadTypeMap.get(assetsSubHeadTypeKeyName);
			   		Double currentTimeLineValue = assetsSubHeadTypeMap.get(currentTimeLineName);
			   		Double previousTimeLineValue = assetsSubHeadTypeMap.get(previousTimeLineName);
			   		
			   	%>	
			   		<tr>
				 		<td><%=assetsSubHeadTypeKeyName%></td>
			    		<%if(currentTimeLineValue != null){
			    			assetsHeadTypeTotalForCurrent += currentTimeLineValue;
			    			assetsHeadTypeGrandTotalForCurrent += currentTimeLineValue;
			    		%>
			    		<td align="right"><%=currentTimeLineValue%></td>
			    		<% } else { %>
				 		<td></td>		
				 		<% } %>
				 		<td></td>		 		
				 		<%if(previousTimeLineValue != null){ 
				 			assetsHeadTypeTotalForPrevious += previousTimeLineValue;
				 			assetsHeadTypeGrandTotalForPrevious += previousTimeLineValue;
				 		%>
			    		<td align="right"><%=previousTimeLineValue%></td>
			    		<% } else { %>
			    		<td></td>
			    		<% } %>
			    		<td></td>
			   	   </tr>
			   	<%		
				   } // End of while(assetsSubHeadTypeIterator.hasNext())
			    %>
			       <tr bgcolor="LightGrey">
				 		<td><b>Total</b></td>
			    		<td></td>
			    		<td align="right"><b><%=assetsHeadTypeTotalForCurrent%></b></td>
			    		<td></td>		
				 		<td align="right"><b><%=assetsHeadTypeTotalForPrevious%></b></td>
			    		
			   	   </tr>
			    <%   		   
			    } // End of While  assetsHeadTypeIterator
			 	%>
			 	<tr bgcolor="LightGrey">
				 		<td><b>Total<b></td>
			    		<td></td>
			    		<td align="right"><b><%=assetsHeadTypeGrandTotalForCurrent%></b></td>
			    		<td></td>		
				 		<td align="right"><b><%=assetsHeadTypeGrandTotalForPrevious%></b></td>			    		
			   	 </tr>
			 	</table>
			</div>
			
			
			<!-- End Of Assets -->			
			
			
			<!-- Start of  Member Arrears -->	
			<div class="perticulars">
			   <table class="leftTable" border=1px; cellPadding=10px;>
			 		<tr>
			 			<th width="10%">SR. NO</th>
			 			<th width="30%">MEMBER's NAME</th>
			 			<th width="20%">BLOCK NO.</th>
			 			<th width="20%">DEBIT AMOUNT</th>
			 			<th width="20%">CREDIT AMOUNT</th>
			 		</tr>
			 	
			    <%
			    Iterator societyAuditMemberArrearsDetailsResultIterator = societyAuditMemberArrearsDetailsList.iterator();
				int membersArrearsCounter = 0;
				Double totalDebitAmount = new Double(0);
				Double totalCreditAmount = new Double(0);
				while(societyAuditMemberArrearsDetailsResultIterator.hasNext()){         
					membersArrearsCounter++;
					Object[] row = (Object[])societyAuditMemberArrearsDetailsResultIterator.next(); 
				    String memberName = (String)row[0];
				    String blockNumber = (String)row[1];
				    Double amount = null;
				    Boolean isDebitOrCredit = (Boolean) row[2];				    
				    if(isDebitOrCredit)
				    {
				    	amount = Math.abs((Double)row[3]);
				    	totalDebitAmount += amount;
				    }
				    else
				    {
				    	amount = Math.abs((Double)row[4]);
				    	totalCreditAmount += amount;
				    }
				
			    %>
			     	<tr>
				 		<td><b><%=membersArrearsCounter%></b></td>
				 		<td><%=memberName %></td>
				 		<td><%=blockNumber %></td>
				 		<% if(isDebitOrCredit) { %>
				 		<td><%=amount%></td>
				 		<td></td>
				 		<% } else  { %>
				 		<td></td>
				 		<td><%=amount%></td>				 		
				 		<% } %>
				 	</tr>
			    <%		
				   }// end of while(societyAuditMemberArrearsDetailsResultIterator.hasNext())
			    %>
			       <tr bgcolor="LightGrey">
				 		<td colspan="3"><b>Total</b></td>
			    		<td align="right"><b><%=totalDebitAmount%></b></td>
			    		<td align="right"><b><%=totalCreditAmount%></b></td>			    		
			   	   </tr>
			     	<tr bgcolor="LightGrey">
				 		<td colspan="3"><b>TOTAL ARREARS<b></td>
			    		<td align="right" colspan="2"><b><%=(totalDebitAmount-totalCreditAmount)%></b></td>			    					    		
			   	 	</tr>
			 	</table>
			</div>
			
			
			<!-- End Of Member Arrears -->
		
		</div>
		
		<div class="form" style="width:100%;">
		<div class="buttonHolder">
			<input class="secondary" style="margin-left:210px;" type="button" id="back" value="<spring:message code="common.button.back"/>" onclick="javascript: backURL();"/>
			<button id="print" class="primary" onclick="javascript:printDivElement('auditPrintDiv');">
					<spring:message code="common.button.print"/>
			</button>
		</div>
		</div>
		
	</div>
	</div>
</div>

<!-- Start Code for Footer -->
<%@include file="../common/appFooter.jsp" %>
<!-- End Code for Footer -->
<script type="text/javascript" src="<%=jqueryPath%>/print/jquery.jqprint.js?${Server_Token_Value}"></script>
</body>

</html>
		