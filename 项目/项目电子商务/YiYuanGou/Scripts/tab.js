$(function () {
    $(".top a").click(function () {//鼠标移上的时候获取a的下标
        //var Topindex = $(".top a").index(this);
        //$(".tab").children("div").hide().eq(Topindex).show(); //先隐藏所有DIV然后显示对应下标的DIV
        var Topindex = $(".top a").index(this);
        $(".tabGV").children("GridView").hide().eq(Topindex).show(); //先隐藏所有DIV然后显示对应下标的DIV
    });
});