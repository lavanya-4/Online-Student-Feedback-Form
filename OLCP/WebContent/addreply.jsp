<%-- 
    Document   : addreply
    Created on : Feb 8, 2012, 11:06:12 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page language="java" session="true" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        
         String cname=(String)session.getAttribute("SessionCourse");
           String username=(String)session.getAttribute("SessionUser");
           
                                    

        ResultSet rs;
        ResultSet rs1;
        ResultSet rs2;
	Connection con1;
        Connection con2;


try{

    String url="jdbc:mysql://localhost:3306/olcp?user=root&password=";
    Class.forName("com.mysql.jdbc.Driver");
    	con1=DriverManager.getConnection(url);
    	Statement st=con1.createStatement();
        int cid=0;
        String msg,topic;
        topic=request.getParameter("t1");
        msg=request.getParameter("msg");
                    int id=Integer.parseInt((String)session.getAttribute("SessionId")); 
        String q2="select Courseid from course where Cname='"+cname+"'";
        rs=st.executeQuery(q2);
        while(rs.next())
                       {
            cid=rs.getInt("Courseid");
        }
     String q1="insert into reply(disid,Courseid,Username,Topic,Replymsg) values("+id+","+cid+",'"+username+"','"+topic+"','"+msg+"')";
     st.executeUpdate(q1);
     out.println("<h1><center>Comment added Successfully<center><h1>");
            %><%
}    
 	catch(Exception e)
	{
	out.println(e);
	//out.println("exception occured");
}
                %>


    </body>
</html>
