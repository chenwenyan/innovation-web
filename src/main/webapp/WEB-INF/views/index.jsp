<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
 <head>
     <title>大学生创新创业计划工程</title>
     <jsp:include flush="true" page="/WEB-INF/views/common/head.jsp"/>
 </head>

<body>
<jsp:include flush="true" page="/WEB-INF/views/common/header.jsp"/>
<h2>大学生创新创业计划工程</h2>
<div>
    <button onclick="location='${website}register'">注册</button>
</div>
<div>
    <button onclick="location='${website}login'">登录</button>
</div>
<jsp:include flush="true" page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
