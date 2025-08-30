<%-- 
    Document   : registeredcourse
    Created on : Feb 3, 2012, 10:47:08 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java" session="true" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form name="f2" align="center"  >
            <table align="center" >
                
            <th><font color="green"><h1>!!!Registered Courses!!!</h1></font></th>
            

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
String status="a";
          String username = (String)session.getAttribute("SessionUser");
          String query="select * from coursereg where Username='"+username+"'AND Status='"+status+"'";
          rs=st.executeQuery(query);

               while(rs.next()){
%>
  <tr>
      
     <td align="center"><a href="factab2.jsp?course=<%=rs.getString(2)%>" target="_top"><%=rs.getString(2)%></a></td>
     

  </tr>
<% }
}

 	catch(Exception e)
	{
	out.println(e);
	//out.println("exception occured");
}
                %>
            
                </ul>
        </table>

        </form>
    </body>
</html>
