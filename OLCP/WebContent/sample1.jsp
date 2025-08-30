<%-- 
    Document   : sample1
    Created on : Feb 4, 2012, 3:23:10 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page language="java" session="true" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
     String str[]=request.getParameterValues("s");
     for(int i=0;i<str.length;i++)
         
     out.println(str[i]);
     %>
        <h1>Hello World!</h1>
    </body>
</html>
