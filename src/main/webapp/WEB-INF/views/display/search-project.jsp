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
<jsp:include flush="true" page="/WEB-INF/views/display/common/side-bar.jsp"/>
<div class="public">
    <div class="container">
        <div class="row">
            <div class="col-sm-10 col-sm-offset-1">
                <div class=" panel panel-default panel-top">
                    <div class="panel-heading top-heading">
                      <span class="panel-title top-location"><i class="fa fa-map-marker my-current-location"></i>&nbsp;&nbsp;当前位置：
                        <a href="${website}/main">首页</a> > 项目检索
                     </span>
                    </div>
                    <div class="panel-body">
                        <form action="/search-project" method="get" class="form-horizontal">
                            <div class="form-group">
                                <label class="col-sm-3 control-label">项目名称：</label>
                                <div class="col-sm-7">
                                    <input type="text" class="form-control" placeholder="请输入项目名称" name="name" id="name"
                                           value="${name}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">负责人：</label>
                                <div class="col-sm-7">
                                    <input type="text" class="form-control" placeholder="请输入负责人姓名" name="charger"
                                           id="charger" value="${charger}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">指导教师：</label>
                                <div class="col-sm-7">
                                    <input type="text" class="form-control" placeholder="请输入指导教师姓名" name="teacher"
                                           id="teacher" value="${teacher}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">学院：</label>
                                <div class="col-sm-7">
                                    <select class="form-control" name="schoolId" id="schoolId">
                                        <option value="-1">全部</option>
                                        <c:forEach var="school" items="${schoolList}">
                                            <c:if test="${schoolList.size()> 0}">
                                                <option value="${school.id}" ${school.id == schoolId ? 'selected' : ""}>${school.name}</option>
                                            </c:if>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group form-inline">
                                <label class="col-sm-3 control-label">年份：</label>
                                <div class="col-sm-7">
                                    <div class='input-group date' id='start_year' name="start_year">
                                        <input type='text' class="form-control" readonly id='startYear' name="startYear" value="${startYear}"/>
                                        <span class="input-group-addon">
                                           <span class="glyphicon glyphicon-calendar"></span>
                                        </span>
                                    </div>
                                    &nbsp;&nbsp;&nbsp;至&nbsp;&nbsp;&nbsp;
                                    <div class='input-group date' id='end_year' name="end_year">
                                        <input type='text' class="form-control" readonly id='endYear' name="endYear" value="${endYear}"/>
                                        <span class="input-group-addon">
                                           <span class="glyphicon glyphicon-calendar"></span>
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-3 col-sm-offset-5">
                                <button class="btn btn-info" type="submit">搜&nbsp;索</button>
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
                                        <th>项目分类</th>
                                        <th>项目类别</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="project" items="${projectList}">
                                        <tr>
                                            <td hidden="hidden">${project.id}</td>
                                            <td title="${project.name}">
                                                <c:if test="${fn:length(project.name) > 20 }">
                                                    ${fn:substring(project.name, 0, 20)}...
                                                </c:if>
                                                <c:if test="${fn:length(project.name) <= 20 }">
                                                    ${project.name}
                                                </c:if>
                                            </td>
                                            <td>${project.charger}</td>
                                            <td>${project.teacher}</td>
                                            <td>${project.schoolName}</td>
                                            <td>
                                                <c:if test="${project.year == 0}">延期</c:if>
                                                <c:if test="${project.year > 0}">${project.year}</c:if>
                                            </td>
                                            <td>${project.type}</td>
                                            <td>${project.category}</td>
                                        </tr>
                                    </c:forEach>
                                    <c:if test="${projectList.size() == '0'}">
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
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include flush="true" page="/WEB-INF/views/display/common/footer.jsp"/>
<a href="#" class="back-to-top"><i class="fa fa-angle-double-up"></i></a>
<script type="text/javascript">
    $(function () {
        $('#start_year').datetimepicker({
            startView: 'decade',
            minView: 'decade',
            format: 'yyyy',
            maxViewMode: 2,
            minViewMode: 2,
            autoclose: true,
            pickerPosition: "bottom-left"
        }).on("changeDate", function (ev) {
            var startYear = $("#startYear").val();
            var endYear = $("#endYear").val();
            if (startYear != "" && endYear != null) {
                if (startYear > endYear) {
                    alert("开始年份应小于结束年份，请重新选择年份！");
                    $("#startYear").val('');
                }
            }
//            $("#endYear").datetimepicker("setStartDate", startYear);
//            $("#startYear").datetimepicker("hide");
        });

        $('#end_year').datetimepicker({
            startView: 'decade',
            minView: 'decade',
            format: 'yyyy',
            maxViewMode: 2,
            minViewMode: 2,
            autoclose: true,
            pickerPosition: "bottom-left"
        }).on("changeDate", function (ev) {
            var startYear = $("#startYear").val();
            var endYear = $("#endYear").val();
            if (startYear != "" && endYear != null) {
                if (startYear > endYear) {
                    alert("开始年份应小于结束年份");
                    $("#endYear").val('');
                }
            }
//            $("#startYear").datetimepicker("setEndDate", endYear);
//            $("#startYear").datetimepicker("hide");
        });


        $('#pageLimit').bootstrapPaginator({
            currentPage: ${pageNo+1},
            totalPages: ${count},
            size: "small",
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
                return "/search-project?pageNo=" + page + "&name=" + $("#name").val().trim() + "&charger=" + $("#charger").val().trim() + "&teacher=" +
                        $("#teacher").val().trim() + "&schoolId=" + $("#schoolId").val() + "&startYear=" + $("#startYear").val() + "&endYear=" + $("#endYear").val();
            }
        });
    });
</script>
</body>
</html>

