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
            <div class="col-sm-10 col-sm-offset-1">
                <div class="alert alert-success clearfix">
                    <div class="col-sm-4">
                        <span class="public-left"><i class="fa fa-home"></i>&nbsp;暑期社会实践公告</span>
                    </div>
                    <div class="col-sm-6 pull-right">
                                <span class="public-right">当前位置：
                                    <a href="">未来计划</a> >
                                    <a href="">暑期社会实践公告</a> > 通知公告
                                </span>
                    </div>
                </div>
            </div>
            <div class="col-sm-3 col-sm-offset-1">
                <section class="demo">
                    <dl class="list maki">
                        <dt>公告</dt>
                        <dd><a href="#">暑期社会实践公告</a></dd>
                        <dd><a href="#">科研扶持</a></dd>
                        <dd><a href="#">创业园</a></dd>
                        <dd><a href="#">企业注册</a></dd>
                        <dd><a href="#">科研成果</a></dd>
                    </dl>
                </section>
            </div>
            <div class="col-sm-7">
                <ul class="info-list">
                    <c:forEach var="item" items="${sqshsjgg}">
                        <li>
                            <a href="/article-detail?id=${item.id}" title="${item.title}">
                                <i class="fa fa-fire">&nbsp;&nbsp;</i>
                                <span class="information">${item.title}</span>
                                <span class="date"><fmt:formatDate value="${item.createdTime}" pattern="yyyy-MM-dd"/></span>
                            </a>
                        </li>
                    </c:forEach>
                    <c:forEach var="item" items="${kyfc}">
                        <li>
                            <a href="/article-detail?id=${item.id}" title="${item.title}">
                                <i class="fa fa-fire">&nbsp;&nbsp;</i>
                                <span class="information">${item.title}</span>
                                <span class="date"><fmt:formatDate value="${item.createdTime}" pattern="yyyy-MM-dd"/></span>
                            </a>
                        </li>
                    </c:forEach>
                    <c:forEach var="item" items="${cyy}">
                        <li>
                            <a href="/article-detail?id=${item.id}" title="${item.title}">
                                <i class="fa fa-fire">&nbsp;&nbsp;</i>
                                <span class="information">${item.title}</span>
                                <span class="date"><fmt:formatDate value="${item.createdTime}" pattern="yyyy-MM-dd"/></span>
                            </a>
                        </li>
                    </c:forEach>
                    <c:forEach var="item" items="${qyzc}">
                        <li>
                            <a href="/article-detail?id=${item.id}" title="${item.title}">
                                <i class="fa fa-fire">&nbsp;&nbsp;</i>
                                <span class="information">${item.title}</span>
                                <span class="date"><fmt:formatDate value="${item.createdTime}" pattern="yyyy-MM-dd"/></span>
                            </a>
                        </li>
                    </c:forEach>
                    <c:forEach var="item" items="${kycg}">
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
            <div class="col-sm-3 col-sm-offset-8 margin-top-50">
                <nav aria-label="Page navigation">
                    <ul class="pagination">
                        <li>
                            <a href="#" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        <li class="active"><a href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">5</a></li>
                        <li>
                            <a href="#" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</div>
<jsp:include flush="true" page="/WEB-INF/views/display/common/footer.jsp"/>
<a href="#" class="back-to-top"><i class="fa fa-angle-double-up"></i></a>
</body>
</html>

