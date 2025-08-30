<%-- 
    Document   : topicdiscussion
    Created on : Feb 8, 2012, 11:36:40 AM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@page language="java" session="true" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script language="javascript">
            function add()
            {
                document.f1.action="addcomment.jsp";
                document.f1.submit();
            }
            function adddis()
            {
                document.f1.action="adddiscussion.jsp";
                document.f1.submit();
            }
            
            
        </script>
        
    </head>
    <body>
        <form name="f1" >
    <center><font color="blue"> <h1><u><i>Discussion Board</i></u></h1>
        </font> </center>
        <table border="0" align="center"  width="100%">
            
        <%
        PrintWriter pw=response.getWriter();
            String cname=(String)session.getAttribute("SessionCourse");
           String username=(String)session.getAttribute("SessionUser");
           
                                    

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
        int cid=0;
        
        String topic=request.getParameter("topic");
        String q2="select Courseid from course where Cname='"+cname+"'";
        
        
        rs=st.executeQuery(q2);
        while(rs.next())
                       {
            cid=rs.getInt("Courseid");
        }
           String q1="select r.Name,r.Email,r.College,r.Department,r.Qualification,d.disid,d.Topicname,d.Query from discussion d,registration r where d.Username=r.Username AND d.Topicname='"+topic+"'";
           rs1=st.executeQuery(q1);
int disid=0;
               while(rs1.next())
               {
                   %><tr><%
          disid=rs1.getInt(6);  %>             
          <td align="center" bgcolor="wheat" width="20%"><%=rs1.getString(1)%><br>Email:
            <%=rs1.getString(2)%><br>College:
            <%=rs1.getString(3)%><br>Department:<%=rs1.getString(4)%><br>Qualification:<%=rs1.getString(5)%></td>
<td align="center" bgcolor="lightgray"><font color="purple"> <h2><%=rs1.getString(7)%></h2></font><br>
    <h3><%=rs1.getString(8)%></h3></td></tr>
                   


<%}

session.setAttribute("SessionId",disid+"");

%>
</table>
    <%
        String q3="select r.Name,r.Email,r.College,r.Department,r.Qualification,rp.Topic,rp.Replymsg from reply  rp,registration r where rp.Username=r.Username AND rp.disid="+disid+"";
         rs2=st.executeQuery(q3);
%>

           
<%    
         while(rs2.next())
               {%>
                  <table border="0" align="center" width="100%" >
 <tr><td colspan="2" bgcolor="wheat" align="left"><h3><font color="green">&nbsp;&nbsp;&nbsp;Reply</font></h3></td></tr>         

<td align="center" bgcolor="wheat" width="20%"><%=rs2.getString(1)%><br>Email:
            <%=rs2.getString(2)%><br>College:
            <%=rs2.getString(3)%><br>Department:<%=rs2.getString(4)%><br>Qualification:<%=rs2.getString(5)%></td>
<td align="center" bgcolor="lightgray"><font color="purple"> <h2><%=rs2.getString(6)%></h2></font><br>
    <h3><%=rs2.getString(7)%></h3></td></tr><br>

<%
}
%>
</table>
<br><br><center>
    <input type="button" value="Add Reply" name="b1" onclick="add()" target="f1"></input>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="button" value="Create New Discusssion" name="b2"  onclick="adddis()" target="f1"></input></center>
<%
}    
 	catch(Exception e)
	{
	out.println(e);
	//out.println("exception occured");
}
                %>

        </form>   
    </body>
</html>


       