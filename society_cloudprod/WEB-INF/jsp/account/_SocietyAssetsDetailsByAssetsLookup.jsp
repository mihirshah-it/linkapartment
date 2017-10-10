<%@page import="app.societywala.account.bo.AccountLedgerStatus"%>
<%@page import="app.societywala.account.bo.LedgerOpeningClosingAmountBO"%>
<%@page import="app.societywala.account.bo.AccountLedgerOtherFieldOptionBO"%>
<%@page import="java.util.Map"%>
<%@page import="app.societywala.account.bo.AccountLedgerTypeHeadBO"%>
<%@page import="app.societywala.account.bo.AccountLedgerHeadOtherFieldBO"%>
<%@page import="app.societywala.account.bo.AccountLedgerSubTypeBO"%>
<%@page import="java.util.List"%>
<%@include file="../common/ajaxConfig.jsp" %>

<%
List<AccountLedgerSubTypeBO> societyAssetsBOList = (List<AccountLedgerSubTypeBO>)request.getAttribute("societyAssetsBOList");
List<AccountLedgerHeadOtherFieldBO> assetsLookupFieldBOList =  (List<AccountLedgerHeadOtherFieldBO>)request.getAttribute("assetsLookupFieldBOList");
Map<Long , List<AccountLedgerHeadOtherFieldBO>> mapFieldOptionBOList = (Map<Long , List<AccountLedgerHeadOtherFieldBO>>)request.getAttribute("mapFieldOptionBOList");
AccountLedgerTypeHeadBO assetsLookupBO = (AccountLedgerTypeHeadBO)request.getAttribute("assetsLookupBO");
Map<Long , Map<Long,String>> mapSocietyAssetsFieldValueMap = (Map<Long , Map<Long,String>>)request.getAttribute("mapSocietyAssetsFieldValueMap");
Map<Long , LedgerOpeningClosingAmountBO> mapSocietySubOpeningClosingBO = (Map<Long , LedgerOpeningClosingAmountBO>)request.getAttribute("mapSocietySubOpeningClosingBO");
%>

<table class="table table-bordered table-striped table-hover dt-responsive">
		<thead>
			<tr>
				<td>Name</td>
				<c:forEach items="${assetsLookupFieldBOList}" var="assetsFieldBO">
				  <td>${assetsFieldBO.fieldName}</td>	
				</c:forEach>
				<td>Opening Amount</td>
				<td>Status</td>
				<td>Actions</td>		
			</tr>
		</thead>
		<tbody>
		    <c:forEach items="${societyAssetsBOList}" var="societyAssetsBO">
			<tr>
				<td>${societyAssetsBO.ledgerTypeTitle}</td>
				<c:forEach items="${assetsLookupFieldBOList}" var="assetsLookupFieldBO">
					<c:choose>
						<c:when test="${mapFieldOptionBOList[assetsLookupFieldBO.accountLedgerHeadOtherFieldId] == null}">
							<td>${mapSocietyAssetsFieldValueMap[societyAssetsBO.accountLedgerSubTypeId][assetsLookupFieldBO.accountLedgerHeadOtherFieldId]}</td>
						</c:when>
						<c:otherwise>
						    <c:set var="fieldOptionValue" value=""/>
						    <c:forEach items="${mapFieldOptionBOList[assetsLookupFieldBO.accountLedgerHeadOtherFieldId]}" var="fieldOptionBO">
								<c:if test="${fieldOptionBO.accountLedgerHeadOtherFieldOptionId == mapSocietyAssetsFieldValueMap[societyAssetsBO.accountLedgerSubTypeId][assetsLookupFieldBO.accountLedgerHeadOtherFieldId]}">
								 	<c:set var="fieldOptionValue" value="${fieldOptionBO.optionValue}"/>
								</c:if>
							</c:forEach>
							<td>${fieldOptionValue}</td>
						</c:otherwise>
					</c:choose>	
				</c:forEach>
				<td>
					<c:choose>
						<c:when test="${mapSocietySubOpeningClosingBO[societyAssetsBO.accountLedgerSubTypeId] eq null}">
				    			-
				    	</c:when>
				    	<c:when test="${mapSocietySubOpeningClosingBO[societyAssetsBO.accountLedgerSubTypeId] ne null}">
				    			<c:choose>
				    				<c:when test="${(mapSocietySubOpeningClosingBO[societyAssetsBO.accountLedgerSubTypeId].openingCreditBalance) > 0}">
				    					${mapSocietySubOpeningClosingBO[societyAssetsBO.accountLedgerSubTypeId].openingCreditBalance} Cr.
				    				</c:when>
				    				<c:when test="${(mapSocietySubOpeningClosingBO[societyAssetsBO.accountLedgerSubTypeId].openingDebitBalance) > 0}">
				    					${mapSocietySubOpeningClosingBO[societyAssetsBO.accountLedgerSubTypeId].openingDebitBalance} Dr.
				    				</c:when>
				    				<c:when test="${(mapSocietySubOpeningClosingBO[societyAssetsBO.accountLedgerSubTypeId].openingDebitBalance) == 0 and (mapSocietySubOpeningClosingBO[societyAssetsBO.accountLedgerSubTypeId].openingCreditBalance) == 0 }">
				    					-
				    				</c:when>
				    			</c:choose>				    		 
				    	</c:when>
				    </c:choose>				    
				</td>
				<td>
					<c:set var="assetsLedgerStatus" value="${societyAssetsBO.accountLedgerStatus}"></c:set>
					<%
						Integer assetsLedgerStatusID = (Integer)pageContext.getAttribute("assetsLedgerStatus");
					%>
					<%=AccountLedgerStatus.getStatusName(assetsLedgerStatusID)%>
										
				</td>
				<td>
					<div class="btn-group">
          	                 <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
          	                 <span class="caret"></span>
          	                 <span class="sr-only">Toggle Dropdown</span>
          	                 </button>
          	                 <ul class="dropdown-menu" role="menu">
          	                  <c:if test="${societyAssetsBO.isSystemDefined == true }">
								<li><a href='javascript:;' onclick="javascript:editAssets('<%=assetsLookupBO.getAccountLedgerTypeHeadId()%>','${societyAssetsBO.accountLedgerSubTypeId}');" title="Edit Amount">Edit Amount</a></li>
							</c:if>
							<c:if test="${societyAssetsBO.isSystemDefined == false}">
								<li><a href='javascript:;' onclick="javascript:editAssets('<%=assetsLookupBO.getAccountLedgerTypeHeadId()%>','${societyAssetsBO.accountLedgerSubTypeId}');" title="Edit Details">Edit Details</a></li>
								<li><a href='javascript:;' onclick="javascript:deleteAssets('<%=assetsLookupBO.getAccountLedgerTypeHeadId()%>','${societyAssetsBO.accountLedgerSubTypeId}','${societyAssetsBO.ledgerTypeTitle}');" title="Delete Account">Delete Account</a></li>
								<li><a href='javascript:;' onclick="javascript:closeAssets('<%=assetsLookupBO.getAccountLedgerTypeHeadId()%>','${societyAssetsBO.accountLedgerSubTypeId}','${societyAssetsBO.ledgerTypeTitle}');" title="Close Account">Close Account</a></li>
							</c:if>
          	                </ul>
          	         </div>					
				</td>		
			</tr>
			</c:forEach>
		</tbody>	
		
</table>