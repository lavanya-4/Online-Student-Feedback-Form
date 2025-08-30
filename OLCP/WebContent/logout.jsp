<%-- 
    Document   : logout
    Created on : Feb 27, 2012, 10:19:13 PM
    Author     : L@lli
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script language="JavaScript">
javascript:window.history.forward(1);
</script>
    </head>
    <body>
<%--
<%if (session.isNew()==true)
response.sendRedirect(response.encodeRedirectURL("startpage.html"));%>
<%session.invalidate();%>

<h4> You were being Logged out </h4> <br>
<a href = "startpage.jsp"> Login </a><br>
    
    <b>Session ID: </b><%= session.getId() %>
    --%>
if(session.getAttribute("username")!= null){
out.println("<script>parent.location.href='starthome.html'</script>");
}else
{
}
</body>
</html>
