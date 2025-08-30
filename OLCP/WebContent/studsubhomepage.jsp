<%-- 
    Document   : studsubhomepage
    Created on : Feb 2, 2012, 10:28:22 AM
    Author     : SURYA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title></title>
<%
String cname=request.getParameter("course");
session.setAttribute("SessionCourse",cname);
%>
<frameset rows="20%,6.5%,*" border="0" >
<frame src="logo6.html" scrolling="no"/>
<frame src="stutab1.jsp" scrolling="no" />
<%-- <frameset cols="30%,*" border="1">
<frame src="i1.jpg" scrolling="no"/> --%>
<frame src="des1.jsp" name="frame"/>
    </frameset>
</frameset>
</head>
</html>