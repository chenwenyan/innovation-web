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
<jsp:include flush="true" page="/WEB-INF/views/display/common/side-bar.jsp"/>
<div class="img-container container">
    <img src="/img/college.jpg" alt="大学生创新创业计划">
</div>
<div class="public-more">
    <div class="container">
        <div class="row">
            <div class="col-sm-3 col-sm-offset-1">
                <div class="side-title">
                    <i class="fa fa-list"></i>
                    <span>公&nbsp;&nbsp;告</span>
                </div>
                <ul class="side-ul">
                    <c:if test="${typeId == 1 || typeId == 2 || typeId == 3 || typeId == 11}">
                        <li><a href="/more-articles?typeId=1"><i class="fa fa-th"></i>&nbsp;&nbsp;互联网+</a></li>
                        <li><a href="/more-articles?typeId=2"><i class="fa fa-th"></i>&nbsp;&nbsp;创青春</a></li>
                        <li><a href="/more-articles?typeId=3"><i class="fa fa-th"></i>&nbsp;&nbsp;挑战杯</a></li>
                        <li><a href="/more-articles?typeId=11"><i class="fa fa-th"></i>&nbsp;&nbsp;其他比赛</a></li>
                    </c:if>
                    <c:if test="${typeId == 4 || typeId == 5 || typeId == 6 || typeId == 7 || typeId == 8  }">
                        <li><a href="/more-articles?typeId=4"><i class="fa fa-th"></i>&nbsp;&nbsp;暑期社会实践公告</a></li>
                        <li><a href="/more-articles?typeId=5"><i class="fa fa-th"></i>&nbsp;&nbsp;科研扶持</a></li>
                        <li><a href="/more-articles?typeId=6"><i class="fa fa-th"></i>&nbsp;&nbsp;创业园</a></li>
                        <li><a href="/more-articles?typeId=7"><i class="fa fa-th"></i>&nbsp;&nbsp;企业注册</a></li>
                        <li><a href="/more-articles?typeId=8"><i class="fa fa-th"></i>&nbsp;&nbsp;科研成果</a></li>
                    </c:if>
                    <c:if test="${typeId == 9 || typeId == 10}">
                        <li><a href="/more-articles?typeId=9"><i class="fa fa-th"></i>&nbsp;&nbsp;国家级创新创业训练计划</a></li>
                        <li><a href="/more-articles?typeId=10"><i class="fa fa-th"></i>&nbsp;&nbsp;科研立项</a></li>
                    </c:if>
                </ul>
                <div class="leftbottom">
                    <img src="/img/leftbottom.png" alt="图片">
                </div>
            </div>
            <div class="col-sm-7 panel panel-default panel-top">
                <div class="panel-heading top-heading">
                        <span class="panel-title top-location"><i class="fa fa-map-marker"></i>&nbsp;当前位置：
                            <c:if test="${typeId == 1 || typeId == 2 || typeId == 3 || typeId == 11}"><a
                                    href="/matches">比赛</a></c:if>

                            <c:if test="${typeId == 4 || typeId == 5 || typeId == 6 || typeId == 7 || typeId == 8 }"><a
                                    href="/plans">计划</a></c:if>
                            <c:if test="${typeId == 9 || typeId == 10}"><a
                                    href="/projects">立项</a></c:if>
                             >
                            <a href="/more-articles?typeId=${typeId}">
                             <c:if test="${typeId == 1 }">互联网+</c:if>
                             <c:if test="${typeId == 2 }">创青春全国大学生创业大赛</c:if>
                             <c:if test="${typeId == 3 }">挑战杯</c:if>
                             <c:if test="${typeId == 4 }">暑期社会实践公告</c:if>
                             <c:if test="${typeId == 5 }">科研扶持</c:if>
                             <c:if test="${typeId == 6 }">创业园</c:if>
                             <c:if test="${typeId == 7 }">企业注册</c:if>
                             <c:if test="${typeId == 8 }">科研成果</c:if>
                             <c:if test="${typeId == 9 }">国家级创新创业训练计划</c:if>
                             <c:if test="${typeId == 10 }">科研立项</c:if>
                             <c:if test="${typeId == 11 }">其他比赛</c:if>
                            </a>
                            > 通知公告
                        </span>
                </div>
                <div class="panel-body">
                    <ul class="">
                        <c:forEach var="item" items="${list}">
                            <li class="list-inline">
                                <a href="/article-detail?id=${item.id}" class="clearfix">
                                    <i class="fa fa-check-circle info-icon">&nbsp;</i>
                                    <span class="info-detail">${item.title}</span>
                                    <span class="info-date"><fmt:formatDate value="${item.createdTime}"
                                                                            pattern="yyyy-MM-dd"/></span>
                                </a>
                                <div class="line"></div>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
                <div class="pull-right" style="margin-right:20px;">
                    <ul id="pageLimit"></ul>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include flush="true" page="/WEB-INF/views/display/common/footer.jsp"/>
<a href="#" class="back-to-top"><i class="fa fa-angle-double-up"></i></a>
<script type="text/javascript">
    $(function () {
        $('#pageLimit').bootstrapPaginator({
            size : "small",
            currentPage: ${pageNo + 1},
            totalPages: ${count},
            bootstrapMajorVersion: 3,
            alignment: "right",
            numberOfPages: 5,
            itemTexts: function (type, page, current) {
                switch (type) {
                    case "first":
                        return "首页";
                    case "prev":
                        return "<<";
                    case "next":
                        return ">>";
                    case "last":
                        return "末页";
                    case "page":
                        return page;
                }
            },
            pageUrl: function (url, page, current) {
                return "/more-articles?pageNo=" + page + "&typeId=" + ${typeId};
            }
        });
    });
</script>
</body>
</html>
