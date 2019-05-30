<%-- 
    Document   : staff_reg_process
    Created on : Dec 4, 2016, 7:13:27 AM
    Author     : user
--%>


<%@page import="java.lang.String"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%

String name1=request.getParameter("name");
String age1=request.getParameter("age");
String username1=request.getParameter("username");
String psd1=request.getParameter("psd");
String dob1=request.getParameter("dob");
String gender1=request.getParameter("gender");
String addre_line1=request.getParameter("addre_line1");
String addre_line2=request.getParameter("addre_line2");
String state1=request.getParameter("state");
String country1=request.getParameter("country");
String email1=request.getParameter("email");
String phone1=request.getParameter("phone");
String doj1=request.getParameter("doj");


int age2=Integer.parseInt(age1);

SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
java.util.Date d1=sdf.parse(dob1);
java.sql.Date dob2=new java.sql.Date(d1.getTime());

SimpleDateFormat sdf1=new SimpleDateFormat("yyyy-MM-dd");
java.util.Date d2=sdf1.parse(doj1);
java.sql.Date doj2=new java.sql.Date(d2.getTime());


Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/olx","root","");
String str="insert into staff_reg(name,age,username,psd,dob,gender,addre_line1,addre_line2,state,country,email,phone,doj) values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
PreparedStatement pst=con.prepareStatement(str);


pst.setString(1,name1);
pst.setInt(2,age2);
pst.setString(3,username1);
pst.setString(4,psd1);
pst.setDate(5,dob2);
pst.setString(6,gender1);
pst.setString(7,addre_line1);
pst.setString(8,addre_line2);
pst.setString(9,state1);
pst.setString(10,country1);
pst.setString(11,email1);
pst.setString(12,phone1);
pst.setDate(13,doj2);
pst.executeUpdate();

String str1="insert into login(username,psd,role) values(?,?,?)";
PreparedStatement pst1=con.prepareStatement(str1);


pst1.setString(1,username1);
pst1.setString(2,psd1);
pst1.setString(3,"staff");
pst1.executeUpdate();


response.sendRedirect("staff_reg.jsp");

%>