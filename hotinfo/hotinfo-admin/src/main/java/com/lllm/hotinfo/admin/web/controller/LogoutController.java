package com.lllm.hotinfo.admin.web.controller;

import com.lllm.hotinfo.admin.util.SystemConstants;
import com.lllm.hotinfo.common.util.CookieUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping(value = SystemConstants.SESSION_ADMIN)
public class LogoutController {

    /*退出登陆*/
    @RequestMapping(value = "logout",method = RequestMethod.GET)
    public String Logout(HttpServletRequest req, HttpServletResponse resp){
        CookieUtils.deleteCookie(req,resp, SystemConstants.AUTO_COOKIE);
        return "redirect:/login";
    }
}
