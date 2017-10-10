<%@page import="app.societywala.society.bo.SocietyPropertyBO"%>
<%@page import="java.util.HashSet"%>
<%@page import="app.societywala.event.bo.FestivalAcceptanceUserDetailsBO"%>
<%@page import="java.util.Set"%>
<%@page import="app.societywala.event.bo.SocietyFestivalPropertyMappingBO"%>
<%@page import="app.societywala.user.bo.UserGenderType"%>
<%
SocietyFestivalPropertyMappingBO festivalPropertyMappingBO = (SocietyFestivalPropertyMappingBO)request.getAttribute("festivalPropertyMappingBO");
Set<FestivalAcceptanceUserDetailsBO> userAcceptanceDetailsSet = new HashSet<FestivalAcceptanceUserDetailsBO>();
int counter = 0;
if(festivalPropertyMappingBO != null)
{
	userAcceptanceDetailsSet = festivalPropertyMappingBO.getFestivalAcceptanceUserDetailsBOSet();
}
SocietyPropertyBO propertyBO = (SocietyPropertyBO)request.getAttribute("propertyBO");

%>

<div class="modal-dialog" role="document">
   <div class="modal-content">
   <form id="festivalRegisterationForm" name="festivalRegisterationForm" role="form" method="post">
   <input type="hidden" id="totalUsersCount" name="totalUsersCount" value="<%=userAcceptanceDetailsSet.size()%>">
   <input type="hidden" id="festivalPropertMappingId" name="festivalPropertMappingId" value="<%=festivalPropertyMappingBO!=null?festivalPropertyMappingBO.getFestivalPropertyMappingId():""%>">
   <input type="hidden" id="propertyId" name="propertyId" value="<%=propertyBO.getSocietyPropertyId()%>"> 
   <div class="modal-header">
     		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
       	<h4 class="modal-title" id="myModalLabel">
       		Registration Form for Property Number : <%=propertyBO.getBlockNumber()%>
       	</h4>
  </div>
  <div class="modal-body">
  		<table class="table table-bordered table-striped table-hover dt-responsive" id="userFestivalEnrollTable">
  			<thead>
	  			<tr>
	  				<th width="35%">Name</th>
	 				<th width="15%">Age</th>
	  				<th width="20%">Gender</th>
	  				<th width="20%">Food</th>
	  				<th width="10%">&nbsp;</th>
	  			</tr>
  			</thead>
  			<tbody>
  			<%
  			for(FestivalAcceptanceUserDetailsBO userDetailsBO : userAcceptanceDetailsSet){ 
  				counter++;
  			%>
  				<tr id="userDetailsTR<%=counter%>">
	  				<td><input type="text" class="form-control" id="username<%=counter%>" name="username<%=counter%>"  value="<%=userDetailsBO.getUserName()%>" required></td>
	 				<td><input type="number" class="form-control" id="userage<%=counter%>" name="userage<%=counter%>" value="<%=userDetailsBO.getUserAge()%>" required></td>
	  				<td>
		  				<select class="form-control" id="usergender<%=counter%>" name="usergender<%=counter%>" required>
		  					<option value="">Select</option>
		  					<option value="<%=UserGenderType.MALE_GENDER%>" <%=(userDetailsBO.getGenderTypeBO().equals(UserGenderType.MALE_GENDER))?"selected":""%>>Male</option>
		  					<option value="<%=UserGenderType.FEMALE_GENDER%>" <%=(userDetailsBO.getGenderTypeBO().equals(UserGenderType.FEMALE_GENDER))?"selected":""%>>Female</option>
		  				</select>
	  				</td>
	  				<td>
	  					<select class="form-control" id="userfood<%=counter%>" name="userfood<%=counter%>" required>
		  					<option value="">Select</option>
		  					<option value="2" <%=(userDetailsBO.getFoodTypeOptionBO().getFoodTypeId().equals(2L))?"selected":""%>>Veg</option>
		  					<option value="3" <%=(userDetailsBO.getFoodTypeOptionBO().getFoodTypeId().equals(3L))?"selected":""%>>Non-Veg</option>
		  					<option value="1" <%=(userDetailsBO.getFoodTypeOptionBO().getFoodTypeId().equals(1L))?"selected":""%>>Jain</option>
		  				</select>
	  				</td>
	  				<td>
	  					<a href="javascript:;" onclick="javascript:deletePersistanceFestivalEntrollment(<%=counter%>);">Delete</a>
	  					<input type="hidden" id="userEnrollStatus<%=counter%>" name="userEnrollStatus<%=counter%>" value="update">
	  					<input type="hidden" id="userEnrollId<%=counter%>" name="userEnrollId<%=counter%>" value="<%=userDetailsBO.getFestivalAcceptanceUserId()%>">
	  				</td>
	  			</tr>
	  		<%} // end of for loop 
  			%>
  			</tbody>
  			<tfoot>
  				<tr>
  					<td>
  						<a href="javascript:;" onclick="javascript:addUserForFestivalEntroll();">Add Member</a>
  					</td>
  				</tr>
  			</tfoot>
  		</table>
  </div>
  <div class="modal-footer">
  	<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
  	<button type="button" class="btn btn-primary" onclick="javascript:$('#festivalRegisterationForm').submit();">Register</button>
  </div>
  </form>
 </div>
</div>