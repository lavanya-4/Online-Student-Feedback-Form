<%-- 
    Document   : createtest
    Created on : Feb 11, 2012, 10:55:21 AM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page language="java" import="java.sql.*" %>

<%
if(request.getParameter("submit")!=null)
{
 ResultSet rs;
        ResultSet rs1;
	Connection con1;
        Connection con2;


try{

    String url="jdbc:mysql://localhost:3306/olcp?user=root&password=";
    Class.forName("com.mysql.jdbc.Driver");
    	con1=DriverManager.getConnection(url);
    	Statement st=con1.createStatement();
           String r1="student",facid;
           String cname=(String)session.getAttribute("SessionCourse");
           String q1="select Courseid from course where Cname='"+cname+"'";
           rs=st.executeQuery(q1);
           int cid=0;
           while(rs.next())
                             {
               cid=rs.getInt(1);
                             }


String quest = request.getParameter("quest").toString();
String QA1 = request.getParameter("QA").toString();
String QB1 = request.getParameter("QB").toString();
String QC1 = request.getParameter("QC").toString();
String QD1 = request.getParameter("QD").toString();
String correctAns = request.getParameter("CorrectAns").toString();
String ans=null;
if(correctAns=="QA")
       {
    ans=QA1;
}
  else if(correctAns=="QB")
       {
    ans=QB1;
}
else if(correctAns=="QC")
       {
    ans=QC1;
}
else 
       {
    ans=QD1;
}

String qry = "insert into test(Question,option1,option2,option3,option4,answer,Courseid) values('"+quest+"','"+QA1+"','"+QB1+"','"+QC1+"','"+QD1+"','"+ans+"',"+cid+")";

int val = st.executeUpdate(qry);
if(val>0)
{%><font color="green"><%
out.println("<h1>Question added successfully</h1>");%></font><%
}
}

catch(SQLException ex){
System.out.println("SQL satatment not found");
}
catch(Exception e){
e.printStackTrace();
}
}

%>

<html>
<title>Quize</title>
<head>

<script>

function validateForm(theForm){

if(theForm.quest.value==""){
//Please enter username
alert("Please enter Question.");
theForm.quest.focus();
return false;
}
else if(theForm.QA.value==""){
    alert("Please enter option1.");
theForm.QA.focus();

return false;
}
else if(theForm.QB.value==""){
    alert("Please Enter option2.");
theForm.QB.focus();

return false;
}
else if(theForm.QC.value==""){
    alert("Please Enter option3.");
theForm.QC.focus();

return false;
}
else if(theForm.QD.value==""){
    alert("Please Enter option4.");
theForm.QD.focus();

return false;
}
else if(theForm.CorrectAns.value==""){
    alert("Please Enter Correct Answer.");
theForm.correctAns.focus();

return false;
}
return true;
} 
</script>
</head>

<body>
<br>
<br/>
<center>

<table border="1" width="450px" bgcolor="pink" cellspacing="0" cellpadding="0">
<tr>
<td width="100%">
<form method="POST" action="" onsubmit="return validateForm(this);">

<h2 align="center"><font color="green">Create Test</font></h2>
<table border="0" width="400px" cellspacing="2" cellpadding="4">
<tr>
<td width="50%"><b>Enter Question:</b></td>
<td width="50%"><input type="text" name="quest" size="40"/> </td>
</tr>
<tr>
<td width="50%"><b>Enter Answer(A.):</b></td>
<td width="50%"><input type="text" name="QA" size="40"/> </td>
</tr>
<tr>
<td width="50%"><b>Enter Answer(B.):</b></td>
<td width="50%"><input type="text" name="QB" size="40"/> </td>
</tr>

<tr>
<td width="50%"><b>Enter Answer(C.):</b></td>
<td width="50%"><input type="text" name="QC" size="40"/> </td>
</tr>

<tr>
<td width="50%"><b>Enter Answer(D.):</b></td>
<td width="50%"><input type="text" name="QD" size="40"/> </td>
</tr>
<tr><td width="50%">CorrectAnswer</td>
                      <td><select name="CorrectAns">
                          <option value="QA">A</option>
                          <option value="QB" >B</option>
                          <option value="QC">C</option>
                          <option value="QD">D</option>
                        
                      </select></td>
        </tr>       
 

</table>
<center>
<p><input type="submit" value="Submit" name="submit">
<input type="reset" value="Reset" name="reset"></p>
</center> 
</form>
</td>
</tr>
</table>
</center>
</body>
</html>