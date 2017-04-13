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
<div class="public-more">
    <div class="container">
        <div class="row">
            <div class="col-sm-10 col-sm-offset-1">
                <div class="alert alert-success clearfix">
                    <div class="col-sm-4">
                           <span class="public-left"><i class="fa fa-home"></i>
                            &nbsp;<c:if test="${article.typeId == 1 }">互联网+</c:if>
                             <c:if test="${article.typeId == 2 }">创青春全国大学生创业大赛</c:if>
                             <c:if test="${article.typeId == 3 }">挑战杯</c:if>
                             <c:if test="${article.typeId == 4 }">暑期社会实践公告</c:if>
                             <c:if test="${article.typeId == 5 }">科研扶持</c:if>
                             <c:if test="${article.typeId == 6 }">创业园</c:if>
                             <c:if test="${article.typeId == 7 }">企业注册</c:if>
                             <c:if test="${article.typeId == 8 }">科研成果</c:if>
                             <c:if test="${article.typeId == 9 }">国家级创新创业训练计划</c:if>
                             <c:if test="${article.typeId == 10 }">科研立项</c:if>
                            公告</span>
                    </div>
                    <div class="col-sm-6 pull-right">
                                <span class="public-right">当前位置：
                                    <c:if test="${article.typeId == 1 || article.typeId == 2}"><a
                                            href="/matches">比赛</a></c:if>
                                    <c:if test="${article.typeId != 1 && article.typeId != 2 && article.typeId != 9 && article.typeId != 10 }"><a
                                            href="/plans">计划</a></c:if>
                                    <c:if test="${article.typeId == 9 || article.typeId == 10}"><a
                                            href="/project">立项</a></c:if>
                                     >
                                    <a href="/more-articles?typeId=${article.typeId}">
                                     <c:if test="${article.typeId == 1 }">互联网+</c:if>
                                     <c:if test="${article.typeId == 2 }">创青春全国大学生创业大赛</c:if>
                                     <c:if test="${article.typeId == 3 }">挑战杯</c:if>
                                     <c:if test="${article.typeId == 4 }">暑期社会实践公告</c:if>
                                     <c:if test="${article.typeId == 5 }">科研扶持</c:if>
                                     <c:if test="${article.typeId == 6 }">创业园</c:if>
                                     <c:if test="${article.typeId == 7 }">企业注册</c:if>
                                     <c:if test="${article.typeId == 8 }">科研成果</c:if>
                                     <c:if test="${article.typeId == 9 }">国家级创新创业训练计划</c:if>
                                     <c:if test="${article.typeId == 10 }">科研立项</c:if>
                                    </a>
                                    > 通知公告
                                </span>
                    </div>
                </div>
            </div>
            <div class="col-sm-3 col-sm-offset-1">
                <section class="demo">
                    <dl class="list maki">
                        <dt>公告</dt>
                        <c:if test="${article.typeId == 1 || article.typeId == 2}">
                            <dd><a href="/more-articles?typeId=1">互联网+</a></dd>
                            <dd><a href="/more-articles?typeId=2">创青春</a></dd>
                            <dd><a href="/more-articles?typeId=3">挑战杯</a></dd>
                        </c:if>
                        <c:if test="${article.typeId != 1 && article.typeId != 2 && article.typeId != 9 && article.typeId != 10 }">
                            <dd><a href="/more-articles?typeId=4">暑期社会实践公告</a></dd>
                            <dd><a href="/more-articles?typeId=5">科研扶持</a></dd>
                            <dd><a href="/more-articles?typeId=6">创业园</a></dd>
                            <dd><a href="/more-articles?typeId=7">企业注册</a></dd>
                            <dd><a href="/more-articles?typeId=8">科研成果</a></dd>
                        </c:if>
                        <c:if test="${article.typeId == 9 || article.typeId == 10}">
                            <dd><a href="/more-articles?typeId=9">国家级创新创业训练计划</a></dd>
                            <dd><a href="/more-articles?typeId=10">科研立项</a></dd>
                        </c:if>

                    </dl>
                </section>
            </div>
            <div class="col-sm-7">
                <ul class="info-list">
                    <c:forEach var="item" items="${list}">
                        <div>
                            <li>
                                <a href="/article-detail?id=${item.id}" class="clearfix">
                                    <i class="fa fa-check-circle info-icon">&nbsp;</i>
                                    <span class="info-detail">${item.title}</span>
                                    <span class="info-date"><fmt:formatDate value="${item.createdTime}"
                                                                            pattern="yyyy-MM-dd"/></span>
                                </a>
                                <div class="line">ewjwehr wer</div>
                            </li>
                        </div>
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
