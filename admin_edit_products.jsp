<%-- 
    Document   : admin_edit_products
    Created on : Nov 9, 2016, 4:09:54 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>STAFF EDIT</title>
        <style>
            body
            {
                background-color:yellowgreen;
                
            }
            h1
            {
                color:red;   
            }
        </style>   
    </head>
    <body>
       <h1> ADMIN EDIT PRODUCTS</h1>
        <form action="admin_edit_products_process.jsp" method="post" enctype="multipart/form-data">
        <table>
            
            <tr>
                <td>Product Id</td>
                <td><%=request.getParameter("pro_id")%>
                <td><input type="hidden" name="pro_id" value="<%=request.getParameter("pro_id")%>"></input></td>    
                                            
             </tr>
             
             <tr>
                <td>Category Id</td>
                <td><%=request.getParameter("category_id")%>
                <td><input type="hidden" name="category_id" value="<%=request.getParameter("category_id")%>"></input></td>    
                                            
             </tr>
             
            <tr>
            <tr>
                <td>PRODUCT NAME</td>
                <td><input type="text" name="pro_name" value="<%=request.getParameter("pro_name")%>"></input></td>
            </tr>
            <tr>
               <td>PRODUCT MODEL</td>
                <td><input type="text" name="pro_model" value="<%=request.getParameter("pro_model")%>"></input></td>
             
            </tr>
            <tr>
               <td>PRODUCT DESCRIPTION</td>
                <td><input type="text" name="pro_desc" value="<%=request.getParameter("pro_desc")%>"></input></td>
   
            </tr>
            
            <tr>
               <td>ADD PICTURE</td>
              <%--  <td><input type="text" name="" value="<%=request.getParameter("pro_pic")%>"></input></td>--%>
              <%
              
              String pic=request.getParameter("pic");
              
              
              %>
              <td><img src="<%=pic%>" width="100" height="100"></td>
              
              <td><input type="file" name="<%=pic%>"></td>
            
              
              
   
            </tr>
            
            <tr>
               <td>PRODUCT RATE</td>
                <td><input type="text" name="pro_rate" value="<%=request.getParameter("pro_rate")%>"></input></td>
             
            </tr>
            
            <tr>
               <td>DATE OF REGISTRATION</td>
                <td><input type="text" name="dor" value="<%=request.getParameter("dor")%>"></input></td>
             
            </tr>
            
            
            <tr>
                <td><input type="submit" value="Save"></input></td>
            </tr>
            
            
        </table>
        </form>
    </body>
</html>


