package com.lllm.hotinfo.admin.web.controller;


import com.lllm.hotinfo.admin.service.UserService;
import com.lllm.hotinfo.admin.util.RegexpUtils;
import com.lllm.hotinfo.admin.util.SystemConstants;
import com.lllm.hotinfo.domain.entity.HiUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping(value = SystemConstants.SESSION_ADMIN)
public class AdminController {

    @Autowired
    private UserService userService;

    /*更新页面数据回显*/
    @ModelAttribute
    public HiUser getHiUserById(String id , HttpServletRequest req){
        HiUser admin = (HiUser) req.getSession().getAttribute(SystemConstants.SESSION_ADMIN);
        if (admin!=null){
            /*重新把管理员的信息写进session,防止信息于修改页面同步被修改,使展示页面不会显示异常*/
            HiUser HiUserById = userService.getTById(admin.getId());
            req.getSession().setAttribute(SystemConstants.SESSION_ADMIN,HiUserById);
            return admin;
        }else if (id == null||"0".equals(id)){
            admin = new HiUser();
        }
        else{
            admin = userService.getTById(Long.parseLong(id));
        }
        return admin;
    }

    /*返回展示和展示管理员个人*/
    @RequestMapping(value = {"profile","goBack"},method = RequestMethod.GET)
    public String profile(HttpServletRequest req){
        if ("/admin/profile".equals(req.getRequestURI())){
            return SystemConstants.GO_ADMIN_PROFILE;
        }
        else{
            return SystemConstants.REDIRECT_PROFILE;
        }
    }

    /*跳转到更新页面*/
    @RequestMapping(value = "updateAdminInfo",method = RequestMethod.GET)
    public String updateInfo(){
        return SystemConstants.GO_ADMIN_FORM;
    }

    /*确认更新请求*/
    @RequestMapping(value ="confirmUpdateInfo",method = RequestMethod.POST)
    public String confirmUpdateInfo(HiUser HiUser, HttpServletRequest req, Model model) {

        String results  = userService.validationInfo(HiUser,SystemConstants.ACTION_ADMIN_UPDATE);
        if ("0".equals(results)) {
            req.getSession().setAttribute(SystemConstants.SESSION_ADMIN, HiUser);
            return SystemConstants.REDIRECT_PROFILE;
        } else {
            RegexpUtils.checkInfo(results,model);
            return SystemConstants.GO_ADMIN_FORM;
        }
    }
}
