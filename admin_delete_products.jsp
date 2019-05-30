<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

String pro_id1=request.getParameter("pro_id");

Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/olx","root","");
String str="Delete from products where pro_id=?";
PreparedStatement pst= con.prepareStatement(str);
pst.setString(1,pro_id1);
pst.executeUpdate();

response.sendRedirect("admin_view_products.jsp");


%>

