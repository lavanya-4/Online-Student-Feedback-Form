<%-- 
    Document   : createcourseannouncements
    Created on : Feb 7, 2012, 8:08:05 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        String cname=(String)session.getAttribute("SessionCourse");
 %>
        <form action="addcourseannouncement.jsp">
            <img src="announcement.jpg" align="right" width="50%">
             <table align="center">
                 <tr><td colspan="2"><h1><font color="purple">PUBLISH COURSE ANNOUNCEMENTS....</font></h1></td><tr>
             <td>Course Name:</td>
             <td><input type="text" name="cname" value="<%out.print(cname);%>"></input></td></tr>
               <tr>
 <td>
 Message:</td>
     <td><textarea value="" name="message" rows="9" cols="30"></textarea></td>
 </tr>
 <br><br>
<tr>
<td colspan="2" align="center"><input type="submit" value="submit"></td></tr>
</table>

</form>
</body>
</html>
