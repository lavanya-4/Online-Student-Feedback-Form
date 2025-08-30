<%-- 
    Document   : sturegcourse
    Created on : Feb 9, 2012, 1:10:58 PM
    Author     : SURYA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java" session="true" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script language="javascript">
     </script>
    </head>
    <body>
       
   
        <%
         PrintWriter pw=response.getWriter();
  String username = (String)session.getAttribute("SessionUser");
  String cname = request.getParameter("name").trim();
  session.setAttribute("SessionCourse",cname);
        ResultSet rs;
	Connection con1;
try{

    String url="jdbc:mysql://localhost:3306/olcp?user=root&password=";
    Class.forName("com.mysql.jdbc.Driver");
    	con1=DriverManager.getConnection(url);

    	Statement st=con1.createStatement();

       String query="select Courseid from course  where Cname='"+cname+"'";
       rs=st.executeQuery(query);
       int cid=0;
       while(rs.next())
          {
           cid=rs.getInt("Courseid");
                     }

        String query1="insert into stdcourse(Username,Courseid) values('"+username+"',"+cid+")";


        st.executeUpdate(query1);
        
%>
    <center><h1><font color="purple">Course Registration Successfull.....</font><br>
            <a href="studentcourseregistration.jsp"><font color="orange">Back</font></a>
            </br></h1></center>
<%
    
       }
	catch(Exception e)
	{
	out.println(e);

    }
    %>

    </body>
</html>
