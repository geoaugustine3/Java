<%-- 
    Document   : login_process
    Created on : Nov 28, 2016, 11:21:55 PM
    Author     : 4
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String username1=request.getParameter("username");
String psd1=request.getParameter("psd");
String role1=request.getParameter("role");

System.out.print(username1+psd1+role1);
String uname="",psd="",rl="";

Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/olx","root","");
String str="select * from login where username=?";
PreparedStatement pst=con.prepareStatement(str);
pst.setString(1,username1);
ResultSet rs=pst.executeQuery();
while(rs.next())
       {
    uname=rs.getString(1);
    psd=rs.getString(2);
    rl=rs.getString(3);

}
System.out.print(uname+psd+rl);

if (username1.equals(uname)&& psd1.equals(psd)&& role1.equals("admin")&&(rl.equals(role1)) )
{
response.sendRedirect("admin_home.jsp");
}
else if (username1.equals(uname)&&psd1.equals(psd)&&(role1.equals("staff")) && (rl.equals(role1)))
{
session.setAttribute("staffsession",uname);
response.sendRedirect("staff_home.jsp");
}  
else if (username1.equals(uname)&&psd1.equals(psd)&& role1.equals("user")&&(rl.equals(role1)))
{
session.setAttribute("usersession",uname);
response.sendRedirect("user_home.jsp");
} 
else
{   
request.setAttribute("msg1","Inavlid username or psd");               
//out.println("Your Username or Password can be Wrong");
request.getRequestDispatcher("login.jsp").forward(request, response);      
}        
   
    
    

%>