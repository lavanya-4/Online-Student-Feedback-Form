<%-- 
    Document   : resulttest
    Created on : Mar 14, 2012, 3:08:48 PM
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
 for(int p=0;p<id.length;p++)
       {
 ResultSet rs4=stmt.executeQuery("Select * from test where idtest="+id[p]+"");
  
    while(rs4.next())
               {
        String ans=rs4.getString(7);
       
        
        %>
    
<table>
    <tr><td><h3><%=(p+1)%>&nbsp;&nbsp;&nbsp;<%=rs4.getString("Question")%></h3></td><td><h3><%if(st[p]!=null&& st[p].equals(rs4.getString(7))){%><img src="tick5.jpg" width="45px"></img><%} else {%><img src="wrng1.jpg" width="45px"></img><%}%></h3></td></tr>
    <tr><td>A.&nbsp;&nbsp;&nbsp;<%if(ans.equals(rs4.getString(3))){%><font color="green"><b><%=rs4.getString("option1")%></b></font><%} else { out.println(rs4.getString("option1")); }%></td></tr>
    <tr><td>B.&nbsp;&nbsp;&nbsp;<%if(ans.equals(rs4.getString(4))){%><font color="green"><b><%=rs4.getString("option2")%></b></font><%} else { out.println(rs4.getString("option2"));}%></td></tr>
    <tr><td>C.&nbsp;&nbsp;&nbsp;<%if(ans.equals(rs4.getString(5))){%><font color="green"><b><%=rs4.getString("option3")%></b></font><%} else { out.println(rs4.getString("option3"));}%></td></tr>
    <tr><td>D.&nbsp;&nbsp;&nbsp;<%if(ans.equals(rs4.getString(6))){%><font color="green"><b><%=rs4.getString("option4")%></b></font><%} else { out.println(rs4.getString("option4"));}%></td></tr>
</table>
<%
    }
         }
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