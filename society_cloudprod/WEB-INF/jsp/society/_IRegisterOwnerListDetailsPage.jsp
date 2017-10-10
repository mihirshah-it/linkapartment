<%@page import="app.societywala.common.constants.CommonConstant"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="app.societywala.society.bo.IRegisterOwnerType"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.List"%>
<%@page import="app.societywala.society.bo.IRegisterOwnerBO"%>
<%@include file="../common/ajaxConfig.jsp" %>
<%
List<IRegisterOwnerBO> iregisterOwnerBOList = (List<IRegisterOwnerBO>)request.getAttribute("iregisterOwnerBOList");
SimpleDateFormat dateFormat = new SimpleDateFormat(CommonConstant.dateUIFormatter);
for (IRegisterOwnerBO iRegisterBO  : iregisterOwnerBOList)
{
%>
   <div style="width:15%"><%=IRegisterOwnerType.getIRegisterOwnerTypeName(iRegisterBO.getOwnerShipTypeId())%></div>
   <%-- <div style="width:15%"><%=dateFormat.format(iRegisterBO.getDateOfAdmission())%></div> --%>
   <div style="width:20%"><%=iRegisterBO.getOwnerUserBO().getFullName()%></div>
  <%--  <div style="width:20%"><%=iRegisterBO.getOwnerPropertyBO().getBlockNumber() +" , "+ iRegisterBO.getOwnerPropertyBO().getSocietyBuildingLevelBO().getSocietyBuildingBO().getSocietyBO().getFormatedAddress()%></div>
   <div style="width:10%"><%=iRegisterBO.getOwnerUserBO().getProffesionalTypeBO().getProfessionalTypeName() %></div> --%>
   <div style="width:10%"><%=iRegisterBO.getAgeOnDateOfRegistration()%></div>	
<%
}
%>