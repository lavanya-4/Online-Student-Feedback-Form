<%-- 
    Document   : feedback
    Created on : Jan 30, 2012, 11:09:12 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" session="true" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form name="f2" action="facultyfeedback.jsp">
         <img src="feedbackform.jpg" width="50%" align="right"/>
             
        <table align="center">
            <tr><td colspan="2">
            <h1><font color="green" style="font-family:TimesNewRoman"> VIEW FEEDBACK...</font></h1>
            <tr><td>Select Course Name:</td>
            <td><select name="cname">
                <%

	try{
            ResultSet rs;
            Connection con;
            String p,q;
            int com1=0;
	    String url="jdbc:mysql://localhost:3306/olcp?user=root&password=";
	    Class.forName("com.mysql.jdbc.Driver");
	    	con=DriverManager.getConnection(url);
	    	Statement st=con.createStatement();
	    	String query="select * from course";
	    	rs=st.executeQuery(query);
                while(rs.next())
		{
                    com1=rs.getInt(1);
                    q=rs.getString(2);
                    %>
                     <option value="<%=q%>"><%=q%></option>
                   <%}

                 }
                catch(Exception e)
                         {

                 }
%>
            </select></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td></td><td></td></tr>

<tr><td colspan="2" align="center"><input type="submit" value="submit"></td></tr>
        </table></form>
    </body>
</html>
