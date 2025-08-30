<%-- 
    Document   : adddiscussion
    Created on : Feb 9, 2012, 10:13:36 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page language="java" session="true" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.lang.*" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form name="f" action="adddiscussion1.jsp" align="center">
            
        
        <img src="discuss.jpg" align="right" ></img>
        <h1><font color="blue"><u><i>Create Discussion</i></u></font></h1>
        <table align="center">
            
            <tr>
                <td>Tilte</td>
                <td><input type="text" value="" name="t1" size="56"></input></td>
            </tr>
            <tr>
                <td>Message</td>
                <td><textarea name="msg" value="" rows="15" cols="50"></textarea></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><input type="submit" /></tr>
        </table>
            </form>
    </body>
</html>
