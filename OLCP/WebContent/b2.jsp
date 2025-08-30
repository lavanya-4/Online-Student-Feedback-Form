<%-- 
    Document   : b2
    Created on : Feb 28, 2012, 9:58:43 PM
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
        
        <img src="manset_79281.jpg" align="right">
         
    </body>
</html>

