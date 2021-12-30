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
                font-family: "SimSun";
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
            int gid;
            double price;
            String image, gname,flag,info;
                                %>
        <%
            gid = Integer.parseInt(request.getParameter("gid"));
            try {
            PreparedStatement ps = DB.dbCon().prepareStatement("select * from goods where gid=?");
            ps.setInt(1, gid);
            ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    gname = rs.getString(2);
                    image = rs.getString(4);
                    price = rs.getDouble(3);
                    info = rs.getString(5);
                    session.setAttribute("gname", gname);
                    session.setAttribute("gid", gid);
                    session.setAttribute("image", image);
                    session.setAttribute("price", price);
                    session.setAttribute("info", info);
                } else {
                    out.print("wrong");
                }
            } catch (Exception e) {
               out.print("sql wrong");
            }
            
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
        </div>
    </body>
</html>
