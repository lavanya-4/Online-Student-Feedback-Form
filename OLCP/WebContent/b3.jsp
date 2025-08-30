<%-- 
    Document   : b3
    Created on : Feb 28, 2012, 10:04:31 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
       </head>
    <body><form>
         <%
         String username=(String)session.getAttribute("SessionUser");
         %>
         <h1><font color="green"><%out.print("Welcome "+username+".....");%></font></h1>
        
        <img src="online_student_learning_500_clr.gif" align="right" >
         
    </body>
</html>

