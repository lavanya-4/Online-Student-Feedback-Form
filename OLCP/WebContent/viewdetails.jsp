<%-- 
    Document   : viewdetails
    Created on : Feb 1, 2012, 8:40:54 PM
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
            <th><font color="green">Qualification</font></th>
            <th><font color="green">Address</font></th>
            <th><font color="green">Designation</font></th>


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
           
           String uname = request.getParameter("uname").trim();
           
          String query="select * from registration where Username='"+uname+"'";
                  //out.println(username);
               //String mid=null;
               rs=st.executeQuery(query);

               while(rs.next()){

                   /*mid=rs.getString(4);
                   }
               String query1="select * from mail where Rec='"+mid+"'";
                rs1=st.executeQuery(query1);
                //out.println("select * from mail where Rec='"+mid+"'");

                while(rs1.next()){*/

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
     <td align="center"><%=rs.getString(10)%></td>
    
     <td align="center"><%=rs.getString(12)%></td>
     <td align="center"><%=rs.getString(13)%></td>
     
     

      
     


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



