<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <jsp:include flush="true" page="/WEB-INF/views/display/common/head.jsp"/>
</head>
<body>
<jsp:include flush="true" page="/WEB-INF/views/display/common/header.jsp"/>
<jsp:include flush="true" page="/WEB-INF/views/display/common/side-bar.jsp"/>
<div class="public">
    <div class="container">
        <div class="row">
            <div class="col-sm-10 col-sm-offset-1 panel panel-default panel-top">
                <div class="panel-heading top-heading">
                        <span class="panel-title top-location"><i class="fa fa-map-marker my-current-location"></i>&nbsp;&nbsp;当前位置：
                            <a href="/main">首页</a> > 关于我们
                        </span>
                </div>
                <div class="panel-body" style="margin-left: 10px">
                    <h3 class="text-center">东北师范大学大学生创新创业中心</h3>
                    <hr>
                    <div class="col-sm-offset-2">
                        <span class="consult">咨询电话</span>
                        <span>（工作时间：周一至周五  8:00-11:30，13:30-17:00，法定节假日除外）</span>
                        <p class="consult-detail">办公室咨询电话：0431-85099382</p>
                        <span class="consult">通讯地址</span>
                        <p class="consult-detail">吉林省长春市人民大街5268号东北师范大学北苑3楼B05</p>
                        <span class="consult">邮箱</span>
                        <p class="consult-detail">cxcyb@nenu.edu.cn</p>
                        <span class="consult">邮编</span>
                        <p class="consult-detail">130024</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="foot-empty"></div>
<jsp:include flush="true" page="/WEB-INF/views/display/common/footer.jsp"/>
<a href="#" class="back-to-top"><i class="fa fa-angle-double-up"></i></a>
</body>
</html>

