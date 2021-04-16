<%--
  Created by IntelliJ IDEA.
  User: macbook
  Date: 2021-04-16
  Time: 10:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<html>
<body><font size="10">
    <jsp:useBean id="car1" class="entity.Car" scope="session"></jsp:useBean>
    <P>您好，这里是中央商场，选择你要购买的商品添加到购物车</P>
    <% String str = response.encodeRedirectURL("add.jsp");%>

    <% car1.add(); %>
    <form action="<%=str%>" method="post" name="form">
        <select name ="item" size="1">
            <option value="TV">电视机</option>
            <option value="apple">苹果</option>
            <option value="coke">可口可乐</option>
            <option value="milk">牛奶</option>
            <option value="tea">茶叶</option>
        </select>
        <br>
        请输入购买的数量：<input type="text" name="mount">
        <br>
        请选择计量单位:<label><input type="radio" value="个" name="unit">个</label>
        <label><input type="radio" value="公斤"name="unit">公斤</label>
        <label><input type="radio" value="台"name="unit">台</label>
        <label><input type="radio" value="瓶"name="unit">瓶</label>
                     <input type="submit" value="提交添加" >
    </form>
    <%      //测试用
        String s1 = request.getParameter("item");
        String s2 = request.getParameter("mount");
//        int s4 = Integer.parseInt(s2);
        System.out.println(s1);
        String s3 = request.getParameter("unit");
        car1.setItem(s1);
//        car1.setMount(s4);
        car1.setUnit(s3);
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
    <% String str1 = response.encodeRedirectURL("selectRemovedGoods.jsp"); %>
    <form action="<%=str1%>" method="post" name="form">
    <input type="submit" value="修改购物车的货物">
    </form>
    </font>
</body>
</html>
