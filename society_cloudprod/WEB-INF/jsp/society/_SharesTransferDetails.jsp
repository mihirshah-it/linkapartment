<%@page import="java.util.Map"%>
<%@page import="app.societywala.common.constants.CommonConstant"%>
<%@page import="app.societywala.society.bo.SocietyPropertyIRegisterBO"%>
<%@include file="../common/ajaxConfig.jsp" %>
<%
SocietyPropertyIRegisterBO iRegisterBO = (SocietyPropertyIRegisterBO)request.getAttribute("iRegisterBO");
Map<String,Object> sessionCommonModelMap = (Map<String,Object>) session.getAttribute(CommonConstant.SESSION_COMMON_MODEL_MAP);
String pageRenderMode = (String)sessionCommonModelMap.get(CommonConstant.PAGE_RENDER_MODE);
%>
<div class="modal-dialog" role="document">
    <div class="modal-content">
      	<div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">
		<%if (pageRenderMode.equals(CommonConstant.CREATE_MODE)  || pageRenderMode.equals(CommonConstant.EDIT_MODE)) {%>
		 Share Transferred details for block no <%=iRegisterBO.getPropertyBO().getBlockNumber() %>
		<%}%>
		</h4>
		</div>
		<form id="sharesTransferFormDetails" name="sharesTransferFormDetails">
		<input type="hidden" id="iRegisterBOId" name="iRegisterBOId" value="<%=iRegisterBO.getiRegisterId() != null ?  iRegisterBO.getiRegisterId() : ""%>"/>
		<input type="hidden" id="propertyId" name="propertyId" value="<%=iRegisterBO.getPropertyBO().getSocietyPropertyId()%>"/> 
		<div class="modal-body">
			<div class="form-group">
				  	<label class="control-label required" for="dateOfShareTransferred">Date Of Share Transferred</label>
				  	<div class="input-group date">
		                  <div class="input-group-addon">
		                    <i class="fa fa-calendar"></i>
		                  </div>
		                  <input type="text" class="form-control pull-right datepicker dateFormat" id="dateOfShareTransferred" name="dateOfShareTransferred" required/>
		             </div>				  				  	
			 </div>
			 <div class="form-group">	
				  	<label class="control-label required" for="dateOfCessation">Date Of Cessation of Membership</label>
				  	<div class="input-group date">
		                  <div class="input-group-addon">
		                    <i class="fa fa-calendar"></i>
		                  </div>
		                  <input type="text" class="form-control pull-right datepicker dateFormat" id="dateOfCessation" name="dateOfCessation" required/>
		             </div>				  				  	
			 </div>
			 <div class="form-group">
				  	<label class="control-label required" for="reasonOfCessation">Reason for Cessation</label>
				  	<textarea class="form-control" id="reasonOfCessation" name="reasonOfCessation" required></textarea>				  	
			 </div>
			 <div class="form-group">
				  	<label class="control-label required" for="newTransfereeNamePlateDetails">New Member Name Plate Details</label>
				  	<input type="text" class="form-control" id="newTransfereeNamePlateDetails" name="newTransfereeNamePlateDetails" required/>				  	
			 </div>
			 
			 <div class="form-group">
				  	<label class="control-label required" for="dateOfCashBOokFolio">Date of CashBook Folio</label>
				  	<div class="input-group date">
		                  <div class="input-group-addon">
		                    <i class="fa fa-calendar"></i>
		                  </div>
		                  <input type="text" class="form-control pull-right datepicker dateFormat" id="dateOfCashBOokFolio" name="dateOfCashBOokFolio" required/>
		             </div>				  					  	
			 </div>
			 <div class="form-group">
				  	<label class="control-label required" for="cashBookFolio">CashBook Folio</label>
				  	<input type="text" class="form-control" id="cashBookFolio" name="cashBookFolio" required/>				  	
			 </div>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			<button type="submit" class="btn btn-primary">Save And Continue</button>
		</div>
		</form>
	</div>
</div>