<%-- 
    Document   : addcampusfaculty1
    Created on : Feb 7, 2012, 10:34:11 AM
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
        ResultSet rs;
        ResultSet rs1;
        ResultSet rs3;
        ResultSet rs4=null;
        
        
	Connection con1;
        Connection con2;
	String name,colz,dept,qual,desig,facid;
int id=0;
	//String name = (String)session.getAttribute("SessionUser");%>
	<center>
	<%
try{

    String url="jdbc:mysql://localhost:3306/olcp?user=root&password=";
    Class.forName("com.mysql.jdbc.Driver");
    	con1=DriverManager.getConnection(url);
        
    	Statement st=con1.createStatement();
        
       
    	facid=request.getParameter("facid");
        
        name=request.getParameter("facname");
	        
        colz=request.getParameter("colz");
        dept=request.getParameter("dept");
        qual=request.getParameter("qualification");
                desig=request.getParameter("desig");
        

        String query1="insert into campus values('" +facid+ "','" +name+ "','" +colz+ "','" +dept+ "','" +qual+  "','" +desig+ "')";
        st.executeUpdate(query1);
        st.executeUpdate("commit");
        //out.println("<h1>Faculty is added to the college database Successfully....</h1>");
        %><center><h2><font color="green">Faculty is added to the college database Successfully....</font><br></br>
                <h2><a href="addcampusfaculty.jsp"><font color="orange">Back</font></a></h2></center>
                 
                    <%        
}
	catch(Exception e)
	{
	
        %>
        <center><h2><font color="green">Enter Valid Faculty Id.....</font><br></br>
                <h2><a href="addcampusfaculty.jsp"><font color="orange">Back</font></a></h2></center>
	<%
}
%>
</center>


    </body>
</html>
