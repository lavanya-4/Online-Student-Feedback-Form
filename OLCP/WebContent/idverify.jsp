<%--
    Document   : userverify
    Created on : Jan 28, 2012, 5:11:30 PM
    Author     : SURYA
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.lang.*"%>
<%@ page import="java.io.IOException"%>
<%@ page import="java.io.PrintWriter"%>


       <%
       String  loginid=request.getParameter("sword");
       System.out.println("mahiiiiiii"+loginid);

ResultSet rs=null;
ResultSet rs1=null;
int flag=0;
try
{
    String url="jdbc:mysql://localhost:3306/olcp?user=root&password=";
    Class.forName("com.mysql.jdbc.Driver");

         Connection  con1=DriverManager.getConnection(url);
         Statement stmt=con1.createStatement();
         Statement stmt1=con1.createStatement();

        rs=stmt.executeQuery("SELECT  *  FROM campus");

	while(rs.next())
	{

        String str=rs.getString(1);
     
            if(loginid.equals(str))
             {
                     flag=1;
                }
         }
        if(flag==1)
            {
            System.out.println("id is already available");
        }
        else out.println(" Registration id is not Avaliable");
}
catch(Exception e)
{
out.println(e);

}


%>
    
