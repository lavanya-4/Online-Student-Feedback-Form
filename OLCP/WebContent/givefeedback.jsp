<%-- 
    Document   : givefeedback
    Created on : Feb 13, 2012, 9:48:39 AM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<%
if(request.getParameter("submit")!=null)
{
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
           String q1="select Courseid from course where Cname='"+cname+"'";
           rs1=st.executeQuery(q1);
           int cid=0;
           while(rs1.next())
                             {
               cid=rs1.getInt(1);
                             }

           String name=request.getParameter("f").toString();
           
           
String grade = request.getParameter("r1").toString();
String sug = request.getParameter("sug").toString();

String qry = "insert into feedback(Username,Courseid,Grade,Suggestion) values('"+name+"',"+cid+",'"+grade+"','"+sug+"')";

int val = st.executeUpdate(qry);
if(val>0)
{%><font color="green"><%
response.sendRedirect("feedbacksuccess.jsp");%></font><%
}
}

catch(Exception e){
e.printStackTrace();
}
}

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script language="javascript">
            function formvalidate(theForm)
            {               
        return true;
            } 
           
           
            </script>
    </head>
    <body>
        <h1><font color="green"><center>FEEDBACK</center></font></h1> 
        <form  action="" onsubmit="return formvalidate(this);">
            <img src="feedbackform.jpg" width="50%" align="right"/>
                <table>
            <tr><td>Select Faculty:</td>
                <td><select name="f" value="">
                        <%
                

	try{
            ResultSet rs;
            ResultSet rs1;
            Connection con;
            String p,q;
            int com1=0;
	    String url="jdbc:mysql://localhost:3306/olcp?user=root&password=";
	    Class.forName("com.mysql.jdbc.Driver");
	    	con=DriverManager.getConnection(url);
	    	Statement st=con.createStatement();
                String cname=(String)session.getAttribute("SessionCourse");
           String q1="select c.Username,r.Name from coursereg c,registration r where Cname='"+cname+"' AND c.Username=r.Username";
           rs1=st.executeQuery(q1);
           String n=null;
           while(rs1.next())
                             {
               n=rs1.getString(1);
               
              %>
                     <option value="<%=n%>"><%=rs1.getString(2)%></option>
                   <%}

                 }
                catch(Exception e)
                         {
                    out.print(e);

                 }
%>
            </select></td></tr>
            <tr><td>Select Feedback:</td>
                <td><input type="radio" value="Very Good" name="r1">Very Good&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" value="Good" name="r1">Good</td></tr>
            <tr><td></td>
                <td><input type="radio" value="Average" name="r1">Average&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" value="poor" name="r1">poor</td></tr>
            <tr><td>Suggestion:</td>
                <td><textarea rows="10" cols="35" name="sug"></textarea></td></tr>
            <tr><td colspan="3"></td></tr>
            <tr><td colspan="3"></td></tr>
            <tr><td colspan="3"></td></tr>
            
            <tr><td colspan="3"><br><center><input type="submit" value="submit" name="submit"></input></center></td></tr>
            
        
        </table>
       
        </form>
    </body>

</html>
