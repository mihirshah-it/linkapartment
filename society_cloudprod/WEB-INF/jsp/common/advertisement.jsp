<%@page import="app.societywala.common.bo.AttachementConstatnt"%>
<%@page import="app.societywala.common.constants.CommonConstant"%>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="net.sf.json.JSONObject"%>
<%
JSONObject jsonObject = (JSONObject)request.getAttribute("jsonObject");
JSONArray jsonArray = (JSONArray)jsonObject.get("advertiseDetailsBOList");
%>
<div class="box">
<div class="box-header with-border">
	<h3 class="box-title">Advertisement</h3>
</div>
<div class="box-body">
             	<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
		               <%--<ol class="carousel-indicators">
		                  <% for(int i = 0 ; i < jsonArray.size() ; i ++) { %>
		                 <li data-target="#carousel-example-generic" data-slide-to="<%=i%>" class='<%=(i==0)?"active":""%>'></li>
		                 <%}%> 		                 
		               </ol>--%>
		               <div class="carousel-inner">
		               		<% for(int i = 0 ; i < jsonArray.size() ; i ++)  {
		               			JSONObject tmpObject = (JSONObject)jsonArray.get(i);
		               			String advertiseLoc = CommonConstant.USER_IMAGE_CONTEXT_URL+"/Thumbnail/"+AttachementConstatnt.getEntityFolderName(AttachementConstatnt.ADMIN_ENTITY)+"/"+AttachementConstatnt.ADMIN_ADVERTISE_SPONSOR_ENTITY_ID+"/"+AttachementConstatnt.getImageModuleFolderName(AttachementConstatnt.IMG_ADVERTISE_SPONSOR_MODULE)+"/"+tmpObject.get("imageFileName");
		               		%>
			                 <div class='item <%=(i==0)?"active":""%>'>
			                   		<a target="_blank" href="<%=tmpObject.get("webLink")%>"> 
			                   		<img width="100%" height="<%=tmpObject.get("height")%>" alt="<%=tmpObject.get("title")%>" src="<%=advertiseLoc%>"></a>
			                   		<div class="carousel-caption">
		                      			
		                    		</div>
			                  </div>
			                 <%
		               		}
			                 %>
		               </div>
		               <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
		                 <span class="fa fa-angle-left"></span>
		               </a>
		               <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
		                 <span class="fa fa-angle-right"></span>
		               </a>
             </div> <!-- ./ End of Caurosal -->
</div>
</div>