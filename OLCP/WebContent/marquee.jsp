<%-- 
    Document   : marquee
    Created on : Feb 5, 2012, 8:38:09 PM
    Author     : Administrator
--%>

<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h3><center><font color="purple">!!!ANNOUNCEMENTS!!!
        </center></font></h3>
    <marquee direction="up">
          <ul type="disc" color="blue" >
        <table border="0"  align="center" width="100%">
          
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


          String query="select a.date,Cname,a.Description from announcement a ,course c where a.Courseid=c.Courseid AND  a.date <= CURRENT_DATE AND a.date>= ( CURRENT_DATE - INTERVAL 20 DAY ) order by a.date DESC";
        rs=st.executeQuery(query);

               while(rs.next()){
%>

<tr> 
     <td align="left"><font color="green"><li><%=rs.getDate(1)%>&nbsp;&nbsp;&nbsp;<%=rs.getString(2)%></li></font></td>
   </tr>  <tr><td align="left"><font color="green"><%=rs.getString(3)%></</font></td>
   </tr>
   <tr><td><hr></td></tr>
<% }
}

 	catch(Exception e)
	{
	out.println(e);
	//out.println("exception occured");
}
                %>
    </ul>     </table></marquee>
    </body>
</html>

