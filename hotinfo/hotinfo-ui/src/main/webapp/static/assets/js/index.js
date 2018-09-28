(function(){
    //lazy-load
    var lazyLoad = function($el){
        $el.find(".smart-load").each(function(i,v){
            var $v = $(v);
            if(!$v.prop('src')){
                $v.prop('src',$v.data('src'));
            }
        })
    }

    //列表切换
    var arrangement_index = 0;
    var list_index = 0;
    var $arrangement = $(".arrangement");
    $("#arrangement-list a").click(function(e){
        var $el =$(this);
        $("#arrangement-list a").removeClass("on");
        $el.addClass("on");
        arrangement_index = $el.data('arrangement');
        $arrangement.eq(arrangement_index).find(".type-item").hide();
        $arrangement.eq(arrangement_index).find(".type-item").eq(list_index).show();
        $arrangement.fadeOut();
        $arrangement.eq(arrangement_index).fadeIn();
        lazyLoad($arrangement.eq(arrangement_index).find(".type-item").eq(list_index));
        
    });

    $("#change-type li").click(function(e){
        
        var $el =$(this);
        $("#change-type li").removeClass("active");
        $el.addClass("active");
        list_index = $el.index();
        $arrangement.eq(arrangement_index).find(".type-item").hide();
        $arrangement.eq(arrangement_index).find(".type-item").eq(list_index).show();
        lazyLoad($arrangement.eq(arrangement_index).find(".type-item").eq(list_index));
    });

    $("#change-type li").eq(0).trigger("click");

    /*(function(){
        var num = 0;
        var width = 0;
        var html = "";
        html = $("#hotcontent-scroll .scroll").html();
        html +=html;
        $("#hotcontent-scroll .scroll").html(html);
        $("#hotcontent-scroll li").each(function(i,v){
            var $v = $(v);
            width +=$v.width();
        });
    
        function goLeft() {
            //750是根据你给的尺寸，可变的
            if (num <= -(width/2+$("#hotcontent-scroll li").eq(0).width()+20)) {
                num = 0;
            }
            num -= 1;
            $("#hotcontent-scroll .scroll").css({
                left: num
            })
        }
        //设置滚动速度
        var timer = setInterval(goLeft, 50);
        
        
        $("#hotcontent-scroll .scroll").css({
            width:width
        })
        
        //设置鼠标经过时滚动停止
        $("#hotcontent-scroll").hover(function() {
            clearInterval(timer);
        },
        function() {
            timer = setInterval(goLeft, 50);
        })
    })()*/
})();