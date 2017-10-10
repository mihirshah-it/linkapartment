<%@page import="java.util.Map"%>
<%@page import="app.societywala.common.constants.CommonConstant"%>
<%@include file="../common/ajaxConfig.jsp" %>
<%@page import="app.societywala.society.bo.PropertyAreaUOMBO"%>
<%@page import="app.societywala.society.bo.PropertyStructureTypeBO"%>
<%@page import="app.societywala.society.bo.PropertyTypeBO"%>
<%@page import="java.util.List"%>
<%@page import="app.societywala.society.bo.SocietyPropertyBO"%>
<%
String buildingLevelDisplayName = (String)request.getAttribute("buildingLevelDisplayName");
Map<String,Object> sessionCommonModelMap = (Map<String,Object>) session.getAttribute(CommonConstant.SESSION_COMMON_MODEL_MAP);
String pageRenderMode = (String)sessionCommonModelMap.get(CommonConstant.PAGE_RENDER_MODE);
if(sessionCommonModelMap.get(CommonConstant.AJAX_PAGE_RENDER_MODE) != null)
{
	pageRenderMode = (String)sessionCommonModelMap.get(CommonConstant.AJAX_PAGE_RENDER_MODE);
}
%>

<div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">
        	<%if (pageRenderMode.equals(CommonConstant.CREATE_MODE)) {%>
        		<spring:message code="property.details.add.form.title.message" arguments="${buildingLevelDisplayName}"/>
        	<%} else if(pageRenderMode.equals(CommonConstant.EDIT_MODE)) { %>
        		<spring:message code="property.details.edit.form.title.message" arguments="${buildingLevelDisplayName}"/>
        	<%} else if(pageRenderMode.equals(CommonConstant.VIEW_MODE)) { %>
        		<spring:message code="property.details.view.form.title.message" arguments="${buildingLevelDisplayName}"/>
        	<%} %>	
        </h4>
      </div>
      
      
      <div class="modal-body">
        	<form:form id="propertyForm" commandName="propertyBO" role="form">
        	<div class="box box-body">
		  	<form:hidden path="societyPropertyId"/>
		  		
		  		<div class="form-group col-md-12">
     			   	<form:label path="propertyNamePlateDetails" cssClass="control-label required"><spring:message code="property.details.form.lbl.name.plate.detail"/></form:label>
     			   	<form:input cssClass="form-control" path="propertyNamePlateDetails" required="required"/>
                </div>
			  	 
			  	<div class="form-group">
			  	 		<div class="col-md-4">
	     			   	<form:label cssClass="control-label required" path="blockNumber"><spring:message code="property.details.form.lbl.block.number"/></form:label>
	                  	<form:input cssClass="form-control" path="blockNumber" htmlEscape="true" required="required"/>
	                  	</div>
	                  	
	                  	<div class="col-md-4">	
	                  	<form:label cssClass="control-label required" path="propertyTypeBO"><spring:message code="property.details.form.lbl.block.type"/></form:label>
	                  	<form:select path="propertyTypeBO" cssClass="form-control" required="required">
							<form:options items="${propertyTypeBOList}" itemValue="propertyTypeId" itemLabel="propertyTypeName" />
						</form:select>
						</div>
						
						<div class="col-md-4">
		     				<form:label cssClass="control-label required" path="propertyStructureTypeBO"><spring:message code="property.details.form.lbl.block.structure"/></form:label>
		                  	<form:select path="propertyStructureTypeBO" cssClass="form-control" required="required">
								<form:options items="${propertyStructureTypeBOList}" itemValue="propertyTypeId" itemLabel="propertyStructureTypeName" />
							</form:select>	                  
			 			</div>               
				 </div>
			 
				 <div class="form-group">
			 		<div class="col-md-6">	
     			   	<form:label cssClass="control-label required" path="propertyArea"><spring:message code="property.details.form.lbl.block.area"/></form:label>
                  	<form:input cssClass="form-control" path="propertyArea" required="required" number="number"/>	
                  	</div>
                  	
                  	<div class="col-md-6">
					  	<form:label  cssClass="control-label required" path="areaUOMBO"> <spring:message code="property.details.form.lbl.block.unitofarea"/></form:label>
					  	<form:select path="areaUOMBO" cssClass="form-control" required="required">
							<form:options items="${propertyAreaUOMBOList}" itemValue="uomId" itemLabel="uomName" />
					</form:select>
					</div>		                  
			</div>
		  	
			
			 <div class="form-group">
			 		<div class="col-md-6">	
	     			   	<form:label path="costOfProperty" cssClass="control-label"> Cost of Property</form:label>
	                  	<form:input cssClass="form-control" path="costOfProperty" number="number"/>
                  	</div>
                  	<div class="col-md-6">
                  		<form:label path="extentionNumber" cssClass="control-label"><spring:message code="property.details.form.lbl.block.extenstionnumber"/></form:label>
                  		<form:input cssClass="form-control" path="extentionNumber"/>
                  	</div>			                  
			 </div>
			 
			 <div class="form-group">
			 	<div class="col-md-6">
				  	<form:label cssClass="control-label required" path="isOnRent"> <spring:message code="property.details.form.lbl.block.isOnRent"/></form:label>
				  	<div>
					  	<form:radiobutton cssClass="minimal" path="isOnRent" value="false" required="required"/><spring:message code="common.label.no"/>
						<form:radiobutton cssClass="minimal" path="isOnRent" value="true" required="required"/><spring:message code="common.label.yes"/>
					</div>
				</div>
				<div class="col-md-6">
					<form:label cssClass="control-label required" path="isBankLoanComplete"> <spring:message code="property.details.form.lbl.block.isBank.Loan.Complete"/></form:label>
			  		<div>
			  			<form:radiobutton  path="isBankLoanComplete" value="true" required="required"/><spring:message code="common.label.yes"/>
			  			<form:radiobutton path="isBankLoanComplete" value="false" required="required"/><spring:message code="common.label.no"/>	
					</div>
				</div>
			</div>
			
			</div> <!-- ./box-body end -->
			
			<%if (pageRenderMode.equals(CommonConstant.CREATE_MODE)) { %>
			<div class="box box-body">
			<div class="form-group">
				  <div class="col-md-6">
					  <form:label cssClass="control-label required" path="propertyAccountOpeningDate">Opening Date</form:label>
					  <div class="input-group date">
			              <div class="input-group-addon">
			                <i class="fa fa-calendar"></i>
			              </div>
			              <form:input cssClass="form-control pull-right datepicker" path="propertyAccountOpeningDate" dateFormat="dateFormat" required="required"/>
		              </div>
	              </div>
	              <div class="col-md-6">
	              	<form:label cssClass="control-label required" path="propertyAccountOpeningAmount">Opening Amount</form:label>
                  	<form:input cssClass="form-control" path="propertyAccountOpeningAmount" required="required" number="number"/>
                  	<div class="text-red">*Put negative value for credit amount</div>
	              </div>           											                  	                  
            </div>
            
        	 <div class="form-group">
        	 		<div class="col-md-6">
	     			   	<form:label cssClass="control-label required" path="propertyAccountOpeningArrearAmount">Opening Principle</form:label>
	                  	<form:input cssClass="form-control" path="propertyAccountOpeningArrearAmount" required="required" number="number"/>
	                  	<div class="text-red">*Put negative value for credit amount</div>
                  	</div>
                  	<div class="col-md-6">
                  		<form:label cssClass="control-label required" path="propertyAccountOpeningInterestAmount">Opening Principle Interest</form:label>
                  		<form:input cssClass="form-control" path="propertyAccountOpeningInterestAmount" required="required" number="number"/>
                  		<div class="text-red">*Put negative value for credit amount</div>
                  	</div>               
			 </div>
			 
			 <div class="form-group">
			 		<div class="col-md-6">
	     			   	<form:label cssClass="control-label required" path="propertyAccountOpeningSupplementaryAmount">Opening Supplementary</form:label>
	                  	<form:input cssClass="form-control" path="propertyAccountOpeningSupplementaryAmount" required="required" number="number"/>
	                  	<div class="text-red">*Put negative value for credit amount</div>
                  	</div>
                  	<div class="col-md-6">
                  		<form:label cssClass="control-label required" path="propertyAccountOpeningSupplementaryInterestAmount">Opening Supplementary Interest</form:label>
	                  	<form:input cssClass="form-control" path="propertyAccountOpeningSupplementaryInterestAmount" required="required" number="number"/>
	                  	<div class="text-red">*Put negative value for credit amount</div>
                  	</div>               
			 </div>			
			</div> <!-- ./box-body end -->
			
			<%} %>
			
		</form:form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <%if (pageRenderMode.equals(CommonConstant.CREATE_MODE)  || pageRenderMode.equals(CommonConstant.EDIT_MODE)) {%>
			<button type="button" onclick="savePropertyForm();" class="btn btn-primary"><spring:message code="common.button.saveAndClose"/></button>
	  	<%} %>
        
      </div>
    </div>
</div>