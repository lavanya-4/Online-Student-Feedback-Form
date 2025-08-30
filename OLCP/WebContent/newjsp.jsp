<%-- 
    Document   : newjsp
    Created on : Feb 28, 2012, 12:18:20 PM
    Author     : Administrator
--%>

<%@page import="java.util.Random"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
           Random r = new Random();
           int a[] = new int[8]; 
           for(int i=0;i<a.length;i++)
                             {
                             int t = r.nextInt(a.length);
                             a[i] = t;
                             int j;
                             for(j=0;t!=a[j]&&j<i;j++);
                             if(j!=i)     i--;
                             
                                          }               
%> 
<%
           for(int i=0;i<a.length;i++)
                             {
           %>
                <%= a[i] %>,
<%
           }
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
 for(int l=0;l<k;l++)
    
    
//        out.println("Select * from test where idtest in("+arr[a[0]]+","+arr[a[1]]+","+arr[a[2]]+","+arr[a[3]]+","+arr[a[4]]+","+arr[a[5]]+","+arr[a[6]]+","+arr[a[7]]+")");     
        rs=st.executeQuery("Select * from test where idtest in("+arr[a[0]]+","+arr[a[1]]+","+arr[a[2]]+","+arr[a[3]]+","+arr[a[4]]+","+arr[a[5]]+","+arr[a[6]]+","+arr[a[7]]+")");
int i=1; 

while(rs.next()){
%>

<tr><td><%=i%>&nbsp;&nbsp;&nbsp;<%=rs.getString("Question")%></td><tr><td><input type="radio" value="<%=rs.getString("option1")%>" name="radio<%=i%>"/>&nbsp;&nbsp;&nbsp;<%=rs.getString("option1")%></td></tr><tr><td><input type="radio" value="<%=rs.getString("option2")%>" name="radio<%=i%>"/>&nbsp;&nbsp;&nbsp;<%=rs.getString("option2")%></td></tr><tr><td><input type="radio" value="<%=rs.getString("option3")%>" name="radio<%=i%>"/>&nbsp;&nbsp;&nbsp;<%=rs.getString("option3")%></td></tr><tr><td><input type="radio" value="<%=rs.getString("option4")%>" name="radio<%=i%>"/>&nbsp;&nbsp;&nbsp;<%=rs.getString("option4")%></td></tr>

<%
i++;
}
}

        
        catch(Exception e)
               {
    out.print("Error  in your submisssion<br> So retry the exam");
}
%>
<tr><td><input type="submit" value="submit"></td></tr>
</table>
</form>
</html>
