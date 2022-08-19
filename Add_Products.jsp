<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.lang.*" %>
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
<center><h1>ADD PRODUCTS</h1></center>
<div class="tocenter">
          <form>
              
                Item:<input type="text" name="item"><br><br>
                Stock:<input type="number" name="quantity"><br><br>
                Price:<input type="number" name="price"><br><br>
              
                <input type="submit" value="ADD" name="add_pro">
                
         </form>
         </div> 
<%
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection c;
            Statement st;
            c=DriverManager.getConnection("jdbc:mysql://localhost:3306/sys","root","");
            st=c.createStatement();
          
            double r=Math.random();
            int pro_id = (int) ((r * 54) + 56);
           
            String item=request.getParameter("item");
            String qty=request.getParameter("quantity");
            String pri=request.getParameter("price");
  
            String insert1="insert into Products values('"+pro_id+"','"+item+"','"+qty+"','"+pri +"')";
            st.executeUpdate(insert1);
            
          
%>
</body>
</html>