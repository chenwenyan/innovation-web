<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>文章管理</title>
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
                        <li><a href="${website}/article">文章管理</a></li>
                        <li><a href="${website}/article" class="active">文章信息管理</a></li>
                    </ol>
                    <h2>文章管理</h2>
                    <c:if test="${isRedirect==true}">
                        <%--<div class="alert alert-success J_tip">保存成功！</div>--%>
                    </c:if>
                </div>
                <div class="col-sm-12">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <h4>搜索</h4>
                        </div>
                        <div class="panel-body">
                            <form class="form-horizontal J_form" action="${website}/article" method="get">
                                <div class="form-group col-sm-6">
                                    <label class="col-sm-4 control-label">文章标题</label>
                                    <div class="col-sm-2">
                                        <input type="text" name="title" id="title" placeholder="请输入文章标题" class="form-control w180" value="${title}">
                                    </div>
                                </div>
                                <div class="form-group col-sm-6">
                                    <label class="col-sm-4 control-label">发布单位</label>
                                    <div class="col-sm-2">
                                        <select class="form-control w180" name="schoolId" id="schoolId">
                                            <option value="0">全部</option>
                                            <c:forEach var="school" items="${schoolList}">
                                                <c:if test="${schoolList.size() == 0}">
                                                    <option value="-1">无</option>
                                                </c:if>
                                                <c:if test="${schoolList.size()> 0}">
                                                    <option <c:if test='${school.id == schoolId}'>selected="selected"</c:if>  value="${school.id}">${school.name}</option>
                                                </c:if>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group col-sm-6">
                                    <label class="col-sm-4 control-label">文章类别</label>
                                    <div class="col-sm-2">
                                        <select class="form-control w180" name="typeId" id="typeId">
                                            <option value="0">全部</option>
                                            <c:forEach var="type" items="${typeList}">
                                                <c:if test="${typeList.size() == 0}">
                                                    <option value="-1">无</option>
                                                </c:if>
                                                <c:if test="${typeList.size()> 0}">
                                                    <option  <c:if test='${type.id == typeId}'>selected="selected"</c:if> value="${type.id}">${type.name}</option>
                                                </c:if>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group col-sm-6">
                                    <label class="col-sm-4 control-label">审核状态</label>
                                    <div class="col-sm-2">
                                        <select class="form-control w180" name="isAudited" id="isAudited">
                                            <option value="-1">全部</option>
                                            <option <c:if test="${isAudited == 0}">selected="selected"</c:if>value="0">待审核</option>
                                            <option <c:if test="${isAudited == 1}">selected="selected"</c:if>value="1">审核通过</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-sm-6 col-sm-offset-5">
                                    <button type="submit" class="btn btn-primary J_submit"><i class="fa fa-search"></i>&nbsp;搜索
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-sm-12">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <h4>文章信息列表</h4>
                        </div>
                        <div class="panel-body">
                            <a href="${website}/article/add" class="btn btn-success margin-bottom-15"><i
                                    class="fa fa-plus"></i>&nbsp;添加文章</a>
                            <div class="table-responsive">
                                <table class="table table-hover table-bordered">
                                    <thead>
                                    <tr>
                                        <th hidden="hidden">用户ID</th>
                                        <th>标题</th>
                                        <th>分类</th>
                                        <th>创建时间</th>
                                        <th>发布单位</th>
                                        <th>审核状态</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="article" items="${articleList}">
                                        <tr>
                                            <td hidden="hidden">${article.id}</td>
                                            <td title="${article.title}">
                                                <c:if test="${fn:length(article.title) > 20 }">
                                                    ${fn:substring(article.title, 0, 20)}...
                                                </c:if>
                                                <c:if test="${fn:length(article.title) <= 20 }">
                                                    ${article.title}
                                                </c:if>
                                            </td>
                                            <td>${article.typeName}</td>
                                            <td><fmt:formatDate value="${article.createdTime}" pattern="yyyy/MM/dd HH:MM:ss"></fmt:formatDate></td>
                                            <td>${article.schoolName}</td>
                                            <td>
                                                <c:if test="${article.isAudited == 0}">待审核</c:if>
                                                <c:if test="${article.isAudited == 1}">审核通过</c:if>
                                            </td>
                                            <td>
                                                <a href="${website}/article/detail?id=${article.id}" class="label-info"><i
                                                        class="fa fa-eye"></i>&nbsp;查看</a>
                                                <c:if test="${article.schoolId == user.schoolId || user.schoolId == 0}">
                                                    <a href="${website}/article/edit?id=${article.id}" class="label-info"><i
                                                            class="fa fa-edit"></i>&nbsp;编辑</a>
                                                    <a href="javascript:;" class="label-info J_delArticle"><i
                                                            class="fa fa-times"></i>&nbsp;删除</a>
                                                </c:if>
                                                <c:if test="${article.isAudited == 0 && user.schoolId == 0}">
                                                    <a href="javascript:;" class="label-info J_setIsAudited"><i
                                                            class="fa fa-toggle-on"></i>&nbsp;审核</a>
                                                </c:if>
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
        $(".J_delArticle").click(function (e) {
            if (confirm("确定要删除此文章吗?") == true) {
                var id = $(e.target).parents("tr").children().first().text();
                $.ajax({
                    type: "post",
                    url: "/article/delete",
                    data: {id: id},
                    success: function (msg) {
                        window.location.reload();
                    }
                });
            }
        });

        $(".J_setIsAudited").click(function (e) {
            if (confirm("修改审核状态？") == true) {
                var id = $(e.target).parents("tr").children().first().text();
                $.ajax({
                    type: "post",
                    url: "/article/audited",
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
            size:"small",
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
                return "/article?pageNo=" + page + "&title=" + $("#title").val().trim() + "&creatorId=" + $("#userId").val() + "&typeId="+ $("#typeId").val();
            }
        });
    });
</script>
</body>
</html>