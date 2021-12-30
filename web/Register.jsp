<%@page contentType="text/html" pageEncoding="GBK"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=GBK">
        <title>JSP Page</title>
        <style type="text/css">
            .outer{
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
            <form action="RegisterServlet" method="post">
                <table border="0">
                    <tbody>
                        <tr>
                            <td>Name:</td>
                            <td><input type="text" name="name" value="" /></td>
                        </tr>
                        <tr>
                            <td>Password:</td>
                            <td><input type="password" name="password" value="" /></td>
                        </tr>
                    </tbody>
                </table>
                <center><input type="submit" value="提交" /><br>
            </form>
        </div>
    </body>
</html>
