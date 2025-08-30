<%-- 
    Document   : updateprofile
    Created on : Feb 23, 2012, 10:15:29 PM
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
  color:green;
  }
  div{
  color:green;
  text-align:center;
  font-size:20px;
   }

 </style>
        <script language="javascript">
            
            function validname()
  {{
   var nam=new RegExp("^[a-z]|[A-Z]+$");
   var name1= document.f.name.value;
   if(nam.test(name1)&&name1!=null)
   {
     document.getElementById("1").innerHTML="";
     return true;
    }
     else {
      document.getElementById("1").innerHTML="Enter Valid Name";
     return false;

      }
  }
}
 function validpwd1()
{
   var pwd1=document.f.pwd.value;
   if( pwd1!=null && pwd1.length>6)
    {
     document.getElementById("2").innerHTML="";
     return true;
    }
        else{
     document.getElementById("2").innerHTML="Password should exceed 6 characters";
      return false;
    }
  }
  function validpwd2()
  {
   var password1=document.f.pwd.value;
   var password2=document.f.cpwd.value;
   if(password1==password2)
   {
     document.getElementById("3").innerHTML="";
     return true;
    }
   else{
    document.getElementById("3").innerHTML="Password Did Not Match";
    return false;
   }
}
   function validmail()
  {
      var email2=new RegExp("^[a-z0-9]+[@][a-z]+[.][a-z][a-z][a-z]+$");
      var email1= document.f.email.value;
      if(email2.test(email1))
        {
         document.getElementById("4").innerHTML="";
         return true;
         }
        else
           {
            document.getElementById("4").innerHTML="Enter Valid Mailid";
            return false;
             }
       }


     function validphno()
     {
        var no=new RegExp("^[0-9]+$");
         var phno=document.f.mbno.value;
             if( no.test(phno) && phno.length==10)
              {
                document.getElementById("5").innerHTML="";
                 return true;
               }
               else
                   {
                   document.getElementById("5").innerHTML="Enter Valid Number";
                      return false;
                 }
}

  function validate()
   {
            var r1=validname(document.getElementById("1"));
          
            var r2=validpwd1(document.getElementById("2"));
            var r3=validpwd2(document.getElementById("3"));
               var r4=validmail(document.getElementById("4"));
                  var r5=validphno(document.getElementById("5"));
               
      


            if(r1&&r2&&r3&&r4&&r5)
{    document.f.action="updateprofile1.jsp";
    document.f.submit();
}
else{}
//response.redirect("startpage.html");    
}


  
            </script>
    </head>
    <body>
        <form name="f">
        <table align="center">
        <%
        ResultSet rs;
        ResultSet rs1;
         ResultSet rs2;
        
        
	Connection con1;
        Connection con2;
try{

    String url="jdbc:mysql://localhost:3306/olcp?user=root&password=";
    Class.forName("com.mysql.jdbc.Driver");
    	con1=DriverManager.getConnection(url);
    	Statement st=con1.createStatement();
        Statement st1=con1.createStatement();
        Statement st2=con1.createStatement();
        Statement st3=con1.createStatement();
           
           
          
           String facname=(String)session.getAttribute("SessionUser");
          
            

           String query="select * from registration where Username='"+facname+"'";
           rs=st.executeQuery(query);
           while(rs.next())
                             {
               %>
               
               <tr><td align="right">Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                   <td><input align="right" type="text" value="<%=rs.getString(1)%>" name="name" onblur="validname()"/>
                   <td><span id="1"></span></td></tr>
               
               
               <tr><td align="right">Password:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                   <td><input type="password" value="<%=rs.getString(3)%>" name="pwd" onblur="validpwd1()"/><td>
               <td><span id="2"></span></td>
               </tr>
               
               <tr><td align="right">Confirm Password:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                   <td><input type="password" value="<%=rs.getString(4)%>" name="cpwd" onblur="validpwd2()"/><td>
               <td><span id="3"></span></td>
               </tr>
               
               <tr><td align="right">Email:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                   <td><input type="text" value="<%=rs.getString(5)%>" name="email" onblur="validmail()"/><td>
               <td><span id="4"></span></td>
               </tr>
               <tr><td align="right">Mobile:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                   <td><input type="text" value="<%=rs.getString(6)%>" name="mbno" onblur="validphno()"/><td>
               <td><span id="5"></span></td>
               </tr>
               <tr><td align="right">Date of Birth:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                   <td><input type="text" value="<%=rs.getString(7)%>" name="dob"/><td></tr>
               
               <tr><td align="right">Department:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                   <td><input type="text" value="<%=rs.getString(9)%>" name="dept"/><td></tr>
               <tr><td align="right">Qualification:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                   <td><input type="text" value="<%=rs.getString(10)%>" name="qual"/><td></tr>
               <tr><td align="right">Designation:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                   <td><input type="text" value="<%=rs.getString(13)%>" name="desig"/><td></tr>
               <tr><td align="right">Address:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                   <td><input type="textarea" value="<%=rs.getString(12)%>" name="add"/><td></tr>
               <tr><td align="right">Interested subjects:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                   <td><select name="is" multiple="true">
                           <%
                          
                            String query1="select Cname from faccourse f,course c where  f.Courseid=c.Courseid AND f.Username='"+facname+"'";
           rs1=st1.executeQuery(query1);
           while(rs1.next())
                             {
                           %><option value="<%=rs1.getString("Cname")%>"><%=rs1.getString(1)%></option><%
           }
                           %>
                       </select><td>Select Subject to be Removed from Interested Subjects</td></tr>
               <tr><td align="right">Add interested subjects:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                   <td><select name="ais" multiple="true">
                           <%
                          String query2="select Cname from course where Courseid not in (select Courseid from faccourse where Username='"+facname+"')";
                           // String query2="select distinct Cname from faccourse f,course c where  f.Courseid<>c.Courseid AND f.Username='"+facname+"'";
           rs2=st2.executeQuery(query2);
           while(rs2.next())
                             {
                           %><option value="<%=rs2.getString("Cname")%>"><%=rs2.getString(1)%></option><%
           }
                           %>
                       </select></tr>
                       <tr><td></td></tr>
                       <tr><td></td></tr>
                       <tr><td></td></tr>
                       <tr><td align="center" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                               <input type="submit" value="update"onclick="validate()"></input>
                           </td></tr>
               
               <%
               
              
               
               
           }
                     }
catch(Exception e)
               {
    out.println(e);
}
        %>  
            </table> </form>
        </body>
</html>
