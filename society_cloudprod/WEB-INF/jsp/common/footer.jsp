 <%@page import="app.societywala.common.constants.CommonConstant"%>
<%@page import="java.text.SimpleDateFormat"%>
<%
SimpleDateFormat copyRightsYearFormat = new SimpleDateFormat(CommonConstant.yearDBFormatter);
String copyRightsTodayYearStr = copyRightsYearFormat.format(configTodayDate);
%>
 
 <footer class="main-footer">
    <div class="pull-right hidden-xs">
      <b>Version</b> 3.0.0
    </div>
    <strong>Copyright &copy; 2011-<%=copyRightsTodayYearStr%> <a href="http://linkapartment.com">Link Apartment</a>.</strong> All rights reserved.
</footer>

<script type="text/javascript">
jsPageCode = <%=pageCode%>;
</script>
<!-- Google Analytic Code -->
<script type="text/javascript">
  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-31079131-1']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
<!-- Google Analytic code end -->