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
<div class="public">
    <div class="container">
        <div class="row">
            <div class="col-sm-10 col-sm-offset-1">
                <div class="alert alert-success clearfix">
                    <div class="col-sm-4">
                        <span class="public-left"><i class="fa fa-home"></i>&nbsp;"互联网+"公告</span>
                    </div>
                    <div class="col-sm-6 pull-right">
                                <span class="public-right">当前位置：
                                    <a href="">比赛</a> >
                                    <a href="">互联网+</a> > 通知公告
                                </span>
                    </div>
                </div>
            </div>
            <div class="col-sm-3 col-sm-offset-1">
                <section class="demo">
                    <dl class="list maki">
                        <dt>公告</dt>
                        <dd><a href="#">互联网+</a></dd>
                        <dd><a href="#">创青春</a></dd>
                        <dd><a href="#">挑战杯</a></dd>
                    </dl>
                </section>
            </div>
            <div class="col-sm-7">
                <h3>${article.title}</h3>
                <hr>
                <span>发布时间：</span>
                <span><fmt:formatDate value="${article.createdTime}" pattern="yyyy-MM-dd"/></span>
                <span>浏览次数：</span>
                <span>275次</span>
                <%--<h4>各学院（部）团委：</h4>--%>
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

