<%-- 
    Document   : index
    Created on : Feb 23, 2012, 8:38:15 PM
    Author     : L@lli
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
 <head><title>Upload page</title></head></p> <p><body>
 <form action="upload_file_multipale.jsp" method="post" enctype="multipart/form-data" name="form1" id="form1"/>
   <center>
   <table border="2" bgcolor="wheat" width="35%">
       <tr>
               <td><b><center><font family="calibri" color="green">MULTIPLE FILES UPLOAD</font></center></td>
           </tr>
       <tr>
               <td align="left">
                     <font family="calibri" color="purple">  Select File: </font><input name="file" type="file" id="file" align="right">
                   </td>
           </tr>
           <tr>
              <td align="left">
                     <font family="calibri" color="purple">  Select File: </font><input name="file" type="file" id="file">
                  </td>
        <tr>
                   <td>
                      <font family="calibri" color="purple">  Select File: </font><input name="file" type="file" id="file">
                   </td>
                 </tr>
                 <tr>
                    <td align="center">
               <input type="submit" name="Submit" value="SUBMIT"/>
                        </td>
                 </tr>
    </table>
        <center>
 </body>
 </html>