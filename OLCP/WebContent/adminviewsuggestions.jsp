<%-- 
    Document   : viewsuggestions
    Created on : Feb 23, 2012, 11:39:17 AM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h2><center><b><font color="blue">SUGGESTIONS</font></b></center></h2>
        <font color="purple">
        <table align="center">
            
        <%
            
        ResultSet rs;
        ResultSet rs1;
         ResultSet rs2;
        
	Connection con1;
        Connection con2;


try{

    String url="jdbc:mysql://localhost:3306/olcp?user=root&password=";
    Class.forName("com.mysql.jdbc.Driver");
    	con1=DriverManager.getConnection(url);
    	Statement st=con1.createStatement();
           int cid=Integer.parseInt((String)session.getAttribute("SCid"));
           
          
           String facname=(String)session.getAttribute("SFacname");
            

           String query="select Suggestion from feedback where Username='"+facname+"' AND Courseid="+cid+"";
          
               rs1=st.executeQuery(query);
               while(rs1.next())
               {
                   
%>

        
     <tr>
         
     
     <td align="center"><%=rs1.getString("Suggestion")%></td></tr>
    
<%
 

}}

 	catch(Exception e)
	{
	out.println(e);
	//out.println("exception occured");
}
%>
       </font>
       </table>
            
    </body>
</html>
