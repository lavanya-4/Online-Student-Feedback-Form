<%-- 
    Document   : test
    Created on : Feb 4, 2012, 4:49:51 PM
    Author     : satya
--%>

<%@page import="java.util.Random"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>  
    <script language="JavaScript">
javascript:window.history.forward(4);
</script>
<%  
String mins = request.getParameter( "mins" );  
if( mins == null ) mins = "3";  
   
String secs = request.getParameter( "secs" );  
if( secs == null ) secs = "1";  
%>  
<script>  
<!--  
var mins = <%=mins%>; // write mins to javascript  
var secs = <%=secs%>; // write secs to javascript  
var t;
function timer()  
{  
// tic tac  
if( --secs == -1 )  
{  
secs = 59;  
--mins;  
}  
  
// leading zero? formatting  
if( secs < 10 ) secs = "0" + secs;               
if( mins < 10 ) mins = "0" + parseInt( mins, 10 );  
  
// display  
document.f1.mins.value = mins;   
document.f1.secs.value = secs;  
  
// continue?  
if( secs == 0 && mins == 0 ) // time over  
{  
alert("Time Over"); 
document.f1.action="testresult.jsp";
document.f1.submit();  
}  
else // call timer() recursively every 1000 ms == 1 sec  
{  
t=window.setTimeout( "timer()", 1000 );  
}  
} 
function stoper()	{
clearTimeout(t);
}

//-->  
</script>
        </head>  
    <body>
        <form name="f1" action="resulttest.jsp"> <center><h1><font color="green">Test</font></h1></center><br>
            

<%
                       
           ResultSet rs=null;
        ResultSet rs1=null;
        ResultSet rs2=null;
	Connection con1=null;
        Connection con2=null;
        int count=0;


try{

    String url="jdbc:mysql://localhost:3306/olcp?user=root&password=";
    Class.forName("com.mysql.jdbc.Driver");
    	con1=DriverManager.getConnection(url);
    	Statement st=con1.createStatement();
        String cname=(String)session.getAttribute("SessionCourse");
           String q1="select Courseid from course where Cname='"+cname+"'";
           rs1=st.executeQuery(q1);
           int cid=0;
           while(rs1.next())
                             {
               cid=rs1.getInt(1);
                             }
           int arr[]=new int[100];
                     int k=0;
rs2=st.executeQuery("select idtest from test where Courseid="+cid+"");
while(rs2.next()){
    arr[k]=rs2.getInt(1);
    k++;
    
} 
if(k!=0){
    
    %>
    Time remaining: <input type="text" name="mins" size="1" style="border:0px solid black;text-align:right">:<input type="text" name="secs" size="1" style="border:0px solid black"> 
            <table>
            
            <script>  
<!--  
timer();  
//-->  
</script>
<%
 Random r = new Random();
           int a[] = new int[20]; 
           for(int i=0;i<a.length;i++)
                             {
                             int t = r.nextInt(k);
                             a[i] = t;
                             int j;
                             for(j=0;t!=a[j]&&j<i;j++);
                             if(j!=i)     i--;
                             
                                          } 
       
int arr1[]=new int[20];
for(int i=0;i<a.length;i++)
       {
    rs=st.executeQuery("Select * from test where idtest = "+arr[a[i]]);
    while(rs.next())
             { 
        arr1[i]=arr[a[i]];
        session.setAttribute("arr"+i,arr1[i]);
        %>
       
        <tr><td><h3><%=(i+1)%>&nbsp;&nbsp;&nbsp;<%=rs.getString("Question")%></h3></td><tr><td><input type="radio" value="<%=rs.getString("option1")%>" name="radio<%=i%>"/>&nbsp;&nbsp;&nbsp;<%=rs.getString("option1")%></td></tr><tr><td><input type="radio" value="<%=rs.getString("option2")%>" name="radio<%=i%>"/>&nbsp;&nbsp;&nbsp;<%=rs.getString("option2")%></td></tr><tr><td><input type="radio" value="<%=rs.getString("option3")%>" name="radio<%=i%>"/>&nbsp;&nbsp;&nbsp;<%=rs.getString("option3")%></td></tr><tr><td><input type="radio" value="<%=rs.getString("option4")%>" name="radio<%=i%>"/>&nbsp;&nbsp;&nbsp;<%=rs.getString("option4")%></td></tr>
<%
    }
   
}
 %>
        <tr><td><input type="submit" value="submit"></td></tr>
</table><%
}
else
       {
    %>
    <h1><center><font color="orange">NO PAPER IS AVAILABLE</font></h1></center>
   <% 
    
}
}

        
        catch(Exception e)
               {
            out.println(e);
    out.println("<h1>Error  in your submition<br> So retry the exam</h1>");
}
%>

    </form></body>
</html>
