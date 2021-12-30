<%-- 
    Document   : RegisterShow
    Created on : 2019-6-1, 20:33:57
    Author     : 11988
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style type="text/css">
             .outer{
                 
                position: absolute;
                left: 40%;
                top: 20%;
                color: #ffffff;
                font-family: "SimSun";
            }
             a:link,a:visited{
                color: #33ffcc;
            }
            a:hover{
                color: #ffffff;
            }
        </style>
    </head>
    <body>
        <img src="image/background.jpeg" width="100%" height="100%" />
        <%
            String cid = String.valueOf(session.getAttribute("cid"));
        %>
        <div class="outer">
            <h1>注册成功！ 您的id为：<%=cid%></h1><br>
            <font size="6"><a href="Login.jsp">去登陆</a>
        </div>
    </body>
</html>
