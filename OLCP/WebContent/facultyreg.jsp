<%-- 
    Document   : facultyreg
    Created on : Feb 4, 2012, 12:04:50 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java" session="true" %>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<!DOCTYPE html>
<html>
  <head>
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

 function  doUnames(str)
{


if(validusername())
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

xmlhttp.open("GET","usernameverify.jsp?sword="+str,true);
xmlhttp.send();
}
else
{
    document.getElementById("6").innerHTML="";
}
}


  function validname()
  {
   var nam=new RegExp("^([a-z]|[A-Z])+$");
   var name= document.f.Name.value;
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
  function  validid(str)
{

    var xmlhttp;
if (str.length==0)
  {
  document.getElementById("9").innerHTML="";
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

    document.getElementById("9").innerHTML=xmlhttp.responseText;

    }
  }

xmlhttp.open("GET","idverify.jsp?sword="+str,true);
xmlhttp.send();
}




function validusername()
  {
   var nam=new RegExp("^([a-z]|[A-Z])+$");
   var name= document.f.Username.value;

   if(nam.test(name)&&name!=null && name.length>4)
   {
     document.getElementById("6").innerHTML="";
     return true;
    }

     else {
      document.getElementById("6").innerHTML="Enter Valid Username";
     return false;

      }

  }

  function validpwd1()
{
   var pwd=document.f.Password.value;
   if( pwd!=null && pwd.length>6)
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
   var password1=document.f.Password.value;
   var password2=document.f.ConfirmPassword.value;
   if(password1==password2)
   {
     document.getElementById("3").innerHTML="";
     return true;
    }
   else{
    document.getElementById("3").innerHTML="Password do not match";
    return false;
   }
}
   

  function validate()
   {
            var r1=validname(document.getElementById("1"));
            var r6=validusername(document.getElementById("6"));
            var r2=validpwd1(document.getElementById("2"));
            var r3=validpwd2(document.getElementById("3"));
      


            if(r1&&r2&&r3&&r6)
{    document.f.action="addfaculty.jsp";
    document.f.submit();
}
else
response.redirect("startpage.html");    
}



    </script>
  </head>
  <body>
      <%
                   
        ResultSet rs;
        ResultSet rs1;
	Connection con;
        Connection con1;
	String name,uname,pwd,cpwd,email,phone,dob,clg,dept,sem,r1="student",add,year,month,day;
        int reg_id=0;
                    
                    
                   %>
        <form name="f"  Method="POST">
   <h1 align=center>!...REGISTRATION...!</h1>
    <table cellspacing="20" align="center">
        <tr>
            <td>Name:</td>
            <td><input type="text" id="Name" name="Name" onblur="validname()"/></td>
            <td><span id="1"></span></td>
        </tr>
        <tr>
            <td>Faculty id:</td>
            <td><input type="text" id="id" name="id" onblur="validid(this.value)"/></td>
            <td><span id="9"></span></td>
        </tr>
        
        <tr>
            <td>Username:</td>
            <td><input type="text" id="Username" name="Username" onkeyup="doUnames(this.value)" /></td>
            <td><span id="6"></span></td>
        </tr>
        <tr>
            <td>Password:</td>
            <td>  <input type="password" id="Password" name="Password" onblur="validpwd1()"/> </td>
            <td><span id="2"></span></td>
        </tr>
        <tr>
            <td>Confirm Password:</td>
            <td><input type="password" id="ConfirmPassword" name="ConfirmPassword" onblur="validpwd2()"/>   </td>
            <td><span id="3"></span></td>
        </tr>
        <!--  <tr>
            <td>Date of Birth:</td>
            <td colspan="2">
                <select name="Year">
                    <option value="1980">1980</option>
                    <option value="1981">1981</option>
                    <option value="1982">1982</option>
                    <option value="1983">1983</option>
                    <option value="1984">1984</option>
                    <option value="1985">1985</option>
                    <option value="1986">1986</option>
                    <option value="1987">1987</option>
                    <option value="1988">1988</option>
                    <option value="1989">1989</option>
                    <option value="1990">1990</option>
                    <option value="1991">1991</option>
                    <option value="1992">1992</option>
                    <option value="1993">1993</option>
                    <option value="1994">1994</option>
                </select>&nbsp;&nbsp;
                <select name="Month">
                    <option value="january">JAN</option>
                    <option value="february">FEB</option>
                    <option value="march">MAR</option>
                    <option value="april">APR</option>
                    <option value="may">MAY</option>
                    <option value="june">JUN</option>
                    <option value="july">JUL</option>
                    <option value="august">AUG</option>
                    <option value="september">SEP</option>
                    <option value="october">OCT</option>
                    <option value="november">NOV</option>
                    <option value="december">DEC</option>
                </select>&nbsp;&nbsp;
                <select name="Day">
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                    <option value="6">6</option>
                    <option value="7">7</option>
                    <option value="8">8</option>
                    <option value="9">9</option>
                    <option value="10">10</option>
                    <option value="11">11</option>
                    <option value="12">12</option>
                    <option value="13">13</option>
                    <option value="14">14</option>
                    <option value="15">15</option>
                    <option value="16">16</option>
                    <option value="17">17</option>
                    <option value="18">18</option>
                    <option value="19">19</option>
                    <option value="20">20</option>
                    <option value="21">21</option>
                    <option value="22">22</option>
                    <option value="23">23</option>
                    <option value="24">24</option>
                    <option value="25">25</option>
                    <option value="26">26</option>
                    <option value="27">27</option>
                    <option value="28">28</option>
                    <option value="29">29</option>
                    <option value="30">30</option>
                    <option value="31">31</option>
                </select>
            </td>
        </tr> -->
         <tr>
             <td>Email:</td>
              <td><input type="text" name="email" value=""></td>
        </tr>
         <tr>
             <td>Mobile:</td>
              <td><input type="text" name="mobile" value=""></td>
        </tr>
        <tr>
             <td>College:</td>
              <td><input type="text" name="College" value=""></td>
        </tr>
        <tr><td>Department:</td>
             <td><select name="Department">
                                  <option value="cse">Computer Science</option>
                                  <option value="eee">Electrical& Electronical </option>
                                  <option value="mech">Mechanical</option>
                                  <option value="ece">Electronics & Communications</option>
                                  <option value="civil">Civil</option>

                                  <option value="It">Information Technology</option>
                   </select></td>
         </tr>
         <tr><td>Qualification</td>
                      <td><select name="qualification">
                          <option value="BTECH">BTECH</option>
                          <option value="MTECH" >MTECH</option>
                          <option value="MCA">MCA</option>
                          <option value="MBA">MBA</option>
                         

                      </select></td>
        </tr>
        <tr><td>Interested Subjects </td><td>
                <select name="c1" multiple="true">
                    
                    <%	
try{

    String url="jdbc:mysql://localhost:3306/olcp?user=root&password=";
    
    Class.forName("com.mysql.jdbc.Driver");
    
    	con=DriverManager.getConnection(url);
        String q=null;
        //con1=DriverManager.getConnection(url);
    	Statement st=con.createStatement(); 
        String query1="select * from course ";
        rs=st.executeQuery(query1);
       while(rs.next())
		{
                    
                    q=rs.getString(2);
                    %>
                     <option value="<%=q%>"><%=q%></option>
                   <%}

                    }                    

catch(Exception e)
	{
	out.println(e);
	//out.println("exception occured");
}
%>
                </select></td></tr>

        <tr>
            <td>Address:</td>
            <td colspan="2">
                <textarea rows="10" cols="40"  name="address">
                </textarea>
            </td>
        </tr>
         <tr><td>Designation</td>
                      <td><select name="designation">
                          <option value="Professor">Professor</option>
                          <option value="AssistantProfessor" >Assistant Professor</option>
                          <option value="AssociateProfessor">AssociateProfessor</option>


                      </select></td>
        </tr>
        <tr>
            <td></td>
            <td><input type="button" value="Submit" onclick="validate()"/></td>
            <td><input type="reset" value="Reset" /></td></tr>
        

    </table>
    </form>
  </body>
</html>
