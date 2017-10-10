<%@include file="../common/ajaxConfig.jsp" %>

<div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">
        	Search user by email id or mobile number	
        </h4>
      </div>
      
      
      <div class="modal-body">
      	<div class="infoDiv">Search user by email id/mobile number</div>
      	<div class="box box-body">
      		<div id="memberSearchDiv">      		
      		<form id="userSearchForm" role="form">
      		<div class="form-group">
      				<div class="col-md-4">
		     		<label for="userSearchName" class="control-label required">Mobile Number/email Id</label>
		     		</div>
		     		<div class="col-md-4">
		     		<input class="form-control" type="text" name="userSearchDetails" id="userSearchDetails" required/>
		     		</div>
		     		<div class="col-md-4">
		     		<input type="button" class="btn btn-primary" name="searchUser" id="searchUser" value="<spring:message code="society.button.search.user"/>" onclick="javascript:searchUserByEmailIdOrMobile();"/>
		     		</div>
             </div>
             </form>
             </div>
      	</div>
	  </div>
		
	  <div id="userDetailsDiv" class="modal-body">
	  </div>
	  
	  <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
	  
	</div> <!--  End of content -->
</div>