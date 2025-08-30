<%-- 
    Document   : viewresults
    Created on : Mar 9, 2012, 7:38:09 PM
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
        <h1> <center> <font color="blue">
       </font> </center></h1>
        <table border="1" bgcolor="wheat" align="center">
            
            <th><font color="green">Date</font></th>
            <th><font color="green">Student Name</font></th>
            <th><font color="green">Score</font></th>
                        
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
           String query="select Date,Username,Score from testresult where Course='"+cname+"' order by Date DESC";
             
       
          
               rs1=st.executeQuery(query);

               while(rs1.next())
               {

             
%>
  <tr>

     <td align="center"><%=rs1.getDate(1)%></td>
     <td align="center"><%=rs1.getString(2)%></td>     
     <td align="center"><%=rs1.getInt(3)%></td>
          
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



