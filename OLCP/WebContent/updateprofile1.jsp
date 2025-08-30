<%-- 
    Document   : updateprofile1
    Created on : Feb 23, 2012, 11:21:44 PM
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
        ResultSet rs3;
        ResultSet rs4=null;
        
        
	Connection con1;
        Connection con2;
	String name,uname,pwd,email,phone,dob,clg,dept,qual,add,des,fid,cpwd;
int reg_id=0;
try
{

    String url="jdbc:mysql://localhost:3306/olcp?user=root&password=";
    Class.forName("com.mysql.jdbc.Driver");
    	con1=DriverManager.getConnection(url);
        
    	Statement st=con1.createStatement();
        Statement st1=con1.createStatement();
        String facname=(String)session.getAttribute("SessionUser");
      	name=request.getParameter("name");
     	pwd=request.getParameter("pwd");
        cpwd=request.getParameter("cpwd");
	email=request.getParameter("email");
        phone=request.getParameter("mbno");
        dob=request.getParameter("dob");
        dept=request.getParameter("dept");
        qual=request.getParameter("qual");
        String str[]=request.getParameterValues("is");
      
        
         String str1[]=request.getParameterValues("ais");
        
        add=request.getParameter("add");
        des=request.getParameter("desig");
               String query3="update registration set Name='"+name+"',Password='"+pwd+"',Confirmpwd='"+cpwd+"',Email='"+email+"',Mobileno='"+phone+"',DOB='"+dob+"',Department='"+dept+"',Qualification='"+qual+"',Address='"+add+"',Designation='"+des+"' where Username='"+facname+"'";
             //  out.println("update registration set Name='"+name+"',Password='"+pwd+"',Confirmpwd='"+pwd+"',Email='"+email+"',Mobileno='"+phone+"',DOB='"+dob+"',Department='"+dept+"',Qualification='"+qual+"',Address='"+add+"',Designation='"+des+"'where Username='"+facname+"'"); 
               
               st.executeUpdate(query3);
               
                st.executeUpdate("commit");
                String query4="update login set Password='"+pwd+"',Mail='"+email+"' where Username='"+facname+"'";
                st1.executeUpdate(query4);
                st1.executeUpdate("commit");
                try
                {
                if(str.length!=0){
                for(int i=0;i<str.length;i++)
                                       {
                    String q1="select Courseid from course where Cname='"+str[i]+"'";
            rs4=st.executeQuery(q1);
            String cid=null;
            while(rs4.next())
                               {
                                cid=rs4.getString("Courseid");
                                
                               }
            int cid1=Integer.parseInt(cid);
            
        String query5="delete from faccourse where Username='"+facname+"' AND Courseid="+cid1+"";
        st.executeUpdate(query5);
        st.executeUpdate("commit");
                }
               
                }
                              }
catch(NullPointerException e1)
{
       }
                                      
                            
            try
             {
               
               if(str1.length!=0){
               for(int j=0;j<str1.length;j++)
                                       {
                    String q2="select Courseid from course where Cname='"+str1[j]+"'";
                    //out.println("select Courseid from course where Cname='"+str1[j]+"'");
            rs3=st.executeQuery(q2);
            String cid3=null;
            while(rs3.next())
                               {
                                cid3=rs3.getString("Courseid");
                                
                               }
            int cid2=Integer.parseInt(cid3);
            
        String query2="insert into faccourse values('"+facname+"',"+cid2+")";
        st.executeUpdate(query2);
        st.executeUpdate("commit");
                }
               }
                             }
               
	catch(NullPointerException e2)
                {
	
                }
               
               //out.println(Profile Updated Successfully");%>
               <h1><center><font color="orange">Profile Updated Successfully</font></center></h>
               <h1><center><a href="updateprofile.jsp"><font color="green">Back</font></a></center></h1><%
                    }      
	catch(Exception e)
	{
	out.println(e);
	
}
%>   
    </body>
</html>
