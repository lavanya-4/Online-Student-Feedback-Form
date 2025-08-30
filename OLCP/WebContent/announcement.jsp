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
              <style type="text/css">
  span{
  color:green;
  }
  div{
  color:green;
  text-align:center;
  font-size:20px;
   }

 </style>
        <script language="javascript">
            
        function validdes()
  {
   
   var name= document.f.message.value;
   if(name.toString().trim().length!=0)
   {
     document.getElementById("1").innerHTML="";
     return true;
    }
     else {
      document.getElementById("1").innerHTML="Enter Announcement";
     return false;
      }
  } 
  function validate()
   {
            var r1=validdes(document.getElementById("1"));
            
            if(r1==true)
{
    
    document.f.action="addannouncement.jsp";
    document.f.submit();
   
}

    
 }

        </script>
    </head>
    <body>
        <form name="f" method="POST">
            <img src="announcement.jpg" align="right" width="50%">
             <table align="center">
                 <tr><td colspan="2"><h1><font color="purple">PUBLISH ANNOUNCEMENTS....</font></h1></td><tr>
             <td>Course Name:</td>
             <td><select name="coursename">
             </br></br>
        <%

	try{
            ResultSet rs;
            Connection con;
            String p,q;
            int com1=0;
	    String url="jdbc:mysql://localhost:3306/olcp?user=root&password=";
	    Class.forName("com.mysql.jdbc.Driver");
	    	con=DriverManager.getConnection(url);
	    	Statement st=con.createStatement();
	    	String query="select * from course";
	    	rs=st.executeQuery(query);
                while(rs.next())
		{
                    com1=rs.getInt(1);
                    q=rs.getString(2);
                    %>
                     <option value="<%=q%>"><%=q%></option>
                   <%}

                 }
                catch(Exception e)
                         {

                 }
%>
 </select></td></tr>
 <tr>
 <td>
 Message:</td>
     <td><textarea value="" name="message" rows="9" cols="30" onkeyup="validdes()"></textarea></td>
     <td><span id="1"></span></td>
 </tr>
      <br><br>
<tr>
<td colspan="2" align="center"><input type="button" value="submit" onclick="validate()"></td></tr>
</table>

</form>
</body>
</html>
