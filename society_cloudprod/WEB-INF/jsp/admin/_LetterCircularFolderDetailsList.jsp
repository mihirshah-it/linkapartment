<%@page import="app.societywala.admin.bo.LetterCirculerCategory"%>
<%@page import="java.util.List"%>
<%@include file="../common/ajaxConfig.jsp" %>
<div id="folderDiv" class="form" style="width: 100%;">
<%
  List<LetterCirculerCategory> letterCirculerCategoryList = (List<LetterCirculerCategory>)request.getAttribute("letterCirculerCategoryList");
%>
	<% for(int i=0;i<letterCirculerCategoryList.size();i++) { 
		LetterCirculerCategory letterCirculerCategory = letterCirculerCategoryList.get(i);
	%> 
	<div class="levelInnerDiv">
   	   <a href="javascript:deleteFolder('<%=letterCirculerCategory.getLetterCirculerCategoryId()%>');"></a>
       <button onclick="javascript:showFilesGridByFolderId('<%=letterCirculerCategory.getLetterCirculerCategoryId()%>');"><%=letterCirculerCategory.getCategoryName()%></button>
       <div></div>
    </div>
    <%} %>					   
</div>