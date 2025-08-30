<%-- 
    Document   : result
    Created on : Feb 12, 2012, 2:30:34 PM
    Author     : Administrator
--%>

<%@page import="java.util.Enumeration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ page import="java.io.*" %>
<%@ page import="java.lang.String.*" %>
<%

String st[]=new String[20];
int id[]=new int[20];
Enumeration e = request.getParameterNames();

for(int i=0;i<st.length;i++)
{
st[i]=request.getParameter("radio"+i);


if(i!=20)
{
    id[i]=Integer.parseInt(session.getAttribute("arr"+i).toString());

}
}
ResultSet rs=null;
        ResultSet rs1=null;
	Connection con1=null;
        Connection con2=null;
        int count=0;


try{

    String url="jdbc:mysql://localhost:3306/olcp?user=root&password=";
    Class.forName("com.mysql.jdbc.Driver");
    	con1=DriverManager.getConnection(url);
    	Statement stmt=con1.createStatement();
        String cname=(String)session.getAttribute("SessionCourse");
        String username=(String)session.getAttribute("SessionUser");

           int l=0;
           String answers[]=new String[20];
           int k=0;
           
for(int l1=0;l1<id.length;l1++)
       {
 rs=stmt.executeQuery("Select answer from test where idtest="+id[l1]+"");
  

if(rs.next()){
answers[k]=rs.getString("answer");

k++;
}
 
}
l=answers.length;

for(int m=0;m<20;m++){
  

if((st[m]!=null)&&(st[m].compareTo(answers[m]) == 0)){
    count++;
     
}
}
%><font color="green"><%
out.println("<h1><center>Your "+count+" answers are correct</center></h1>");%></font><%
String query1="insert into testresult(Username,Course,Score,Date)values('"+username+"','"+cname+"',"+count+",sysdate())";
 stmt.executeUpdate(query1);

}
catch(NullPointerException e1)
        {
            out.print("<h1><center>Select all answers<center></h1>");
        }
 catch(Exception e2)
                 {
     out.print(e2);
     
 }
%>