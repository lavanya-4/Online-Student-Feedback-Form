<%-- 
    Document   : reply
    Created on : Mar 8, 2012, 9:32:30 PM
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
         <style type="text/css">
  span{
  color:red;
  }
  div{
  color:green;
  text-align:center;
  font-size:20px;
   }

 </style>
        <script language="javascript">
            function mail()
            {
               window.location="mailslidebar.html";
               // document.getElementById(b2).innerHTML="stureg.html";
               
            }
            function validmail(str)
            {

    if(validusermail())
    {
       
    var xmlhttp;
    if (str.length==0)
  {
  document.getElementById("6").innerHTML="";
  return;
  }
if (window.XMLHttpRequest)
  {
  xmlhttp=new XMLHttpRequest();
  }
else
  {
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp.onreadystatechange=function()
  {

  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {

    document.getElementById("6").innerHTML=xmlhttp.responseText;

    }
  }

xmlhttp.open("GET","usermailverify.jsp?sword="+str,true);
xmlhttp.send();
}
else
{
    document.getElementById("6").innerHTML="Enter Valid Mailid";
    return false;
}
  }  
 function validusermail()
  {
      var email=new RegExp("^[a-z0-9]+[@][a-z]+[.][a-z][a-z][a-z]+$");
      var email1= document.f.usermailid.value;
      if(email.test(email1)&& email1!=null)
        {
         document.getElementById("6").innerHTML="";
         return true;
         }
        else
           {
            document.getElementById("6").innerHTML="Enter Valid Email";
            return false;
             }
       }
        
function validate()
{
  var r1=validusermail(document.getElementById("6"));
    if(r1)
        {
            document.f.action="mailinsert1.jsp";
            document.f.submit();
        }
}
           
                    </script>
    </head>
    <body>
        <%
        String from=request.getParameter("from");
        %>
        <h4>
        <form name="f">
            <a href="checkmail.jsp" ><font color="orange" align="right">Back</font></a>
            <font color="green">
            <table align="center">
            <tr><td>TO</td>
            <td>
                <input type="text" name="usermailid" size="52" value="<%=from%>"onkeyup="validmail(this.value)"/>

            </td>
            <td><span id="6"></span></tr>
            <tr>
                <td>Subject</td>
                <td><input type="text"  name="sub" value="" size="52"></td>
            </tr>
            <tr>
                <td>Message</td>
                <td><textarea name="msg" value="" rows="15" cols="46"></textarea>
                </td>
            </tr>
            <tr><td colspan="2"></td></tr>
            <tr><td colspan="2"></td></tr>
            <tr><td colspan="2"></td></tr>
            <tr><td colspan="2"></td></tr>
            <tr><td colspan="2"></td></tr>
            <tr>
                <td align="center" colspan="2" ><input type="button" value="SEND" onclick="validate()">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="button"  name="b1" value="CANCEL" onclick="mail()"></td>

            </tr>
            
            </table></font></form></h4>
    </body>
</html>
