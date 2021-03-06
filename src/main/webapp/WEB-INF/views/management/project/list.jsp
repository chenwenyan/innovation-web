<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>项目管理</title>
    <jsp:include flush="true" page="/WEB-INF/views/management/common/head.jsp"/>
    <style type="text/css">
        .tip1 {
            height: 32px;
            font-size: 12px;
            font-family: inherit;
            color: red;
            padding: 8px;
        }

        .tip2 {
            height: 32px;
            font-size: 12px;
            font-family: inherit;
            color: red;
            padding: 8px;
        }
    </style>
</head>
<body>
<jsp:include flush="true" page="/WEB-INF/views/management/common/header.jsp"/>
<div class="page clearfix">
    <div class="holder">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <ol class="breadcrumb">
                        <li><a href="${website}/"><i class="fa fa-home"></i>首页</a></li>
                        <li><a href="${website}/project/list">项目管理</a></li>
                        <li><a href="${website}/project/list" class="active">项目信息管理</a></li>
                    </ol>
                    <h2>项目管理</h2>
                    <c:if test="${isRedirect==true}">
                        <%--<div class="alert alert-success J_tip">${msg}</div>--%>
                    </c:if>
                </div>
                <div class="col-sm-12">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <h4>搜索</h4>
                        </div>
                        <div class="panel-body">
                            <form class="form-horizontal J_form" action="${website}/project" method="get">
                                <div class="form-group col-sm-6">
                                    <label class="col-sm-4 control-label">项目名称</label>
                                    <div class="col-sm-3">
                                        <input type="text" name="name" placeholder="请输入项目名称" class="form-control w180" id="name" value="${name}">
                                    </div>
                                </div>
                                <div class="form-group col-sm-6">
                                    <label class="col-sm-4 control-label">负责人</label>
                                    <div class="col-sm-3">
                                        <input type="text" name="charger" placeholder="请输入负责人姓名"
                                               class="form-control w180" id="charger" value="${charger}">
                                    </div>
                                </div>
                                <div class="form-group col-sm-6">
                                    <label class="col-sm-4 control-label">指导老师</label>
                                    <div class="col-sm-3">
                                        <input type="text" name="teacher" placeholder="请输入指导老师姓名"
                                               class="form-control w180" id="teacher" value="${teacher}">
                                    </div>
                                </div>
                                <div class="form-group col-sm-6">
                                    <label class="col-sm-4 control-label">学院</label>
                                    <div class="col-sm-3">
                                        <select class="col-sm-2 form-control w180" name="schoolId" id="schoolId">
                                            <option <c:if test='${schoolId == null}'>selected="selected"</c:if> value="-1">全部</option>
                                            <c:forEach var="school" items="${schoolList}">
                                                <c:if test="${schoolList.size()> 0}">
                                                    <option <c:if test='${school.id == schoolId}'>selected="selected"</c:if> value="${school.id}">${school.name}</option>
                                                </c:if>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group form-inline clearfix ">
                                    <label class="col-sm-2 control-label">年份：</label>
                                    <div class="col-sm-7 ">
                                        <div class='input-group date ' id='start_year' name="start_year" style="float:left;">
                                            <input  type='text' class="form-control w180" readonly id='startYear' name="startYear" value="${startYear}"/>
                                            <span class="input-group-addon" >
                                           <span class="glyphicon glyphicon-calendar"></span>
                                        </span>
                                        </div>
                                        <label class="col-sm-1 control-label" style="float:left;">至</label>
                                        <div class='input-group date' id='end_year' name="end_year">
                                            <input type='text' class="w180 form-control" readonly id='endYear' name="endYear" value="${endYear}"/>
                                            <span class="input-group-addon">
                                               <span class="glyphicon glyphicon-calendar"></span>
                                           </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6 col-sm-offset-5">
                                    <button type="submit" class="btn btn-primary J_submit"><i class="fa fa-search"></i>&nbsp;查询
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-sm-12">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <h4>项目信息列表</h4>
                        </div>
                        <div class="panel-body">
                            <a href="${website}/project/add" class="btn btn-success margin-bottom-15"><i
                                    class="fa fa-plus"></i>&nbsp;添加项目</a>
                            <a href="${website}/project/import" class="btn btn-success margin-bottom-15"><i
                                    class="fa fa-plus"></i>&nbsp;导入excel模板</a>
                            <div class="table-responsive">
                                <table class="table table-hover table-bordered">
                                    <thead>
                                    <tr>
                                        <th hidden="hidden">项目Id</th>
                                        <th>项目名称</th>
                                        <th>负责人</th>
                                        <th>指导老师</th>
                                        <th>学院</th>
                                        <th>年份</th>
                                        <th>项目分类</th>
                                        <th>项目类别</th>
                                        <th>操作</th>
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
                                            <td>${project.year}</td>
                                            <td>${project.type}</td>
                                            <td>${project.category}</td>
                                            <td>
                                                <c:if test="${project.schoolId == user.schoolId || user.schoolId == 0}">
                                                <a href="${website}/project/edit?id=${project.id}" class="label-info"><i
                                                        class="fa fa-edit"></i>&nbsp;编辑</a>
                                                <a href="javascript:;" class="label-info J_delType"><i
                                                        class="fa fa-times"></i>&nbsp;删除</a>
                                                </c:if>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    <c:if test="${projectList.size()=='0'}">
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
<script type="text/javascript">
    $(function () {
        if ($(".J_tip")) {
            setTimeout(function () {
                $(".J_tip").hide();
            }, 3000);
        }
        $(".J_delType").click(function (e) {
            if (confirm("确定要删除此项目吗?") == true) {
                var id = $(e.target).parents("tr").children().first().text();
                $.ajax({
                    type: "post",
                    url: "/project/delete",
                    data: {id: id},
                    success: function (msg) {
                        window.location.reload();
                    }
                });
            }
        });

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
            if (startYear != "" && endYear != "") {
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
            if (startYear != "" && endYear != "") {
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
                return "/project?pageNo=" + page + "&name=" + $("#name").val().trim() + "&charger="+ $("#charger").val().trim() + "&teacher=" +
                        $("#teacher").val().trim()+"&schoolId="+$("#schoolId").val() + "&startYear=" + $("#startYear").val() + "&endYear=" + $("#endYear").val();
            }
        });
    });
</script>
</body>
</html>