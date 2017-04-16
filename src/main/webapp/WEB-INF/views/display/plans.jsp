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
                                <h6 class="smart-margin-left">暑期社会实践</h6>
                                <a href="/more-articles?typeId=4" class="smart-margin-left"><i
                                        class="fa fa-angle-double-right"></i>&nbsp;更多</a>
                            </div>
                        </div>
                    </div>
                    <div class="panel-body line-number">
                        <ul>
                            <c:forEach var="item" items="${sqshsjgg}">
                                <li>
                                    <a href="/article-detail?id=${item.id}" title="${item.title}">
                                        <i class="fa fa-fire">&nbsp;&nbsp;</i>
                                        <span class="information">
                                                <c:if test="${fn:length(item.title) > 20 }">
                                                    ${fn:substring(item.title, 0, 20)}...
                                                </c:if>
                                                   <c:if test="${fn:length(item.title) <= 20 }">
                                                       ${item.title}
                                                   </c:if>
                                        </span>
                                        <span class="date"><fmt:formatDate value="${item.createdTime}"
                                                                                   pattern="yyyy-MM-dd"/></span>
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
                                <h6 class="smart-margin-left">科研扶持 创业园 企业注册</h6>
                                <a href="/more-articles?typeId=5" class="smart-margin-left"><i
                                        class="fa fa-angle-double-right"></i>&nbsp;更多</a>
                            </div>
                        </div>
                    </div>
                    <div class="panel-body line-number">
                        <ul>
                            <c:forEach var="item" items="${kyfc}">
                                <li>
                                    <a href="/article-detail?id=${item.id}" title="${item.title}">
                                        <i class="fa fa-fire">&nbsp;&nbsp;</i>
                                        <span class="information">
                                                <c:if test="${fn:length(item.title) > 20 }">
                                                    ${fn:substring(item.title, 0, 20)}...
                                                </c:if>
                                                   <c:if test="${fn:length(item.title) <= 20 }">
                                                       ${item.title}
                                                   </c:if>
                                        </span>
                                        <span class="date"><fmt:formatDate value="${item.createdTime}"
                                                                                   pattern="yyyy-MM-dd"/></span>
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
                                <h6 class="smart-margin-left">科研成果</h6>
                                <a href="/more-articles?typeId=8" class="smart-margin-left"><i
                                        class="fa fa-angle-double-right"></i>&nbsp;更多</a>
                            </div>
                        </div>
                    </div>
                    <div class="panel-body line-number">
                        <ul>
                            <c:forEach var="item" items="${kycg}">
                                <li>
                                    <a href="/article-detail?id=${item.id}" title="${item.title}">
                                        <i class="fa fa-fire">&nbsp;&nbsp;</i>
                                        <span class="information">
                                                <c:if test="${fn:length(item.title) > 20 }">
                                                    ${fn:substring(item.title, 0, 20)}...
                                                </c:if>
                                                  <c:if test="${fn:length(item.title) <= 20 }">
                                                      ${item.title}
                                                  </c:if>
                                        </span>
                                        <span class="date"><fmt:formatDate value="${item.createdTime}"
                                                                                   pattern="yyyy-MM-dd"/></span>
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

