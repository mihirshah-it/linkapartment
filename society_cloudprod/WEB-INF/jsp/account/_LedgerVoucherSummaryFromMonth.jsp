<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="app.societywala.account.bo.SocietyLedgerAccountBO"%>
<%@page import="java.util.List"%>
<%@include file="../common/ajaxConfig.jsp"%>
<%
	List<SocietyLedgerAccountBO> societyLedgerAccountBOList = (List<SocietyLedgerAccountBO>)request.getAttribute("societyLedgerAccountBOList");
	Double grandTotalDebit = new Double(0);
	Double grandTotalCredit = new Double(0);
	NumberFormat  numberFormatter = new DecimalFormat(CommonConstant.NUMBER_FORMAT);
%>	
	<table width="90%" border=1px; cellPadding=10px; align="center">
		<thead>
			<tr>
				<td width="15%">Date</td>
				<td width="40%"><b>Particular</b></td>
				<td width="15%">Receipt Number</td>
				<td width="15%">Debit</td>
				<td width="15%">Credit</td>		
			</tr>
		</thead>
		<tbody>
		    <c:forEach items="${societyLedgerAccountBOList}" var="societyLedgerAccountBO">
			
			<tr class="trHandOverBGColour" onclick="showVoucher(${societyLedgerAccountBO.societyJournalAccountBO.journalEntityTypeId} , ${societyLedgerAccountBO.societyJournalAccountBO.journalEntityId});">	
				<c:set var="totalDebitAmt" value="${societyLedgerAccountBO.debitAmount}" ></c:set>
				<c:set var="totalCreditAmt" value="${societyLedgerAccountBO.creditAmount}" ></c:set>
				<td><fmt:formatDate pattern="<%=CommonConstant.dateUIFormatter%>" value="${societyLedgerAccountBO.societyJournalAccountBO.journalCreationDate}"/></td>
				<td>${societyLedgerAccountBO.societyJournalAccountBO.narration}</td>
				<td>${societyLedgerAccountBO.societyJournalAccountBO.sequenceNumber}</td>
				<td>
				  		
						<c:choose>
							<c:when test="${totalDebitAmt eq null or totalDebitAmt <= 0}">
				  					
							</c:when>
							<c:otherwise>
									<% 
									Double tmpDebit = (Double)pageContext.getAttribute("totalDebitAmt");
								    grandTotalDebit +=  tmpDebit; 
								    %>
									<fmt:formatNumber type="number" pattern="<%=CommonConstant.NUMBER_FORMAT%>" value="${totalDebitAmt}" />				   					
							</c:otherwise>							
				    	</c:choose>				    		 
				    					    
				</td>
				<td>
					<c:choose>
							<c:when test="${totalCreditAmt eq null or totalDebitAmt <= 0}">
				  					
							</c:when>
							<c:otherwise>
									<% 
									Double tmpCredit = (Double)pageContext.getAttribute("totalCreditAmt");
								    grandTotalCredit +=  tmpCredit; 
								    %>
									<fmt:formatNumber type="number" pattern="<%=CommonConstant.NUMBER_FORMAT%>" value="${totalCreditAmt}" />
				   			</c:otherwise>							
				    </c:choose>
				</td>		
			</tr>
			
			</c:forEach>
			<tr>
				<td colspan="3"><b>Grand Total</b></td>
				<td><%=numberFormatter.format(grandTotalDebit)%></td>
				<td><%=numberFormatter.format(grandTotalCredit)%></td>
			</tr>
		</tbody>			
	</table>