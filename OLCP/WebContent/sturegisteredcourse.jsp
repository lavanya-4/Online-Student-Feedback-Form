<%-- 
    Document   : sturegisteredcourse
    Created on : Feb 9, 2012, 11:26:50 AM
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
        <form name="f2" align="center"  >
            <table align="center" >

            <th><font color="green"><h1>!!!Registered Courses!!!</h1></font></th>


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
          String username = (String)session.getAttribute("SessionUser");
       String cname=(String)session.getAttribute("SessionCourse");
        String query1="select c.Cname from course c,stdcourse s where c.Courseid=s.Courseid AND s.Username='"+username+"'";
        rs=st.executeQuery(query1);
        while(rs.next())
            {
            %>

      
  <tr>

     <td align="center"><a href="studsubhomepage.jsp?course=<%=rs.getString(1)%>" target="_top"><%=rs.getString(1)%></a></td>


  </tr>
<% }
        }
 	catch(Exception e)
	{
	out.println(e);
    }
                %>

                </ul>
        </table>

        </form>
    </body>
</html>