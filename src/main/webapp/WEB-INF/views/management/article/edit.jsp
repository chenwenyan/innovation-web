<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>文章编辑</title>
    <jsp:include flush="true" page="/WEB-INF/views/management/common/head.jsp"/>
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
<jsp:include flush="true" page="/WEB-INF/views/management/common/header.jsp"/>
<div class="page clearfix">
    <div class="holder">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <ol class="breadcrumb">
                        <li><a href="${website}/"><i class="fa fa-home"></i>&nbsp;首页</a></li>
                        <li><a href="${website}/article">文章管理</a></li>
                        <li><a href="${website}/article/add" class="active">文章添加管理</a></li>
                    </ol>
                    <h2>编辑文章</h2>
                    <div class="alert alert-success">${msg}</div>
                </div>

                <div class="col-sm-12">
                    <form class="J_form form-horizontal inline" action="${website}/article/edit?id=${article.id}" method="post">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                <h4>编辑</h4>
                            </div>
                            <div class="panel-body">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label"><span class="requires">*</span>文章标题</label>
                                    <div class="col-sm-6">
                                        <input type="text"
                                               placeholder="请输入文章标题" class="col-sm-3 form-control name" name="title" id="title" value="${article.title}">
                                        <span class="tip2 col-sm-6">文章标题不能为空，请重新填写</span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label"><span class="requires">*</span>文章类别</label>
                                    <div class="col-sm-6">
                                        <select class="col-sm-3 form-control" name="typeId" id="typeId">
                                            <c:forEach var="type" items="${typeList}">
                                                <c:if test="${typeList.size() == 0}">
                                                    <option value = "-1">无</option>
                                                </c:if>
                                                <c:if test="${typeList.size()> 0}">
                                                    <option value ="${type.id}">
                                                    <%--<c:if test="${article.typeId eq type.id}"> selected="selected" </c:if>--%>
                                                    ${type.name}</option>
                                                </c:if>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label"><span class="requires">*</span>文章内容</label>
                                    <div class="col-sm-6">
                                        <textarea placeholder="请输入文章内容" rows="15" class="form-control col-sm-3" name="content" id="content" >${article.content}</textarea>
                                        <span class="tip2 col-sm-6">文章内容不能为空，请重新填写</span>
                                    </div>
                                </div>

                            </div>
                            <div class="panel-footer clearfix">
                                <div class="col-sm-6 col-sm-offset-3 ">
                                    <div class="btn-toolbar">
                                        <button class="btn btn-primary" type="submit"><i class="fa fa-save"></i>&nbsp;保存</button>
                                        <button class="btn btn-default" type="reset"><i class="fa fa-undo"></i>重置</button>
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
    $(function(){

        $(".tip1").hide();
        $(".tip2").hide();

        //验证是否为空
        $("#title").blur(function(){
            var title = $("#title").val();
            if(title == "" || title == null){
                $(".tip1").show();
            }
            else{
                $(".tip1").hide();
            }
        });

        //输入时不显示tip
        $("#title").focus(function(){
            $(".tip1").hide();
        });

        //验证是否为空
        $("#content").blur(function(){
            var content = $("#content").val();
            if(content == "" || content == null){
                $(".tip2").show();
            }
            else{
                $(".tip2").hide();
            }
        });

        //输入时不显示tip
        $("#content").focus(function(){
            $(".tip2").hide();
        });

        //表单提交验证
        $(".J_form").submit(function(){
            var title = $("#title").val();
            var content = $("#content").val();
            if(title == null || title =="" || content == null || content == ""){
                alert("请将内容填写完整！");
                return false;
            }
            else{
                $(".J_form").submit();
            }
        });
    })
</script>
</body>
</html>
