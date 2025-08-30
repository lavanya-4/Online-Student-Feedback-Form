<%-- 
    Document   : viewsuggestions
    Created on : Feb 23, 2012, 11:30:53 AM
    Author     : Lovely
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
    <body>
        <img src="feedback1.jpg" align="right" width="50%" height="450px">
        </img>
        <h3><center><font color="blue">SUGGESTIONS</font></center></h3>
        <table align="center" border="0" style="color:purple" >
            <tr>
            
                 
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
           String cname=(String)session.getAttribute("SessionCourse");
           String username=(String)session.getAttribute("SessionUser");
           String q1="select Courseid from course where Cname='"+cname+"'";
           rs=st.executeQuery(q1);
int cid=0;
               while(rs.next())
               {
              cid=rs.getInt("Courseid");
                           }

           String query="select Suggestion from feedback where Username='"+username+"' AND Courseid="+cid+"";
          
               rs1=st.executeQuery(query);
String str=null;

               while(rs1.next())
                  
                 {
                   
             
%>
  
    <tr><td><%=rs1.getString("Suggestion")%></td></tr>
    
         
           
<% 
       
             }
}
//if(str.equals(null))
//out.println("No feedback is available");    
          


 	catch(Exception e)
	{
	out.println(e);
	
}
                %>
   

        
  </table>
    </body>
</html>
