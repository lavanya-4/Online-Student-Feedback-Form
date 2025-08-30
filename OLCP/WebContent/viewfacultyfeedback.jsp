<%-- 
    Document   : viewfacultyfeedback
    Created on : Feb 3, 2012, 11:12:48 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page language="java" session="true" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form name="f2" action="facultyfeedback.jsp">
         <img src="feedbackform.jpg" width="39%"   align="right"/>
        
             
                <%

	try{
            ResultSet rs;
            ResultSet rs1;
            ResultSet rs2;
            
            Connection con;
            String p,q;
            int com1=0;
	    String url="jdbc:mysql://localhost:3306/olcp?user=root&password=";
	    Class.forName("com.mysql.jdbc.Driver");
	    	con=DriverManager.getConnection(url);
	    	Statement st=con.createStatement();
                String cname=(String)session.getAttribute("scourse");
                String facname1=request.getParameter("fname");
                %>
                <h1><blink><font color="violet">Welcome <%=facname1%></font></blink></h1>
                <h1><center><font color="blue">Grade</font></center></h1>
                <%
                String s="a";
	    	String q1="select Courseid from course where Cname='"+cname+"'";
           rs=st.executeQuery(q1);
           
int cid=0;
               while(rs.next())
               {
              cid=rs.getInt("Courseid");
                           }
String role="faculty";
String q2="select Username from registration where Name='"+facname1+"'AND Role='"+role+"'";
           rs2=st.executeQuery(q2);
String username="";
               while(rs2.next())
               {
              username=rs2.getString(1);
               }

           String query="select Grade,Suggestion from feedback where Username='"+username+"' AND Courseid="+cid+"";
          //out.println("select Grade,Suggestion from feedback where Username='"+username+"' AND Courseid="+cid+"");
               rs1=st.executeQuery(query);
String str=null,grd=null;
int c1=0,c2=0,c3=0,c4=0;
               while(rs1.next())
               {
grd=rs1.getString("Grade");
                   if(grd.equals("Very Good"))
                                             {
                       c1++;
                   }
                   else if(grd.equals("Good")){
                   c2++;
                   }
                   else if(grd.equals("Average")){
                   c3++;
                   }
                   else if(grd.equals("Bad")){
                   c4++;
                   }
                                     }
             
%>
  
            <table align="center">    
            <tr>
                <td align="left"><font color="purple">Very Good:</font></td>
     <td align="center"><font color="purple">&nbsp;&nbsp;&nbsp;&nbsp;<%out.print(c1);%></font></td></tr>
     <tr>
       <td align="left"><font color="purple">Good:</font></td>
     <td align="center"><font color="purple">&nbsp;&nbsp;&nbsp;&nbsp;<%out.print(c2);%></font></td></tr> 
      <tr><td align="left"><font color="purple">Average:</font></td>
     <td align="center"><font color="purple">&nbsp;&nbsp;&nbsp;&nbsp;<%out.print(c3);%></td></tr>
       <tr>
           <td align="left"><font color="purple">Bad:</font></td>
     <td align="center"><font color="purple">&nbsp;&nbsp;&nbsp;&nbsp;<%out.print(c4);%></font></td></tr>
          </table>
     <br><br><br><%
     session.setAttribute("SCid",cid+"");
     session.setAttribute("SFacname",username);%>
     
     <center><a href="adminviewsuggestions.jsp"><font color="green">Suggestions</font></a></center>
     
         
        <% 
       
             }

 

 	catch(Exception e)
	{
	out.println(e);
	//out.println("exception occured");
}
                %>
   

        
         
    </body>
</html>