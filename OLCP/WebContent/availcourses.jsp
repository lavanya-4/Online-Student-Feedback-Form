<%-- 
    Document   : availcourses
    Created on : Jan 31, 2012, 8:49:32 AM
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
        <table align="center" >
            
            <th><font color="green"><h1>!!! Available Courses!!!</h1></font></th>
            <%

        ResultSet rs;
        ResultSet rs1;
	Connection con1;
        Connection con2;


try{

    String url="jdbc:mysql://localhost:3306/olcp?user=root&password=";
    Class.forName("com.mysql.jdbc.Driver");
    	con1=DriverManager.getConnection(url);

    	Statement st=con1.createStatement();


          String query="select * from course";
        rs=st.executeQuery(query);

               while(rs.next()){
%>
  <tr>
      
     <td align="center"><%=rs.getString(2)%></td>
     

  </tr>
<% }
}

 	catch(Exception e)
	{
	out.println(e);
	//out.println("exception occured");
}
                %>
            

        </table>

    </body>
</html>
