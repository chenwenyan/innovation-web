<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                <ul class="info-list">
                    <li>
                        <a href="#" class="clearfix">
                            <i class="fa fa-check-circle info-icon">&nbsp;</i>
                            <span class="info-detail">关于东北师范大学大学生数字摄制媒体中心骨干选聘的通知中心骨干选聘的通知</span>
                            <span class="info-date">[2017-04-07]</span>
                        </a>
                        <div class="line"></div>
                    </li>
                    <li>
                        <a href="#" class="clearfix">
                            <i class="fa fa-check-circle info-icon">&nbsp;</i>
                            <span class="info-detail">关于东北师范</span>
                            <span class="info-date">[2017-04-07]</span>
                        </a>
                        <div class="line"></div>
                    </li>
                    <li>
                        <a href="#" class="clearfix">
                            <i class="fa fa-check-circle info-icon">&nbsp;</i>
                            <span class="info-detail">关于东北师范大学大学生数字摄制媒体中心骨干选聘的通知中心骨干选聘的通知</span>
                            <span class="info-date">[2017-04-07]</span>
                        </a>
                        <div class="line"></div>
                    </li>
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
