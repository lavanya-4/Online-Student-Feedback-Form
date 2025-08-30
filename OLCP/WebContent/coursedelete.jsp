<%-- 
    Document   : coursedelete
    Created on : Jan 29, 2012, 1:29:48 PM
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
        ResultSet rs2;
         ResultSet rs3;
        Statement st1=null,st2=null,st3=null,st4=null,st5=null,st6=null,st7=null,st8=null,st9=null;
	Connection con1;
        Connection con2;
			
try{

    String url="jdbc:mysql://localhost:3306/olcp?user=root&password=";
    Class.forName("com.mysql.jdbc.Driver");
    	con1=DriverManager.getConnection(url);
    	Statement st=con1.createStatement();
        st1=con1.createStatement();
         st2=con1.createStatement();
         st3=con1.createStatement();
         st4=con1.createStatement();
         st5=con1.createStatement();
         st6=con1.createStatement();
         st7=con1.createStatement();
         st8=con1.createStatement();
         st9=con1.createStatement();
        
      	String name=request.getParameter("coursename");
        String username = (String)session.getAttribute("SessionUser");
        String a="select Mail from login where Username='"+username+"'";
        rs2=st.executeQuery(a);
        String adminmail=null;
        while(rs2.next())
                       {
            adminmail=rs2.getString(1);
        }
       String query1="select Courseid from course where Cname='"+name+"'";
       rs=st1.executeQuery(query1);
             String cid=null;
            while(rs.next())
            {
            cid=rs.getString("Courseid");
            }       
        int cid1=Integer.parseInt(cid);
        String fname,email,cname1;
        String sub="Course deletion";
        String msg=""+name+" is deleted by administator";
        String query="select l.Username,Mail,Cname from coursereg c,login l  where  c.Username=l.Username AND Cname='"+name+"'";
        rs1=st2.executeQuery(query);
                while(rs1.next())
        {
            fname=rs1.getString(1);
            email=rs1.getString(2);
            cname1=rs1.getString(3);
            String m="insert into mail(Rec,Send,Sub,Message,Date) values('"+email+"','"+adminmail+"','"+sub+"','"+msg+"',sysdate())";
            st3.executeUpdate(m);
            st3.executeUpdate("commit");
            String query3="delete from coursereg where Username='"+fname+"' AND Cname='"+cname1+"'";          
             st4.executeUpdate(query3);
          st4.executeUpdate("commit");
            
        }              
         String query5="select l.Username,Courseid,Mail from stdcourse c,login l  where Courseid="+cid+" AND c.Username=l.Username";
        rs3=st5.executeQuery(query5);
        String sname,semail=null;
        int scid=0;
        while(rs3.next())
        {
            sname=rs3.getString(1);
            scid=rs3.getInt(2);
            semail=rs3.getString(3);
            String m1="insert into mail(Rec,Send,Sub,Message,Date) values('"+semail+"','"+adminmail+"','"+sub+"','"+msg+"',sysdate())";
            st6.executeUpdate(m1);
            st6.executeUpdate("commit");
            String query7="delete from stdcourse where Username='"+sname+"' AND Courseid="+scid+"";          
          st7.executeUpdate(query7);
        
         
          st7.executeUpdate("commit");
          String d="delete from announcement where Courseid="+scid+"";
          st8.executeUpdate(d);
          st8.executeUpdate("commit");
           
        }      
        
          String query4="delete from course where  Cname='"+name+"'"; 
                                   
          st9.executeUpdate(query4);
                 
       st9.executeUpdate("commit");
       out.print("<h1>Course was deleted........</h1>");
       
               
       }

 	catch(Exception e)
	{
	out.println(e);
	//out.println("exception occured");
}
                %>

          </body>
</html>



      