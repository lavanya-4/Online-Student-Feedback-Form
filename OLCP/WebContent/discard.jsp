<%-- 
    Document   : discard
    Created on : Mar 8, 2012, 9:46:01 PM
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
    <body>
        <%
        
	try{
            ResultSet rs;
            Connection con;
            
	    String url="jdbc:mysql://localhost:3306/olcp?user=root&password=";
	    Class.forName("com.mysql.jdbc.Driver");
	    	con=DriverManager.getConnection(url);
	    	Statement st=con.createStatement();
                String id=request.getParameter("id");
	    	String query="delete from mail where id="+id+"";
	    	st.executeUpdate(query);
                %>
                <center><h2><font color="green">Mail Deleted Successfully...</font><br>
                        <a href="checkmail.jsp"><font color="orange">Back</font></a>
                   </center> <%
                    }
        
                catch(Exception e)
                         {

                 }
        %>
    </body>
</html>
