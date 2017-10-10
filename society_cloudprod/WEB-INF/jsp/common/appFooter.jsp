<!-- AdvertiseMent Left Fixed Position -->

<%@page import="app.societywala.common.constants.CommonConstant"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="app.societywala.common.impl.utilimpl.CommonUtilImpl"%>
<%
SimpleDateFormat copyRightsYearFormat = new SimpleDateFormat(CommonConstant.yearDBFormatter);
String copyRightsTodayYearStr = copyRightsYearFormat.format(configTodayDate);
%>

<div class="advertisementbarRight">
	<div>Advertisement</div>
	<div class="rightVeriticalJCarousel" id="rightVeriticalJCarousel">
	<!-- BuySellAds Zone Code -->
		<ul>
			
		</ul>
	<!-- End BuySellAds Zone Code -->
	</div>
</div>

<!-- AdvertiseMent Left Fixed Position -->

<div class="appFooterBg">
	<div class="center">
	<div class="appFooter">
		<div style="text-align: center; padding: 20px;">
			COPYRIGHT � LinkApartment.com 2011-<%=copyRightsTodayYearStr%><br/>
			Site best viewed in IE 9.0 and above, Firefox and Chrome .
		</div>
	</div>
	</div>
</div>

<!-- AdvertiseMent Sponsor Down Position -->
 <div class="advertisementbarBottom">
	<div>Sponsore</div>
	<div class="bannerBottom">
	<!-- BuySellAds Zone Code -->
		<div class="bannerDivBottom" id="bannerDivBottom" dir="rtl">
			<ul>
			
			</ul>
		</div>
	<!-- End BuySellAds Zone Code -->
	</div>
</div> 
<!-- AdvertiseMent Sponsor Down Position -->

<script type="text/javascript">
jsPageCode = <%=pageCode%>;
</script>