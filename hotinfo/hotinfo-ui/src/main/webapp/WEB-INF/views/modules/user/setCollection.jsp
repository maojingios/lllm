<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/includes/user/taglib.jsp"%>
<html>
<head>
    <title>我的收藏 - 新民网通行证</title>
    <jsp:include page="${ctxInclude}/head.jsp"/>
</head>
<body class="usercenter us_new_box">
<%--顶部--%>
<jsp:include page="${ctxInclude}/top.jsp"/>
<%--顶部/--%>
<%--内容--%>
<div class="PageCoreBg us_wrap_bg">
    <div class="PageCore">
        <div class="bar_wrap">
            <%--菜单--%>
            <jsp:include page="${ctxInclude}/menu.jsp"/>
            <%--菜单/--%>
            <%--详情--%>
            <div class="us_rightbar">
                <div class="us_right_head">
                    <span>用户中心</span>&gt;<span>我的收藏</span>
                </div>
                <ul id="us_sc_list">

                </ul>
                <p class="us_sc_del" style="display: none;">全部删除</p>
            </div>
            <%--详情/--%>
        </div>

        <div class="tk-box dels-box">
            <div class="tk-wrapper-box">
                <div class="tk-wrapper">
                    <h1>是否要全部删除?</h1>
                    <div class="btn-box">
                        <span class="us_tk_oks">确认</span>
                        <span class="us_tk_cannel">取消</span>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>

        <div class="tk-box del-box">
            <div class="tk-wrapper-box">
                <div class="tk-wrapper">
                    <h1>是否要删除?</h1>
                    <div class="btn-box">
                        <span class="us_tk_ok">确认</span>
                        <span class="us_tk_cannel">取消</span>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>

    </div>
</div>
<%--内容/--%>
<jsp:include page="${ctxInclude}/foot.jsp"/>
<script type="text/javascript">
    (function(){
        $(window).load(function(){
            util.red();
            util.del();
            $.showTime();
        });

        // $("#us_leftBar_nav li").on("click","a",function(){
        //   $(this).addClass('lf_active').parent().siblings('li').find('a').removeClass('lf_active');
        // });

        $("#us_sc_list li").hover(function(){
            $(this).css({'background-color':'#fafafa'});
            $(this).find('.us_sc_close').show();
        },function(){
            $(this).css({'background-color':'transparent'});
            $(this).find('.us_sc_close').hide();
        });

        $(".us_sc_close").click(function(){
            $(".del-box").show();
        });
        $(".us_sc_del").click(function(){
            $(".dels-box").show();
        });
        $(".us_tk_ok").click(function(){
            $("#us_sc_list li").each(function(i){
                var id = $(this).eq(i).data('id');
                var _this = $(this).eq(i);
                if(typeof id != 'undefined' && id !='')
                {
                    $.ajax({
                        type: 'POST',
                        data:{id:id},
                        url: '/index.php?app=uc&controller=Set&action=delCollect',
                        dataType: 'json',
                        success: function(data){
                            console.log(data);
                            if(data.status==1)
                            {
                                _this.remove();
                            }
                        },
                        error:function(data) {

                        },
                    });
                }
            });
            util.red();
            util.del();
            $('.tk-box').hide();
        });

        $(".us_tk_oks").click(function(){
            var arr = $("#us_sc_list").children("li");
            var ids = '';
            for(var i = 0; i < arr.length;i++)
            {
                ids += $(arr[i]).attr("data-id") +",";
            }
            if(typeof ids != 'undefined' && ids !='')
            {
                $.ajax({
                    type: 'POST',
                    data:{id:ids},
                    url: '/index.php?app=uc&controller=Set&action=delCollect',
                    dataType: 'json',
                    success: function(data){
                        if(data.status==1)
                        {
                            window.location.href="/index.php?app=uc&controller=Set";
                        }
                    },
                    error:function(data) {

                    },
                });
            }
            util.red();
            util.del();
            $('.tk-box').hide();
        });
        $(".us_tk_cannel").click(function(){
            $('.tk-box').hide();
        });
        timer = setInterval($.showTime,5000);
    })();
</script>
</body>
</html>
