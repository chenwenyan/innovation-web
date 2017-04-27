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
                    <h3 class="text-center">校团委</h3>
                    <div class="text-center">
                        京东于2004年正式涉足电商领域。2015年，京东集团市场交易额达到4627亿元，净收入达到1813亿元，年交易额同比增长78%，增速是行业平均增速的2倍*。京东是中国收入规模最大的互联网企业。2016年7月，京东入榜2016《财富》全球500强，成为中国首家、唯一入选的互联网企业。截至2016年6月30日，京东集团拥有超过11万名正式员工，业务涉及电商、金融和技术三大领域。
                        2014年5月，京东集团在美国纳斯达克证券交易所正式挂牌上市，是中国第一个成功赴美上市的大型综合型电商平台，并成功跻身全球前十大互联网公司排行榜，2015年7月，京东凭借高成长性入选纳斯达克100指数和纳斯达克100平均加权指数。
                    </div>
                    <h3 class="tit-title">科研中心</h3>
                    <div class="text-center">
                        京东商城目前已成长为中国最大的自营式电商企业，2015年第三季度在中国自营式B2C电商市场的占有率为56.9%*。京东商城致力于为消费者提供愉悦的在线购物体验，自2004年成立以来，坚持“正品行货”的理念，对假货零容忍；采取六大品控措施，保障正品，大量品牌直供，从源头杜绝假货。通过内容丰富、人性化的网站（www.jd.com
                        ）和移动客户端，京东商城以富有竞争力的价格，提供具有丰富品类及卓越品质的商品和服务，以快速可靠的方式送达消费者，并且提供灵活多样的支付方式。京东商城致力于打造一站式综合购物平台，服务中国亿万家庭，3C事业部、家电事业部、消费品事业部、服饰家居事业部、生鲜事业部和新通路事业部六大部门领航发力，覆盖用户多元需求。同时，京东商城还为第三方卖家提供在线销售平台和物流等一系列增值服务。
                    </div>
                    <h3 class="tit-title">联系方式</h3>
                    <div class="text-center">
                        张三： 18912121212
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

