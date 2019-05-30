<%-- 
    Document   : admin_view_products
    Created on : Dec 15, 2016, 1:08:51 AM
    Author     : user
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <h1>ADMIN VIEW PRODUCTS</h1>
        <table border="1">
        <tr>    
        <th>PRODUCT ID</th>
        <th>CATEGORY ID</th>
        <th>PRODUCT NAME</th>
        <th>PRODUCT MODEL</th>
        <th>DESCRIPTION</th>
        <th>PICTURE</th>
        <th>RATE</th>
        <th>DATE OF REGISTRATION</th>
        </tr>
        <%
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/olx","root","");
        String str="select * from products";
        PreparedStatement pst=con.prepareStatement(str);
        ResultSet rs=pst.executeQuery();
        
        while(rs.next())
           {  
        %>
        
        <tr>   
                <td><%=rs.getInt(1)%></td>
                <td><%=rs.getInt(2)%></td>
                <td><%=rs.getString(3)%></td>
                <td><%=rs.getString(4)%></td>
                <td><%=rs.getString(5)%></td>
                <td><%
                String s1=rs.getString(6);
                //out.println(s1);
                String im=s1.substring(49);
                //out.print(im);
                %><img src="<%=im%>" width="90" height="90"></td>
                <td><%=rs.getLong(7)%></td>
                <td><%=rs.getDate(8)%></td>
                                       
                <td><a href="admin_edit_products.jsp?pro_id=<%=rs.getInt(1)%>&category_id=<%=rs.getInt(2)%>&pro_name=<%=rs.getString(3)%>&pro_model=<%=rs.getString(4)%>&pro_desc=<%=rs.getString(5)%>&pro_rate=<%=rs.getLong(7)%>&dor=<%=rs.getDate(8)%>&pic=<%=im%>"><input type="submit" value="Edit"></input></a></td>
                <td><a href="admin_delete_products.jsp?pro_id=<%=rs.getInt(1)%>"><input type="submit" value="DELETE"></input></a></td>
                        
        </tr>    
        
          <%}%>
        
        </table>    