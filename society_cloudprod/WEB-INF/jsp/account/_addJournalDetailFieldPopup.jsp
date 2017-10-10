<%@page import="app.societywala.account.bo.JournalEntryDetailsType"%>
<%@include file="../common/ajaxConfig.jsp" %>
<%
	Integer jornalEntryDetailsTypeId = (Integer)request.getAttribute("jornalEntryDetailsTypeId");
	String jornalEntryDetailsTypeName = "";
	if(jornalEntryDetailsTypeId.equals(JournalEntryDetailsType.BY))
	{
		jornalEntryDetailsTypeName = "By";
	}else if(jornalEntryDetailsTypeId.equals(JournalEntryDetailsType.TO))
	{
		jornalEntryDetailsTypeName = "To";
	}
%>

 <div class="modal-dialog" role="document">
 	<div class="modal-content"> 		
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			<h4 class="modal-title" id="myModalLabel">
			Add Field For Entry Details (<%=jornalEntryDetailsTypeName%>)
			</h4>
		</div>
		<div class="modal-body">
			<form id="addFieldForm" name="addFieldForm" class="form" role="form">
			<input type="hidden" name="isTDSApplicable" id="isTDSApplicable" value="false" />
	  		<input type="hidden" name="tdsAdjustmentIsCorrect" id="tdsAdjustmentIsCorrect" value="true">
			<div class="form-group">	
			  	<label class="control-label required">Particular </label>
			  	<input type="hidden"  id="accountLedgerIdParticular" name="accountLedgerIdParticular"/>
				<input type="text" class="form-control" id="accountLedgerParticularName" name="accountLedgerParticularName" required/>
		  	</div>
		  	<div class="form-group">
			  	<label class="control-label required" id="rupessLabelId">Rs.</label>
			  	<input type="number" class="form-control" id="fieldAmount" name="fieldAmount" required>
		  	</div>
		  	
		  	<div id="addChildFieldForm" name="addChildFieldForm">
			<input type="hidden" name="popupChildDetailsCounter" id="popupChildDetailsCounter" value="0"/>
			<div id="childAmountReferenceDiv">
				<!-- <div class="inputHolder">	
				  	<label class="label">Reference </label>
				  	<select id="" name=""> 
				  		<option value="1">New Reference</option>
				  		<option value="2">On Account</option>
				  	</select>		
			  	</div>
			  	<div class="inputHolder">	
				  	<label class="label">Particular </label>
				  	<input type="hidden"  id="accountLedgerChildIdParticular" name="accountLedgerChildIdParticular"/>
					<input type="text" class="mandatory" id="accountLedgerChildParticularName" name="accountLedgerChildParticularName"/>
			  	</div>
			  	<div class="inputHolder">
				  	<label class="label">Rs. </label>
				  	<input type="text" id="fieldAmount" name="fieldAmount">
			  	</div> -->
			</div>
			</div> <!--  End of child -->
		</form>
		</div>
		
		<div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			<button type="button" onclick="$('#addFieldForm').submit();" class="btn btn-primary">Add</button>	
		</div>		
		
 	</div>
 </div>
 <script type="text/javascript">
 	bindValidateAddJournalDetailFieldPopup('<%=jornalEntryDetailsTypeId%>');
 </script>