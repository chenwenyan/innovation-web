<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>学院添加</title>
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
                        <li><a href="${website}/"><i class="fa fa-home"></i>&nbsp;首页</a></li>
                        <li><a href="${website}/school">学院管理</a></li>
                        <li><a href="${website}/school/add" class="active">学院添加管理</a></li>
                    </ol>
                    <h2>添加类别</h2>
                    <%--<div class="alert alert-success">${msg}</div>--%>
                </div>

                <div class="col-sm-12">
                    <form class="J_form form-horizontal inline" action="${website}/school/add"
                          method="post">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                <h4>添加</h4>
                            </div>
                            <div class="panel-body">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label"><span class="requires">*</span>学院名称</label>
                                    <div class="col-sm-9">
                                        <input type="text"
                                               placeholder="请输入学院名称" class="w180 form-control name col-sm-3"
                                               name="name">
                                        <span class="tip2 col-sm-6">学院名称不能为空，请重新填写</span>
                                    </div>
                                </div>
                            </div>
                            <div class="panel-footer clearfix">
                                <div class="col-sm-6 col-sm-offset-3 ">
                                    <div class="btn-toolbar">
                                        <button class="btn btn-primary" type="submit"><i class="fa fa-save"></i>&nbsp;保存
                                        </button>
                                        <button class="btn btn-default" type="button"
                                                onclick="javascript:window.history.back(-1);"><i class="fa fa-undo"></i>返回
                                        </button>
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
    $(function () {

        $(".tip1").hide();
        $(".tip2").hide();

        //验证是否为空
        $(".name").blur(function () {
            var name = $(".name").val();
            if (name == "") {
                $(".tip1").show();
            }
            else {

            }
        });

        //输入时不显示tip
        $(".name").focus(function () {
            $(".tip1").hide();
        });

        //表单提交验证
        $(".J_form").submit(function () {
            var name = $(".name").val();
            if (name == null) {
                alert("请将内容填写完整！");
                return false;
            }
            else {
                $(".J_form").submit();
            }
        });
    })
</script>
</body>
</html>