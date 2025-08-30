<%-- 
    Document   : checkcourse
    Created on : Feb 6, 2012, 7:26:16 PM
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
    <body>
        

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
       int id=0;
       String name1=null;
      int flag1=0,flag2=0;
        
        String uname = request.getParameter("uname");
         String cname = request.getParameter("cname");
        
        
        //String cname=(String)session.getAttribute("Sessioncourse");
                
            String q1="select Courseid from course where Cname='"+cname+"'";
              rs1=st.executeQuery(q1); 
                while(rs1.next())
                {
                    id=rs1.getInt("Courseid");
                }
        String query="select * from faccourse where Username='"+uname+"' AND Courseid="+id+" ";
        rs=st.executeQuery(query);
          if(rs.next())
                           {
              flag1=1;
                       
                       
              
          }
          else
              flag2=1;
        
        if(flag1==1){
         %><h1><%   out.println( uname+" is selected this course as a interested subject... ");%></h1>
    <%
        }
         
                           else if(flag2==1)
                      {
                  %> <h1><%out.println(uname+" is not selected this course as a interested subject...");%></h1>
                  </center>
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
