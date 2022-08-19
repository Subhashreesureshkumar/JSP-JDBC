<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="background-color:skyblue;">

 <%
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection c;
            Statement st;
            c=DriverManager.getConnection("jdbc:mysql://localhost:3306/sys","root","");
            st=c.createStatement();
            ResultSet rs;
           
            
            double r1 = Math.random();
            int ord_id = (int) ((r1 * 20000) + 756);
        
            String pro=request.getParameter("item");
            String quantity=request.getParameter("quantity");
         
            PreparedStatement id = c.prepareStatement("Select proID from Products where pname=?");
            id.setString(1, pro);
            rs = id.executeQuery();
            int id1=0;
            while (rs.next()) {
                id1= rs.getInt(1);
            }
                
               
            String pri = null;
            PreparedStatement price = c.prepareStatement("Select Price from Products where pname=?");
            price.setString(1, pro);
            rs = price.executeQuery();
            while (rs.next()) {
                    pri = rs.getString(1);
            }
          
            int rate=150 ;
                
            PreparedStatement insertProd;
            insertProd = c.prepareStatement("insert into ord_prod values(?,?,?,?,?)");
            insertProd.setInt(1, ord_id);
            insertProd.setString(2, pro);
            insertProd.setString(3, quantity);
            insertProd.setString(4, pri);
            insertProd.setInt(5, rate);
            int i2 = insertProd.executeUpdate();
                
           

            long millis = System.currentTimeMillis();
            
            java.sql.Date date = new java.sql.Date(millis);
            session.getAttribute("cus_id");
            double r=Math.random();
            int cus_id = (int) ((r * 54000) + 5676);
            String insert1="insert into Orders values('"+ord_id+"','"+cus_id+"','"+date+"')";
            st.executeUpdate(insert1);
           
           
            
            out.println("<center><h1>");
            out.println("ORDER PLACED!!");
            out.println("******************************************************BILL****************************************************");

            out.println("</center>");
            rs = st.executeQuery("Select Orders.ordID,pro,quantity,price,rate from Orders INNER JOIN ord_prod ON Orders.ordID=ord_prod.ordID");
            out.println("<center><table border=1 style='text-align:center'><tr><th>ITEMS</th><th>QUANTITY</th><th>PRICE</th><th>RATE</th></tr>");        
            while (rs.next()) {
                out.println( "<tr><td>"+rs.getString(2)+"</td><td>" + rs.getInt(3)+"</td><td>"  + rs.getInt(4)+"</td><td>" + rs.getInt(5)+"</td></tr>");
            }
           
          
            out.println("</table>\n</center>");
            
            out.println("<h2>To Continue orders,<a href='Place_Order.html'>CLICK HERE</a></h2>");
     %>
</body>
</html>