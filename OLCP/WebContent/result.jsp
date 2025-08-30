<%-- 
    Document   : result
    Created on : Feb 11, 2012, 10:51:00 AM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%
String id[]= new String[10];
for(int i=0;i<10;i++){
id[i]=request.getParameter("radio"+i);
}
String str[]= new String[10];
for(int j=0;j<10;j++){
str[j]=request.getParameter("answer"+j);
}
boolean isCorrect = Arrays.equals(id,str);
out.println("Your Answers are : " + isCorrect);
%>