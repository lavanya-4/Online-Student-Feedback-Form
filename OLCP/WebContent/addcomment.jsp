<%-- 
    Document   : addcomment
    Created on : Feb 8, 2012, 3:16:31 PM
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
        <form name="f" action="addreply.jsp" align="center">
            <img src="comment_stage_6.png" align="right">
        <h1><font color="blue"><u><i>Add Reply</i></u></font></h1>
        <table align="center">
            <tr>
                <td>Tilte</td>
                <td><input type="text" value="" name="t1" size="57"></input></td>
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
