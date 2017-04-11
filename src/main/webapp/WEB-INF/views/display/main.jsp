<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="东北师范大学大学生创新创业计划工程">
    <link rel="icon" href="/img/favicon.jpg">

    <title>创新创业计划培训工程</title>
    <jsp:include flush="true" page="/WEB-INF/views/common/head.jsp"/>
</head>
<body>
<div class="header">
    <div class="container">
        <div class="row">
            <div class="col-sm-4 col-sm-offset-1">
                <img src="/img/favicon.jpg" class="left" alt="东北师范大学">
                <img src="/img/logo-right.jpg" class="right" alt="东北师范大学">
            </div>
            <div class="col-sm-5 col-sm-offset-1">
                <!-- <h1>创新创业计划培训工程</h1> -->
                <img src="/img/font.png" class="font" alt="创新创业计划培训工程">
            </div>
        </div>
    </div>
</div>
<div class="navbar-wrapper">
    <nav class="navbar">
        <div class="container-fluid">
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="#"><i class="fa fa-home"></i>&nbsp;首页 <span
                            class="sr-only">(current)</span></a></li>
                    <li><a href="#"><i class="fa fa-anchor"></i>&nbsp;比赛</a></li>
                    <li><a href="#"><i class="fa fa-arrows"></i>&nbsp;立项</a></li>
                    <li><a href="#"><i class="fa fa-check-circle-o"></i>&nbsp;未来计划</a></li>
                    <!-- <li><a href="#"><i class="fa fa-bars"></i>&nbsp;关于我们</a></li> -->
                </ul>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>
</div>

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

<!-- FOOTER -->
<footer>
    <div class="container">
        <div class="row">
            <div class="col-sm-5 footer-left col-sm-offset-1">
                <p>
                    友情链接：
                    <a href="http://www.nenu.edu.cn/">东北师范大学&nbsp;&nbsp;|&nbsp;</a>
                    <a href="http://youth.nenu.edu.cn/">扬思网&nbsp;&nbsp;|&nbsp;</a>
                    <a href="http://www.youth.cn/">中国青年网</a>
                </p>
                <p>版权所有：共青团东北师范大学委员会</p>
                <p>地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址：吉林省长春市人民大街5268号　邮编：130024</p>
            </div>
            <div class="col-sm-4 col-sm-offset-1">
                <img src="/img/weixin.jpg" alt="微信二维码" class="weixin">
                <span>东北师范大学大学生创业中心</span>
            </div>
        </div>
    </div>
</footer>
<a href="#" class="back-to-top"><i class="fa fa-angle-double-up"></i></a>
</body>
</html>
