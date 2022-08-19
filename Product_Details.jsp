<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="background-color:skyblue;">

<center><h1>LIST OF FRUITS</h1></center>
 <%
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection c;
            Statement st;
            c=DriverManager.getConnection("jdbc:mysql://localhost:3306/sys","root","");
            st=c.createStatement();
            ResultSet rs = st.executeQuery("Select proID,pname,price from Products");
            out.println("<center><table border=1 style='text-align:center;font-size:28px;'><tr><th>S.NO</th><th>ITEMS</th><th>PRICE</th></tr>");
            while (rs.next()) {
              out.println("<h2><tr ><td>"+rs.getInt(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"/-</td></tr></h2>");
            }
            out.println("</table>\n</center>");
            out.println("<center>");
            out.println("<h2>Make your Orders by login or signup to our page...</h2>");
            out.println("<h2>Are you a new customer?<a href='Sign_in.jsp'>CLICK HERE</a></h2>");
            out.println("<h2>Or else,<a href='Login.html'>CLICK HERE</a></h2>");
            out.println("</center>");
            
 %>
</body>
</html>