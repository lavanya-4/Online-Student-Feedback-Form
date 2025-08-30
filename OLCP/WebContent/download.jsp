<%-- 
    Document   : download
    Created on : Feb 27, 2012, 3:14:06 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.*"%>
<html>
    
<form method="post" action="testresult.jsp" >
    <center><font color="green"><h1>Materials</h1></font></center>
     <font color="orange">
<table align="center" cellspacing="15px">
   
<%
ResultSet rs=null;
        ResultSet rs1=null;
	Connection con1=null;
        Connection con2=null;
        int count=0;


try{

    String url="jdbc:mysql://localhost:3306/olcp?user=root&password=";
    Class.forName("com.mysql.jdbc.Driver");
    	con1=DriverManager.getConnection(url);
    	Statement st=con1.createStatement();
        String cname=(String)session.getAttribute("SessionCourse");
           
        
        rs=st.executeQuery("Select * from files where Cname='"+cname+"'order by Date DESC");
int i=1; 

while(rs.next()){
    //out.println(rs.getString(3));
%>

<tr><td> <%=rs.getDate(5)%> </td>
    <td><a href="<%=rs.getString(3)%>" target="_blank"><%=rs.getString(4)%></a></td>
    <td>Uploaded by  <%=rs.getString(6)%> </td></tr>
<%

}
}

        
        catch(Exception e)
               {
    out.print(e);
}
%>

</table></font>
</form>
</html>

