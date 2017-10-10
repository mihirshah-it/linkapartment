<%@page import="app.societywala.common.bo.AttachementConstatnt"%>
<%@page import="app.societywala.common.constants.CommonConstant"%>
<%@page import="app.societywala.advertise.bo.AdvertisementProviderType"%>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- <meta http-equiv="Content-Type" content="text/html; charset=utf-8"> -->
<meta name="author" content="www.linkapartment.com" />
<meta name="keyphrases" content="society accounting software,software for residential societies, resident welfare associations,accounting and management portal,web based society management software,web based apartment management software" />
<meta name="keywords" content="society management System, society maintenance software, society accounting software, web based society management,  web based society management systems, chs management software, society automated billing software, India, Cooperative, Housing, Co-operative, Co-op, Housing Society, Commercial Society, Society, Building Association, Association, Apartment Complex, Apartment, Flat, Shop, Office, Gala, Unit, Parking, Wing, Society Member, Flat Owner, Apartment Owner, Homeowner, Managing Committee, Management, Accountant, CA, Chartered Accountant, Registrar, Manager, Manage, Communicate, Interact, Network, Social Network, Billing, Receipts, Income, Expenditure, Balance Sheet, Profit & Loss, Software, Web, Internet, Cloud, Microsoft, Online Society, Web based Accounting, Web based Accounting for co-operative society, Society online, Society Accounting"/>
<meta name="description" content="Peace of Mind for Managing a Society. 100% Web based society management with automated billing, live balancesheet, payment gateway,helpdesk ticketing,capital asset maintenance, attendance tracking"/>
<link rel="shortcut icon" href="<%=ctxPath%>/assets/images/favicon.png">
<meta name = "title" content= "Society Management System | Society Maintenance Software - LinkApartment" />

<!-- Bootstrap 3.3.6 -->
<link rel="stylesheet" href="<%=ctxPath%>/bootstrap/css/bootstrap.min.css?${Server_Token_Value}">
<!-- Font Awesome -->
<link rel="stylesheet" href="<%=ctxPath%>/css/font-awesome/css/font-awesome.min.css">

<!-- Ionicons -->
<link rel="stylesheet" href="<%=ctxPath%>/css/ionicons/css/ionicons.min.css">


<!-- DataTables -->
<link rel="stylesheet" href="<%=pluginPath%>/datatables/dataTables.bootstrap.min.css">
<link rel="stylesheet" href="<%=pluginPath%>/datatables/extensions/Select/css/select.dataTables.min.css">
<link rel="stylesheet" href="<%=pluginPath%>/datatables/extensions/Buttons/css/buttons.dataTables.min.css">


<!-- Theme style -->
<link rel="stylesheet" href="<%=ctxPath%>/css/society.css?${Server_Token_Value}">
<!-- AdminLTE Skins. Choose a skin from the css/skins folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet" type="text/css" href="<%=jqueryCssPath%>?${Server_Token_Value}" />
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/css/skins/_all-skins.min.css?${Server_Token_Value}" />

<!-- iCheck -->
<link rel="stylesheet" href="<%=pluginPath%>/iCheck/flat/blue.css">
<!-- Morris chart -->
<link rel="stylesheet" href="<%=pluginPath%>/morris/morris.css">
<!-- jvectormap -->
<link rel="stylesheet" href="<%=pluginPath%>/jvectormap/jquery-jvectormap-1.2.2.css">
<!-- Date Picker -->
<link rel="stylesheet" href="<%=pluginPath%>/bootstrap-datepicker/css/bootstrap-datepicker.css">
<!-- Daterange picker -->
<link rel="stylesheet" href="<%=pluginPath%>/daterangepicker/daterangepicker.css">
<!-- Bootstrap time Picker -->
<link rel="stylesheet" href="<%=pluginPath%>/timepicker/bootstrap-timepicker.min.css">
<!-- Select2 -->
<link rel="stylesheet" href="<%=pluginPath%>/select2/select2.min.css">


<!-- Form Validator -->


<!-- bootstrap wysihtml5 - text editor -->
<link rel="stylesheet" href="<%=pluginPath%>/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">


<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->


<!-- <title>Society Management System | Society Maintenance Software - HamariSociety</title> -->
<!-- Copyright(C) www.HamariSociety.com-->
<%-- <link rel="stylesheet" type="text/css" href="<%=cssRoot%>/appcommon.css?${Server_Token_Value}" />  --%>

<link rel="stylesheet" type="text/css" href="<%=jqueryPath%>/alert/jquery.alerts.css?${Server_Token_Value}" />

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
<script type="text/javascript" src="<%=pluginPath%>/jQuery/jquery-2.2.3.min.js"></script>
<script type="text/javascript" src="<%=pluginPath%>/jQueryUI/jquery-ui.min.js?${Server_Token_Value}"></script>

<script type="text/javascript" src="<%=jqueryPath%>/alert/jquery.alerts.js?${Server_Token_Value}"></script>
<script type="text/javascript" src="<%=jqueryPath%>/breadCrumb/js/jquery.easing.1.3.js?${Server_Token_Value}"></script>
<script type="text/javascript" src="<%=jqueryPath%>/breadCrumb/js/jquery.jBreadCrumb.1.1.js?${Server_Token_Value}"></script>
<script type="text/javascript" src="<%=jqueryPath%>/notificationMessage/js/jquery.toastmessage.js?${Server_Token_Value}"></script>
<script type="text/javascript" src="<%=jqueryPath%>/blockUIMaster/jquery.blockUI.js?${Server_Token_Value}"></script>
<script type="text/javascript" src="<%=jqueryPath%>/dateTimeFormat/build/jquery.datetimepicker.full.min.js?${Server_Token_Value}"></script>
<!-- Hot Key Short Cut Key -->
<%-- <script type="text/javascript" src="<%=jqueryPath%>/hotkey/js/jquery.shortcuts.js?${Server_Token_Value}"></script> --%>
<!-- Hot Key Short Cut Key End -->
<!-- jCarousel Config -->
<script type="text/javascript" src="<%=jqueryPath%>/jCarousel/js/jquery.jcarousel.min.js?${Server_Token_Value}"></script>
<!-- jCarousel Config -->
<!-- Common Config Js -->

<%--
<!--[if IE]>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<![endif]-->
<!--[if lte IE 8]>
	<script src="<%=jsRoot%>/Html4Comaptible/html5shiv.js" type="text/javascript"></script>
<![endif]-->
 --%>

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


<script src="<%=ctxPath%>/bootstrap/js/bootstrap.min.js"></script>
<script src="<%=pluginPath%>/select2/select2.full.min.js"></script>
<!-- Morris.js charts -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<script src="<%=pluginPath%>/morris/morris.min.js"></script>
<!-- Sparkline -->
<script src="<%=pluginPath%>/sparkline/jquery.sparkline.min.js?${Server_Token_Value}"></script>
<!-- jvectormap -->
<script src="<%=pluginPath%>/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="<%=pluginPath%>/jvectormap/jquery-jvectormap-world-mill-en.js?${Server_Token_Value}"></script>
<!-- jQuery Knob Chart -->
<script src="<%=pluginPath%>/knob/jquery.knob.js?${Server_Token_Value}"></script>
<!-- daterangepicker -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>

<!-- datepicker -->
<script src="<%=pluginPath%>/bootstrap-datepicker/js/bootstrap-datepicker.min.js?${Server_Token_Value}"></script>
<!-- Bootstrap WYSIHTML5 -->
<script src="<%=pluginPath%>/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js?${Server_Token_Value}"></script>
<!-- Slimscroll -->
<script src="<%=pluginPath%>/slimScroll/jquery.slimscroll.min.js?${Server_Token_Value}"></script>
<!-- FastClick -->
<script src="<%=pluginPath%>/fastclick/fastclick.js?${Server_Token_Value}"></script>

<!-- DataTables -->
<script src="<%=pluginPath%>/datatables/jquery.dataTables.min.js"></script>
<script src="<%=pluginPath%>/datatables/dataTables.bootstrap.min.js"></script>
<script src="<%=pluginPath%>/datatables/extensions/Select/js/dataTables.select.min.js"></script>
<script src="<%=pluginPath%>/datatables/extensions/Responsive/js/dataTables.responsive.min.js"></script>
<script src="<%=pluginPath%>/datatables/extensions/Buttons/js/dataTables.buttons.min.js"></script>

<!-- Chart -->
<script src="<%=pluginPath%>/chartjs/Chart.min.js"></script>


<!-- Form Validator -->
<script src="<%=pluginPath%>/validator/js/jquery.validate.min.js"></script>

<!-- SlimScroll -->
<script src="<%=pluginPath%>/slimScroll/jquery.slimscroll.min.js"></script>




<!-- AdminLTE App -->
<script src="<%=jsRoot%>/app.js?${Server_Token_Value}"></script>
<script type="text/javascript" src="<%=jsRoot%>/common/common.js?${Server_Token_Value}"></script>


<script type="text/javascript"> 

function loadAdvertisement(pageCode , providerType)
{
	 $.ajax( {
	        type: "GET",       // the default
	        url: jctxPath+"/ajaxadvertise/getAdvertisement.htm",
	        dataType: "html",
	        data: { pageCode: pageCode , /* This is configure in config.jsp and override in all page before import of this file */
        	    providerType : providerType}, /* Load all advertise */
        	success: function(data) {
        		$("#advertisement").html(data);
        	}
        	    
	 });
}

$(document).ready(function(){	
	
	
	// Right Add panel Set Height

	$.sessionTimeout();
	
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
	
	// Focus always first form element
	 $("form:not(.filter) :input:visible:enabled:first").focus();
});


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
	loadAdvertisement(jsPageCode , <%=AdvertisementProviderType.ADVERTISEMENT%>);
});

</script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button);
</script>

<!-- Date format validate -->
<script>
$.validator.addMethod("dateFormat",
	    function(value, element) {
	        return this.optional(element) || value.match(/^\d\d?\/\d\d?\/\d\d\d\d$/);
	    },
	    "Please enter a date in the format dd/mm/yyyy.");
	    
$.validator.addMethod('uniqueEmailId',
        function(value) {
		var result = true;
		if($.trim(value)!='')
			{
				$.ajax({ 
			        async:false, 
			        url:jctxPath+"/ajaxuser/checkEmailIdExists.htm",
			        data:{emailId:value}, 
			        dataType:"json",
			        success: function(data) {
			        	result = (data.isEmailIdDuplicate == true) ? false : true;
		            }
				});	
			}
		return result;

}, "Email Id is Already Exists");

$.validator.addMethod('uniqueMobileId',
        function(value) {
		var result = true;
		if($.trim(value)!='')
			{
				$.ajax({ 
			        async:false, 
			        url:jctxPath+"/ajaxuser/checkMobileNumberExists.htm",
			        data:{mobileNumber:value}, 
			        dataType:"json",
			        success: function(data) {
			        	result = (data.isMobileNumberDuplicate == true) ? false : true;
		            }
				});	
			}
		return result;

}, "Mobile Number is Already Exists");
</script>
