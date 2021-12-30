<%@page import="MyBean.Order"%>
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
        </style>
    </head>
   
            <body background="image/background1.jpeg">
        <%!
        String flag;
        %>
    <%
        String[] items = request.getParameterValues("item");
        String id = String.valueOf(session.getAttribute("cid"));
        int cid = Integer.parseInt(id);
        float sum1=0;
          ArrayList<ProductBean> order = new ArrayList<>();
        for(String i:items){
            ProductBean bean = Order.getOrder(Integer.parseInt(i), cid);
            order.add(bean);
            Order.insert(bean);
        }
        session.setAttribute("Order", order);
        for (ProductBean aa : order) {
            sum1 = sum1 + aa.getSum();
        }
    %>
        <div class="outer">
            <center> 
                <table border=1 cellpadding=1 cellspacing=1  >
                    <tr>
                        <td colspan="6" align="center"><h2>��Ʒ�б�</h2></td>
                    </tr>
                    <tr>
                        <td align="center"><b>��Ʒ����</b></td>
                        <td align="center"><b>��Ʒ�۸�</b></td>
                        <td align="center"><b>��ƷͼƬ</b></td>
                        <td align="center"><b>��������</b></td>
                        <td align="center"><b>�ϼ�</b></td>
                        <td></td>
                    </tr>
                    <c:forEach items="${Order}" var="aa">
                        <tr>
                            <td align="center">${aa.gname}</td>
                            <td align="center">${aa.price}</td>
                            <td align="center"><img src="${aa.image}" width="200" height="300"/>
                            </td>
                        <form action="CountServlet">
                            <td align="center"><input type="hidden" name="gid" value=${aa.gid} /><input type="submit" value="-" name="operate" /><input type="text" name="number" value="${aa.number}" /><input type="submit" value="+" name="operate" /></td>
                        </form>
                        <td align="center">${aa.sum}</td>
                        <td></td>
                        </tr>
                    </c:forEach>
                    <tr>
                        <td colspan="6" align="center"><h2>�ϼƣ�<%=sum1%></h2></td>
                    </tr>
                </table>
            </center>
    </body>   
</html>
