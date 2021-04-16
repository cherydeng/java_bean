<%--
  Created by IntelliJ IDEA.
  User: macbook
  Date: 2021-04-16
  Time: 10:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<html>
<body><font size="10">
    <jsp:useBean id="car1" class="entity.Car" scope="session"></jsp:useBean>
    <%
        String name = request.getParameter("deleteitem");
        if(name == null){
            name = "";
        }
        byte c[] = name.getBytes("ISO-8859-1");
        name = new String(c);
        car1.delete(name);
        out.print("您删除了货物"+name);
    %>

    <P>您的购物车由如下商品:</P>
    <% Hashtable list = car1.List();
        Enumeration enume = list.elements();
        while (enume.hasMoreElements()) {
            String goods = (String) enume.nextElement();
            byte b[] = goods.getBytes("ISO-8859-1");
            goods = new String(b);
            out.print("<BR>" + goods);
        }

    %>
    <% String str1 = response.encodeRedirectURL("car.jsp"); %>
    <form action="<%=str1%>" method="post" name="form">
        <input type="submit" value="继续货物">
    </form>
    <%
        String str = response.encodeRedirectURL("selectRemovedGoods.jsp");
    %>
    <form action="<%=str%>" method="post" name="form1">
        <input type="submit" value="修改购物车的货物">
    </form>
</font>
</body>
</html>

