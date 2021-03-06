<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>用户登录</title>
    <jsp:include flush="true" page="/WEB-INF/views/management/common/head.jsp"/>
</head>
<body class="login-background">
<div class="page container clearfix">
    <div class="row">
        <div class="login-heading">
            <h2 class="text-center">大学生创新创业计划培训工程</h2>
            <h3 class="text-center">后台管理系统</h3>
        </div>
    </div>
    <form class="J_loginForm" method="post" action="/login">
        <div class="row">
            <div class="login-body login-box">
                <div class="title">
                    <h4 class="text-center margin-top-25 margin-bottom-30">欢迎登录</h4>
                    <c:if test="${isRedirect == true}">
                        <div class="alert alert-success J_tip">${msg}</div>
                    </c:if>
                </div>
                <div class="form-group">
                    <div class="input-group">
							<span class="input-group-addon">
								<span class="fa fa-user"></span>
							</span>
                        <input class="J_username form-control" type="text" placeholder="请填写登录用户名" name="username" value="">
                        <span class="input-tip">请输入用户名</span>
                        <span class="empty-tip">用户名不能为空，请重新输入</span>
                    </div>
                </div>
                <div class="form-group">
                    <div class="input-group">
							<span class="input-group-addon">
								<span class="fa fa-lock"></span>
							</span>
                        <input class="J_pwd form-control" type="password" placeholder="请填写登录密码" name="password" value="">
                        <span class="input-tip">请输入密码</span>
                        <span class="empty-tip">密码不能为空，请重新输入</span>
                    </div>
                </div>
                <%--<div class="checkbox pull-right margin-top-0 margin-bottom-15">--%>
                    <%--<label>--%>
                        <%--<input class="J_remember height-18" type="checkbox" name="remember" value="0">--%>
                        <%--记住我的登录信息--%>
                    <%--</label>--%>
                <%--</div>--%>
                <button class="J_submitBtn btn btn-primary btn-block" type="submit" data-btn-type="loading" data-btn-loading-text="正在登录，请稍后..." >登录</button>
            </div>
        </div>
        <div class="row">
            <div class="login-footer clearfix">
                <div class="tip-info pull-left">
                    <b>出现错误？</b>
                    <p>请联系管理员</p>
                </div>
                <div class="pull-right">
                    <button class="btn btn-default reset-btn J_resetBtn" type="reset">重置
                    </button>
                </div>
            </div>
        </div>
    </form>
</div>
<script type="text/javascript">
    $(function() {

        if ($(".J_tip")) {
            setTimeout(function () {
                $(".J_tip").hide();
            }, 3000);
        }

        /**
         * 输入用户名提示
         */
        $(".J_username").focus(function(){
            if($(this).val() == ""){
                $(".J_username+.input-tip").addClass("show");
                $(".J_username+.input-tip+.empty-tip").removeClass("show");
            }else{
                $(".J_username+.input-tip").removeClass("show");

            }
        });
        $(".J_username").blur( function () {
            if($(this).val() == ""){
                $(".J_username+.input-tip").removeClass("show");
                $(".J_username+.input-tip+.empty-tip").addClass("show");
            }else{
                $(".J_username+.input-tip").removeClass("show");

            }
        });
        /**
         * 输入密码提示
         */
        $(".J_pwd").focus(function(){
            if($(this).val() == ""){
                $(".J_pwd+.input-tip").addClass("show");
                $(".J_pwd+.input-tip+.empty-tip").removeClass("show");
            }else{
                $(".J_pwd+.input-tip").removeClass("show");

            }
        });
        $(".J_pwd").blur( function () {
            if($(this).val() == ""){
                $(".J_pwd+.input-tip").removeClass("show");
                $(".J_pwd+.input-tip+.empty-tip").addClass("show");
            }else{
                $(".J_pwd+.input-tip").removeClass("show");

            }
        });
        /**
         * 记住登录状态
         */
//        var rememberStatus = $(".J_remember").attr("checked"),
//                remember;
//        if(rememberStatus == "checked"){
//            $(".J_remember").attr("checked","checked");
//            remember=1;
//        }else{
//            $(".J_remember").removeAttr("checked");
//            remember=0;
//        }
//        $(".J_remember").change(function (){
//            $(".J_remember").attr("checked","checked");
//            remember+=1;
//            if (remember==2) {
//                remember=0;
//                rememberStatus="unchecked";
//            }else{
//                rememberStatus="checked";
//            }
//            // console.log(remember);
//        } ) ;

        /**
         * 验证并提交
         */
        $(".J_loginForm").submit( function () {
            if ($(".J_username").val() == "") {
                $(".J_username+.input-tip").removeClass("show");
                $(".J_username+.input-tip+.empty-tip").addClass("show");
            }
            if ($(".J_pwd").val().length<6) {
                $(".J_pwd+.input-tip").removeClass("show");
                $(".J_pwd+.input-tip+.empty-tip").addClass("show");
            }
            if (($(".J_username").val() == "")||($(".J_pwd").val().length<6)){
                return false;
            }else{
//                $.ajax({
//                    type: 'post',
//                    url: '/login',
//                    data: {username:username,password:password,remember:remember},
//                    success: function(data) {
//
//                    }
//                });
            }
        });

        /**
         * 重置提示信息
         */
        $(".J_resetBtn").click( function () {
            $(".J_username+.input-tip+.empty-tip").removeClass("show");
            $(".J_pwd+.input-tip+.empty-tip").removeClass("show");
        });
//        if (remember==1) {
//            $(".J_resetBtn").click( function () {
//                $(".J_remember").attr("checked","checked");
//            });
//        }
    })
</script>
</body>
</html>