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
                        <li><a href="${website}/index"><i class="fa fa-home"></i>&nbsp;首页</a></li>
                        <li><a href="${website}/borrower">借阅人管理</a></li>
                        <li><a href="${website}/borrower/add_borrower" class="active">借阅人添加管理</a></li>
                    </ol>
                    <h2>添加借阅人</h2>
                    <!--<div class="alert alert-success">保存成功！</div>-->
                </div>

                <div class="col-sm-12">
                    <form class="J_form form-horizontal inline" action="${website}/borrower/add_borrower" method="post">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                <h4>添加</h4>
                            </div>
                            <div class="panel-body">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">借阅人账号</label>
                                    <div class="col-sm-6">
                                        <select class="w180 sex form-control" name="username">
                                            <c:forEach var="user" items="${userList}">
                                                <option value="${user.username}">${user.username}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label"><span class="requires">*</span>借阅人名称</label>
                                    <div class="col-sm-9">
                                        <input type="text"
                                               placeholder="请输入借阅人名称" class="w180 form-control name col-sm-3" name="name">
                                        <span class="tip2 col-sm-6">借阅人名称不能为空，请重新填写</span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">借阅人性别</label>
                                    <div class="col-sm-6">
                                        <select class="w180 sex form-control" name="sex">
                                            <option value="0" selected="selected">男</option>
                                            <option value="1">女</option>
                                        </select>
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
        $(".username").blur(function(){
            var username = $(".username").val();
            if(username ==""){
                $(".tip1").show();
            }
            else{

            }
        });

        //输入时不显示tip
        $(".username").focus(function(){
            $(".tip1").hide();
        });

        //验证是否为空
        $(".name").blur(function(){
            var name = $(".name").val();
            if(name ==""){
                $(".tip2").show();
            }
            else{
                $(".tip2").hide();
            }
        });

        //输入时不显示tip
        $(".name").focus(function(){
            $(".tip2").hide();
        });

        //表单提交验证
        $(".J_form").submit(function(){
            var name = $(".name").val();
            if(name==null||name==""){
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
