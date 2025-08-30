<%@page language="java" session="true" %>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<html>
    <head>
        <title></title>
    </head>
    <body>
        <%
        ResultSet rs;
        ResultSet rs1;
	Connection con;
        Connection con1;
	String name,uname,pwd,cpwd,email,phone,dob,clg,dept,sem,r1="student",add,year,month,day;
        int reg_id=0;
	//String name = (String)session.getAttribute("SessionUser");%>
	<center>
	<%	
try{

    String url="jdbc:mysql://localhost:3306/olcp?user=root&password=";
    
    Class.forName("com.mysql.jdbc.Driver");
    out.print("driver");
    	con=DriverManager.getConnection(url);
        out.print("conn");
        //con1=DriverManager.getConnection(url);
    	Statement st=con.createStatement();
        //Statement st1=con1.createStatement();
        String ids = new String();
    	name=request.getParameter("Name");

        uname=request.getParameter("Username");
	pwd=request.getParameter("Password");
	//cpwd=request.getParameter("ConfirmPassword");
	email=request.getParameter("Email");
        phone=request.getParameter("Mobileno");
        year=request.getParameter("Year");
        month=request.getParameter("Month");
        day=request.getParameter("Day");
        //dob=year+month+day;
        clg=request.getParameter("College");
        dept=request.getParameter("Department");
         
        sem=request.getParameter("Semister");
        
        add=request.getParameter("address");
        String query1="select ifnull((max(Reg_id)+1),1) Reg_id from registration group by Role having Role='"+r1+"'";
        rs=st.executeQuery(query1);
       while(rs.next())
            {
               ids = rs.getString("Reg_id");
            }
        reg_id= Integer.parseInt(ids);
      //out.print(insert into registration values('" +name+ "','" +uname+ "','" +pwd+ "','" +cpwd+ "','" +email+  "','" +phone+ "','" +dob+ "','" +clg+ "','" +dept+"',"+null+",'"+sem+"','"+add+"',"+null+","+reg_id+",'"+r1+"',"+null+"));
        String query2="insert into registration values('" +name+ "','" +uname+ "','" +pwd+ "','" +email+  "','" +phone+ "','" +clg+ "','" +dept+"',"+null+",'"+sem+"','"+add+"',"+null+","+reg_id+",'"+r1+"',"+null+")";
    	st.executeUpdate(query2);
        st.executeUpdate("commit");
        String query3="insert into login values('" +uname+ "','" +pwd+ "','"+r1+"','" +email+  "')";
    	st.executeUpdate(query3);
        st.executeUpdate("commit");
        response.sendRedirect("addstudentsuccess.jsp");
       // out.println(query1);
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


