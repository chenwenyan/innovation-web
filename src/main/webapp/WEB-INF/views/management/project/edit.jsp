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

        .w415{
            width: 444px !important;
        }

        .w400{
            width: 400px !important;
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
                        <li><a href="${website}/project/list">项目管理</a></li>
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
                                               placeholder="请输入项目名称" class="w415 form-control name col-sm-3"
                                               name="name">
                                        <span class="tip2 col-sm-6">项目名称不能为空，请重新填写</span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label"><span class="requires">*</span>负责人</label>
                                    <div class="col-sm-9">
                                        <input type="text" value="${project.charger}"
                                               placeholder="请输入负责人姓名" class="w415 form-control name col-sm-3"
                                               name="charger">
                                        <span class="tip2 col-sm-6">负责人姓名不能为空，请重新填写</span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label"><span class="requires">*</span>指导老师</label>
                                    <div class="col-sm-9">
                                        <input type="text" value="${project.teacher}"
                                               placeholder="请输入指导老师姓名" class="w415 form-control name col-sm-3"
                                               name="teacher">
                                        <span class="tip2 col-sm-6">指导老师姓名不能为空，请重新填写</span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label"><span class="requires">*</span>学院</label>
                                    <div class="col-sm-9">
                                        <select class="col-sm-2 form-control w415" name = "schoolId" id="schoolId">
                                            <c:forEach var="school" items="${schoolList}">
                                                <c:if test="${schoolList.size() == 0}">
                                                    <option value="-1">无</option>
                                                </c:if>
                                                <c:if test="${schoolList.size()> 0}" >
                                                    <option <c:if test="${project.schoolId == school.id}">selected="selected"</c:if> value="${school.id}">${school.name}</option>
                                                </c:if>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label"><span class="requires">*</span>项目分类</label>
                                    <div class="col-sm-9">
                                        <select class="col-sm-3 form-control w180" name ="type" id="type">
                                            <option  <c:if test="${project.type == '国创'}">selected="selected"</c:if> value="国创" selected>国创 </option>
                                            <option  <c:if test="${project.type == '科研立项'}">selected="selected"</c:if>value="科研立项">科研立项 </option>
                                        </select>
                                        <label class="col-sm-1 control-label">项目类别</label>
                                        <select class="col-sm-3 form-control w180" name ="category" id="category">
                                            <option <c:if test="${project.category == '创新训练'}">selected="selected"</c:if> value="创新训练">创新训练</option>
                                            <option <c:if test="${project.category == '创业训练'}">selected="selected"</c:if> value="创业训练">创业训练</option>
                                            <option <c:if test="${project.category == '创业实践'}">selected="selected"</c:if> value="创业实践">创业实践</option>
                                            <option <c:if test="${project.category == '本科生项目'}">selected="selected"</c:if> value="本科生项目">本科生项目</option>
                                            <option <c:if test="${project.category == '本科生项目（重点）'}">selected="selected"</c:if> value="本科生项目（重点）">本科生项目（重点）</option>
                                            <option <c:if test="${project.category == '本科生项目（一般）'}">selected="selected"</c:if> value="本科生项目（一般）">本科生项目（一般）</option>
                                            <option <c:if test="${project.category == '青年探索培育基金拟资助项目'}">selected="selected"</c:if> value="青年探索培育基金拟资助项目">青年探索培育基金拟资助项目</option>
                                            <option <c:if test="${project.category == '科研项目'}">selected="selected"</c:if> value="科研项目">科研项目</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label"><span class="requires">*</span>年份</label>
                                    <div class="col-sm-9">
                                        <div class='input-group date' id='this_year' name="this_year">
                                            <input type='text' class="form-control w400" readonly id='year' name="year" value="${project.year}"/>
                                            <span class="input-group-addon">
                                              <span class="glyphicon glyphicon-calendar"></span>
                                           </span>
                                        </div>
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

        $('#this_year').datetimepicker({
            startView: 'decade',
            minView: 'decade',
            format: 'yyyy',
            maxViewMode: 2,
            minViewMode: 2,
            autoclose: true,
            pickerPosition: "bottom-left"
        });

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


        //类别选项
        $("#type").change(function () {
            var type = $("#type").val();
            if (type == '国创') {
                $("#category").empty();
                $("#category").append("<option value='创新训练' selected>创新训练</option>");
                $("#category").append("<option value='创业训练'>创业训练</option>");
                $("#category").append("<option value='创业实践'>创业实践</option>");
            }
            if (type == '科研立项') {
                $("#category").empty();
                $("#category").append("<option value='本科生项目（重点）' selected>本科生项目（重点）</option>");
                $("#category").append("<option value='本科生项目（一般）'>本科生项目（一般）</option>");
                $("#category").append("<option value='青年探索培育基金拟资助项目'>青年探索培育基金拟资助项目</option>");
                $("#category").append("<option value='科研项目'>科研项目</option>");
            }
        });
    })
</script>
</body>
</html>