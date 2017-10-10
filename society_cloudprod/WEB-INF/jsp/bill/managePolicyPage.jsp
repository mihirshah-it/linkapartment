<%@page import="app.societywala.bill.bo.BillPolicyType"%>
<%@page import="app.societywala.common.bo.PolicyMasterBO"%>
<%@page import="java.util.Map"%>
<%@page import="app.societywala.society.bo.SocietyPolicyBO"%>
<%@page import="java.util.List"%>
<%@include file="../common/appConfig.jsp" %>
<html>
<HEAD>
	<%@include file="../common/appMetaConfig.jsp"%>
	<TITLE><spring:message code="common.title.label.product"/> :: Bill Policy Details</TITLE>
</HEAD>

<%
String mainMenu = "manageBills";
String subMenu  = "billPolicy";
String formSubmitAction=ctxPath+"/bill/saveSocietyPolicyDetails.htm";
List<SocietyPolicyBO> societyPolicyList = (List<SocietyPolicyBO>)request.getAttribute("societyPolicyList");
List<PolicyMasterBO> allPolicyMasterBO = (List<PolicyMasterBO>)request.getAttribute("allPolicyMasterBO");

Map<String,Object> sessionCommonModelMap = (Map<String,Object>) session.getAttribute(CommonConstant.SESSION_COMMON_MODEL_MAP);
String pageRenderMode = (String)sessionCommonModelMap.get(CommonConstant.PAGE_RENDER_MODE);
%>
<c:set var="billDuePenaltyPolicyId" value="<%=BillPolicyType.BILL_DUE_PENALTY_ID%>"/>
<c:set var="billAuditGenerationPolicyId" value="<%=BillPolicyType.BILL_AUDIT_GENERATION_TYPE_ID%>"/>
<c:set var="billGenerationDatePolicyId" value="<%=BillPolicyType.BILL_GENERATION_DATE_ID%>"/>
<c:set var="billDueDatePolicyId" value="<%=BillPolicyType.BILL_DUE_DATE_ID%>"/>
<c:set var="billGenerationMode" value="<%=BillPolicyType.BILL_GENERATION_MODE%>"/>
<c:set var="billGenerationCycleId" value="<%=BillPolicyType.BILL_GENERATION_CYCLE%>"/>
<c:set var="billSequenceGenerationModeId" value="<%=BillPolicyType.BILL_RECEIPT_SEQUENCE_GENRATION_MODE%>"/>
<c:set var="billPrefixCode" value="<%=BillPolicyType.MEMBER_BILL_NUMBER_PREFIX%>"/>
<c:set var="billSuffixCode" value="<%=BillPolicyType.MEMBER_BILL_NUMBER_SUFFIX%>"/>
<c:set var="billReceiptPrefixCode" value="<%=BillPolicyType.MEMBER_BILL_RECEIPT_NUMBER_PREFIX%>"/>
<c:set var="billReceiptSuffixCode" value="<%=BillPolicyType.MEMBER_BILL_RECEIPT_NUMBER_SUFFIX%>"/>
<c:set var="interestCalculationMode" value="<%=BillPolicyType.INTEREST_GENERATION_MODE%>"/>
<c:set var="billDefaultDayPenaltyPolicyId" value="<%=BillPolicyType.DEFAULT_DAY_INTEREST_MODE%>"/>
<c:set var="valueForMemberOwnerType" value="<%=BillPolicyType.POLICY_FOR_MEMBER_OWNER %>"/>
<c:set var="valueForMemberTenantType" value="<%=BillPolicyType.POLICY_FOR_MEMBER_TENANT %>"/>
<c:set var="billNotes" value="<%=BillPolicyType.BILL_NOTES %>"/>

<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
<%@include file="../common/header.jsp"%>
  <%@include file="../common/leftSideMenu.jsp"%>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
		  <h1>
	       		<spring:message code="bill.policy.form.header"/>	       		
	      </h1>
	      <hsCommonTag:breadCrumb pageTitle="Bill Policy Details" isFirstIndex="true"/> 
	 </section>	 
	 <section class="content">
	 	<div class="row">
    		<div class="col-md-12">
    				<form class="form" method="post" action="<%=formSubmitAction%>" role="form" id="policyForm">
    					<div class="box box-primary">
    					<div class="box-body">
    					<input type="hidden" name="policyListCounter" id="policyListCounter" value="<%=allPolicyMasterBO.size()%>"/>
						<c:forEach items="${allPolicyMasterBO}" var="policyMasterBO" varStatus="counter">
							<c:set var="requiredProp" value=""/>
						    <c:if test="${policyMasterBO.isMandatory == true }">
						    	 <c:set var="requiredProp" value="required"/>
						    </c:if>
						    <c:set var="memberTypeCounter" value="1"/>
						    <c:if test = "${policyMasterBO.hasTenantMemberValue eq true}">
						      	<c:set var="memberTypeCounter" value="2"/>
						    </c:if>
				    		<input type="hidden" id="policyForMemberTypeCount${counter.count}" name="policyForMemberTypeCount${counter.count}" value="${memberTypeCounter}"/>
							<c:forEach begin="1" end="${memberTypeCounter}" var="memberCounter">
								<c:set var="isPolicyDeclared" value="false"/>
								<c:set var="policyValue" value=""/>
								<c:set var="policyValueMemberType" value="${memberCounter}"/>
								<c:set var="isCustomeValue" value="true"/>
								<c:set var="isValueInPercntage" value="false"/>
								<c:set var="societyPolicyId" value=""/>
								<c:set var="policyStatus" value="new" />
								<c:forEach items="${societyPolicyList}" var="societyPolicyBO" varStatus="societyPolicyCounter">				  
						 			 <c:if test = "${policyMasterBO.policyMasterId == societyPolicyBO.policyMasterBO.policyMasterId and societyPolicyBO.valueForMemberType eq memberCounter}">
						 			 	 <c:set var="policyValue" value="${societyPolicyBO.policyValue}"/>
										  <c:set var="isCustomeValue" value="${societyPolicyBO.isCustomValue}"/>
										  <c:set var="isValueInPercntage" value="${societyPolicyBO.isValueInPercentage}"/>
										  <c:set var="societyPolicyId" value="${societyPolicyBO.societyPolicyId}"/>
										  <c:set var="policyValueMemberType" value="${societyPolicyBO.valueForMemberType}"/>
										  <c:set var="policyStatus" value="update" />				  
						 			 </c:if>
						 		</c:forEach>
						 			 	
				 			 	<div class="form-group row">
				 			 		<c:if test="${policyMasterBO.policyMasterId != billNotes}">
				 			 			<div class="col-md-6">
				 			 		</c:if>
				 			 		<c:if test="${policyMasterBO.policyMasterId == billNotes}">
				 			 			<div class="col-md-12">
				 			 		</c:if>
				 			 		
				 			 		<c:choose>
									   	 <c:when test="${policyMasterBO.hasTenantMemberValue eq true and policyValueMemberType eq valueForMemberOwnerType}">
									   	 	<label class="control-label ${requiredProp}" for="valueForMemberType${counter.count}_${memberCounter}">${policyMasterBO.policyName} (for member)</label>
									   	 	<input type="hidden" name="valueForMemberType${counter.count}_${memberCounter}" id="valueForMemberType${counter.count}_${memberCounter}" value="${valueForMemberOwnerType}"/>
									   	 </c:when>
									   	 <c:when test="${policyMasterBO.hasTenantMemberValue eq true and policyValueMemberType eq valueForMemberTenantType}">
									   	 	<label class="control-label ${requiredProp}" for="valueForMemberType${counter.count}_${memberCounter}">${policyMasterBO.policyName} (for tenant)</label>
									   	 	<input type="hidden" name="valueForMemberType${counter.count}_${memberCounter}" id="valueForMemberType${counter.count}_${memberCounter}" value="${valueForMemberTenantType}"/>
									   	 </c:when>
									   	 <c:otherwise>
									   	 	<label class="control-label ${requiredProp}" for="valueForMemberType${counter.count}_${memberCounter}">${policyMasterBO.policyName}</label>
									   	 	<input type="hidden" name="valueForMemberType${counter.count}_${memberCounter}" id="valueForMemberType${counter.count}_${memberCounter}" value="${valueForMemberOwnerType}"/>
									   	 </c:otherwise>
				   	 				</c:choose>
				   	 				
				   	 			</div>						   	 				
				   	 				
				   	 				
				   	 				<input type="hidden" name="policyMasterId${counter.count}_${memberCounter}" id="policyMasterId${counter.count}_${memberCounter}" value="${policyMasterBO.policyMasterId}"/>
				   	 				
				   	 				<c:choose>
								      <c:when test="${policyMasterBO.policyMasterId == billPrefixCode or policyMasterBO.policyMasterId == billSuffixCode or policyMasterBO.policyMasterId == billReceiptPrefixCode or policyMasterBO.policyMasterId == billReceiptSuffixCode}">
								           <div class="col-md-3">
								           <select class="form-control" name="isPolicyIsCustomValue${counter.count}_${memberCounter}" id="isPolicyIsCustomValue${counter.count}_${memberCounter}" onchange="javascript:showHideCustomValue('${counter.count}');" ${requiredProp}>
								             <option value="false" <c:if test="${policyValue == 'FY_DATE'}"> selected </c:if> ><%=BillPolicyType.BILL_PREFIX_SUFFIX_FY_DATE_CODE%></option>
								             <option value="true" <c:if test="${isCustomeValue == true}"> selected </c:if>>Custom Code</option>						             
								           </select>
								           </div>							           
								      </c:when>						      
								     <c:otherwise>
								       <input type="hidden" name="isPolicyIsCustomValue${counter.count}_${memberCounter}" id="isPolicyIsCustomValue${counter.count}_${memberCounter}" value="${isCustomeValue}" />
								     </c:otherwise>
							     	</c:choose> 
				   	 				
				   	 				
				   	 				<c:choose>
							     	  <c:when test="${policyMasterBO.policyMasterId == billAuditGenerationPolicyId}">
							     	  	 <div class="col-md-3">
							     	  	 <select class="form-control" name="policyValue${counter.count}_${memberCounter}" id="policyValue${counter.count}_${memberCounter}" ${requiredProp}>
								             <option value="1" <c:if test="${policyValue == 1}"> selected </c:if>  >Yearly</option>
								             <option value="2" <c:if test="${policyValue == 2}"> selected </c:if> >Quarterly</option>
								             <option value="3" <c:if test="${policyValue == 3}"> selected </c:if> >Half Yearly</option>
								          </select>
								          </div>						        
								      </c:when>
								      <c:when test="${policyMasterBO.policyMasterId == billGenerationMode}">
								      	 <div class="col-md-3">
								      	 <select class="form-control" name="policyValue${counter.count}_${memberCounter}" id="policyValue${counter.count}_${memberCounter}"  ${requiredProp} >
								             <option value="<%=BillPolicyType.BILL_GENERATION_MODE_MANUALLY%>" <c:if test="${policyValue == 1}"> selected </c:if>  >Manually</option>
								             <option value="<%=BillPolicyType.BILL_GENERATION_MODE_AUTOMATIC%>" <c:if test="${policyValue == 2}"> selected </c:if> >Automatic</option>						            
								          </select>
								          </div>									        
								      </c:when>
								      <c:when test="${policyMasterBO.policyMasterId == billSequenceGenerationModeId}">
								      	 <div class="col-md-3">
								      	 <select class="form-control" name="policyValue${counter.count}_${memberCounter}" id="policyValue${counter.count}_${memberCounter}" ${requiredProp}>
								             <option value="<%=BillPolicyType.BILL_RECEIPT_SEQUENCE_GENERATION_MODE_SOCIETY%>" <c:if test="${policyValue == 1}"> selected </c:if>  >Society Wise</option>
								             <option value="<%=BillPolicyType.BILL_RECEIPT_SEQUENCE_GENERATION_MODE_PROPERTY%>" <c:if test="${policyValue == 2}"> selected </c:if> >Member Wise</option>						            
								          </select>
								          </div>										         
								      </c:when>
								      <c:when test="${policyMasterBO.policyMasterId == interestCalculationMode}">
								      	 <div class="col-md-3">
								      	 <select class="form-control" name="policyValue${counter.count}_${memberCounter}" id="policyValue${counter.count}_${memberCounter}" ${requiredProp}>
								             <option value="<%=BillPolicyType.SIMPLE_INTEREST%>" <c:if test="${policyValue == 1}"> selected </c:if>  >Simple Interest</option>
								             <option value="<%=BillPolicyType.COMPOUND_INTEREST%>" <c:if test="${policyValue == 2}"> selected </c:if> >Compound Interest</option>						            
								          </select>
								          </div>										         
								      </c:when>
								       <c:when test="${policyMasterBO.policyMasterId == billDefaultDayPenaltyPolicyId}">
								         <div class="col-md-3">
								         <select class="form-control" name="policyValue${counter.count}_${memberCounter}" id="policyValue${counter.count}_${memberCounter}" ${requiredProp}>
								             <option value="true" <c:if test="${policyValue == 'true'}"> selected </c:if>  >Enabled</option>
								             <option value="false" <c:if test="${policyValue == 'false'}"> selected </c:if> >Disabled</option>						            
								          </select>
								          </div>									          
								      </c:when>
								       <c:when test="${policyMasterBO.policyMasterId == billGenerationCycleId}">
								         <div class="col-md-3">
								         <select class="form-control" name="policyValue${counter.count}_${memberCounter}" id="policyValue${counter.count}_${memberCounter}" ${requiredProp}>
								             <option value="<%=BillPolicyType.BILL_FOR_EVERY_ONE_MONTH%>" <c:if test="${policyValue == 1}"> selected </c:if>  >Every 1 Month</option>
								             <option value="<%=BillPolicyType.BILL_FOR_EVERY_TWO_MONTH%>" <c:if test="${policyValue == 2}"> selected </c:if> >Every 2 Month</option>
								             <option value="<%=BillPolicyType.BILL_FOR_EVERY_THREE_MONTH%>" <c:if test="${policyValue == 3}"> selected </c:if> >Every 3 Month</option>
								             <option value="<%=BillPolicyType.BILL_FOR_EVERY_FOUR_MONTH%>" <c:if test="${policyValue == 4}"> selected </c:if> >Every 4 Month</option>
								             <option value="<%=BillPolicyType.BILL_FOR_EVERY_SIX_MONTH%>" <c:if test="${policyValue == 6}"> selected </c:if> >Every 6 Month</option>	
								             <option value="<%=BillPolicyType.BILL_FOR_ONCE_IN_A_YEAR%>" <c:if test="${policyValue == 12}"> selected </c:if> >Once In a Year</option>					             
								           </select>
								           </div>									          
								      </c:when>
								     <c:when test="${policyMasterBO.policyMasterId == billGenerationDatePolicyId}">
								         <div class="col-md-3">
								         <select class="form-control" name="policyValue${counter.count}_${memberCounter}" id="policyValue${counter.count}_${memberCounter}" ${requiredProp}>
								         <c:forEach  begin="1" end="27" var="dateCounter">
								         	  <option value="${dateCounter}" <c:if test="${policyValue == dateCounter}"> selected </c:if> >${dateCounter}</option>
								          </c:forEach>
								          </select>
								          </div>								         
								      </c:when>
								      <c:when test="${policyMasterBO.policyMasterId == billNotes}">
								      	<div class="col-md-10">	
								      	<textarea name="policyValue${counter.count}_${memberCounter}" id="policyValue${counter.count}_${memberCounter}" ${requiredProp}>${policyValue}</textarea>
								      	</div>
								      </c:when>								      
								      <c:when test="${policyMasterBO.policyMasterId == billPrefixCode or policyMasterBO.policyMasterId == billSuffixCode or policyMasterBO.policyMasterId == billReceiptPrefixCode or policyMasterBO.policyMasterId == billReceiptSuffixCode}">
								      	<div class="col-md-3">
								      	 <input class="form-control" type="text" name="policyValue${counter.count}_${memberCounter}" id="policyValue${counter.count}_${memberCounter}" value="${policyValue}" ${requiredProp}/>
								      	</div>
								      </c:when>
								      <c:otherwise>
								      	<div class="col-md-3">
								      	 <input class="form-control" type="number" name="policyValue${counter.count}_${memberCounter}" id="policyValue${counter.count}_${memberCounter}" value="${policyValue}" ${requiredProp}/>
								      	</div>
								       </c:otherwise>
							      </c:choose>	
							      
							      <c:choose>
			   	 				  <c:when test="${policyMasterBO.policyMasterId == billDuePenaltyPolicyId}">
			   	 				  	<div class="col-md-3">	
							           <select class="form-control col" name="isPolicyInPercentage${counter.count}_${memberCounter}" id="isPolicyInPercentage${counter.count}_${memberCounter}" ${requiredProp}>
							             <option value="true" <c:if test="${isValueInPercntage == true}"> selected </c:if>>% (p.a.)</option>
							             <option value="false" <c:if test="${isValueInPercntage == false}"> selected </c:if> >Rs.</option>
							           </select>
							        </div>
							      </c:when>						      
							     <c:otherwise>
							       <input type="hidden" name="isPolicyInPercentage${counter.count}_${memberCounter}" id="isPolicyInPercentage${counter.count}_${memberCounter}" value="false" />
							     </c:otherwise>
						     	</c:choose>									    
							     
							     <input type="hidden" name="societPolicyId${counter.count}_${memberCounter}" id="societPolicyId${counter.count}_${memberCounter}" value="${societyPolicyId}"/>
				    			 <input type="hidden" name="societPolicyStatus${counter.count}_${memberCounter}" id="societPolicyStatus${counter.count}_${memberCounter}" value="${policyStatus}"/>						 
							     	
				 		 		</div> <!-- End of form-group row -->
						 	</c:forEach>
						</c:forEach>
					
					</div> <!-- End of box-body -->
					
					<div class="box-footer">
	                  	<%if (pageRenderMode.equals(CommonConstant.CREATE_MODE)  || pageRenderMode.equals(CommonConstant.EDIT_MODE)) {%>
              				<button type="submit" class="btn btn-primary" ><spring:message code="common.button.save"/></button>
              				<%} %>	
            		</div>   
            		       		
				</form>    				
    		</div> <!--  End of col 1 -->
    		
    	</div> <!-- End of main row -->
	 </section> <!--  end of content -->
  </div> <!-- End of content wrapper -->
  <%@include file="../common/footer.jsp"%>
  <%@include file="../common/rightSideMenu.jsp"%> 
</div> <!-- End of Wrapper -->
</body>
	
<!-- JS Files -->
<script src="<%=jsRoot%>/bill/managePolicyPage.js?${Server_Token_Value}" type="text/javascript"></script>
</html>