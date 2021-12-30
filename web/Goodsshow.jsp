<%@page import="MyBean.Cart"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="MyServlet.DB"%>
<%@page import="MyBean.Goods"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .outer1{
                position: absolute;
                left: 500px;
                top: 120px;
            }
            .info{
                position: absolute;
                left: 500px;
                top: 800px;
            }
            .one{
                position: absolute;
                right: 20%;
                top: 48%;
                color: #ffffff;
            }
            body{
                background-color: #000000;
            }
        </style>
    </head>
    <body>
        <%!
            String image, gname, flag,price,info;
        %>
        <%
            gname=String.valueOf(session.getAttribute("gname")) ;
            image=String.valueOf(session.getAttribute("image")) ;
            price=String.valueOf(session.getAttribute("price")) ;
            flag=String.valueOf(session.getAttribute("flag"));
            info=String.valueOf(session.getAttribute("info"));
        %>
          <div class="outer1">
            <img src=" <%= image%>" width="500" height="600"/>
        </div> 
            <div class="info">
                <img src="<%= info%>" width="700" height="550"/>
            </div>><input  color="#ffffff"  style="font-size: 20px;position: absolute;top: 750px;left: 500px" type="submit" value="详情" />
        <div class="one">
            <h1><%= gname%><br>
                <%= price%></h1>
            <form action="Cart_Servlet">
                <input size="6" style=" font-size: 45px;background: #ff6600;color: #ffffff;width: 230px;height: 90px" type="submit" value="加入购物车" />
            </form>
            <%=flag%>
        </div>
    </body>
</html>
