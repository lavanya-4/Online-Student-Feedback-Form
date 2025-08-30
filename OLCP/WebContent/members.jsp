<%-- 
    Document   : members
    Created on : Feb 1, 2012, 8:32:12 PM
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
        <script language="javascript">
            function sessioncal(str)
            {
                session.setAttribute("Sessionreg_id",str);
            }
            </script>
    </head>
    <body>
        <h1> <center> <font color="blue">Members
       </font> </center></h1>
        <table border="1" bgcolor="wheat" align="center">
            <th><font color="green">Reg_id</font></th>
            <th><font color="green">Name</font></th>
             <th><font color="green">Role</font></th>
            <th><font color="green">View</font></th>
            <th><font color="green">Delete</font></th>


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

           //String username = (String)session.getAttribute("SessionUser");
          String query="select Reg_id,Name,l.Role from login l,registration r where l.Username=r.Username ";
          //out.println(username);
               int mid=0;
               rs=st.executeQuery(query);

               while(rs.next()){

                   
                   /*}
               String query1="select * from mail where Rec='"+mid+"'";
                rs1=st.executeQuery(query1);
                //out.println("select * from mail where Rec='"+mid+"'");

                while(rs1.next()){*/


%>
  <tr>
      
     <td align="center"><%=rs.getString(1)%></td>
     <td align="center"><%=rs.getString(2)%></td>
     <td align="center"><%=rs.getString(3)%></td>
      
     <td align="center">
         
         <a href="viewdetails.jsp?mid=<%=rs.getString(1)%>">View</a></td>
<td align="center"><input type="button" value="Delete" onclick="memberdelete.jsp"/></td>

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

