<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>添加项目</title>
    <jsp:include flush="true" page="/WEB-INF/views/management/common/head.jsp"/>
    <style type="text/css">
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
                        <li><a href="${website}/project/list">项目管理</a></li>
                        <li><a href="${website}/project/import" class="active">导入excel模板</a></li>
                    </ol>
                    <h2>导入excel模板</h2>
                    <%--<div class="alert alert-success">${msg}</div>--%>
                </div>

                <div class="col-sm-12">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <h4>导入</h4>
                        </div>
                        <div class="panel-body">
                            <form class="J_form form-horizontal inline" enctype="multipart/form-data" id="batchUpload"
                                  action="${website}/project/ajax/import"
                                  method="post">
                                <div style="display: inline">
                                <button class="btn btn-success btn-xs" id="uploadEventBtn" style="height:26px;"
                                        type="button">
                                    选择文件
                                </button>
                                <input type="file" name="file" style="width:0px;height:0px;" id="uploadEventFile">
                                </div>
                                <input id="uploadEventPath" disabled="disabled" type="text" placeholder="请选择excel表"
                                       style="border: 1px solid #e6e6e6; height: 26px;width: 200px;">
                            </form>
                            <button type="button" class="btn btn-success btn-sm" style="margin-top:10px;" onclick="user.uploadBtn()">上传</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    var User = function () {
        this.init = function () {
            //模拟上传excel
            $("#uploadEventBtn").unbind("click").bind("click", function () {
                $("#uploadEventFile").click();
            });
            $("#uploadEventFile").bind("change", function () {
                $("#uploadEventPath").attr("value", $("#uploadEventFile").val());
            });
        };
        //点击上传按钮
        this.uploadBtn = function () {
            var uploadEventFile = $("#uploadEventFile").val();
            if (uploadEventFile == '') {
                alert("请选择excel,再上传");
            } else if (uploadEventFile.lastIndexOf(".xls") < 0) {//可判断以.xls和.xlsx结尾的excel
                alert("只能上传Excel文件");
            } else {
                var url = '${website}/project/ajax/import';
                var formData = new FormData($('form')[0]);
                user.sendAjaxRequest(url, 'POST', formData);
            }
        };

        this.sendAjaxRequest = function (url, type, data) {
            $.ajax({
                url: url,
                type: type,
                data: data,
                success: function (result) {
                    alert(result.msg);
                    if (result.code == 1) {
                        window.location.href = '${website}/project/list';
                    }
                },
                error: function () {
                    alert("excel上传失败");
                },
                cache: false,
                contentType: false,
                processData: false
            });
        };
    };
    $(function () {
        user = new User();
        user.init();
    });
</script>
</body>
</html>