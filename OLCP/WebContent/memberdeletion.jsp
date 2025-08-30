<%-- 
    Document   : memberdeletion
    Created on : Feb 2, 2012, 9:27:22 PM
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
        <h1> <center> <font color="blue">Details
       </font> </center></h1>
        <table border="1" bgcolor="wheat" align="center">
            <th><font color="green">Reg_id</font></th>
            <th><font color="green">Name</font></th>
            <th><font color="green">Username</font></th>
            
            <th><font color="green">Course name</font></th>
            <th><font color="green">Delete</font></th>


                  <%

        ResultSet rs;
        ResultSet rs1;
	Connection con1;
        Connection con2;


try{

    String url="jdbc:mysql://localhost:3306/olcp?user=root&password=";
    Class.forName("com.mysql.jdbc.Driver");
    	con1=DriverManager.getConnection(url);
    	Statement st=con1.createStatement();
           String r1="faculty",s="a";
         //  String reg_id = request.getParameter("mid").trim();
           //int rid=Integer.parseInt(reg_id);
          String query="select r.Reg_id,r.Name,r.Username,c.Cname from registration r,coursereg c where  r.Username=c.Username AND c.Status='"+s+"' AND r.Role='"+r1+"'";
                  //out.println(username);
               //String mid=null;
          
               rs=st.executeQuery(query);

               while(rs.next())
               {

             
%>
  <tr>

     
     <td align="center"><%=rs.getInt(1)%></td>     
     <td align="center"><%=rs.getString(2)%></td>
     <td align="center"><%=rs.getString(3)%></td>
     
     <td align="center"><%=rs.getString(4)%></td>
     <td align="center"><a href="deletecourse.jsp?uname1=<%=rs.getString(3)%>&cname1=<%=rs.getString(4)%>">Delete</a></td>
    </tr>
      
     
<% }
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



