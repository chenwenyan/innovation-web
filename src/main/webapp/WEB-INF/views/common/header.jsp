<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="row">
    <div class="col-sm-12">
        <nav class="navbar navbar-default navbar-static-top admin-nav J_admin_nav">
            <%--<a class="left-toggle pull-left" href="javascript:;">--%>
                <%--<i class="fa fa-bars"></i>--%>
            <%--</a>--%>
            <a class="pull-left logo-text menu-list-logo" href="javascript:;"><i class="fa fa-book"></i>&nbsp;大学生创新创业计划工程</a>
            <a class="pull-right header-menu" href="javascript:;"><i class="fa fa-bars"></i>&nbsp;</a>
            <ul class="nav navbar-nav">

                <li >
                    <a class="menu-list J_layer_1_menu" data-menu-id="0" href="/type">文章类别管理</a>
                    <ul class="dropdown-menu arrow" aria-labelledby="dLabel">
                        <li><a class="J_menu" href="/type">文章类别管理</a></li>
                        <li><a class="J_menu" href="/type/add">类别添加管理</a></li>
                    </ul>
                </li>

                <li >
                    <a class="menu-list J_layer_1_menu" data-menu-id="1" href="/article">文章管理</a>
                    <ul class="dropdown-menu arrow" aria-labelledby="dLabel">
                        <li><a class="J_menu" href="/article">文章信息管理</a></li>
                        <li><a class="J_menu" href="/article/add">文章添加管理</a></li>
                    </ul>
                </li>

                <li>
                    <a class="menu-list J_layer_1_menu" data-menu-id="2" href="/user">用户管理</a>
                    <ul class="dropdown-menu arrow" aria-labelledby="dLabel">
                        <li><a class="J_menu" href="/user">用户信息管理</a></li>
                        <li><a class="J_menu" href="/user/add">用户添加管理</a></li>
                    </ul>
                </li>

            </ul>
            <ul class="nav navbar-nav hello-administrator pull-right">
                <li>
                    <a class="menu-list J_adminInfo" href="javascript:;">你好，${user.username}！<span class="caret"></span></a>
                    <ul class="dropdown-menu arrow" aria-labelledby="dLabel">
                        <li><a href="javascript:;"><i class="fa fa-user"></i>&nbsp;修改个人信息</a></li>
                        <li class="divider"></li>
                        <li><a href="/login"><i class="fa fa-sign-out"></i>&nbsp;退出登录</a></li>
                    </ul>
                </li>
                <li>
                    <img class="pull-right img-responsive administrator" src="/img/admin.png" alt="管理员图片" title="管理员图片">
                </li>
            </ul>
        </nav>
    </div>
</div>

