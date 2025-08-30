<%-- 
    Document   : usermailverify
    Created on : Jan 31, 2012, 7:19:44 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="java.sql.*"%>
<%@ page import="java.lang.*"%>
<%@ page import="java.io.IOException"%>
<%@ page import="java.io.PrintWriter"%>
       <%
       String  mail=request.getParameter("sword");
      

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
         String query="select * from login";
        rs=stmt.executeQuery(query);

	while(rs.next())
	{

        String str=rs.getString(4);

            if(mail.equals(str))
             {
                     flag=1;
                }
         }
        if(flag==1)
            {
            out.println("");
        }
               else 
            out.println("Enter Registered User Mailid");
}
catch(Exception e)
{
out.println(e);

}


%>

