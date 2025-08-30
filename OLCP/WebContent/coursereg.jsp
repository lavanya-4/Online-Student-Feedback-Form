<%-- 
    Document   : coursereg
    Created on : Feb 3, 2012, 3:29:38 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <img src="Registration.gif" align="right" width="50%" height="410px"></img>
        <table border="1" bgcolor="wheat" align="center">
            <h1> <center> <font color="blue">Courses
       </font> </center></h1>
                       <th><font color="green">Course Name</font></th>
          
            <th><font color="green">Registration</font></th>


                  <%
PrintWriter pw=response.getWriter();
        ResultSet rs;
        ResultSet rs1;
	Connection con1;
        Connection con2;


try{

    String url="jdbc:mysql://localhost:3306/olcp?user=root&password=";
    Class.forName("com.mysql.jdbc.Driver");
    	con1=DriverManager.getConnection(url);
    	Statement st=con1.createStatement();
         String username = (String)session.getAttribute("SessionUser");
          String name=null;
         //  String reg_id = request.getParameter("mid").trim();
           //int rid=Integer.parseInt(reg_id);
          String query="select * from course where Cname not in (select Cname from coursereg where Username='"+username+"')";
      
        
               rs=st.executeQuery(query);

               while(rs.next())
               {

             
%>
  <tr>

     <td align="center"><%=rs.getString(2)%></td>
     <td align="center"><a href="regcourse.jsp?name=<%=rs.getString(2)%>">Register</a></td>              
  </tr>
      
     
<% 
}
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



