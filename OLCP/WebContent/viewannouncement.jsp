<%-- 
    Document   : viewannouncement
    Created on : Jan 31, 2012, 8:44:05 PM
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
        <img src="News.jpg" align="right" width="50%" height="410px"/>
        <h1><center><font color="blue">!!!ANNOUNCEMENTS!!!
        </center></font></h1>
        <table border="1" bgcolor="wheat" align="center">
            <th><font color="green">DATE</font></th>
            <th><font color="green">COURSE NAME</font></th>
            <th><font color="green">MESSAGE</font></th>

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


        String query="select a.date,Cname,a.Description from announcement a ,course c where a.Courseid=c.Courseid AND  a.date <= CURRENT_DATE AND a.date>= ( CURRENT_DATE - INTERVAL 20 DAY )";
        rs=st.executeQuery(query);

               while(rs.next()){
%>
  <tr>
      <td align="center"><%=rs.getDate(1)%></td>
     <td align="center"><%=rs.getString(2)%></td>
     <td align="center"><%=rs.getString(3)%></td>

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
