<%-- 
    Document   : loginvalid
    Created on : Jan 6, 2012, 10:59:51 AM
    Author     : SURYA
--%>

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
         PrintWriter pw=response.getWriter();
String username=request.getParameter("username");
String password=request.getParameter("password");

try
        {
String url="jdbc:mysql://localhost:3306/olcp?user=root&password=";
    Class.forName("com.mysql.jdbc.Driver");

Connection con=DriverManager.getConnection(url);
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from login where Username='"+username+"' and Password='"+password+"'");

String role;
            if(rs.next())
                {
                role=rs.getString(3);
                if(role.equals("admin"))
                    {
                session.setAttribute("SessionUser",username);
                response.sendRedirect("admin1.html");
                }
                else if(role.equals("faculty"))
                    {
                    session.setAttribute("SessionUser",username);
                    response.sendRedirect("fachome.html");
                    }
                else
                    {
                    session.setAttribute("SessionUser",username);
                    response.sendRedirect("studenthomepage.html");
                    }

                }

            else
               {
                response.sendRedirect("failure.html");
                }
}
catch(Exception e)
        {
    out.println(e);
    }

             %>

    </body>
</html>
