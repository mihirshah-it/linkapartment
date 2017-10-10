<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@page import="app.societywala.common.bo.AttachementConstatnt"%>
<%@page import="app.societywala.common.constants.CommonConstant"%>
<%@page import="app.societywala.advertise.bo.AdvertisementProviderType"%>

<!-- <meta http-equiv="Content-Type" content="text/html; charset=utf-8"> -->
<meta name="author" content="www.linkapartment.com" />
<meta name="keyphrases" content="society accounting software,software for residential societies, resident welfare associations,accounting and management portal,web based society management software,web based apartment management software" />
<meta name="keywords" content="society management System, society maintenance software, society accounting software, web based society management,  web based society management systems, chs management software, society automated billing software, India, Cooperative, Housing, Co-operative, Co-op, Housing Society, Commercial Society, Society, Building Association, Association, Apartment Complex, Apartment, Flat, Shop, Office, Gala, Unit, Parking, Wing, Society Member, Flat Owner, Apartment Owner, Homeowner, Managing Committee, Management, Accountant, CA, Chartered Accountant, Registrar, Manager, Manage, Communicate, Interact, Network, Social Network, Billing, Receipts, Income, Expenditure, Balance Sheet, Profit & Loss, Software, Web, Internet, Cloud, Microsoft, Online Society, Web based Accounting, Web based Accounting for co-operative society, Society online, Society Accounting"/>
<meta name="description" content="Peace of Mind for Managing a Society. 100% Web based society management with automated billing, live balancesheet, payment gateway,helpdesk ticketing,capital asset maintenance, attendance tracking"/>
<link rel="shortcut icon" href="<%=ctxPath%>/assets/images/favicon.png">

<meta name = "title" content= "Society Management System | Society Maintenance Software - HamariSociety" />
<meta name="keywords" content="society management System, society maintenance software, society accounting software, web based soiety management,  web based society management systems, chs management software, society automated billing software"/>

<!-- <title>Society Management System | Society Maintenance Software - HamariSociety</title> -->
<!-- Copyright(C) www.HamariSociety.com-->
<link rel="stylesheet" type="text/css" href="<%=cssRoot%>/appcommon.css?${Server_Token_Value}" />
<link rel="stylesheet" type="text/css" href="<%=jqueryCssPath%>?${Server_Token_Value}" />
<link rel="stylesheet" type="text/css" href="<%=jqueryPath%>/alert/jquery.alerts.css?${Server_Token_Value}" />

<!--  Bread Crumb Start -->
<link rel="stylesheet" type="text/css" href="<%=jqueryPath%>/breadCrumb/css/Base.css?${Server_Token_Value}" />
<link rel="stylesheet" type="text/css" href="<%=jqueryPath%>/breadCrumb/css/BreadCrumb.css?${Server_Token_Value}" />
<!--  Bread Crumb End -->

<!-- Notification Message -->
<link rel="stylesheet" type="text/css" href="<%=jqueryPath%>/notificationMessage/css/jquery.toastmessage.css?${Server_Token_Value}" />
<!-- Notification Message -->

<link rel="stylesheet" type="text/css" href="<%=jqueryPath%>/jcrop/css/jquery.Jcrop.min.css?${Server_Token_Value}" />

<!-- File Upload CSS -->
  	 <link rel="stylesheet" href="<%=ctxPath%>/jquery/fileUploadMaster/css/style.css?${Server_Token_Value}"/>
  	 <link rel="stylesheet" href="<%=ctxPath%>/jquery/fileUploadMaster/css/jquery.fileupload-ui.css?${Server_Token_Value}"/>
<!-- File Upload CSS End -->

<!-- JQUery Grid Css -->
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/jquery/grid/css/ui.jqgrid.css?${Server_Token_Value}"  />
<!-- JQUery Grid Css -->

<!--  Rich Text box function -->	
	<link rel="stylesheet" type="text/css" href="<%=jqueryPath%>/textEditor/jquery-te.css?${Server_Token_Value}" />
<!--  Rich Text box  function -->

	<link rel="stylesheet" type="text/css" href="<%=jqueryPath%>/dateTimeFormat/jquery.datetimepicker.css?${Server_Token_Value}" />
	
<!-- Progress Bar Common CSS  -->
<style>
 .ui-progressbar {
position: relative;
}

.progress-label {
position: absolute;
left: 50%;
top: 4px;
font-weight: bold;
text-shadow: 1px 1px 0 #fff;
}
</style>
<!-- Progress CSS end  -->


<!-- Common Config Js -->
<script type="text/javascript" src="<%=jsRoot%>/common/jquery-1.10.2.min.js?${Server_Token_Value}"></script>
<script type="text/javascript" src="<%=jsRoot%>/common/jquery-migrate-1.2.1.min.js?${Server_Token_Value}"></script>
<script type="text/javascript" src="<%=jsRoot%>/common/common.js?${Server_Token_Value}"></script>
<script type="text/javascript" src="<%=jqueryJsPath%>?${Server_Token_Value}"></script>
<script type="text/javascript" src="<%=jqueryPath%>/alert/jquery.alerts.js?${Server_Token_Value}"></script>
<script type="text/javascript" src="<%=jqueryPath%>/breadCrumb/js/jquery.easing.1.3.js?${Server_Token_Value}"></script>
<script type="text/javascript" src="<%=jqueryPath%>/breadCrumb/js/jquery.jBreadCrumb.1.1.js?${Server_Token_Value}"></script>
<script type="text/javascript" src="<%=jqueryPath%>/notificationMessage/js/jquery.toastmessage.js?${Server_Token_Value}"></script>
<script type="text/javascript" src="<%=jqueryPath%>/blockUIMaster/jquery.blockUI.js?${Server_Token_Value}"></script>
<script type="text/javascript" src="<%=jqueryPath%>/dateTimeFormat/build/jquery.datetimepicker.full.min.js?${Server_Token_Value}"></script>
<!-- Hot Key Short Cut Key -->
<script type="text/javascript" src="<%=jqueryPath%>/hotkey/js/jquery.shortcuts.js?${Server_Token_Value}"></script>
<!-- Hot Key Short Cut Key End -->
<!-- jCarousel Config -->
<script type="text/javascript" src="<%=jqueryPath%>/jCarousel/js/jquery.jcarousel.min.js?${Server_Token_Value}"></script>
<!-- jCarousel Config -->
<!-- Common Config Js -->

<!--[if IE]>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<![endif]-->
<!--[if lte IE 8]>
	<script src="<%=jsRoot%>/Html4Comaptible/html5shiv.js" type="text/javascript"></script>
<![endif]-->

<!-- Session Timeout Script -->
<script type="text/javascript" src="<%=jqueryPath%>/sessionTimeOut/jquery.sessionTimeout.js?${Server_Token_Value}"></script>
<!-- Session Timeout Script -->



<!-- File Upload Script -->
		<!-- The jQuery UI widget factory, can be omitted if jQuery UI is already included -->
		<script src="<%=ctxPath%>/jquery/fileDownload/jquery.fileDownload.js?${Server_Token_Value}" type="text/javascript"></script>
		<!-- The Iframe Transport is required for browsers without support for XHR file uploads -->
		<script src="<%=ctxPath%>/jquery/fileUploadMaster/js/jquery.iframe-transport.js?${Server_Token_Value}"></script>
		<!-- The basic File Upload plugin -->
		<script src="<%=ctxPath%>/jquery/fileUploadMaster/js/jquery.fileupload.js?${Server_Token_Value}"></script>
<!-- File Upload End -->

<!-- ModalPopup js -->
<script src="<%=jsRoot%>/common/modalPopUp.js?${Server_Token_Value}" type="text/javascript"></script>
<!-- ModalPopup js -->

<!-- Image Crop Common Script -->
<script type="text/javascript" src="<%=jqueryPath%>/jcrop/js/jquery.Jcrop.min.js?${Server_Token_Value}"></script>
<script type="text/javascript" src="<%=jsRoot%>/common/imageUploadAndCrop.js?${Server_Token_Value}"></script>
<!-- Image Crop Common Script -->

<!--  Plugins override CSS -->
<link rel="stylesheet" type="text/css" href="<%=cssRoot%>/pluginOverride.css?${Server_Token_Value}" />
<!--  Plugins override CSS -->

<!-- Calculation Plugins -->
<script type="text/javascript" src="<%=jqueryPath%>/calculation/jquery.calculation.min.js?${Server_Token_Value}"></script>
<!-- Calculation Plugins -->

<!--  Rich Text box function -->	
	<script type="text/javascript" src="<%=jqueryPath%>/textEditor/jquery-te.min.js?${Server_Token_Value}"></script>
<!--  Rich Text box  function -->

<script type="text/javascript"> 
//Advertisement Carosual

function adCarousel_itemLoadCallback(carouselId, scrollModeVertical, pageCode , providerType)
{
     $.ajax( {
        type: "GET",       // the default
        url: jctxPath+"/ajaxadvertise/getAdvertisementAndSponsoreImages.htm",
        dataType: "json",
        data: { pageCode: pageCode , /* This is configure in config.jsp and override in all page before import of this file */
        	    providerType : providerType}, /* Load all advertise */
        success: function(data) {
        		adCarousel_itemAddCallback(carouselId , scrollModeVertical , data);        		
        }
      } );
};

function adCarousel_itemAddCallback(carouselId , scrollModeVertical , data)
{
    // Simply add all items at once and set the size accordingly.
    var advertiseDetailsBOList = data.advertiseDetailsBOList;

	for(var i in advertiseDetailsBOList)
	{
		$("#"+carouselId+" ul").append(adCarousel_getItemHTML(advertiseDetailsBOList[i]));
	}
	bindCourosal(carouselId , scrollModeVertical);
};

function adCarousel_getItemHTML(advertiseDetailsBO)
{
    //return '<img src="' + advertiseDetailsBO. + '" width="75" height="75" alt="" />';
    var advertiseLoc = '<%=CommonConstant.USER_IMAGE_CONTEXT_URL%>/Thumbnail/<%=AttachementConstatnt.getEntityFolderName(AttachementConstatnt.ADMIN_ENTITY)%>/<%=AttachementConstatnt.ADMIN_ADVERTISE_SPONSOR_ENTITY_ID%>/<%=AttachementConstatnt.getImageModuleFolderName(AttachementConstatnt.IMG_ADVERTISE_SPONSOR_MODULE)%>/'+advertiseDetailsBO.imageFileName;
    return '<li> <a target="_blank" href="'+advertiseDetailsBO.webLink+'"> <img width="100%" height="'+advertiseDetailsBO.height+'" alt="'+advertiseDetailsBO.title+'" src="'+advertiseLoc+'"></a> </li>';

};

//Advertisement Carosual

$(document).ready(function(){	
	
	// JQuery Grid Plugin added...
	if ($.isFunction($('div.ui-jqgrid > div.ui-jqgrid-view > div.ui-jqgrid-bdiv > div > table.ui-jqgrid-btable').jqGrid)) {
		var gridWidth = ($(window).width()*78)/100;
		jQuery.extend(jQuery.jgrid.defaults, { width : gridWidth });
	}	
	// Right Add panel Set Height

	$.sessionTimeout();
	
	$('#breadCrumb').jBreadCrumb();
	
	//Prevent the backspace key from navigating back and call custom back.
	 $(function () {
	     var rx = /INPUT|TEXTAREA|DIV/i;
	     var rxT = /RADIO|CHECKBOX|SUBMIT/i;

	     $(document).bind("keydown keypress", function (e) {
	         var preventKeyPress;
	         if (e.keyCode == 8) {
	             var d = e.srcElement || e.target;
	             
	             if (rx.test(e.target.tagName)) {
	            	 var preventPressBasedOnType = false;
					 if(d.attributes["contenteditable"]) { // For TinyMCE Div contentIsEditable
						  if(d.attributes["contenteditable"].value == true)
	                	  {
	                		 preventPressBasedOnType = false;
	                	  }
	                 }
					 else if (d.attributes["type"]) {
	                     preventPressBasedOnType = rxT.test(d.attributes["type"].value);
	                 }
	                 preventKeyPress = d.readOnly || d.disabled || preventPressBasedOnType;
	             } else {preventKeyPress = true;}
	         } else { preventKeyPress = false; }

	         if (preventKeyPress)
	        	 {
	        	 	e.preventDefault();
	        	 	backURL();
	        	 }
	     });
	 });
	//End Prevent the backspace key from navigating back and call custom back.
});


/*$(document).ajaxSend(function() {
    
	// Stop redirect timer and restart warning timer
	//clearTimeout(redirTimer);
	//redirTimer = getTimeout();
});*/

/* $.ajaxStart(function() {
	blockProcessingBlock();
});

$.ajaxStop(unBlockTheBlockUI()); */

$.ajaxSetup({
	type: "GET",
	data: {
		formTokenID: jsFormTokenID,
	},
	dataType: "jsonp",
	beforeSend: function(jqXHR, settings) {
		if(settings.type == "POST")
		{
			blockProcessingBlock();
		}
    },
    complete :  function(jqXHR, settings) {
    	unBlockTheBlockUI();
		
    },
    success: function(jqXHR, settings) {
    	unBlockTheBlockUI();		
    }
});



$(window).bind("load", function() {
	unBlockTheBlockUI();
	// Advertisement Carosual
	$('.rightVeriticalJCarousel').css('height', $('.contentBg').height()+'px');	
	adCarousel_itemLoadCallback("rightVeriticalJCarousel" , true , jsPageCode , <%=AdvertisementProviderType.ADVERTISEMENT%>);
	adCarousel_itemLoadCallback("bannerDivBottom" , false , jsPageCode , <%=AdvertisementProviderType.SPONSORE%>);
	// Advertisement Carosual
});

function bindCourosal(carousalIdName , scrollModeVertical)
{
	$('#'+carousalIdName).jcarousel({
		vertical: scrollModeVertical,
		rtl: !scrollModeVertical,
		wrap : "circular",
		animation:{duration:1500,easing:'easeInOutExpo'}		
    	})
		.jcarouselAutoscroll({
			interval: 3000,
            target: '+=1',
            autostart: true
		});
}
</script>