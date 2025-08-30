<%-- 
    Document   : facfeedback
    Created on : Feb 3, 2012, 10:11:27 PM
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
        <form name="f2" action="viewfacultyfeedback.jsp">
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
                String username = (String)session.getAttribute("SessionUser");
                out.print(username);
	    	String query="select * from coursereg where Username='"+username+"'";
	    	rs=st.executeQuery(query);
                while(rs.next())
		{
                    
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
