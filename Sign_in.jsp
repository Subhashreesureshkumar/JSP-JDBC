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
 <center><h1>SIGNIN</h1></center>
           <div class="tocenter">
           
            <form action="http://localhost:8080/Order_Management_system/Place_Order.html" >
                Name:<input type="text" name="cname"><br><br>
                Phone Number:<input type="text" name="phoneno"><br><br>
                Email id:<input type="text" name="email"><br><br>
                Address:<input type="text" name="address"><br><br>
                <%
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection c;
            Statement st;
            c=DriverManager.getConnection("jdbc:mysql://localhost:3306/sys","root","");
            st=c.createStatement();
          
            double r=Math.random();
            int cus_id = (int) ((r * 54000) + 5676);
            session.setAttribute("cus_id", cus_id);
            String name=request.getParameter("cname");
            String phoneno=request.getParameter("phoneno");
            String mail=request.getParameter("email");
            String address=request.getParameter("address");
            
           
            
            String insert="insert into Customers values('"+cus_id+"','"+name+"','"+phoneno+"','"+mail+"','"+address+"')";
            st.executeUpdate(insert);
            %>
                <input type="submit" value="Submit" name="loginSubmit">
              
            </form>
            </div>
</body>
</html>