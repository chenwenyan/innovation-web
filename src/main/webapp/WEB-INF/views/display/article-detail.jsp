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
<div class="img-container container">
    <img src="/img/college.jpg" alt="大学生创新创业计划">
</div>
<div class="public-detail">
    <div class="container">
        <div class="row">
            <div class="col-sm-3 col-sm-offset-1">
                <div class="side-title">
                    <i class="fa fa-list"></i>
                    <span>公&nbsp;&nbsp;告</span>
                </div>
                <ul class="side-ul">
                    <c:if test="${article.typeId == 1 || article.typeId == 2 || article.typeId == 3 || article.typeId == 11}">
                        <li><a href="/more-articles?typeId=1"><i class="fa fa-th"></i>&nbsp;&nbsp;互联网+</a></li>
                        <li><a href="/more-articles?typeId=2"><i class="fa fa-th"></i>&nbsp;&nbsp;创青春</a></li>
                        <li><a href="/more-articles?typeId=3"><i class="fa fa-th"></i>&nbsp;&nbsp;挑战杯</a></li>
                        <li><a href="/more-articles?typeId=11"><i class="fa fa-th"></i>&nbsp;&nbsp;其他比赛</a></li>
                    </c:if>
                    <c:if test="${article.typeId == 4 || article.typeId == 5 || article.typeId == 6 || article.typeId == 7 || article.typeId == 8  }">
                        <li><a href="/more-articles?typeId=4"><i class="fa fa-th"></i>&nbsp;&nbsp;暑期社会实践公告</a></li>
                        <li><a href="/more-articles?typeId=5"><i class="fa fa-th"></i>&nbsp;&nbsp;科研扶持</a></li>
                        <li><a href="/more-articles?typeId=6"><i class="fa fa-th"></i>&nbsp;&nbsp;创业园</a></li>
                        <li><a href="/more-articles?typeId=7"><i class="fa fa-th"></i>&nbsp;&nbsp;企业注册</a></li>
                        <li><a href="/more-articles?typeId=8"><i class="fa fa-th"></i>&nbsp;&nbsp;科研成果</a></li>
                    </c:if>
                    <c:if test="${article.typeId == 9 || article.typeId == 10}">
                        <li><a href="/more-articles?typeId=9"><i class="fa fa-th"></i>&nbsp;&nbsp;国家级创新创业训练计划</a></li>
                        <li><a href="/more-articles?typeId=10"><i class="fa fa-th"></i>&nbsp;&nbsp;科研立项</a></li>
                    </c:if>
                </ul>
                <div class="leftbottom">
                    <img src="/img/leftbottom.png" alt="图片">
                </div>
            </div>

            <div class="col-sm-7 panel panel-default panel-top">
                <div class="panel-heading top-heading">
                                <span class="panel-title top-location"><i class="fa fa-map-marker"></i>&nbsp;当前位置：
                                    <c:if test="${article.typeId == 1 || article.typeId == 2 || article.typeId == 3 || article.typeId == 11}"><a
                                            href="/matches">比赛</a></c:if>

                                    <c:if test="${article.typeId == 4 || article.typeId == 5 || article.typeId == 6 || article.typeId == 7 || article.typeId == 8 }"><a
                                            href="/plans">计划</a></c:if>
                                    <c:if test="${article.typeId == 9 || article.typeId == 10}"><a
                                            href="/projects">立项</a></c:if>
                                     >
                                    <a href="/more-articles?typeId=${typeId}">
                                     <c:if test="${article.typeId == 1 }">互联网+</c:if>
                                     <c:if test="${article.typeId == 2 }">创青春全国大学生创业大赛</c:if>
                                     <c:if test="${article.typeId == 3 }">挑战杯</c:if>
                                     <c:if test="${article.typeId == 4 }">暑期社会实践公告</c:if>
                                     <c:if test="${article.typeId == 5 }">科研扶持</c:if>
                                     <c:if test="${article.typeId == 6 }">创业园</c:if>
                                     <c:if test="${article.typeId == 7 }">企业注册</c:if>
                                     <c:if test="${article.typeId == 8 }">科研成果</c:if>
                                     <c:if test="${article.typeId == 9 }">国家级创新创业训练计划</c:if>
                                     <c:if test="${article.typeId == 10 }">科研立项</c:if>
                                     <c:if test="${article.typeId == 11 }">其他比赛</c:if>
                                    </a>
                                    > 通知公告
                                </span>
                </div>
               <div class="panel-body">
                <div>
                    <h3 class="text-center">${article.title}</h3>
                </div>
                <div class="text-center" style="font-size: 12px">
                    <span>发布时间：</span>
                    <span><fmt:formatDate value="${article.createdTime}" pattern="yyyy-MM-dd"/></span>
                    <span>&nbsp;&nbsp;&nbsp;&nbsp;发布单位：</span>
                    <span>${article.schoolName}</span>
                    <span>&nbsp;&nbsp;&nbsp;&nbsp;浏览：</span>
                    <span>${article.readNum}</span>
                    <span>次</span>
                </div>
                <hr>
                <div class="content-padding">
                    ${article.content}
                </div>
               <div class="content-padding">
                   <c:if test="${files.size() > 0}">
                       <label class="label-control">附件：</label>
                       <div class="file-ff">
                           <c:forEach var="file" items="${files}">
                               <a href="${website}/file/download?fileId=${file.id}" class="file_download">${file.name}</a>
                               <br>
                           </c:forEach>
                       </div>
                   </c:if>
               </div>
            </div>
        </div>
    </div>
</div>
</div>
<jsp:include flush="true" page="/WEB-INF/views/display/common/footer.jsp"/>
<a href="#" class="back-to-top"><i class="fa fa-angle-double-up"></i></a>
</body>
</html>

