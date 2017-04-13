<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <jsp:include flush="true" page="/WEB-INF/views/display/common/head.jsp"/>
</head>
<body>
<jsp:include flush="true" page="/WEB-INF/views/display/common/header.jsp"/>
<div class="img-container">
    <img src="/img/head1.jpg" alt="大学生创新创业计划">
</div>
<div class="public">
    <div class="container">
        <div class="row">
            <div class="col-sm-4">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-12 text-left">
                                <h6 class="smart-margin-left">互联网+</h6>
                                <a href="#" class="smart-margin-left"><i class="fa fa-angle-double-right"></i>&nbsp;更多</a>
                            </div>
                        </div>
                    </div>
                    <div class="panel-body">
                        <ul>
                            <c:forEach var="item" items="${hlw}">
                                <li>
                                    <a href="/article-detail?id=${item.id}" title="${item.title}">
                                        <i class="fa fa-fire">&nbsp;&nbsp;</i>
                                        <span class="information">${item.title}</span>
                                        <span class="date"><fmt:formatDate value="${item.createdTime}" pattern="yyyy-MM-dd"/></span>
                                    </a>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-12 text-left">
                                <h6 class="smart-margin-left">创青春全国大学生创业大赛</h6>
                                <a href="#" class="smart-margin-left"><i class="fa fa-angle-double-right"></i>&nbsp;更多</a>
                            </div>
                        </div>
                    </div>
                    <div class="panel-body">
                        <ul>
                            <c:forEach var="item" items="${cqc}">
                                <li>
                                    <a href="/article-detail?id=${item.id}" title="${item.title}">
                                        <i class="fa fa-fire">&nbsp;&nbsp;</i>
                                        <span class="information">${item.title}</span>
                                        <span class="date"><fmt:formatDate value="${item.createdTime}" pattern="yyyy-MM-dd"/></span>
                                    </a>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-12 text-left">
                                <h6 class="smart-margin-left">挑战杯</h6>
                                <a href="#" class="smart-margin-left"><i class="fa fa-angle-double-right"></i>&nbsp;更多</a>
                            </div>
                        </div>
                    </div>
                    <div class="panel-body">
                        <ul>
                            <c:forEach var="item" items="${tzb}">
                                <li>
                                    <a href="/article-detail?id=${item.id}" title="${item.title}">
                                        <i class="fa fa-fire">&nbsp;&nbsp;</i>
                                        <span class="information">${item.title}</span>
                                        <span class="date"><fmt:formatDate value="${item.createdTime}" pattern="yyyy-MM-dd"/></span>
                                    </a>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<jsp:include flush="true" page="/WEB-INF/views/display/common/footer.jsp"/>
<a href="#" class="back-to-top"><i class="fa fa-angle-double-up"></i></a>
</body>
</html>
