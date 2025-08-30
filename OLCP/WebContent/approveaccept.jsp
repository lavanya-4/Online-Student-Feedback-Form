<%-- 
    Document   : approveaccept
    Created on : Feb 1, 2012, 9:52:39 PM
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
        String username=(String)session.getAttribute("SessionUser");
        String uname = request.getParameter("uname").trim();
        String cname = request.getParameter("cname").trim();
        String query="update coursereg set Status='"+status+"' where Cname='"+cname+"' AND Username='"+uname+"' ";
          
          st.executeUpdate(query);
           
       
              String q1="select Mail from login where Username='"+uname+"'";
       rs1=st.executeQuery(q1);
       String email=null;
       while(rs1.next())
                     {
       email=rs1.getString(1);
       
                     }
       //out.print(email);
        String q2="select Mail from login where Username='"+username+"'";
        //out.print(username);
       rs2=st.executeQuery(q2);
       String adminemail=null;
       while(rs2.next())
                     {
       adminemail=rs2.getString(1);
       
                     }
       //out.print(adminemail);
       String sub="New Course is added";
       String msg=""+cname+" is added ";
               
       String r2="insert into mail(Rec,Send,Sub,Message,Date) values('"+email+"','"+adminemail+"','"+sub+"','"+msg+"',sysdate())";
       st.executeUpdate(r2);
       st.executeUpdate("commit");
       out.print("<h1>Course Approved........</h1>");
       
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
