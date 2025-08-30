<%-- 
    Document   : regcourse
    Created on : Feb 3, 2012, 7:16:09 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java" session="true" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
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
            function validatemail()
            {
               var m1=new RegExp("^([a-z]|[.]|[A-Z]|[0-9])+[@][a-z]+[.][a-z]+$");
   var m2= document.f1.e1.value;
   if(m1.test(m2)&&m2!=null)
   {
     document.getElementById("2").innerHTML="";
     return true;
    }
     else {
      document.getElementById("2").innerHTML="Enter Valid Email";
     return false;

      }
            }
   function validatemb()
            {
              
   var m2= document.f1.m1.value;
   if( m2.toString().trim().length==10)
   {
      
     document.getElementById("1").innerHTML="";
     return true;
    }
     else {
        
      document.getElementById("1").innerHTML="Enter Valid mobile";
     return false;

      }
      }
            function validate()
   {
            var r1=validatemail(document.getElementById("2"));
            
            var r2=validatemb(document.getElementById("1"));
                 if(r1&&r2)
{
        document.f1.action="courseregistration.jsp";
    document.f1.submit();
}

}
     </script>
    </head>
    <body>
        
        <%
         PrintWriter pw=response.getWriter();
  String username = (String)session.getAttribute("SessionUser");
  String cname = request.getParameter("name");
        //out.print(cname);
  session.setAttribute("Sessioncourse",cname);
        %>
<form  name="f1" align="center" > 
    
<table align="center">
    <tr>
        <td>Enter Valid Email id:</td>
        <td><input type="text" value="" name="e1" onblur="validatemail()"></span></td>
        <td><span id="2"></span></td>
    </tr>
    <tr>
        <td>Mobile no:</td>
        <td><input type="text" value="" name="m1" onblur="validatemb()" ></td>
        <td><span id="1"></span></td>
         </tr>
    
    <tr>
        <td colspan="2"><input type="button" rows="10" cols="20" value="Submit" onclick="validate()" ></input></td>
    </tr>
</table>
    </body>
</html>
