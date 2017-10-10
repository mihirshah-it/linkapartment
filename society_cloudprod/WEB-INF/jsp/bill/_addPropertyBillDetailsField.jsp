<%@include file="../common/ajaxConfig.jsp" %>

<div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
      	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Add Field For Bill</h4>
      </div>
      <form id="addFieldForm" name="addFieldForm" role="form">
      <div class="modal-body">        	
        	<div class="box box-body">
        		<div class="form-group">
			    	<label class="control-label required" for="accountLedgerParticularName">Particular</label>
			    	<input type="hidden"  id="accountLedgerIdParticular" name="accountLedgerIdParticular"/>
					<input type="text" class="form-control" id="accountLedgerParticularName" name="accountLedgerParticularName" required/>		                  
				</div>
				<div class="form-group">
			    	<label class="control-label required" for="fieldAmount">Rs.</label>
			    	<input type="number" class="form-control" id="fieldAmount" name="fieldAmount" required/>		                  
				</div>
        	</div>        	
      		
      </div>
      
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" onclick="javascript:addPropertyBillDetailFieldPopup();" class="btn btn-primary">Add Field</button>
	  </div>
      </form>
      
   </div>
</div>