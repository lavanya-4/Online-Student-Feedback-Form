<%-- 
    Document   : mailinsert
    Created on : Jan 31, 2012, 8:42:32 AM
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
	String name,sub,msg;

	//String name = (String)session.getAttribute("SessionUser");%

try{

    String url="jdbc:mysql://localhost:3306/olcp?user=root&password=";
    Class.forName("com.mysql.jdbc.Driver");
    	con1=DriverManager.getConnection(url);

    	Statement st=con1.createStatement();

       String ids=new String();
    	name=request.getParameter("usermailid");

        
	sub=request.getParameter("sub");
	
        msg=request.getParameter("msg");
        String username = (String)session.getAttribute("SessionUser");
          String query="select * from login where Username='"+username+"' ";
          rs=st.executeQuery(query);
       while(rs.next())
            {
               ids = rs.getString(4);
            }
        
          

        String query1="insert into mail(Rec,Send,Sub,Message,Date) values('" +name+ "','" +ids+ "','" +sub+ "','" +msg+ "',sysdate())";
        //javax.swing.JOptionPane.showMessageDialog(null,query1 );
        st.executeUpdate(query1);
        st.executeUpdate("commit");
              %>
     <h1><center><font color="purple">Mail Sent Successfully.....</font></center><h1>
             <br><h2><a href="checkmail.jsp"><center><font color="orange">BACK</font></center></a></h2>
<%
          	}
	
                
        catch(Exception e1)
	{
	out.println(e1);
	//out.println("exception occured");
    }
%>
    </body>
</html>
