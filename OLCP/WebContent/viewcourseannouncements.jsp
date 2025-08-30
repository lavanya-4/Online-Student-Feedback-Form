<%-- 
    Document   : viewcourseannouncements
    Created on : Feb 7, 2012, 7:56:37 PM
    Author     : Administrator
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
        <h1> <center> <font color="blue">
       </font> </center></h1>
        <table border="1" bgcolor="wheat" align="center">
            <th><font color="green">Course Name</font></th>
            <th><font color="green">Date</font></th>
            <th><font color="green">Announcement</font></th>
                        
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
           String r1="student",facid;
           String cname=(String)session.getAttribute("SessionCourse");
           String q1="select Courseid from course where Cname='"+cname+"'";
           rs=st.executeQuery(q1);
int cid=0;
               while(rs.next())
               {
              cid=rs.getInt("Courseid");
                           }

           String query="select c.Cname,a.date,a.Description from announcement a,course c where a.Courseid=c.Courseid AND c.Cname='"+cname+"'";
             
             String mid=null;
          
               rs1=st.executeQuery(query);

               while(rs1.next())
               {

             
%>
  <tr>

     <td align="center"><%=rs1.getString("Cname")%></td>
     <td align="center"><%=rs1.getString("date")%></td>     
     <td align="center"><%=rs1.getString("Description")%></td>
          
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



