<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>用户添加</title>
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
                        <li><a href="${website}/index"><i class="fa fa-home"></i>&nbsp;首页</a></li>
                        <li><a href="${website}/user">用户管理</a></li>
                        <li><a href="${website}/user/edit" class="active">用户编辑管理</a></li>
                    </ol>
                    <h2>编辑用户</h2>
                    <c:if test="${isRedirect == true}">
                        <div class="alert alert-success J_tip">${msg}</div>
                    </c:if>
                </div>

                <div class="col-sm-12">
                    <form class="J_form form-horizontal inline" action="${website}/user/edit?id=${this_user.id}"
                          method="post">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                <h4>编辑</h4>
                            </div>
                            <div class="panel-body">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label"><span class="requires">*</span>用户名称</label>
                                    <div class="col-sm-9">
                                        <input type="text" value="${this_user.username}"
                                               placeholder="请输入用户名称" class="w180 form-control name col-sm-3"
                                               name="username">
                                        <span class="tip2 col-sm-6">用户名称不能为空，请重新填写</span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label"><span class="requires">*</span>用户名称</label>
                                    <div class="col-sm-9">
                                        <input type="text" value="${this_user.password}"
                                               placeholder="请输入用户名称" class="w180 form-control name col-sm-3"
                                               name="password">
                                        <span class="tip2 col-sm-6">用户密码不能为空，请重新填写</span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label"><span class="requires">*</span>学院</label>
                                    <div class="col-sm-9">
                                        <select class="col-sm-2 form-control w180" name="schoolId" id="schoolId">
                                            <c:forEach var="school" items="${schoolList}">
                                                <c:if test="${schoolList.size()> 0}">
                                                    <option <c:if test='${school.id == user.schoolId}'>selected="selected"</c:if> value="${school.id}">${school.name}</option>
                                                </c:if>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div hidden>
                                    <input value="${this_user.status}" name="status">
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
        if ($(".J_tip")) {
            setTimeout(function () {
                $(".J_tip").hide();
            }, 3000);
        }

        $(".tip1").hide();
        $(".tip2").hide();

        //验证是否为空
        $(".username").blur(function () {
            var username = $(".username").val();
            if (username == "") {
                $(".tip1").show();
            }
            else {

            }
        });

        //输入时不显示tip
        $(".username").focus(function () {
            $(".tip1").hide();
        });

        //验证是否为空
        $(".name").blur(function () {
            var name = $(".name").val();
            if (name == "") {
                $(".tip2").show();
            }
            else {
                $(".tip2").hide();
            }
        });

        //输入时不显示tip
        $(".name").focus(function () {
            $(".tip2").hide();
        });

        //表单提交验证
        $(".J_form").submit(function () {
            var username = $(".username").val();
            var name = $(".name").val();
            if (name == null || name == "") {
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