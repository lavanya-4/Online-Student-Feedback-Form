<%-- 
    Document   : stusidebar
    Created on : Feb 1, 2012, 10:27:35 PM
    Author     : SURYA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table border="1" align="center" width="30%" >
       
                  <%
        ResultSet rs;
      	Connection con1;
    
try
{
    String url="jdbc:mysql://localhost:3306/olcp?user=root&password=";
    Class.forName("com.mysql.jdbc.Driver");
    	con1=DriverManager.getConnection(url);
    	Statement st=con1.createStatement();
          String query="select Cname from course";
        rs=st.executeQuery(query);

               while(rs.next())
               {
%>

  <tr>
 
    <td align="center"><a href="studsubhomepage.jsp?cname=<%=rs.getString(1)%>" target="_top">
        <font color="green"><%=rs.getString(1)%></font></a></td> 

  </tr>
<%
               }
}

 	catch(Exception e)
	{
	out.println(e);

}
                %>

        </table>
    </body>
</html>
