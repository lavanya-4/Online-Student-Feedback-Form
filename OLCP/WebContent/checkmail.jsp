<%-- 
    Document   : checkmail
    Created on : Jan 31, 2012, 9:08:58 PM
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
        <img src="inbox.png" align="right"/>
        <h1> <center> <font color="blue">INBOX
       </font> </center></h1>
        
        <table border="1" bgcolor="wheat" align="left" width="60%" cellpadding="10px">
            <th><font color="green">DATE</font></th>
            <th><font color="green">FROM</font></th>
            <th><font color="green">SUBJECT</font></th>
            <th><font color="green">MESSAGE</font></th>
            <th><font color="green">REPLY</font></th>
            <th><font color="green">DELETE</font></th>


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
          String query="select * from login where Username='"+username+"'";
          //out.println(username);
 String mid=null;
               rs=st.executeQuery(query);

               while(rs.next()){

                   mid=rs.getString(4);
                   }
               String query1="select * from mail where Rec='"+mid+"'";
                rs1=st.executeQuery(query1);
                //out.println("select * from mail where Rec='"+mid+"'");
             
                while(rs1.next()){

%>
  <tr>
      <td align="center"><%=rs1.getDate(6)%></td>
     <td align="center"><%=rs1.getString(2)%></td>
     <td align="center"><%=rs1.getString(3)%></td>
     <td align="center"><%=rs1.getString(4)%></td>
     <td align="center"><a href="reply.jsp?from=<%=rs1.getString(2)%>">Reply</a></td>
     <td align="center"><a href="discard.jsp?id=<%=rs1.getString(5)%>">Delete</a></td>

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
