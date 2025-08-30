<%-- 
    Document   : deletecourse
    Created on : Feb 6, 2012, 10:02:02 PM
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
       Statement st1=con1.createStatement();
       Statement st2=con1.createStatement();
       Statement st3=con1.createStatement();
       Statement st4=con1.createStatement();
       Statement st5=con1.createStatement();
        String uname = request.getParameter("uname1").trim();
        String cname = request.getParameter("cname1").trim();
       
   
          
        String username = (String)session.getAttribute("SessionUser");
        String a="select Mail from login where Username='"+username+"'";
        rs1=st.executeQuery(a);
        String adminmail=null;
        while(rs1.next())
                       {
            adminmail=rs1.getString(1);
        }
        String fname,email,cname1;
        String sub="Course Member Deletion";
        String msg=""+uname+" has been deleted as a member to "+cname+" by administator";
        String query3="select l.Username,Mail,Cname from coursereg c,login l  where  c.Username=l.Username AND Cname='"+cname+"'";
        rs2=st2.executeQuery(query3);
                while(rs2.next())
        {
            fname=rs2.getString(1);
            email=rs2.getString(2);
            cname1=rs2.getString(3);
            String m="insert into mail(Rec,Send,Sub,Message,Date) values('"+email+"','"+adminmail+"','"+sub+"','"+msg+"',sysdate())";
            st3.executeUpdate(m);
            st3.executeUpdate("commit");
            
          
    String query="delete from coursereg where Username='"+uname+"' AND Cname='"+cname+"'";          
          st.executeUpdate(query);
          st.executeUpdate("commit");       
          
         
               
 }%>
<h1><center><font color="orange">Member Deletion Successful........</font></center></h1>
 
         <%      
        }
 	catch(Exception e)
                               {
	out.println(e);
}
                %>
<br><a href="memberdeletion.jsp"><center><font color="purple">BACK</font></center></a>
        </table>
    </body>
</html>
