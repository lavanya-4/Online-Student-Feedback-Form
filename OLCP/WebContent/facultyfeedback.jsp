<%--
    Document   : feedback
    Created on : Jan 30, 2012, 11:09:12 PM
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form name="f2" action="viewfacultyfeedback.jsp">
         <img src="feedbackform.jpg" width="50%" align="right"/>

        <table align="center">
            <tr><td colspan="2">
            <h1><font color="green" style="font-family:TimesNewRoman">!!!FEEDBACK!!!</font></h1>
            <tr><td>Select Faculty:</td>
            <td><select name="fname">
                <%

	try{
            ResultSet rs;
            Connection con;
            String p,q=null;;
            int com1=0;
            String s="a";
	    String url="jdbc:mysql://localhost:3306/olcp?user=root&password=";
	    Class.forName("com.mysql.jdbc.Driver");
	    	con=DriverManager.getConnection(url);
	    	Statement st=con.createStatement();
                String cname=request.getParameter("cname");
                session.setAttribute("scourse",cname);
                //out.println(cname);
	    	String query="select r.Name from registration r,coursereg f where   r.Username=f.Username    AND f.Cname='"+cname+"' AND f.Status='"+s+"'";
	    	//out.println("select r.Name from registration r,coursereg f where   r.Username=f.Username    AND f.Cname='"+cname+"' AND f.Status='"+s+"'");
                rs=st.executeQuery(query);
                while(rs.next())
		{                   
                    q=rs.getString("Name");
                    %>
                     <option value="<%=q%>"><%=q%></option>
                   <%}
                 
                 }
       
       
                catch(Exception e)
                         {

                 }
%>
            </select></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td></td><td></td></tr>
<tr><td colspan="2" align="center"><input type="submit" value="submit"></td></tr>
        </table>
        </form>
    </body>
</html>
