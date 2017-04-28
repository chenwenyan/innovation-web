<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include flush="true" page="/WEB-INF/views/display/common/head.jsp"/>
</head>
<body>
<jsp:include flush="true" page="/WEB-INF/views/display/common/header.jsp"/>

<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner" role="listbox">
        <div class="item active">
            <img class="first-slide" src="/img/nenu-hlw.jpg" alt="First slide">
        </div>
        <div class="item">
            <img class="second-slide" src="/img/head2.jpg" alt="Second slide">
        </div>
        <div class="item">
            <img class="third-slide" src="/img/head3.jpg" alt="Third slide">
        </div>
    </div>
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>

<div class="container marketing">

    <!-- Three columns of text below the carousel -->
    <div class="row">
        <div class="col-lg-4">
            <img class="img-circle" src="/img/1.jpg" alt="Generic placeholder image" width="140" height="140">
            <h3>创新创业类比赛</h3>
            <p>互联网+</p>
            <p>创青春全国大学生创业大赛</p>
            <p>挑战杯</p>
            <p><a class="btn btn-default" href="/matches" role="button">详情 &raquo;</a></p>
        </div>
        <div class="col-lg-4">
            <img class="img-circle" src="/img/2.jpg" alt="Generic placeholder image" width="140" height="140">
            <h3>创新创业科研项目</h3>
            <p>国家级大学生创新创业训练计划</p>
            <p>“中央高校基本科研业务专项资金”本科生项目</p>
            <p>&nbsp;</p>
            <p><a class="btn btn-default" href="/projects" role="button">详情 &raquo;</a></p>
        </div>
        <div class="col-lg-4">
            <img class="img-circle" src="/img/innovation.jpg" alt="Generic placeholder image" width="140" height="140">
            <h3>创新创业扶持一揽子计划</h3>
            <p>暑期社会实践&nbsp;&nbsp;科研扶持</p>
            <p>创业园&nbsp;&nbsp;企业注册</p>
            <p>科研成果</p>
            <p><a class="btn btn-default" href="/plans" role="button">详情 &raquo;</a></p>
        </div>
    </div>
    

    <div class="row sousuo">
        <div class="col-sm-12">
            <a href="/search-project">
                <img src="/img/search.jpg" alt="搜索入口" class="sousuo">
            </a>
        </div>
    </div>
</div>
<jsp:include flush="true" page="/WEB-INF/views/display/common/footer.jsp"/>
<a href="#" class="back-to-top"><i class="fa fa-angle-double-up"></i></a>
</body>
</html>
