<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include flush="true" page="/WEB-INF/views/common/head.jsp"/>
</head>
<body>
<jsp:include flush="true" page="/WEB-INF/views/display/header.jsp"/>

<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner" role="listbox">
        <div class="item active">
            <a href="#">
                <img class="first-slide" src="/img/head1.jpg" alt="First slide">
            </a>
            <!-- <div class="container">
                <div class="carousel-caption">
                    <h1>Example headline.</h1>
                    <p>Note: If you're viewing this page via a <code>file://</code> URL, the "next" and "previous" Glyphicon buttons on the left and right might not load/display properly due to web browser security rules.</p>
                    <p><a class="btn btn-lg btn-primary" href="#" role="button">Sign up today</a></p>
                </div>
            </div> -->
        </div>
        <div class="item">
            <a href="#">
                <img class="second-slide" src="/img/coursel-2.jpg" alt="Second slide">
            </a>
            <!-- <div class="container">
                <div class="carousel-caption">
                    <h1>Another example headline.</h1>
                    <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                    <p><a class="btn btn-lg btn-primary" href="#" role="button">Learn more</a></p>
                </div>
            </div> -->
        </div>
        <div class="item">
            <a href="#">
                <img class="third-slide" src="/img/coursel-3.jpg" alt="Third slide">
            </a>
            <!-- <div class="container">
                <div class="carousel-caption">
                    <h1>One more for good measure.</h1>
                    <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                    <p><a class="btn btn-lg btn-primary" href="#" role="button">Browse gallery</a></p>
                </div>
            </div> -->
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
</div><!-- /.carousel -->


<!-- Marketing messaging and featurettes
================================================== -->
<!-- Wrap the rest of the page in another container to center all the content. -->

<div class="container marketing">

    <!-- Three columns of text below the carousel -->
    <div class="row">
        <div class="col-lg-4">
            <img class="img-circle" src="/img/1.jpg" alt="Generic placeholder image" width="140" height="140">
            <h2>创新创业类比赛</h2>
            <p>互联网+</p>
            <p>创青春全国大学生创业大赛</p>
            <p>挑战杯</p>
            <p><a class="btn btn-default" href="#" role="button">详情 &raquo;</a></p>
        </div><!-- /.col-lg-4 -->
        <div class="col-lg-4">
            <img class="img-circle" src="/img/2.jpg" alt="Generic placeholder image" width="140" height="140">
            <h2>创新创业科研项目</h2>
            <p>国家级大学生创新创业训练计划</p>
            <p>“中央高校基本科研业务专项资金”本科生项目</p>
            <p>&nbsp;</p>
            <p><a class="btn btn-default" href="#" role="button">详情 &raquo;</a></p>
        </div><!-- /.col-lg-4 -->
        <div class="col-lg-4">
            <img class="img-circle" src="/img/3.jpg" alt="Generic placeholder image" width="140" height="140">
            <h2>创新创业扶持一揽子计划</h2>
            <p>暑期社会实践&nbsp;&nbsp;科研扶持</p>
            <p>创业园&nbsp;&nbsp;企业注册</p>
            <p>科研成果</p>
            <p><a class="btn btn-default" href="#" role="button">详情 &raquo;</a></p>
        </div><!-- /.col-lg-4 -->
    </div><!-- /.row -->

    <!-- START THE FEATURETTES -->

    <div class="row sousuo">
        <div class="col-sm-12">
            <a href="#">
                <img src="/img/search.jpg" alt="搜索入口" class="sousuo">
            </a>
        </div>
    </div>


    <!-- START THE FEATURETTES -->

    <!-- <div class="row dongtai">
        <div>
            <h4 class="headline">最新动态</h4>
        </div>
        <div class="col-lg-3 photo">
            <a href="#">
                <img src="/img/1.jpg" alt="最新动态">
            </a>
        </div>
        <div class="col-lg-3 photo">
            <a href="#">
                <img src="/img/2.jpg" alt="最新动态">
            </a>
        </div>
        <div class="col-lg-3 photo">
            <a href="#">
                <img src="/img/3.jpg" alt="最新动态">
            </a>
        </div>
        <div class="col-lg-3 photo">
            <a href="#">
                <img src="/img/4.jpg" alt="最新动态">
            </a>
        </div>
    </div>

    <hr class="featurette-divider">
-->
</div>
<jsp:include flush="true" page="/WEB-INF/views/display/footer.jsp"/>
<a href="#" class="back-to-top"><i class="fa fa-angle-double-up"></i></a>
</body>
</html>
