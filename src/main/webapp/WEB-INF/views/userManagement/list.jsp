<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>用户添加</title>
    <jsp:include flush="true" page="/WEB-INF/views/common/head.jsp"/>
    <style type="text/css">
        .tip1{
            height: 32px;
            font-size: 12px;
            font-family: inherit;
            color: red;
            padding: 8px;
        }
        .tip2{
            height: 32px;
            font-size: 12px;
            font-family: inherit;
            color: red;
            padding: 8px;
        }
    </style>
</head>
<body>
<jsp:include flush="true" page="/WEB-INF/views/common/header.jsp"/>
<div class="page clearfix">
    <div class="holder">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <ol class="breadcrumb">
                        <li><a href="${website}/"><i class="fa fa-home"></i>首页</a></li>
                        <li><a href="${website}/user">用户管理</a></li>
                        <li><a href="${website}/user/list" class="active">用户信息管理</a></li>
                    </ol>
                    <h2>用户信息管理</h2>
                    <c:if test="${isRedirect==true}">
                        <div class="alert alert-success J_tip">保存成功！</div>
                    </c:if>
                </div>
                <div class="col-sm-12">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <h4>搜索</h4>
                        </div>
                        <div class="panel-body">
                            <form class="form-horizontal J_form" action="${website}/user/list" method="post">
                                <div class="form-group col-sm-6">
                                    <label class="col-sm-4 control-label">用户名称</label>
                                    <div class="col-sm-3">
                                        <input type="text" name="name" placeholder="请输入用户名称" class="form-control w180">
                                    </div>
                                </div>
                                <%--<div class="form-group col-sm-6">--%>
                                    <%--<label class="col-sm-4 control-label">借阅人状态</label>--%>
                                    <%--<div class="col-sm-3">--%>
                                        <%--<input type="text" name="status" placeholder="请输入借阅人状态" class="form-control w180">--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <div class="col-sm-6 col-sm-offset-5">
                                    <button type="submit" class="btn btn-primary J_submit"><i class="fa fa-search"></i>&nbsp;查询</button>
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
                            <a href="${website}/user/add" class="btn btn-success margin-bottom-15"><i class="fa fa-plus"></i>&nbsp;添加借阅人</a>
                            <div class="table-responsive">
                                <table class="table table-hover table-bordered">
                                    <thead>
                                    <tr>
                                        <th hidden="hidden">用户ID</th>
                                        <th>用户名称</th>
                                        <th>密码</th>
                                        <%--<th>用户状态</th>--%>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="user" items="${userList}">
                                        <tr>
                                            <!--<td>1</td>-->
                                            <td hidden="hidden">${user.id}</td>
                                            <td>${user.username}</td>
                                            <td>${user.password}</td>
                                            <%--<td>--%>
                                                <%--<c:if test="${user.status=='1'}">正常</c:if>--%>
                                                <%--<c:if test="${user.status=='2'}">停用</c:if>--%>
                                                <%--<c:if test="${user.status=='3'}">删除</c:if>--%>
                                            <%--</td>--%>
                                            <td>
                                                <a href="${website}/user/edit?id=${user.id}" class="label-info"><i class="fa fa-search"></i>&nbsp;编辑</a>
                                                <a href="${website}/user/change_user_status?id=${borrower.id}" class="label-info J_alertStatus" ><!--data-toggle="modal" data-target="#alertStatus" --> <i class="fa fa-search"></i>&nbsp;修改状态</a>
                                                <a href="${website}/user/delete?id=${user.id}" class="label-info J_delUser"><i class="fa fa-times"></i>&nbsp;删除</a>
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
    $(function(){
        if($(".J_tip")){
            setTimeout(function(){
                $(".J_tip").hide();
            }, 3000);
        }
        $(".J_delUser").click(function(e){
            if(confirm("确定要删除此借阅人信息吗?") == true){
                var id = $(e.target).parents("tr").children().first().text();
                $.ajax({
                    type: "post",
                    url: "",
                    data: {id: id},
                    success: function(msg){
                        window.location.reload();
                    }
                });
            };
        });
        $(".J_alertStatus").click(function(e){
            if(confirm("确定要修改此借阅人的借阅状态吗？") == true){
                var
                        statusEl = $(e.target).parents("td").siblings().last().text(),
                        status;

                if(statusEl == "正常"){
                    status = 2;
                }else{
                    status = 1;
                };
                $.ajax({
                    type: "post",
                    url: "",
                    data: {status: status},
                    success: function(msg){
                        window.location.reload();
                    }
                });
            };
        });
    });
</script>
</body>
</html>