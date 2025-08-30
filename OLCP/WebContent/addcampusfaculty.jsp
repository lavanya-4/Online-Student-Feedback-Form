<%-- 
    Document   : addcampusfaculty
    Created on : Feb 7, 2012, 10:28:43 AM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
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
           function validname()
  {
   var nam=new RegExp("^[a-z]|[A-Z]+$");
   var name= document.f.facname.value;
   if(nam.test(name)&&name!=null)
   {
     document.getElementById("1").innerHTML="";
     return true;
    }
     else {
      document.getElementById("1").innerHTML="Enter Valid Name";
     return false;

      }
  }
  function validate()
  {
      var r1=validname(document.getElementById("1"));
      if(r1)
          {
    
    document.f.action="addcampusfaculty1.jsp";
    document.f.submit();
}
  }
        </script>
    </head>
    <body>
        <form name="f" method="POST" >
            <font color="darkgreen"><h2 align=center><u><i>Welcome To Adding Faculty</i></u></h2></font>
             <p align="center"><b>
             <table height="250" width="50%" align="center">
             <tr>
               <td>Faculty id:<font color="red">*</font></td><td><input type="text" name="facid" value=""></td>
             </tr>
             <tr>
                 <td>Faculty Name:<font color="red">*</font></td><td><input type="text" name="facname" onkeyup="validname()"></td><td><span id="1"></span></td>
             </tr>
             <tr>
               <td>College:</td><td><input type="text" name="colz" value="sai aditya" readonly></td>
             </tr>
             <tr>
               <td>Department:</td><td><select name="dept">
                                  <option value="cse">Computer Science</option>
                                  <option value="eee">Electrical& Electronical </option>
                                  <option value="mech">Mechanical</option>
                                  <option value="ece">Electronics & Communications</option>
                                  <option value="civil">Civil</option>

                                  <option value="It">Information Technology</option></td>
             </tr>
             <tr>
               <td>Qualification:</td><td><select name="qualification">
                          <option value="BTECH">BTECH</option>
                          <option value="MTECH" >MTECH</option>
                          <option value="MCA">MCA</option>
                          <option value="MBA">MBA</option></td>
             </tr>
             <tr>
               <td>Designation:</td><td><select name="desig">
                          <option value="Professor">Professor</option>
                          <option value="Associate Professor" >Associate Professor</option>
                          <option value="Assistant Professor">Assistant Professor</option>                          
             </tr>
                          <tr> 
              <td><br><br><br></td>
              <td><input type="submit" value="Add Faculty" onclick="validate()"></td>
            </tr>
         </table>
     </b>
 </p>
 </form>
</body>
</html>
