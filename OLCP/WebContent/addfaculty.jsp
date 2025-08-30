

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" session="true" %>
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
	String cname,name,uname,pwd,cpwd,email,phone,dob,clg,dept,qual,add,des,month,day,year,r1="faculty",fid,sub;
int reg_id=0;
	//String name = (String)session.getAttribute("SessionUser");%>
	<center>
	<%
try{

    String url="jdbc:mysql://localhost:3306/olcp?user=root&password=";
    Class.forName("com.mysql.jdbc.Driver");
    	con1=DriverManager.getConnection(url);
        
    	Statement st=con1.createStatement();
        
        String ids = new String();
    	name=request.getParameter("Name");
        String id=request.getParameter("id");
        uname=request.getParameter("Username");
	pwd=request.getParameter("Password");
	cpwd=request.getParameter("ConfirmPassword");
	
        
        email=request.getParameter("email");
        phone=request.getParameter("mobile");
      
        //dob=year+month+day;
        clg=request.getParameter("College");
        dept=request.getParameter("Department");

        qual=request.getParameter("qualification");
        String str[]=request.getParameterValues("c1");
        add=request.getParameter("address");
        des=request.getParameter("designation");
               String query3="select * from campus where Fac_id='"+id+"'";
                rs3=st.executeQuery(query3);
                if(rs3.next())
            {
           fid=rs3.getString(1);
           if(id.equals(fid))
           {
                   String query="select ifnull((max(Reg_id)+1),1) Reg_id from registration group by Role having Role='"+r1+"'";
          out.print("select ifnull((max(Reg_id)+1),1) Reg_id from registration group by Role having Role='"+r1+"'");
                   rs=st.executeQuery(query);
          while(rs.next())
            {
               ids = rs.getString("Reg_id");
            }
        reg_id= Integer.parseInt(ids);

        String query1="insert into registration values('" +name+ "','" +uname+ "','" +pwd+ "','" +email+  "','" +phone+ "','" +clg+ "','" +dept+"','"+qual+"',"+null+",'"+add+"','"+des+"','"+reg_id+"','"+r1+"','"+id+"')";
        st.executeUpdate(query1);
        out.print("insert into registration values('" +name+ "','" +uname+ "','" +pwd+ "','" +cpwd+ "','" +email+  "','" +phone+ "','" +clg+ "','" +dept+"','"+qual+"',"+null+",'"+add+"','"+des+"','"+reg_id+"','"+r1+"','"+id+"')");
        st.executeUpdate("commit");
        String query2="insert into login values('" +uname+ "','" +pwd+ "','"+r1+"','" +null+  "')";
        st.executeUpdate(query2);
        st.executeUpdate("commit");
        
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
            
        String query5="insert into faccourse values('"+uname+"',"+cid1+")";
        st.executeUpdate(query5);
        st.executeUpdate("commit");
                       }        
       response.sendRedirect("addstudentsuccess.jsp");
       
    	}
                     }
               
        
       else {%>
        <font color="blue"><% out.print("<h1>Your Registration id is not valid......<h1>");

            }
}
	catch(Exception e)
	{
	out.println(e);
	//out.println("exception occured");
}
%>
</center>


    </body>
</html>
