<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
          form{
                border:3px solid #000000;    
                font-size: 36px;
                background-color:pink;
               
            }
            input
            {
            font-size: 28px;
            }
       .tocenter{
                display:flex;
                align-items:center;
                justify-content:center;
                margin:1px;
                padding:10px;
            
            }
  </style>
</head>
<body style="background-color:skyblue;'">
<center>
<h1>ADD CUSTOMERS</h1>
</center>
<div class="tocenter">
          <form>
                ID:<input type="text" name="cid"><br><br>
                Name:<input type="text" name="cname"><br><br>
                Phone Number:<input type="text" name="phoneno"><br><br>
                Email id:<input type="text" name="email"><br><br>
                Address:<input type="text" name="address"><br><br>
                <input type="submit" value="ADD" name="loginSubmit">
                
         </form>
 </div> 
<%
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection c;
            Statement st;
            c=DriverManager.getConnection("jdbc:mysql://localhost:3306/sys","root","");
            st=c.createStatement();
          
            double r=Math.random();
            int cus_id = (int) ((r * 54000) + 5676);
            String name=request.getParameter("cname");
            String phoneno=request.getParameter("phoneno");
            String mail=request.getParameter("email");
            String address=request.getParameter("address");
            
            String insert="insert into Customers values('"+cus_id+"','"+name+"','"+phoneno+"','"+mail+"','"+address+"')";
            st.executeUpdate(insert);
            
          
%>
</body>
</html>

