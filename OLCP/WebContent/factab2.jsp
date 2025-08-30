<%-- 
    Document   : factab2
    Created on : Feb 7, 2012, 11:50:16 AM
    Author     : Administrator
--%>
<%@page language="java" session="true" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<html>
<head>
<title></title>
<%
String course=request.getParameter("course");
session.setAttribute("SessionCourse", course);
%>
<frameset rows="20%,8%,*" border="0" >
<frame src="logo5.html" scrolling="no" name="mainfr" >
<frame src="facultytab.html" scrolling="no" >
 <frame src="des1.jsp" name="frame1">
</frameset>
</head>
</html>
