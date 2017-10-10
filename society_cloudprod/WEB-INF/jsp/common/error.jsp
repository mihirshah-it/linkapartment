<%@page import="java.io.PrintStream"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@ page isErrorPage="true" %> 
<html>
<body>
Some Error is occurre

<b><%= exception.getMessage() %></b><br>
<p><b>With the following stack trace:</b>

<pre><b><% 
  ByteArrayOutputStream baos = new ByteArrayOutputStream();
  exception.printStackTrace(new PrintStream(baos));
  out.print(baos); %>
</b></pre>
</body>
</html>