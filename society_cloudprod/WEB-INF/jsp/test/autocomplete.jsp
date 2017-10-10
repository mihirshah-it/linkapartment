   <link rel="stylesheet" type="text/css" href="<%=cssRoot%>/jquery.autocomplete.css" />
   <script type="text/javascript" src="<%=jsRoot%>/common/jquery.ui.core.js"></script>
   <script type="text/javascript" src="<%=jsRoot%>/common/jquery.ui.widget.js"></script>
   <script type="text/javascript" src="<%=jsRoot%>/common/jquery.ui.position.js"></script>
   <script type="text/javascript" src="<%=jsRoot%>/common/jquery.autocomplete.js"></script>

<script type="text/javascript">
   $(function() {	      
	   $("#stateBO").autocomplete({
		           source: function(request, response) {
	            	  $.ajax({
	                      url: jctxPath+"/ajaxsociety/getAllStateListByCountryID.htm",
	                      dataType: "json",
	                      data: {
	                          maxRows: 15,
	                          name_startsWith: request.term,
	                          countryId: $("#countryBO").val()
	                      },
	                      success: function(data) {
	                          response($.map(data.state, function(item) {
	                    		  return {
	                                  label: item.stateName,
	                                  value: item.stateId
	                              }
	                          }))
	                      }
	                  })
	              },
	              minLength: 2,
	              open: function() {
	                  $(this).removeClass("ui-corner-all").addClass("ui-corner-top");
	              },
	              close: function() {
	                  $(this).removeClass("ui-corner-top").addClass("ui-corner-all");
	              }
	          });
	      });
   </script>
   
   
   <div class="ui-widget"><form:input  path="stateBO" htmlEscape="true"/>