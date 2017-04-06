<%--
  Created by IntelliJ IDEA.
  User: wychen
  Date: 2017/4/2
  Time: 16:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div>
    <h4>用户登录</h4>
    <form id="loginForm" name="loginForm" method="post" action="/login">
        <div>
            <input type="text" id="username" name="username" placeholder="用户名"/>
        </div>
        <div>
            <input type="password" id="password" name="password" placeholder="密码"/>
        </div>
        <button type="reset" id="reset" name="reset">重置</button>
        <button type="submit" id="submit" name="submit">登录</button>
    </form>
</div>
</body>
</html>
