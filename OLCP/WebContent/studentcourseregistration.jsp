<%-- 
    Document   : studentcourseregistration
    Created on : Feb 8, 2012, 11:59:35 PM
    Author     : SURYA
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
        <img src="Registration.gif" align="right" width="50%" height="410px"></img>
         <table border="1" bgcolor="pink" align="center">
                       <th colspan="2"><font color="blue">Course Name</font></th>

            <th colspan="2"><font color="green">Registration</font></th>
      
        <%
        ResultSet rs;
      
	Connection con1;
      
try{

    String url="jdbc:mysql://localhost:3306/olcp?user=root&password=";
    Class.forName("com.mysql.jdbc.Driver");
    	con1=DriverManager.getConnection(url);

    	Statement st=con1.createStatement();

    
    
        String username = (String)session.getAttribute("SessionUser");
        String cname=(String)session.getAttribute("SessionCourse");
      String query1="select Cname from course where Courseid not in (select Courseid from stdcourse where Username='"+username+"')";
        rs=st.executeQuery(query1);
   while(rs.next())
               {


%>
  <tr>

     <td align="center" colspan="2"><%=rs.getString("Cname")%></td>
     <td align="center" colspan="2"><a href="sturegcourse.jsp?name=<%=rs.getString("Cname")%>">Register</a></td>

  </tr>



<% } 
               
        
        %></table><%
               }
	catch(Exception e)
	{
	out.println(e);

    }
%>
    </body>
</html>
