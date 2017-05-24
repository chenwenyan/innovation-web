<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="row">
    <div class="col-sm-12">
        <nav class="navbar navbar-default navbar-static-top admin-nav J_admin_nav">
            <a class="pull-left logo-text menu-list-logo" href="javascript:;"><i class="fa fa-book"></i>&nbsp;大学生创新创业计划培训工程</a>
            <a class="pull-right header-menu" href="javascript:;"><i class="fa fa-bars"></i>&nbsp;</a>
            <ul class="nav navbar-nav">

                <li>
                    <a class="menu-list J_layer_1_menu" data-menu-id="1" href="/article/list">文章管理</a>
                    <ul class="dropdown-menu arrow" aria-labelledby="dLabel">
                        <li><a class="J_menu" href="/article/list">文章信息管理</a></li>
                        <li><a class="J_menu" href="/article/add">文章添加管理</a></li>
                    </ul>
                </li>

                <li>
                    <a class="menu-list J_layer_1_menu" data-menu-id="2" href="/project/list">项目管理</a>
                    <ul class="dropdown-menu arrow" aria-labelledby="dLabel">
                        <li><a class="J_menu" href="/project/list">项目信息管理</a></li>
                        <%--<c:if test="${user.schoolId == 0}">--%>
                            <li><a class="J_menu" href="/project/add">项目添加管理</a></li>
                            <li><a class="J_menu" href="/project/add">导入excel模板</a></li>
                        <%--</c:if>--%>
                    </ul>
                </li>
                <c:if test="${user.schoolId == 0}">
                    <li>
                        <a class="menu-list J_layer_1_menu" data-menu-id="2" href="/user/list">用户管理</a>
                        <ul class="dropdown-menu arrow" aria-labelledby="dLabel">
                            <li><a class="J_menu" href="${website}/user/list">用户信息管理</a></li>
                            <li><a class="J_menu" href="${website}/user/add">用户添加管理</a></li>
                        </ul>
                    </li>

                    <li>
                        <a class="menu-list J_layer_1_menu" data-menu-id="0" href="/type/list">文章类别管理</a>
                        <ul class="dropdown-menu arrow" aria-labelledby="dLabel">
                            <li><a class="J_menu" href="/type/list">文章类别管理</a></li>
                            <li><a class="J_menu" href="/type/add">类别添加管理</a></li>
                        </ul>
                    </li>

                    <li>
                        <a class="menu-list J_layer_1_menu" data-menu-id="2" href="/school/list">学院管理</a>
                        <ul class="dropdown-menu arrow" aria-labelledby="dLabel">
                            <li><a class="J_menu" href="/school/list">学院信息管理</a></li>
                            <li><a class="J_menu" href="/school/add">学院添加管理</a></li>
                        </ul>
                    </li>
                </c:if>

            </ul>
            <ul class="nav navbar-nav hello-administrator pull-right">
                <li>
                    <a class="menu-list J_adminInfo" href="javascript:;">你好，${user.username}！<span class="caret"></span></a>
                    <ul class="dropdown-menu arrow" aria-labelledby="dLabel">
                        <%--<li><a href="javascript:;"><i class="fa fa-user"></i>&nbsp;修改个人信息</a></li>--%>
                        <%--<li class="divider"></li>--%>
                        <li><a href="/logout"><i class="fa fa-sign-out"></i>&nbsp;退出登录</a></li>
                    </ul>
                </li>
                <li>
                    <img class="pull-right img-responsive administrator" src="/img/admin.png" alt="管理员图片" title="管理员图片">
                </li>
            </ul>
        </nav>
    </div>
</div>

