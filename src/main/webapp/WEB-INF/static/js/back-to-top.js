$(function(){
    //返回顶部
    $(".back-to-top").click(function(){
        $("html,body").animate({scrollTop: '0px'}, 1000);
        return false;
    });
});