<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>用户信息管理</title>
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
                        <li><a href="${website}/user">用户管理</a></li>
                        <li><a href="${website}/user" class="active">用户信息管理</a></li>
                    </ol>
                    <h2>用户信息管理</h2>
                    <c:if test="${isRedirect == true}">
                        <div class="alert alert-success J_tip">保存成功！</div>
                    </c:if>
                </div>
                <div class="col-sm-12">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <h4>搜索</h4>
                        </div>
                        <div class="panel-body">
                            <form class="form-horizontal J_form" action="${website}/user" method="post">
                                <div class="form-group col-sm-6">
                                    <label class="col-sm-4 control-label">用户名称</label>
                                    <div class="col-sm-3">
                                        <input type="text" name="username" placeholder="请输入用户名称" class="form-control w180">
                                    </div>
                                </div>
                                <%--<div class="form-group col-sm-6">--%>
                                    <%--<label class="col-sm-4 control-label">用户状态</label>--%>
                                    <%--<div class="col-sm-3">--%>
                                        <%--<select class="col-sm-2 form-control w180" name="status" id="status">--%>
                                            <%--<option value="0">全部</option>--%>
                                            <%--<option value="1">正常</option>--%>
                                            <%--<option value="2">停用</option>--%>
                                        <%--</select>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
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
                            <h4>用户信息列表</h4>
                        </div>
                        <div class="panel-body">
                            <a href="${website}/user/add" class="btn btn-success margin-bottom-15"><i
                                    class="fa fa-plus"></i>&nbsp;添加用户</a>
                            <div class="table-responsive">
                                <table class="table table-hover table-bordered">
                                    <thead>
                                    <tr>
                                        <th hidden="hidden">用户ID</th>
                                        <th>用户名称</th>
                                        <th>密码</th>
                                        <th>学院</th>
                                        <%--<th>用户状态</th>--%>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="user" items="${userList}">
                                        <tr>
                                            <td hidden="hidden">${user.id}</td>
                                            <td>${user.username}</td>
                                            <td>${user.password}</td>
                                            <td>${user.schoolName}</td>
                                            <%--<td>--%>
                                                <%--<c:if test="${user.status=='1'}">正常</c:if>--%>
                                                <%--<c:if test="${user.status=='2'}">停用</c:if>--%>
                                            <%--</td>--%>
                                            <td>
                                                <a href="${website}/user/edit?id=${user.id}" class="label-info"><i
                                                        class="fa fa-edit"></i>&nbsp;编辑</a>
                                                <%--<a href="javascript:;"--%>
                                                   <%--class="label-info J_alertStatus"><i--%>
                                                        <%--class="fa fa-search"></i>&nbsp;修改状态</a>--%>
                                                <a href="javascript:;" class="label-info J_delUser"><i
                                                        class="fa fa-times"></i>&nbsp;删除</a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    <c:if test="${userList.size()=='0'}">
                                        <tr>
                                            <td colspan="8" style="text-align: center;">无查询结果</td>
                                        </tr>
                                    </c:if>
                                    </tbody>
                                </table>
                                <div class="pull-right"><ul id="pageLimit"></ul></div>
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
        $(".J_delUser").click(function (e) {
            if (confirm("确定要删除此用户信息吗?") == true) {
                var id = $(e.target).parents("tr").children().first().text();
                $.ajax({
                    type: "post",
                    url: "/user/delete",
                    data: {id: id},
                    success: function (msg) {
                        window.location.reload();
                    }
                });
            }
        });
        $(".J_alertStatus").click(function (e) {
            if (confirm("确定要修改此用户的状态吗？") == true) {
                var id = $(e.target).parents("tr").children().first().text();
                $.ajax({
                    type: "post",
                    url: "/user/setStatus",
                    data: {id: id},
                    success: function (msg) {
                        window.location.reload();
                    }
                });
            }
        });
        $('#pageLimit').bootstrapPaginator({
            currentPage: ${pageNo+1},
            totalPages: ${count},
            size:"normal",
            bootstrapMajorVersion: 3,
            alignment:"right",
            numberOfPages:5,
            itemTexts: function (type, page, current) {
                switch (type) {
                    case "first": return "首页";
                    case "prev": return "<<";
                    case "next": return ">>";
                    case "last": return "末页";
                    case "page": return page;
                }
            },
            pageUrl:function (url,page,current) {
                return "/user?pageNo=" + page;
            }
        });
        console.log(${count});
    });
</script>
</body>
</html>