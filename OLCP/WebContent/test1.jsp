<%-- 
    Document   : test1
    Created on : Feb 11, 2012, 10:45:46 AM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form name="form" method="post" action="result.jsp">
<table> 
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
        String cname=(String)session.getAttribute("SessionCourse");
           String q1="select Courseid from course where Cname='"+cname+"'";
           rs=st.executeQuery(q1);
           int cid=0;
           while(rs.next())
                             {
               cid=rs.getInt(1);
                             }
    rs1=st.executeQuery("select * from test where Courseid="+cid+"");
int i=0;
while(rs1.next()){ 
%>
<tr>
<td><%=rs1.getString(2)%></td>
<td><input type="radio" name="radio<%=i%>" value="<%= rs1.getString(3) %>"></td><td><%=rs1.getString(3)%></td>
<td><input type="radio" name="radio<%=i%>" value="<%= rs1.getString(4) %>"></td><td><%=rs1.getString(4)%></td>
<td><input type="radio" name="radio<%=i%>" value="<%= rs1.getString(5) %>"></td><td><%=rs1.getString(5)%></td>
<td><input type="radio" name="radio<%=i%>" value="<%= rs1.getString(6) %>"></td><td><%=rs1.getString(6)%></td>

<td><input type="hidden" name="answer<%=i%>" value="<%= rs1.getString(7) %>"></td>

</tr><%
i++;
}
}
catch(Exception e)
	{
	out.println(e);
	//out.println("exception occured");
}
%>
<tr><td><INPUT type="submit" name="submit" value="Submit"></td></tr>
</table>
</form>
    </body>
</html>
