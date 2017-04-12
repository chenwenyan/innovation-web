<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>类别管理</title>
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
                        <li><a href="${website}/type">类别管理</a></li>
                        <li><a href="${website}/type/list" class="active">类别信息管理</a></li>
                    </ol>
                    <h2>类别管理</h2>
                    <c:if test="${isRedirect==true}">
                        <div class="alert alert-success J_tip">${msg}</div>
                    </c:if>
                </div>
                <div class="col-sm-12">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <h4>搜索</h4>
                        </div>
                        <div class="panel-body">
                            <form class="form-horizontal J_form" action="${website}/type" method="post">
                                <div class="form-group col-sm-6">
                                    <label class="col-sm-4 control-label">类别名称</label>
                                    <div class="col-sm-3">
                                        <input type="text" name="name" placeholder="请输入类别" class="form-control w180">
                                    </div>
                                </div>
                                <div class="form-group col-sm-6">
                                    <label class="col-sm-4 control-label">助记码</label>
                                    <div class="col-sm-3">
                                        <input type="text" name="assistantCode" placeholder="请输入助记码" class="form-control w180">
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
                            <h4>类别信息列表</h4>
                        </div>
                        <div class="panel-body">
                            <a href="${website}/type/add" class="btn btn-success margin-bottom-15"><i
                                    class="fa fa-plus"></i>&nbsp;添加类别</a>
                            <div class="table-responsive">
                                <table class="table table-hover table-bordered">
                                    <thead>
                                    <tr>
                                        <th hidden="hidden">类别Id</th>
                                        <th>名称</th>
                                        <th>助记码</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="type" items="${typeList}">
                                        <tr>
                                            <td hidden="hidden">${type.id}</td>
                                            <td>${type.name}</td>
                                            <td>${type.assistantCode}</td>
                                            <td>
                                                <a href="${website}/type/edit?id=${type.id}" class="label-info"><i
                                                        class="fa fa-edit"></i>&nbsp;编辑</a>
                                                <%--<a href="javascript:;" class="label-info J_delType"><i--%>
                                                        <%--class="fa fa-times"></i>&nbsp;删除</a>--%>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    <c:if test="${typeList.size()=='0'}">
                                        <tr>
                                            <td colspan="8" style="text-align: center;">无查询结果</td>
                                        </tr>
                                    </c:if>
                                    </tbody>
                                </table>
                                <div class="J_pagination"></div>
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
//        $(".J_delType").click(function (e) {
//            if (confirm("确定要删除此类别吗?") == true) {
//                var id = $(e.target).parents("tr").children().first().text();
//                $.ajax({
//                    type: "post",
//                    url: "/type/delete",
//                    data: {id: id},
//                    success: function (msg) {
//                        window.location.reload();
//                    }
//                });
//            }
//        });
    });
</script>
</body>
</html>