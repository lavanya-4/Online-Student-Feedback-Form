<%-- 
    Document   : approve
    Created on : Feb 1, 2012, 2:14:53 PM
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
        <h1><center><font color="blue">!!!Faculty Approval!!! </font></center></h1>
        <table border="1" bgcolor="wheat" align="center">
     
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
        String uname=null,cname1=null;

String username = (String)session.getAttribute("SessionUser");
          String query="select * from coursereg where Status!='a' ";
           rs=st.executeQuery(query);

               while(rs.next()){
%>
  <tr>
      <td align="center"><%=rs.getString(3)%></td>
     <td align="center"><%=rs.getString(2)%></td>
     <td align="center"><a href="viewdetails.jsp?uname=<%=rs.getString(3)%>">view</td>
     <td align="center"><a href="checkcourse.jsp?uname=<%=rs.getString(3)%>&cname=<%=rs.getString(2)%>">Check</a></td>
     <td align="center"><a href="approveaccept.jsp?uname=<%=rs.getString(3)%>&cname=<%=rs.getString(2)%>">Approve</td>
     <td align="center"><a href="approvereject.jsp?uname=<%=rs.getString(3)%>&cname=<%=rs.getString(2)%>">Reject</td>
     
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
