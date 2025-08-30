<%-- 
    Document   : approvereject
    Created on : Feb 3, 2012, 11:59:24 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
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
	Connection con1;
        Connection con2;


try{

    String url="jdbc:mysql://localhost:3306/olcp?user=root&password=";
    Class.forName("com.mysql.jdbc.Driver");
    	con1=DriverManager.getConnection(url);

    	Statement st=con1.createStatement();
       
        String status="a";
        String Username=(String)session.getAttribute("SessionUser");
        String uname = request.getParameter("uname").trim();
        String cname = request.getParameter("cname").trim();
        String query="delete from coursereg where Username='"+uname+"' AND Cname='"+cname+"'";
          
          st.executeUpdate(query);
          String query1="select Courseid from course where Cname='"+cname+"'";
          rs=st.executeQuery(query1);
                    int cid=0;
          while(rs.next())
                           {
              cid=rs.getInt("Courseid");
          }
          String query3="delete from faccourse where Username='"+uname+"' AND Courseid="+cid+"";
          
          st.executeUpdate(query3);
           String q1="select Mail from login where Username='"+uname+"'";
       rs1=st.executeQuery(q1);
       String email=null;
       while(rs1.next())
                     {
       email=rs1.getString(1);
       
                     }
        String q2="select Mail from login where Username='"+Username+"'";
       rs2=st.executeQuery(q2);
       String email1=null;
       while(rs2.next())
                     {
       email1=rs2.getString(1);
       
                     }
       String sub="Your Registration is not accepted";
       String msg=""+cname+" is not accepted ";
               
       String r2="insert into mail(Rec,Send,Sub,Message,Date) values('"+email+"','"+email1+"','"+sub+"','"+msg+"',sysdate())";
       st.executeUpdate(r2);
       st.executeUpdate("commit");
          
           
       st.executeUpdate("commit");
       out.print("<h1>Course was Rejected........</h1>");
       
               
 }

 	catch(Exception e)
	{
	out.println(e);
	//out.println("exception occured");
}
                %>

        </table>
    </body>
</html>
