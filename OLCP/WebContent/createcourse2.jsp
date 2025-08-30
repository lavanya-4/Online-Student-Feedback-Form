<%-- 
    Document   : create
    Created on : Mar 13, 2012, 1:40:21 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="java.util.List" %>
   <%@ page import="java.util.Iterator" %>
   <%@ page import="java.io.*" %>
   <%@ page import="java.sql.*" %>
    <%@ page import="java.lang.*" %>
  
   <%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
   <%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
   <%@ page import="org.apache.commons.fileupload.*"%>
   <center><table border="0">
        
           
   <%
   int k=0;
   //String cname5=request.getParameter("cou");
   
 //  out.println(cname5);
 boolean isMultipart = ServletFileUpload.isMultipartContent(request);
 if (!isMultipart) {
 } else {
           FileItemFactory factory = new DiskFileItemFactory();
           ServletFileUpload upload = new ServletFileUpload(factory);
           List items = null;
           try {
                   items = upload.parseRequest(request);
           } catch (FileUploadException e) {
                   e.printStackTrace();
           }
           Iterator itr = items.iterator();
           while (itr.hasNext()) {
           FileItem item = (FileItem) itr.next();
           if (item.isFormField()) {
           } else {
               
                   try {
                       String url="jdbc:mysql://localhost:3306/olcp?user=root&password=";
                      Class.forName("com.mysql.jdbc.Driver");
                      ResultSet rs; 
                       ResultSet rs1; 
                     
        	           Connection con1=DriverManager.getConnection(url);
    	                    Statement st=con1.createStatement();
                            String cname=(String)session.getAttribute("SessionCourse");
                             String username=(String)session.getAttribute("SessionUser");
                             String q1="select Name from registration where Username='"+username+"'";
                            rs1=st.executeQuery(q1);
                            String facname=null;
                            while(rs1.next())
                                                               {
                                facname=rs1.getString(1);
                                
                            }
                           String itemName = item.getName();
                           
                           File savedFile = new File(config.getServletContext().getRealPath("/")+"course/"+itemName);
                           item.write(savedFile);
                           //String sf=item.getName();
                           //String[] f=null,fn=null;
                                  // f=sf.split(".");
                                  // out.print(f.length);
                                   //for(int k=0;k<f.length;k++)
                                  //{
                                   //   fn[k]=f[k]; 
                                  // }
                                  // out.println(fn[1]);
                           String cname1=(String)session.getAttribute("course");
                       
                           String status="Active";
                           if(k==0)
                           {
                         String query="insert into course(Cname,Description,Status,Date,filename) values('"+cname1+"','./course/"+itemName+"','"+status+"',sysdate(),'"+itemName+"')";
                                                    st.executeUpdate(query);
                                                    k++; 
                           
                           
                             %>
                             
                    <tr><td><h1><font color="orange"><%=cname1%>&nbsp;&nbsp;Course Creation Successful</font></h1></td></tr><%}
                           
                         //  out.println("<tr><td><b>Your file has been savedat the loaction:</b></td></tr><tr><td><b>"+config.getServletContext().getRealPath("/")+"uploadedFiles"+"\\"+itemName+"</td></tr>");
                                                        
                                            else
                                                             {
                               String query1="insert into img(Course,Filepath,File) values('"+cname1+"','./course/"+itemName+"','"+itemName+"')";
                                                    st.executeUpdate(query1);
                                                             }  }                 
                           
                    
                   
                                     
                   catch (Exception e) {
                           e.printStackTrace();
                   }
           }
           }
   }
   %>
   <tr><td align="center"><h2><a href="create.html"><font color="purple"><center>Back</center></font></h2></td></tr>
       </table>
   </center>