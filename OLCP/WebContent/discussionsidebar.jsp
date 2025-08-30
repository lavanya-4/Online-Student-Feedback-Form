<%-- 
    Document   : discussionsidebar
    Created on : Feb 8, 2012, 11:13:06 AM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body bgcolor="skyblue">
        <h2><a href="adddiscussion.jsp" target="f2"><font color="white">Create New</a></font></h2>
       <font color="black"> <h2><u><i>Topics</i></u></h2>
        
        </font> </center></h1><ul type="square">
        <table border="0">
         <tr><td></td></tr>
                      
        <%
        String cname=(String)session.getAttribute("SessionCourse");
           String username=(String)session.getAttribute("SessionUser");
           
                                    
String topic=null;   
        ResultSet rs;
        ResultSet rs1;
	Connection con1;
        Connection con2;


try{

    String url="jdbc:mysql://localhost:3306/olcp?user=root&password=";
    Class.forName("com.mysql.jdbc.Driver");
    	con1=DriverManager.getConnection(url);
    	Statement st=con1.createStatement();
        int cid=0;
                    
        String q2="select Courseid from course where Cname='"+cname+"'";
        rs=st.executeQuery(q2);
        while(rs.next())
                       {
            cid=rs.getInt("Courseid");
        }
           String q1="select Topicname from discussion where Courseid="+cid+"";
           rs1=st.executeQuery(q1);

               while(rs1.next())
               {
                                 
%>
<tr> <td align="center"> <a href="topicdiscussion.jsp?topic=<%=rs1.getString("Topicname")%>" target="f2"><li><%=rs1.getString("Topicname")%> </a></td></tr>
</ul>
<%}

           
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


       