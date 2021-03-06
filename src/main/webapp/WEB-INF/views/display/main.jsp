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
        <li data-target="#myCarousel" data-slide-to="3"></li>
    </ol>
    <div class="carousel-inner" role="listbox">
        <div class="item active">
            <img class="first-slide" src="/img/head-hlw-1.jpg" alt="First slide">
        </div>
        <div class="item">
            <img class="second-slide" src="/img/head-hlw-2.jpg" alt="Second slide">
        </div>
        <div class="item">
            <img class="third-slide" src="/img/head-hlw-3.jpg" alt="Third slide">
        </div>
        <div class="item">
            <img class="Forth-slide" src="/img/head-hlw-4.jpg" alt="Forth slide">
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
    <div class="row my-main">
        <div class="col-lg-4">
            <img class="img-circle" src="/img/1.jpg" alt="Generic placeholder image" width="140" height="140">
            <h3>创新创业类比赛</h3>
            <p><a class=“” href="/moreArticles?typeId=1">"互联网+"大学生创新创业大赛</a></p>
            <p><a href="/moreArticles?typeId=2">"创青春"全国大学生创业大赛</a></p>
            <p><a href="/moreArticles?typeId=3">"挑战杯"全国大学生课外学术科技作品竞赛</a></p>
            <p><a class="btn btn-default" href="/matches" role="button">详情 &raquo;</a></p>
        </div>
        <div class="col-lg-4">
            <img class="img-circle" src="/img/2.jpg" alt="Generic placeholder image" width="140" height="140">
            <h3>创新创业科研项目</h3>
            <p><a class=“” href="/moreArticles?typeId=9">国家级大学生创新创业训练计划</a></p>
            <p><a href="/moreArticles?typeId=10">“中央高校基本科研业务专项资金”本科生项目</a></p>
            <p>&nbsp;</p>
            <p><a class="btn btn-default" href="/projects" role="button">详情 &raquo;</a></p>
        </div>
        <div class="col-lg-4">
            <img class="img-circle" src="/img/innovation.jpg" alt="Generic placeholder image" width="140" height="140">
            <h3>创新创业扶持一揽子计划</h3>
            <p><a class=“” href="/moreArticles?typeId=4">暑期社会实践</a>&nbsp;&nbsp;<a class=“” href="/moreArticles?typeId=5">创业扶持</a></p>
            <p><a href="/moreArticles?typeId=6">创业园</a>&nbsp;&nbsp;<a href="/moreArticles?typeId=7">企业注册</a></p>
            <p><a href="/moreArticles?typeId=8">科研成果</a></p>
            <p><a class="btn btn-default" href="/plans" role="button">详情 &raquo;</a></p>
        </div>
    </div>
    

    <div class="row sousuo">
        <div class="col-sm-12">
            <a href="/searchProject">
                <img src="/img/search.jpg" alt="搜索入口" class="sousuo">
            </a>
        </div>
    </div>
</div>
<jsp:include flush="true" page="/WEB-INF/views/display/common/footer.jsp"/>
<a href="#" class="back-to-top"><i class="fa fa-angle-double-up"></i></a>
</body>
</html>
