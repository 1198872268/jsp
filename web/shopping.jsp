<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="LoginBean" type="MyBean.Login" scope="session"/>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style type="text/css">
            .outer{
                font-family: "SimSun";
                position: fixed;
                left: 7%;
                top: 50%;
            }
            a:link,a:visited{
                color: #33ffcc;
            }
            a:hover{
                color: #ffffff;
            }
            .table th, .table td { 
                text-align: center;
                vertical-align: middle!important;
            }
        </style>
    </head>
    <body>
        <img src="image/background.jpeg" width="100%" height="100%" />
        <font color="#ffffff" size="6" style="position: fixed;left: 4%;top: 4%">欢迎您! <jsp:getProperty name="LoginBean" property="name"/></font>
        <font color="#ffffff" size="6" style="position: fixed;left: 4%;top: 40%">开启您的购物之旅</font>
        <div class="outer">
            <font size="5">
            <a href="MyCart.jsp">我的购物车</a><br>
            <a href="kindone.jsp">男装/女装/童装</a><br>
            <a href="kindtwo.jsp">果汁/酒类/汽水</a><br>
            <a href="kindthree.jsp">美食/生鲜/零食</a><br>
            <a href="">学习/办公/户外</a><br>
            <a href="">家具/家饰/家纺</a><br>
            <%
                HttpSession ss = request.getSession(); 
                 String cid =String.valueOf(ss.getAttribute("id"));
                 int id = Integer.parseInt(cid);
                 session.setAttribute("cid", id);
                %>
            </font>
        </div>
        
    </body>
</html>
