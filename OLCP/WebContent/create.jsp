<%-- 
    Document   : create
    Created on : Mar 13, 2012, 3:30:12 PM
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
        String name=request.getParameter("cou");
        session.setAttribute("course",name);
        %>
        <form action="createcourse2.jsp"  method="post" enctype="multipart/form-data" name="form1" id="form1">
            <img src="create_logo_v2.png" align="right" width="40%"/>
        <table align="center">
            
            <tr><td></td></tr>
            <tr><td></td></tr>
            <tr><td></td></tr>
            <tr><td></td></tr>
            <tr><td></td></tr>
            <tr>
               <td align="left">
                     <font family="calibri" color="purple">  Add Desription File: </font><input name="file" type="file" id="file" align="right">
                   </td><td><span id="1"/></td>
           </tr>
           <tr>
              <td align="left">
                     <font family="calibri" color="purple">  Add Images Used in Html File: </font><input name="file" type="file" id="file" align="right">
                  </td>
        <tr>
                   <td>
                      <font family="calibri" color="purple"></font><input name="file" type="hidden" id="file">
                   </td>
                 </tr>
                 <tr><td></td></tr><tr><td></td></tr><tr><td></td></tr>
                 
                 <tr>
                    <td align="center">
               <input type="submit" name="Submit" value="SUBMIT"/>
                        </td></tr>
                 </table>
    </body>
</html>
