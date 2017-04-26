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
                             <c:if test="${article.typeId == 11 }">其他比赛</c:if>
                            公告</span>
                    </div>
                    <div class="col-sm-6 pull-right">
                                <span class="public-right">当前位置：
                                    <c:if test="${article.typeId == 1 || article.typeId == 2 || article.typeId == 3 || article.typeId == 11}"><a
                                            href="/matches">比赛</a></c:if>
                                    <c:if test="${article.typeId == 4 || article.typeId == 5 || article.typeId == 6 || article.typeId == 7 || article.typeId == 8 }"><a
                                            href="/plans">计划</a></c:if>
                                    <c:if test="${article.typeId == 9 || article.typeId == 10}"><a
                                            href="/projects">立项</a></c:if>
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
                                     <c:if test="${article.typeId == 11 }">其他比赛</c:if>
                                    </a>
                                    > 通知公告
                                </span>
                    </div>
                </div>
            </div>
            
            <div class="col-sm-3 col-sm-offset-1">
                <p class="gonggao">公&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;告</p>
                <ul class="side">
                        <c:if test="${article.typeId == 1 || article.typeId == 2 || article.typeId == 3 || article.typeId == 11}">
                            <li><a href="/more-articles?typeId=1">互联网+</a></li>
                            <li><a href="/more-articles?typeId=2">创青春</a></li>
                            <li><a href="/more-articles?typeId=3">挑战杯</a></li>
                            <li><a href="/more-articles?typeId=11">其他比赛</a></li>
                        </c:if>
                    <c:if test="${article.typeId == 4 || article.typeId == 5 || article.typeId == 6 || article.typeId == 7 || article.typeId == 8 }">
                            <li><a href="/more-articles?typeId=4">暑期社会实践公告</a></li>
                            <li><a href="/more-articles?typeId=5">科研扶持</a></li>
                            <li><a href="/more-articles?typeId=6">创业园</a></li>
                            <li><a href="/more-articles?typeId=7">企业注册</a></li>
                            <li><a href="/more-articles?typeId=8">科研成果</a></li>
                        </c:if>
                        <c:if test="${article.typeId == 9 || article.typeId == 10}">
                            <li><a href="/more-articles?typeId=9">国家级创新创业训练计划</a></li>
                            <li><a href="/more-articles?typeId=10">科研立项</a></li>
                        </c:if>

                </ul>
            </div>
            <div class="col-sm-7">
                <h3 class="text-center">${article.title}</h3>
                <div class="text-center">
                    <span>发布时间：</span>
                    <span><fmt:formatDate value="${article.createdTime}" pattern="yyyy/MM/dd HH:MM:ss"/></span>
                    <span>&nbsp;&nbsp;&nbsp;&nbsp;浏览：</span>
                    <span>${article.readNum}</span>
                    <span>次</span>
                </div>
                <hr>
                <p>
                    ${article.content}
                </p>
            </div>
        </div>
    </div>
</div>
<jsp:include flush="true" page="/WEB-INF/views/display/common/footer.jsp"/>
<a href="#" class="back-to-top"><i class="fa fa-angle-double-up"></i></a>
</body>
</html>

