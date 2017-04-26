<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>添加项目</title>
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
                        <li><a href="${website}/project/add" class="active">项目添加管理</a></li>
                    </ol>
                    <h2>添加项目</h2>
                    <%--<div class="alert alert-success">${msg}</div>--%>
                </div>

                <div class="col-sm-12">
                    <form class="J_form form-horizontal inline" action="${website}/project/add"
                          method="post">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                <h4>编辑</h4>
                            </div>
                            <div class="panel-body">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label"><span class="requires">*</span>项目名称</label>
                                    <div class="col-sm-9">
                                        <input type="text"
                                               placeholder="请输入项目名称" class="w180 form-control name col-sm-3"
                                               name="name">
                                        <span class="tip2 col-sm-6">项目名称不能为空，请重新填写</span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label"><span class="requires">*</span>负责人</label>
                                    <div class="col-sm-9">
                                        <input type="text"
                                               placeholder="请输入负责人姓名" class="w180 form-control name col-sm-3"
                                               name="charger">
                                        <span class="tip2 col-sm-6">负责人姓名不能为空，请重新填写</span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label"><span class="requires">*</span>指导老师</label>
                                    <div class="col-sm-9">
                                        <input type="text"
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
                                <div class="form-group">
                                    <label class="col-sm-3 control-label"><span class="requires">*</span>项目分类</label>
                                    <div class="col-sm-9">
                                        <select class="col-sm-3 form-control w180" name ="type" id="type">
                                           <option value="1" selected>比赛 </option>
                                           <option value="2">科研立项 </option>
                                           <option value="3">未来计划 </option>
                                        </select>
                                        <label class="col-sm-2 control-label">项目类别</label>
                                        <select class="col-sm-3 form-control w180" name ="category" id="category">
                                            <option value="1">互联网+</option>
                                            <option value="2">创青春全国大学生创业大赛</option>
                                            <option value="3">挑战杯</option>
                                            <option value="11">其他比赛</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label"><span class="requires">*</span>年份</label>
                                    <div class="col-sm-9">
                                        <input class="col-sm-2 form-control form-filter yearpicker w180"
                                               readonly="readonly" name="year" id="year"/>
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

        $('#year').datetimepicker({
            startView: 'decade',
            minView: 'decade',
            format: 'yyyy',
            maxViewMode: 2,
            minViewMode: 2,
            autoclose: true
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
            if (charger == null || charger == "" || teacher == "" || teacher == null ) {
                alert("请将内容填写完整！");
                return false;
            }
            else {
                $(".J_form").submit();
            }
        });

        //类别选项
        $("#category").change(function () {
            var category = $("#category").val();
            if(category == 1) {
                $("#typeId").empty();
                $("#typeId").append("<option value='1' selected>互联网+</option>");
                $("#typeId").append("<option value='2'>创青春全国大学生创业大赛</option>");
                $("#typeId").append("<option value='3'>挑战杯</option>");
                $("#typeId").append("<option value='11'>其他比赛</option>");
            }
            if(category == 2) {
                $("#typeId").empty();
                $("#typeId").append("<option value='4' selected>暑期社会实践公告</option>");
                $("#typeId").append("<option value='5'>科研扶持</option>");
                $("#typeId").append("<option value='6'>创业园</option>");
                $("#typeId").append("<option value='7'>企业注册</option>");
                $("#typeId").append("<option value='8'>科研成果</option>");
            }
            if(category == 3) {
                $("#typeId").empty();
                $("#typeId").append("<option value='9' selected>国家级创新创业训练计划</option>");
                $("#typeId").append("<option value='10'>科研立项</option>");
            }
        });
    });
</script>
</body>
</html>