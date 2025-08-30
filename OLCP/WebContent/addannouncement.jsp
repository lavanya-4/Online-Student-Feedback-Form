<%-- 
    Document   : addannouncement
    Created on : Jan 30, 2012, 2:27:51 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">


<%@page language="java" session="true" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<html>
    <head>
        <title></title>
    </head>
    <body>
        <%
        ResultSet rs2=null;
        ResultSet rs1=null;
	Connection con;
        Connection con1;
	String name,msg,date;
    int id=501;
int reg_id=0;
	
	try{

    String url="jdbc:mysql://localhost:3306/olcp?user=root&password=";
    Class.forName("com.mysql.jdbc.Driver");
    	con=DriverManager.getConnection(url);
        //con1=DriverManager.getConnection(url);
    	Statement st=con.createStatement();
        //Statement st1=con1.createStatement();
        String ids = new String();
    	name=request.getParameter("coursename");
        msg=request.getParameter("message");


        String q1="select Courseid from course where Cname='"+name+"'";
          rs2=st.executeQuery(q1);
          int cid=0;
      while(rs2.next())
         {

           cid= rs2.getInt(1);
          }
          
        String query1="insert into announcement(Courseid,date,Description) values("+cid+",sysdate(),'"+msg+"')";
    	st.executeUpdate(query1);
        st.executeUpdate("commit");
       response.sendRedirect("addannouncementsuccess.jsp");
       // out.println(query1);
    	}
	catch(Exception e)
	{
	out.println(e);
	//out.println("exception occured");
}
%>
</center>
    </body>
</html>
