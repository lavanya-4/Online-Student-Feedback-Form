<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
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
        ResultSet rs;
        ResultSet rs1;
	Connection con1;
        Connection con2;
	String cname,des,status="Active";
int reg_id=0;
	//String name = (String)session.getAttribute("SessionUser");%>
	<center>
	<%
try{

    String url="jdbc:mysql://localhost:3306/olcp?user=root&password=";
    Class.forName("com.mysql.jdbc.Driver");
    	con1=DriverManager.getConnection(url);
    	Statement st=con1.createStatement();
        String ids = new String();
        int cid=0;
      
           
        cname=request.getParameter("cname");
	    des=request.getParameter("des");
      
        String query1="insert into course(Cname,Description,Status,Date) values('" +cname+ "','" +des+ "','"+status+"',sysdate())";

        st.executeUpdate(query1);
        st.executeUpdate("commit");
                      
       response.sendRedirect("addcoursesuccess.html");

    	
        }
catch(Exception e)
       {
    
}
%>
</center>


    </body>
</html>

