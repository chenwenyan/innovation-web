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
            <div class="col-sm-10 col-sm-offset-1">
                <div class="alert alert-success clearfix">
                    <div class="col-sm-4">
                        <span class="public-left"><i class="fa fa-home"></i>&nbsp;项目检索</span>
                    </div>
                    <div class="col-sm-6 pull-right">
                                <span class="public-right">当前位置：
                                    <a href="${website}/main">首页</a> > 项目检索
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
                        <form action="/search-project" method="post" class="form-horizontal">
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
                                    <select class="form-control" name="schoolId">
                                        <option value="0">全部</option>
                                        <c:forEach var="school" items="${schoolList}">
                                            <c:if test="${schoolList.size()> 0}">
                                                <option value="${school.id}">${school.name}</option>
                                            </c:if>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group form-inline">
                                <label class="col-sm-3 control-label">年份：</label>
                                <div class="col-sm-6">
                                    <input class="col-sm-2 form-control w180 form-filter yearpicker" readonly="readonly"
                                           name="startYear" id="startYear"/>
                                    <%--</div>--%>
                                    <label class="col-sm-2 control-label">至</label>
                                    <%--<div class="col-sm-3">--%>
                                    <input class="col-sm-2 form-control w180 form-filter yearpicker "
                                           readonly="readonly" name="endYear" id="endYear"/>
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
                                        <th>年份</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="project" items="${projectList}">
                                        <tr>
                                            <td hidden="hidden">${project.id}</td>
                                            <td>
                                                <c:if test="${fn:length(project.name) > 20 }">
                                                    ${fn:substring(project.name, 0, 20)}...
                                                </c:if>
                                                <c:if test="${fn:length(project.name) > 20 }">
                                                    ${project.name}
                                                </c:if>
                                            </td>
                                            <td>${project.charger}</td>
                                            <td>${project.teacher}</td>
                                            <td>${project.schoolName}</td>
                                            <td>${project.year}</td>
                                                <%--<td><fmt:formatDate value="${project.year}" pattern="yyyy" /></td>--%>
                                        </tr>
                                    </c:forEach>
                                    <c:if test="${projectlList.size()=='0'}">
                                        <tr>
                                            <td colspan="8" style="text-align: center;">无查询结果</td>
                                        </tr>
                                    </c:if>
                                    </tbody>
                                </table>
                                <div class="pull-right">
                                    <ul id="pageLimit"></ul>
                                </div>
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

<jsp:include flush="true" page="/WEB-INF/views/display/common/footer.jsp"/>
<a href="#" class="back-to-top"><i class="fa fa-angle-double-up"></i></a>
<script type="text/javascript">
    $(function () {
        $('#startYear').datetimepicker({
            startView: 'decade',
            minView: 'decade',
            format: 'yyyy',
            maxViewMode: 2,
            minViewMode: 2,
            autoclose: true
        }).on("changeDate", function (ev) {
            var startYear = $("#startYear").val();
            $("#endYear").datetimepicker("setStartDate", startYear);
            $("#startYear").datetimepicker("hide");
        });

        $('#endYear').datetimepicker({
            startView: 'decade',
            minView: 'decade',
            format: 'yyyy',
            maxViewMode: 2,
            minViewMode: 2,
            autoclose: true
        }).on("changeDate", function (ev) {
            var startYear = $("#startYear").val();
            var endYear = $("#endYear").val();
            if (startYear != "" && endYear != null) {
                if (startYear >= endYear) {
                    alert("开始年份应小于结束年份");
                }
            }
            $("#startYear").datetimepicker("setEndDate", endYear);
            $("#startYear").datetimepicker("hide");
        });


        $('#pageLimit').bootstrapPaginator({
            currentPage: ${pageNo+1},
            totalPages: ${count},
            size: "normal",
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
                return "/search-project?pageNo=" + page;
            }
        });
    });
</script>
</body>
</html>

