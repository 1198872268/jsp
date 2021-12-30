<%@page import="MyBean.ProductBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="MyBean.ProductDao"%>
<%@page contentType="text/html" pageEncoding="GB2312"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=GB2312">
        <title>JSP Page</title>
        <style type="text/css">
            .outer{
                font-family: "SimSun";
                size: 20px;
                width: 100%;
                font-size: 20px;
                color: #ffffff;
            }
            table{
                width: 1200px;
            }
            .order{
                position: absolute;
                width: 20px;
                right: 230px;
                top: 125px;
            }
        </style>
    </head>
    <%
        String id = String.valueOf(session.getAttribute("cid"));
        int cid = Integer.parseInt(id);
        float sum1 = 0;
        ArrayList<ProductBean> list = ProductDao.getProductList(cid);
        session.setAttribute("wang", list);
        for (ProductBean aa : list) {
            sum1 = sum1 + aa.getSum();
        }
    %>
    <body background="image/background1.jpeg">
        <div class="outer">
            <center> 
                <table border=1  >
                    <tr>
                        <td colspan="5" align="center"><h2>商品列表</h2></td>
                    </tr>
                    <tr>
                        <td align="center"><b>商品名称</b></td>
                        <td align="center"><b>商品价格</b></td>
                        <td align="center"><b>商品图片</b></td>
                        <td align="center"><b>购买数量</b></td>
                        <td align="center"><b>合计</b></td>
                    </tr>
                    <c:forEach items="${wang}" var="aa">
                        <tr>
                            <td align="center">${aa.gname}</td>
                            <td align="center">${aa.price}</td>
                            <td align="center"><img src="${aa.image}" width="200" height="300"/>
                            </td>
                        <form action="CountServlet">
                            <td align="center"><input type="hidden" name="gid" value=${aa.gid} /><input type="submit" value="-" name="operate" /><input type="text" name="number" value=${aa.number} size="5" /><input type="submit" value="+" name="operate" /></td>
                        </form>
                        <td align="center">${aa.sum}</td>
                        </tr>
                    </c:forEach>
                </table>
            </center>
        </div>
        <div class="order" >
            <form action="Order.jsp">
                <table border="1">
                    <tbody>
                        <c:forEach var="bb" items="${wang}">
                            <tr><td style="height: 305px"><input style="width:20px" type="checkbox" name="item" value=${bb.gid} /></td></tr>
                                </c:forEach>
                    </tbody>
                </table>
                <input style="font-size: 26px;position: absolute;top:98%;left: 50%;width: 80px;height: 50px" type="submit" value="结算" />
            </form>  
        </div>
    </body>   
</html>
