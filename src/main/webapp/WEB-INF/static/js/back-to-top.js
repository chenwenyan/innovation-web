$(function(){
    $(window).scroll(function () {
        var scrollValue = $(window).scrollTop();
        scrollValue > 100 ? $('.back-to-top').fadeIn() : $('.back-to-top').fadeOut();
    });

    //返回顶部
    $(".back-to-top").click(function(){
        $("html,body").animate({scrollTop: '0px'}, 1000);
        return false;
    });
});