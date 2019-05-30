<%-- 
    Document   : category_process
    Created on : Dec 13, 2016, 10:29:05 PM
    Author     : user
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%

String category1=request.getParameter("category");


Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/olx","root","");
String str="insert into category(category_name) values(?)";
PreparedStatement pst=con.prepareStatement(str);


pst.setString(1,category1);

pst.executeUpdate();

response.sendRedirect("category.jsp");

%>