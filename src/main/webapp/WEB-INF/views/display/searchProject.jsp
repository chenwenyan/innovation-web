<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include flush="true" page="/WEB-INF/views/common/head.jsp"/>
</head>
<body>
<jsp:include flush="true" page="/WEB-INF/views/display/header.jsp"/>
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

<jsp:include flush="true" page="/WEB-INF/views/display/footer.jsp"/>
<a href="#" class="back-to-top"><i class="fa fa-angle-double-up"></i></a>
</body>
</html>

