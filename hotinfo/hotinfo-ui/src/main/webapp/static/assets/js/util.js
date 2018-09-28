var util = {
  // top:function(){
  //   var title = $('title').html();
  //   var html = '<div class="top_wrap">\
  //       <img src="images/logo.png" alt="新民网" class="us_logo"/>\
  //       <h2 id="us_name">'+ title +'</h2>\
  //       <div class="us_reg absimg">\
  //         <span>没有账号？</span>\
  //         <a href="//172.25.43.71/template/wangkangyin/xm_web20171211/regsiter.html" target="_blank">立即注册</a>\
  //       </div>\
  //     </div>';
  //   $(".tsbg").empty().append(html);
  // },
  // rightBar:function(){
  //   var html ='<div class="us_ewm_wrap">\
  //       <h2 class="us_title">新民客户端下载</h2>\
  //       <img src="images/erweima.png" alt="新民App" />\
  //     </div>'
  //   $(".us_erweima_box").empty().append(html);
  // },
  // nav:function(){
  //   var html = '<li>\
  //           <a data-href="uc_frame.html" data-title="我的收藏" href="javascript:void(0)" class="lf_active">\
  //             <div class="us_lf_icon lf_icon1"></div>\
  //             <span>我的收藏</span>\
  //           </a>\
  //         </li>\
  //         <li>\
  //           <a  data-href="msg_frame.html" data-title="站内信" href="javascript:void(0)">\
  //             <div class="us_lf_icon lf_icon2"></div>\
  //             <span>站内信</span>\
  //             <span class="us_qipao">1</span>\
  //           </a>\
  //         </li>\
  //         <li>\
  //           <a data-href="set_frame.html" data-title="账号设置" href="javascript:void(0)">\
  //             <div class="us_lf_icon lf_icon3"></div>\
  //             <span>账号设置</span>\
  //           </a>\
  //         </li>\
  //         <li>\
  //           <a data-href="app_frame.html" data-title="账号异常申诉" href="javascript:void(0)">\
  //             <div class="us_lf_icon lf_icon4"></div>\
  //             <span>账号异常申诉</span>\
  //           </a>\
  //         </li>'
  //   $("#us_leftBar_nav").empty().append(html)
  // },
  red:function(){
    var red = $(".us_qipao").html();
    var num = $("#us_msg_list li").hasClass('us_msg_active');
    // if(num){
    //   $(".us_qipao").css({"display":"inline-block"});
    // }
    if(red > 99 && red <= 999){
      $(".us_qipao").css({"width":"25px"});
    }else if(red > 999 && red <= 9999){
      $(".us_qipao").css({"width":"35px"});
    }
  },
  next:function(){
    if($("#us_msg_list li").length > 10){
      $(".us_next_box").show();
    }else{
      $(".us_next_box").hide();
    }
  },
  del:function(){
    if($("#us_sc_list li").length == 0){
      $(".us_sc_del").hide();
    }else{
      $(".us_sc_del").show();
    }
  },
  errnotice:function(id,errmsg){
    var nowtext = $(id).val();
    $(id).val('');
    $(id).attr('placeholder',errmsg);
    setTimeout(function(){
      $(id).val(nowtext);
    },500);
  },
  k_tab:function(obj){
    var bStop = false,
    bStopIndex = 0,
    href = $(obj).attr('data-href'),
    title = $(obj).attr("data-title"),
    topWindow = $(window.parent.document),
    show_navLi = topWindow.find("li"),
    iframe_box = topWindow.find("#iframe_box");
    //console.log(topWindow);
    if(!href||href==""){
      alert("无效链接");
      return false;
    }if(!title){
      alert("无效标题");
      return false;
    }
    if(title==""){
      alert("标题为空");
      return false;
    }
    iframe_box.find(".iframe_wrap").each(function() {
      if($(this).attr("data-href") == href){
        bStop=true;
        bStopIndex=show_navLi.index($(this));
        return false;
      }
    });
    if(!bStop){
      util.creatFrame(href,title);
    }else{
      iframe_box.find(".iframe_wrap").hide().eq(bStopIndex).show().find("iframe").attr("src",href);
      console.log(bStopIndex);
    } 
  },
  creatFrame:function(href,titleName){
    var topWindow=$(window.parent.document),
    iframe_box=topWindow.find('#iframe_box'),
    iframeBox=iframe_box.find('.iframe_wrap');
    iframeBox.hide();
    iframe_box.append('<div class="iframe_wrap" data-href="'+href+'"><iframe src="'+href+'" frameborder="0" height="650px" width="935px" scrolling="yes" style="overflow:auto;"></iframe></div>');
    // var showBox=iframe_box.find('.iframe_wrap:visible');
    // showBox.find('iframe').bind("load",function(){
    //   showBox.find('.loading').hide();
    // });
  },
  validate:function(){
    var passwords = /^(?![^a-zA-Z]+$)(?!\D+$).{2,10}/;
    var idents = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
    var name = $("#name").val(),
    user =$("#user").val(),
    phone =$("#phone").val(),
    password =$("#password").val(),
    repassword =$("#repassword").val(),
    ident =$("#ident").val(),
    code=$("#code").val();
    if(!name){
      this.errnotice('#name','请输入姓名');
    }else if(!user){
      this.errnotice('#user','请输入账号');
    }else if(!phone){
      this.errnotice('#phone','请输入电话号码');
    }else if(!password){
      this.errnotice('#password','请输入密码');
    }else if(!repassword){
      this.errnotice('#repassword','请输入重复密码');
    }else if(!ident){
      this.errnotice('#ident','请输入身份证');
    }else if(!code){
      this.errnotice('#code','请输入验证码');
    }else if(!password.test(passwords)){
      this.errnotice('#password','需英文字母与数字组合');
    }else if(repassword != password){
      this.errnotice('#repassword','密码不相同');
    }else if(!idents.test(ident)){
      this.errnotice('#ident','身份证格式错误');
    }else if(isNaN(phone)){
      errnotice('#phone','移动电话必须为数字');
    }else{
      $("form").submit();
    }
  }
};