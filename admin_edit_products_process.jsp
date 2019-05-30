<%-- 
    Document   : admin_edit_products_process
    Created on : Jan 4, 2017, 1:32:35 AM
    Author     : user
--%>

<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String pro_id="";
String category_id="";
String pro_name="";
String pro_model="";
String pro_desc="";
String pro_rate="";
String dor="";



int MAX_MEMORY_SIZE = 1024 * 1024 * 2;
    final int MAX_REQUEST_SIZE = 1024 * 1024;
 
    DiskFileItemFactory factory = new DiskFileItemFactory();
      factory.setSizeThreshold(MAX_MEMORY_SIZE);
 factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
 
 String uploadFolder="C:/Users/user/Documents/NetBeansProjects/olx/web/pic";
 
    ServletFileUpload upload = new ServletFileUpload(factory);
     ServletFileUpload upload1 = new ServletFileUpload(factory);

    // Set overall request size constraint
    upload.setSizeMax(MAX_REQUEST_SIZE);
    upload1.setSizeMax(MAX_REQUEST_SIZE);
       
           String fileName="";
 String filePath="";
 File uploadedFile=null;
  
        // Parse the request
        List items = upload.parseRequest(request);
        for (Object item1 : items) {
            FileItem item = (FileItem) item1;

            if (!item.isFormField()) {
              fileName=new File(item.getName()).getName();
                
              
                               
               filePath=uploadFolder+File.separator+fileName;
                
               uploadedFile = new File(filePath);
                
               

                // saves the file to upload directory
                item.write(uploadedFile);
                 
                
            }
            else
                               {
                  if(item.getFieldName().equals("category_id"))
        {   
          category_id=item.getString();
        }
        
             if(item.getFieldName().equals("pro_name"))
        {   
          pro_name=item.getString();
        }
              if(item.getFieldName().equals("pro_model"))
        {   
          pro_model=item.getString();
        }   
               if(item.getFieldName().equals("pro_desc"))
        {   
          pro_desc=item.getString();
        }
            
                if(item.getFieldName().equals("pro_rate"))
        {   
          pro_rate=item.getString();
        }
                if(item.getFieldName().equals("dor"))
        {   
          dor=item.getString();
        }
            }
            
            }

int pro_id1=Integer.parseInt(pro_id); 
int category_id1=Integer.parseInt(category_id);
long pro_rate1=Long.parseLong(pro_rate);

System.out.println(pro_id1);
System.out.println(category_id1);
System.out.println(pro_rate1);

SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
java.util.Date d1=sdf.parse(dor);
java.sql.Date dor1=new java.sql.Date(d1.getTime());

Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/olx","root","");
String str="update products set category_id=?,pro_name=?,pro_model=?,pro_desc=?,pro_pic=?,pro_rate=?,dor=? where pro_id=?";
PreparedStatement pst=con.prepareStatement(str);

pst.setInt(1,category_id1);
pst.setString(2,pro_name);
pst.setString(3,pro_model);
pst.setString(4,pro_desc);
pst.setString(5,filePath.trim());
pst.setLong(6,pro_rate1);
pst.setDate(7,dor1);
pst.setInt(8,pro_id1);
pst.executeUpdate();


response.sendRedirect("admin_view_products.jsp");

%>