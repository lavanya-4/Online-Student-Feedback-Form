<%-- 
    Document   : upload_file_multipale
    Created on : Feb 23, 2012, 8:44:32 PM
    Author     : L@lli
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
                           
                           File savedFile = new File(config.getServletContext().getRealPath("/")+"uploadedFiles/"+itemName);
                           item.write(savedFile);
                           

                         String query="insert into files(Cname,Filepath,Filename,Date,Username) values('"+cname+"','./uploadedFiles/"+itemName+"','"+itemName+"',sysdate(),'"+facname+"')";
                                                     st.executeUpdate(query);
                             %>
                             
                    <tr><td><h1><font color="orange"><%=itemName%>&nbsp;&nbsp;FILE IS UPLOADED SUCCESSFULLY</font></h1></td></tr><%
                           
                         //  out.println("<tr><td><b>Your file has been savedat the loaction:</b></td></tr><tr><td><b>"+config.getServletContext().getRealPath("/")+"uploadedFiles"+"\\"+itemName+"</td></tr>");
                   
                           
                   } 
                   
                                     
                   catch (Exception e) {
                           e.printStackTrace();
                   }
           }
           }
   }
   %>
    <tr><td><h2><font color="purple"><a href="upload_file_multiple.jsp">Back</font></h2></td></tr>
       </table>
   </center>