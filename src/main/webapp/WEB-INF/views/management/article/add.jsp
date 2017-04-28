<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>文章添加</title>
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
                        <li><a href="${website}/article">文章管理</a></li>
                        <li><a href="${website}/article/add" class="active">文章添加管理</a></li>
                    </ol>
                    <h2>添加文章</h2>
                    <%--<div class="alert alert-success">${msg}</div>--%>
                </div>

                <div class="col-sm-12">
                    <div class="J_form form-horizontal inline" action="${website}/article/add" method="post">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                <h4>添加</h4>
                            </div>
                            <div class="panel-body">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label"><span class="requires">*</span>文章标题</label>
                                    <div class="col-sm-6">
                                        <input type="text"
                                               placeholder="请输入文章标题" class="col-sm-3 form-control name" name="title"
                                               id="title">
                                        <span class="tip2 col-sm-6">文章标题不能为空，请重新填写</span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label"><span class="requires">*</span>文章类别</label>
                                    <div class="col-sm-6">
                                        <select class="col-sm-3 form-control" name="typeId" id="typeId">
                                            <c:forEach var="type" items="${typeList}">
                                                <c:if test="${typeList.size() == 0}">
                                                    <option value="-1">无</option>
                                                </c:if>
                                                <c:if test="${typeList.size() > 0}">
                                                    <option value="${type.id}">${type.name}</option>
                                                </c:if>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label"><span class="requires">*</span>文章内容</label>
                                    <div class="col-sm-6">
                                        <textarea placeholder="请输入文章内容" name="content" id="content"></textarea>
                                        <span class="tip2 col-sm-6">文章内容不能为空，请重新填写</span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <input hidden id="filesList" name="filesList">
                                    <label class="col-sm-3 control-label">上传附件</label>
                                    <form class="col-sm-6" id="uploadForm">
                                        <input class="" type="file" name="uploadInput" id="uploadInput" size="30"
                                               multiple="multiple"
                                               accept="application/msword;application/pdf;application/msexcel;">
                                        <button style="display:none;" hidden="hidden" class="btn btn-default" type="button" id="J_upload">上传</button>
                                    </form>
                                </div>
                                <%--<form class="form-group" id="uploadForm">--%>
                                <%--<input hidden id="filesList" name="filesList">--%>
                                <%--<label class="col-sm-3 control-label">上传附件</label>--%>
                                <%--<div class="col-sm-6">--%>
                                <%--<input class="" type="file" name="uploadInput" id="uploadInput" size="30"  multiple="multiple" accept="application/msword;application/pdf;application/msexcel;">--%>
                                <%--<button class="btn btn-default" type="button" id="J_upload">上传</button>--%>
                                <%--</div>--%>
                                <%--</form>--%>
                            </div>
                            <div class="panel-footer clearfix">
                                <div class="col-sm-6 col-sm-offset-3 ">
                                    <div class="btn-toolbar">
                                        <button class="btn btn-primary" type="button" id="saveBtn"><i
                                                class="fa fa-save"></i>&nbsp;保存
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
            tinymce.init({
                selector: 'textarea',
                height: 500,
                theme: 'modern',
                plugins: [
                    'advlist autolink lists link image charmap print preview hr anchor pagebreak',
                    'searchreplace wordcount visualblocks visualchars code fullscreen',
                    'insertdatetime media nonbreaking save table contextmenu directionality',
                    'emoticons template paste textcolor colorpicker textpattern imagetools codesample toc'
                ],
                toolbar1: 'undo redo | insert | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image',
                toolbar2: 'print preview media | forecolor backcolor emoticons | codesample',
                image_advtab: true,
                templates: [
                    {title: 'Test template 1', content: 'Test 1'},
                    {title: 'Test template 2', content: 'Test 2'}
                ],
                content_css: [
                    '//fonts.googleapis.com/css?family=Lato:300,300i,400,400i',
                    '//www.tinymce.com/css/codepen.min.css'
                ],
                language: "zh_CN"
            });

            $(".tip1").hide();
            $(".tip2").hide();

            //验证是否为空
            $("#title").blur(function () {
                var title = $("#title").val();
                if (title == "" || title == null) {
                    $(".tip1").show();
                }
                else {
                    $(".tip1").hide();
                }
            });

            //输入时不显示tip
            $("#title").focus(function () {
                $(".tip1").hide();
            });

            //验证是否为空
            $("#content").blur(function () {
                var content = $("#content").val();
                if (content == "" || content == null) {
                    $(".tip2").show();
                }
                else {
                    $(".tip2").hide();
                }
            });

            //输入时不显示tip
            $("#content").focus(function () {
                $(".tip2").hide();
            });

            //表单提交验证
            $("#saveBtn").click(function () {
                var title = $("#title").val().trim();
                var content = $("#content").val();
//            if(title == null || title == "" || content == null || content == ""){
//                alert("请将内容填写完整！");
//                return false;
//            }
//            else{
                $(".J_form").submit();

//                $("#J_upload").click(function () {

//                if (files == "" || files == null) {
//                    alert("还未选择文件！");
//                    return false;
//                }
//                for(var i = 0; i < files.length; i++){
//                    if (files[i].lastIndexOf('.') == -1) {
//                        alert("文件路径不正确！");
//                        return false;
//                    }
//                    var fileTypes = ".doc|.docx|.pdf|.xls|.xlsx|";
//                    var extName = files[i].substring(files[i].lastIndexOf(".")).toLowerCase();//（把路径中的所有字母全部转换为小写）
//                    if (fileTypes.indexOf(extName + "|") == -1) {
//                        var ErrMsg = "该文件类型不允许上传。请上传 " + fileTypes + " 类型的文件，当前文件类型为" + extName;
//                        alert(ErrMsg);
//                        return false;
//                    }
//                }
                var files = document.getElementById("uploadInput").files;
                console.log(new FormData($('#uploadForm')[0]));
                    var formData = new FormData();
//                    var name = $("#uploadInput").val();
//                    formData.append("file",$("#uploadInput")[0].files[0]);
//                    formData.append("name",name);
                    //追加文件数据
                    for(var i=0;i<files.length;i++){
                        formData.append("file["+i+"]", files[i]);
                    }
                $.ajax({
                    type: "post",
                    url: "${website}/ajax/upload",
                    data:formData,
                    processData: false,
                    // 告诉jQuery不要去设置Content-Type请求头
                    contentType: false,
                    success: function (res) {
//                   $("#filesList").value = res.toString();
                        alert(res);
                    },
                    error: function (res) {
                        alert("error");
                    }
                });
//                });
//            }
            });
        })
    </script>
</body>
</html>
