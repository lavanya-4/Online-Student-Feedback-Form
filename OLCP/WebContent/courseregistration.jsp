<%-- 
    Document   : courseregistration
    Created on : Feb 3, 2012, 8:36:08 PM
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
        <%

        
        ResultSet rs;
        ResultSet rs1;
	Connection con1;
        Connection con2;
	String email,mbno,msg;

	//String name = (String)session.getAttribute("SessionUser");%

try{

    String url="jdbc:mysql://localhost:3306/olcp?user=root&password=";
    Class.forName("com.mysql.jdbc.Driver");
    	con1=DriverManager.getConnection(url);

    	Statement st=con1.createStatement();

       String ids=new String();
    	email=request.getParameter("e1");

        
	mbno=request.getParameter("m1");
	
        
        String username = (String)session.getAttribute("SessionUser");
        String cname=(String)session.getAttribute("Sessioncourse");
         String s1="u";
       
        String query1="insert into coursereg(Cname,Username,Status) values('" +cname+ "','" +username+ "','"+s1+"')";
        //javax.swing.JOptionPane.showMessageDialog(null,query1 );
        st.executeUpdate(query1);
        
        String query2="update registration set Email='"+email+ "',Mobileno='" +mbno+ "' where Username='"+username+"'";
        //javax.swing.JOptionPane.showMessageDialog(null,query1 );
        st.executeUpdate(query2);
        st.executeUpdate("commit");
        String q3="update login set Mail='"+email+"' where Username='"+username+"'";
        st.executeUpdate(q3);  %>      
        <center><h1> <font color="purple">Course Registration is done successfully.....</font><h1>
                    <h1><a href="coursereg.jsp"><font color="orange">Back</fot></a></h1>
                    </center>
                    <
                   <%

    	}
	catch(Exception e)
	{
	out.println(e);
	//out.println("exception occured");
    }
%>
    </body>
</html>
