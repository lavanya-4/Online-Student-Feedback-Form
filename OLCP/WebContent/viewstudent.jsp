<%-- 
    Document   : viewstudent
    Created on : Feb 2, 2012, 11:38:38 AM
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
        <h1> <center> <font color="blue">Details
       </font> </center></h1>
        <table border="1" bgcolor="wheat" align="center">
            <th><font color="green">Reg_id</font></th>
            <th><font color="green">Name</font></th>
            <th><font color="green">Username</font></th>
            
            <th><font color="green">Password</font></th>
            <th><font color="green">Email</font></th>
            <th><font color="green">MobileNo</font></th>
            
            <th><font color="green">Dob</font></th>
            <th><font color="green">College</font></th>
            <th><font color="green">Department</font></th>
            
            <th><font color="green">semister</font></th>
            <th><font color="green"> Qualification</font></th>
                       <th><font color="green">Address</font></th>
          
            


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
         //  String reg_id = request.getParameter("mid").trim();
           //int rid=Integer.parseInt(reg_id);
          String query="select * from registration where Role='"+r1+"'";
                  //out.println(username);
               //String mid=null;
          
               rs=st.executeQuery(query);

               while(rs.next())
               {

             
%>
  <tr>

     <td align="center"><%=rs.getString(14)%></td>
     <td align="center"><%=rs.getString(1)%></td>     
     <td align="center"><%=rs.getString(2)%></td>
     <td align="center"><%=rs.getString(3)%></td>
     
     <td align="center"><%=rs.getString(5)%></td>
     <td align="center"><%=rs.getString(6)%></td>
     <td align="center"><%=rs.getString(7)%></td>
     <td align="center"><%=rs.getString(8)%></td>
     <td align="center"><%=rs.getString(9)%></td>
     <td align="center"><%=rs.getString(11)%></td>
     <td align="center"><%=rs.getString(10)%></td>
     <td align="center"><%=rs.getString(12)%></td>
       
     
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



