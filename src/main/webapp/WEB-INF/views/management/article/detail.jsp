<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>查看文章内容</title>
    <jsp:include flush="true" page="/WEB-INF/views/management/common/head.jsp"/>
    <script src="http://www.lanrenzhijia.com/ajaxjs/pdfobject.js"></script>
</head>
<body>
<jsp:include flush="true" page="/WEB-INF/views/management/common/header.jsp"/>
<div class="page clearfix">
    <div class="holder">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <ol class="breadcrumb">
                        <li><a href="${website}/"><i class="fa fa-home"></i>&nbsp;首页</a></li>
                        <li><a href="${website}/article">文章管理</a></li>
                        <li><a href="javascript:;" class="active">查看文章内容</a></li>
                    </ol>
                    <h2>查看文章</h2>
                    <%--<div class="alert alert-success">${msg}</div>--%>
                </div>

                <div class="col-sm-12">
                    <form class="J_form form-horizontal inline" action="" method="">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                <h4>查看</h4>
                            </div>
                            <div class="panel-body">
                                <div class="form-group">
                                    <%--<label class="col-sm-3 control-label"><span class="requires">*</span>文章标题</label>--%>
                                    <div class="col-sm-8 text-center col-sm-offset-2">
                                        <h4>${article.title}</h4>
                                    </div>
                                </div>
                                <div class="form-group text-right">
                                    <%--<label class="col-sm-3 control-label"><span class="requires">*</span>文章类别</label>--%>
                                    <div class="col-sm-8">
                                        文章类别：${article.typeName}&nbsp;&nbsp;&nbsp;发布单位：${article.schoolName} &nbsp;&nbsp;&nbsp;创建时间：<fmt:formatDate value="${article.createdTime}" pattern="yyyy/MM/dd hh:MM:ss"></fmt:formatDate>
                                    </div>
                                </div>
                                <hr>
                                <div class="form-group text-left">
                                    <%--<label class="col-sm-3 control-label"><span class="requires">*</span>文章内容</label>--%>
                                    <div class="col-sm-8 col-sm-offset-2">
                                        ${article.content}
                                    </div>
                                </div>
                                <hr>
                                <div class="form-group col-sm-offset-3">
                                    <%--<label class="col-sm-3 control-label"><span class="requires">*</span>文章类别</label>--%>
                                    <div class="col-sm-8">
                                        <c:if test="${files.size() > 0}">
                                            <label class="label-control">附件：</label>
                                            <c:forEach var="file" items="${files}">
                                                <a href="${website}/file/download?fileId=${file.id}" class="file_download">${file.name}</a>
                                                <br>
                                            </c:forEach>
                                        </c:if>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">

</script>
</body>
</html>
