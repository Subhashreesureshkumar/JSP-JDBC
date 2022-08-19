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
<body style="background-color:skyblue;">
<center><h1>Remove Product</h1></center>
<div class="tocenter">
</head>


<form>
                Item:<input type="text" name="name"><br><br>
                 <input type="submit" value="Del" name="del_pro">
                
         </form>
         </div>
         <%
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection c;
            Statement st;
            c=DriverManager.getConnection("jdbc:mysql://localhost:3306/sys","root","");
            st=c.createStatement();
          
          
            String item=request.getParameter("name");
          
            
            PreparedStatement del = c.prepareStatement("delete from Products where pname=?");
            del.setString(1, item);
            int d = del.executeUpdate();
         
            
          
%>
</body>
</html>