<%@page contentType="text/html" pageEncoding="GBK"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=GBK">
        <title>JSP Page</title>
        <style type="text/css">
            .outer{
                font-family: "SimSun";
                position: absolute;
                left: 40%;
                top: 20%;
                width: 300px;
                height: 250px;
                color: #ffffff;
            }
            table{
                height: 80px
            }
            a:link,a,a:visited{
                color:#99ffff;
            }
            a:hover{
                color:  #ffffff;
            }
        </style>
    </head>
    <body>   
        <img src="image/background.jpeg" width="100%" height="100%" />
        <div class="outer">
            <form action="LoginServlet" method="post">
                <table border="0">
                    <tbody>
                        <tr>
                            <td>ID:</td>
                            <td><input type="text" name="id" value="" /></td>
                        </tr>
                        <tr>
                            <td>Password:</td>
                            <td><input type="password" name="password" value="" /></td>
                        </tr>
                    </tbody>
                </table>
                <center><input type="submit" value="登陆" /><br>
                <a href="Register.jsp">新用户注册</a></center>
            </form>
            <font size="5" color="#ff0000">账号或密码错误！</font>
        </div>
    </body>
</html>
