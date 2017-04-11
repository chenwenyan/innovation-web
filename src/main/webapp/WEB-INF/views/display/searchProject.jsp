<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="东北师范大学大学生创新创业计划工程">
    <link rel="icon" href="/img/favicon.jpg">

    <title>创新创业计划工程</title>
    <jsp:include page="/WEB-INF/views/common/head.jsp" flush="true"/>
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
                <h1>创新创业计划培训工程</h1>
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
                    <li><a href="#"><i class="fa fa-at"></i>&nbsp;未来计划</a></li>
                    <!-- <li><a href="#"><i class="fa fa-bars"></i>&nbsp;关于我们</a></li> -->
                </ul>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>
</div>
<!-- Carousel
================================================== -->
<div class="img-container">
    <img src="/img/head1.jpg" alt="大学生创新创业计划">
</div>


<!-- START THE FEATURETTES -->
<div class="public">
    <div class="container">
        <div class="row">
            <div class="col-sm-10 col-sm-offset-1">
                <div class="alert alert-success clearfix">
                    <div class="col-sm-4">
                        <span class="public-left"><i class="fa fa-home"></i>&nbsp;项目检索</span>
                    </div>
                    <div class="col-sm-6 pull-right">
                                <span class="public-right">当前位置：
                                    <a href="">首页</a> > 项目检索
                                </span>
                    </div>
                </div>
            </div>
            <div class="col-sm-10 col-sm-offset-1">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-12 text-left">
                                <h6 class="smart-margin-off">项目检索</h6>
                            </div>
                        </div>
                    </div>
                    <div class="panel-body">
                        <form action="" method="" class="form-horizontal">
                            <div class="form-group">
                                <label class="col-sm-3 control-label">项目名称：</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" placeholder="请输入项目名称" name="name">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">负责人：</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" placeholder="请输入负责人姓名" name="charger">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">指导教师：</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" placeholder="请输入指导教师姓名" name="teacher">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">学院：</label>
                                <div class="col-sm-6">
                                    <select name="" class="form-control" name="schoolId">
                                        <c:forEach var="school" items="${schoolList}">
                                            <c:if test="${schoolList.size() == 0}">
                                                <option value="-1">无</option>
                                            </c:if>
                                            <%--<option value="0">全部</option>--%>
                                            <c:if test="${schoolList.size()> 0}">
                                                <option value="${school.id}">${school.name}</option>
                                            </c:if>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="col-sm-3 col-sm-offset-5">
                                <button class="btn btn-primary" type="submit">搜&nbsp;索</button>
                            </div>
                        </form>
                        <div class="col-sm-12 margin-top-15">
                            <div class="table-responsive">
                                <table class="table table-hover table-bordered">
                                    <thead>
                                    <tr>
                                        <th>项目名称</th>
                                        <th>负责人</th>
                                        <th>指导教师</th>
                                        <th>学院</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="project" items="${projectList}">
                                        <tr>
                                            <td hidden="hidden">${project.id}</td>
                                            <td>${project.name}</td>
                                            <td>${project.charger}</td>
                                            <td>${project.teacher}</td>
                                            <td>${project.schoolName}</td>
                                            <td>
                                                <a href="${website}/project/edit?id=${project.id}" class="label-info"><i
                                                        class="fa fa-edit"></i>&nbsp;编辑</a>
                                                <a href="javascript:;" class="label-info J_delType"><i
                                                        class="fa fa-times"></i>&nbsp;删除</a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    <c:if test="${projectlList.size()=='0'}">
                                        <tr>
                                            <td colspan="8" style="text-align: center;">无查询结果</td>
                                        </tr>
                                    </c:if>
                                    </tbody>
                                </table>
                            </div>
                            <div class="col-sm-4 pull-right">
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
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-12 text-left">
                                <h6 class="smart-margin-off"></h6>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
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

<script src="../js/jquery.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/holder.min.js"></script>
<script src="../js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>

