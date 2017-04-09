<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>文章管理</title>
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
                        <li><a href="${website}/article">文章管理</a></li>
                        <li><a href="${website}/article/list" class="active">文章信息管理</a></li>
                    </ol>
                    <h2>文章管理</h2>
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
                            <form class="form-horizontal J_form" action="${website}/article/list" method="post">
                                <div class="form-group col-sm-6">
                                    <label class="col-sm-4 control-label">文章标题</label>
                                    <div class="col-sm-3">
                                        <input type="text" name="name" placeholder="请输入文章标题" class="form-control w180">
                                    </div>
                                </div>
                                <div class="form-group col-sm-6">
                                    <label class="col-sm-4 control-label">文章作者</label>
                                    <div class="col-sm-3">
                                        <select >
                                         <c:forEach var="user" items="${userList}">
                                             <c:if test="fns:${userList.length == 0}">
                                                 <option id="-1">无</option>
                                             </c:if>
                                             <c:if test="fns:${userList.length > 0}">
                                                 <option id="${user.id}">${user.name}</option>
                                             </c:if>
                                         </c:forEach>
                                        </select>
                                    </div>
                                </div>
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
                            <a href="${website}/user/add" class="btn btn-success margin-bottom-15"><i class="fa fa-plus"></i>&nbsp;添加文章</a>
                            <div class="table-responsive">
                                <table class="table table-hover table-bordered">
                                    <thead>
                                    <tr>
                                        <th hidden="hidden">用户ID</th>
                                        <th>标题</th>
                                        <th>内容</th>
                                        <th>分类</th>
                                        <th>创建时间</th>
                                        <th>作者</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="article" items="${articleList}">
                                        <tr>
                                            <td hidden="hidden">${article.id}</td>
                                            <td>${article.title}</td>
                                            <td>${article.content}</td>
                                            <td>${article.type}</td>
                                            <td>${article.createdTime}</td>
                                            <td>${article.creator}</td>
                                            <td>
                                                <a href="${website}/article/edit?id=${article.id}" class="label-info"><i class="fa fa-edit"></i>&nbsp;编辑</a>
                                                <a href="javascript:;" class="label-info J_delUser"><i class="fa fa-times"></i>&nbsp;删除</a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    <c:if test="${articleList.size()=='0'}">
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
            if(confirm("确定要删除此文章吗?") == true){
                var id = $(e.target).parents("tr").children().first().text();
                $.ajax({
                    type: "post",
                    url: "/article/delete",
                    data: {id: id},
                    success: function(msg){
                        window.location.reload();
                    }
                });
            }
        });
    });
</script>
</body>
</html>