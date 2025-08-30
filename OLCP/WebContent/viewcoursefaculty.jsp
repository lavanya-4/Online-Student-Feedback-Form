<%-- 
    Document   : viewcoursefaculty
    Created on : Feb 7, 2012, 7:36:54 PM
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
        <h1> <center> <font color="blue">Faculty Details
       </font> </center></h1>
        <table border="1" bgcolor="wheat" align="center">
            <th><font color="green">Name</font></th>
            <th><font color="green">Email</font></th>
            <th><font color="green">College</font></th>
            <th><font color="green">Department</font></th>
            
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
String s="a";
           String query="select r.Name,r.Email,r.College,r.Department from registration r,coursereg c where r.Username=c.Username AND c.Cname='"+cname+"' AND c.Status='"+s+"'";
             
             String mid=null;
          
               rs1=st.executeQuery(query);

               while(rs1.next())
               {

             
%>
  <tr>

     <td align="center"><%=rs1.getString("Name")%></td>
     <td align="center"><%=rs1.getString("Email")%></td>     
     <td align="center"><%=rs1.getString("College")%></td>
     <td align="center"><%=rs1.getString("Department")%></td>
      
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



