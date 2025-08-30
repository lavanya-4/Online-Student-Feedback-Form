<%-- 
    Document   : viewcoursefeedback
    Created on : Feb 7, 2012, 8:23:01 PM
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
        <img src="feedback1.jpg" align="right" width="50%" height="450px">
        </img>
        <h1><center><font color="blue">!!!View Feedback!!!</font></center></h1>
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

           String query="select Grade,Suggestion from feedback where Username='"+username+"' AND Courseid="+cid+"";
          
               rs1=st.executeQuery(query);
String str=null;
int c1=0,c2=0,c3=0,c4=0;
               while(rs1.next())
                  
                 {
                   String grade;
                   grade=rs1.getString("Grade");
                    if(grade.equals("poor"))
                   {
                          c1++;
                        
                    }
                   
        else if(grade.equals("Good"))
                   {
                          c2++;
                        
                    }
       else if(grade.equals("Very Good"))
                   {
                          c3++;
                        
                    }
       else if(grade.equals("Average"))
                   {
                          c4++;
                        
                    }
                                       }
             
%>
  
       <tr> <td><h3>GRADING</h3></td>
     </tr>    
         <tr><td>VeryGood</td>&nbsp;&nbsp;<td><% out.println(c3); %></td></tr>
      <tr><td>Good</td>&nbsp;&nbsp;<td><% out.println(c2); %></td></tr>
       <tr><td>Average</td>&nbsp;&nbsp;<td><% out.println(c4);%></td></tr>
       <tr><td>poor</td>&nbsp;&nbsp;<td><% out.println(c1); %></td></tr>
        
         
     </tr>
     <tr><td><a href="viewsuggestions.jsp?user=<%=username%> & cid=<%=cid%>" ><font color="green">Suggestions</font></a></td></tr>
    
         
           
<% 
       
             }

//if(str.equals(null))
//out.println("No feedback is available");    
          


 	catch(Exception e)
	{
	out.println(e);
	//out.println("exception occured");
}
                %>
   

        
         </table>
    </body>
</html>
