<%--
  Created by IntelliJ IDEA.
  User: macbook
  Date: 2021-04-16
  Time: 10:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<html>
<body><font size="10">
    <jsp:useBean id="car1" class="entity.Car" scope="session"></jsp:useBean>
    <P>选择从购物车删除商品:</P>
    <% String str = response.encodeRedirectURL("removeWork.jsp");%>

    <form action="<%=str%>" method="post" name="form2">
        <select name ="deleteitem" size="1">
            <option value="TV">电视机</option>
            <option value="apple">苹果</option>
            <option value="coke">可口可乐</option>
            <option value="milk">牛奶</option>
            <option value="tea">茶叶</option>
        </select>
        <input type="submit" value="提交删除">
    </form>
    <P>您的购物车由如下商品:</P>
    <% Hashtable list = car1.List();
        Enumeration enume = list.elements();
        while (enume.hasMoreElements()) {
            String goods = (String) enume.nextElement();
            byte b[] = goods.getBytes("utf-8");
            goods = new String(b);
            out.print("<BR>" + goods);
        }

    %>
    <% String str1 = response.encodeRedirectURL("car.jsp"); %>
    <form action="<%=str1%>" method="post" name="form">
        <input type="submit" value="继续购物">
    </form>
</font>
</body>
</html>
