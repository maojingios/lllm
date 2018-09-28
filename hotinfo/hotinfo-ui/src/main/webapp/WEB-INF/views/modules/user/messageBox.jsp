<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/includes/user/taglib.jsp"%>
<html>
<head>
    <title>站内信-新民网通行证</title>
    <jsp:include page="${ctxInclude}/head.jsp"/>
</head>
<body class="umsg us_new_box">
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
                        <span>用户中心</span>&gt;<span>站内信</span>
                    </div>
                    <div class="us_msg_top">
                        <span>发件人</span>
                        <span>标题</span>
                        <span>日期</span>
                    </div>

                    <ul id="us_msg_list">

                    </ul>
                    <!-- 分页 start -->
                    <style>
                        /*start 分页*/
                        .fenye{width:600px; height:auto; overflow:hidden; float:right}
                        .postiontop{position:relative; top:-40px;}
                        .pageBox{ width:auto; height:auto;float:right;  line-height:30px; margin-right:35px; display:inline}
                        .pageBox .unselect{  border:1px solid #a09f9f;color:#e3194b; padding:3px 8px;height:20px; margin-left:2px; margin-right:2px;}
                        .pageBox .selected{  border:1px solid #a09f9f;color:#e3194b;; background:#ddeefe;padding:3px 8px;height:20px; margin-left:2px; margin-right:2px}
                        .pageBox .number{padding:3px 8px; _padding:4px 8px;}
                        .pageBox a:link {color: #e3194b; text-decoration:none;}
                        .pageBox a:visited {color: #e3194b;text-decoration:none;}
                        .pageBox a:hover {color:#e3194b; text-decoration:underline}
                        .pageBox a:active {color: #e3194b;}
                        .backtop{position: relative;top: 20px;left: 30px;cursor: pointer;display: block;width: 72px;height: 15px;background: url(//image.xinmin.cn/template/www.xinmin.cn/201210/images/backtop.jpg) no-repeat;}
                        /*end 分页*/
                    </style>
                    <div class="fenye">
                    </div>
                    <!-- 分页 end -->
                    <!-- <div class="us_next_box"><a href="#" class="us_msg_next">下一页</a></div>  请干掉JS CSS-->
                </div>
            <%--详情/--%>
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
            util.next();
            $.showTime();
        });

        $("#us_msg_list li").delegate(".us_sc_title",'click',function(){
            util.red();
            $(this).parent().removeClass('us_msg_active');
            $(this).prev('.msg_outbox').find('.msg_red').remove();
        });

        $(".us_leftbar li a").click(function(){
            $(this).addClass('lf_active').parent().siblings('li').find('a').removeClass('lf_active');
        });

        $("#us_msg_list li").hover(function(){
            $(this).css({'background-color':'#fafafa'});
            $(this).find('.us_sc_close').show();
        },function(){
            $(this).css({'background-color':'transparent'});
            $(this).find('.us_sc_close').hide();
        });

        $(".us_sc_close").click(function(){
            $(".del-box").show();
        });
        $(".us_tk_ok").click(function(){
            $("#us_msg_list li").each(function(i){
                var id = $(this).eq(i).data('id');
                var _this = $(this).eq(i);
                if(typeof id != 'undefined' && id !='')
                {
                    $.ajax({
                        type: 'POST',
                        data:{id:id},
                        url: '/index.php?app=uc&controller=MsgBox&action=del',
                        dataType: 'json',
                        success: function(data){
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
            util.next();
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
