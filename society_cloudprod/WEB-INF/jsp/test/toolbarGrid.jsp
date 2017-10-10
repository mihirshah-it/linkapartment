<%@include file="../common/config.jsp" %>
<html>
<HEAD>
   <TITLE><spring:message code="common.title.label.product"/></TITLE>  
   <%@include file="../common/appmetaFile.jsp"%>
   <link rel="stylesheet"  href="<%=ctxPath%>/jquery/grid/css/ui.jqgrid.css" type="text/css" />
   <script src="<%=ctxPath%>/jquery/grid/js/i18n/grid.locale-en.js"   type="text/javascript"></script>
   <script src="<%=ctxPath%>/jquery/grid/js/jquery.jqGrid.min.js"   type="text/javascript"></script>
   
</HEAD>
<body>
test
<div  class="gridHolder">
<table id="testtoolbar"></table>
<div id="ptesttoolbar" ></div>
</div>
</body>

<script>
//$("#toolbar").jqGrid("clearGridData", true);
   $('#testtoolbar').GridUnload();
   jQuery("#testtoolbar").jqGrid
   ({ url:'<%=ctxPath%>/test/testUsergrid.htm',
	  postData : { buildingLevelId: '1' },
      datatype: "json",
      mtype: "GET",
      height: 255, 
      width: 600,
      colNames:['Id','First Name', 'Last Name'],
      colModel:[ {name:'userId',index:'userId', width:65, sorttype:'int'},
                 {name:'fullName',index:'fullName', width:150},
                 {name:'fullName',index:'fullName', width:100} ], 
      rowNum:2, 
      rowTotal: 2000,
      rowList : [20,30,50], 
      loadonce:false,
      rownumbers: false, 
      rownumWidth: 40, 
      gridview: true,
      pager: '#ptesttoolbar',
      sortname: 'First Name', 
      viewrecords: true,
      multiselect: true,
      sortorder: "asc"
    //afterInsertRow
      //caption: " :: Level "+levelName+" Details"
      /* loadComplete: function (data) {       }*/
    });
   jQuery("#testtoolbar").jqGrid('navGrid','#ptesttoolbar',{del:false,add:false,edit:false,search:false});
   jQuery("#testtoolbar").jqGrid('filterToolbar',{stringResult: true,searchOnEnter : false});
   </script>
</html>