<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>项目编辑</title>
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
                        <li><a href="${website}/project">项目管理</a></li>
                        <li><a href="javascript:;" class="active">项目编辑管理</a></li>
                    </ol>
                    <h2>项目编辑</h2>
                    <%--<div class="alert alert-success">${msg}</div>--%>
                </div>

                <div class="col-sm-12">
                    <form class="J_form form-horizontal inline" action="${website}/project/edit?id=${project.id}"
                          method="post">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                <h4>编辑</h4>
                            </div>
                            <div class="panel-body">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label"><span class="requires">*</span>项目名称</label>
                                    <div class="col-sm-9">
                                        <input type="text" value="${project.name}"
                                               placeholder="请输入项目名称" class="w180 form-control name col-sm-3"
                                               name="name">
                                        <span class="tip2 col-sm-6">项目名称不能为空，请重新填写</span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label"><span class="requires">*</span>负责人</label>
                                    <div class="col-sm-9">
                                        <input type="text" value="${project.charger}"
                                               placeholder="请输入负责人姓名" class="w180 form-control name col-sm-3"
                                               name="charger">
                                        <span class="tip2 col-sm-6">负责人姓名不能为空，请重新填写</span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label"><span class="requires">*</span>指导老师</label>
                                    <div class="col-sm-9">
                                        <input type="text" value="${project.teacher}"
                                               placeholder="请输入指导老师姓名" class="w180 form-control name col-sm-3"
                                               name="teacher">
                                        <span class="tip2 col-sm-6">指导老师姓名不能为空，请重新填写</span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label"><span class="requires">*</span>学院</label>
                                    <div class="col-sm-9">
                                        <select class="col-sm-2 form-control w180" name = "schoolId" id="schoolId">
                                            <c:forEach var="school" items="${schoolList}">
                                                <c:if test="${schoolList.size() == 0}">
                                                    <option value="-1">无</option>
                                                </c:if>
                                                <c:if test="${schoolList.size()> 0}" >
                                                    <option value="${school.id}">${school.name}</option>
                                                </c:if>
                                            </c:forEach>
                                        </select>
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

        //验证是否为空
        $(".charger").blur(function () {
            var charger = $(".charger").val();
            if (charger == "") {
                $(".tip2").show();
            }
            else {
                $(".tip2").hide();
            }
        });

        //输入时不显示tip
        $(".charger").focus(function () {
            $(".tip2").hide();
        });

        //表单提交验证
        $(".J_form").submit(function () {
            var name = $(".name").val();
            var charger = $(".charger").val();
            var teacher = $(".teacher").val();
            if (name == null || assistantCode == "") {
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