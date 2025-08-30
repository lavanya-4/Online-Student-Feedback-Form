<%-- 
    Document   : b1
    Created on : Feb 15, 2012, 1:48:46 PM
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
        
        <img src="admin.jpg" align="right">
         
    </body>
</html>
