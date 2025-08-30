<%-- 
    Document   : des1
    Created on : Mar 13, 2012, 4:06:13 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.*"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<html>
    
<form method="post" action="testresult.jsp" >
       
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
        //out.print(cname);
        
           
        
        rs=st.executeQuery("Select * from course where Cname='"+cname+"' ");
int i=1; 
String filename;

while(rs.next()){
    filename=rs.getString(6);
    response.sendRedirect("./"+filename+"");
    //out.println(rs.getString(3));
%>

 
    
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

