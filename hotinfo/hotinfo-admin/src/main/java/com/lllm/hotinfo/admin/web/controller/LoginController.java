package com.lllm.hotinfo.admin.web.controller;


import com.lllm.hotinfo.admin.service.UserService;
import com.lllm.hotinfo.admin.util.SystemConstants;
import com.lllm.hotinfo.common.util.CookieUtils;
import com.lllm.hotinfo.common.util.PWDUtils;
import com.lllm.hotinfo.domain.entity.HiUser;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class LoginController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = {SystemConstants.ACTION_LOGIN, ""}, method = RequestMethod.GET)
    public String Login(HttpServletRequest req, HiUser hiUser) {
        isHaveRCookie(req, hiUser);
        if (isHaveACookie(req)) {
            return "redirect:/main";
        }
        return SystemConstants.ACTION_LOGIN;
    }

    @RequestMapping(value = SystemConstants.ACTION_LOGIN, method = RequestMethod.POST)
    public String login(HiUser hiUser, HttpServletRequest req, HttpServletResponse resp, RedirectAttributes attributes) {
        HiUser admin = userService.getByUserName(hiUser.getUserName(), hiUser.getPassWord());
        //判断是否记住账号
        if ("on".equals(hiUser.getIsRemember())) {
            CookieUtils.setCookie(req, resp, SystemConstants.REMEMBER_COOKIE, hiUser.getUserName(), 7 * 24 * 3600);
        }
        //不需要记住我,清掉cookie
        else {
            deleteAllCookies(req, resp);
        }
        if (admin == null) {
            attributes.addFlashAttribute(SystemConstants.ERROR_INFO, "用户名或密码错误");
            return "redirect:/login";
        }
        //登陆成功
        else {
            //判断是否自动登陆
            if ("on".equals(hiUser.getAutoLogin())) {
                String password = PWDUtils.EncryptedPWD(hiUser.getPassWord(),20);
                CookieUtils.setCookie(req, resp, SystemConstants.AUTO_COOKIE, String.format("%s-%s", hiUser.getUserName(),
                                       password), 7 * 24 * 3600);
            }
            req.getSession().setAttribute(SystemConstants.SESSION_ADMIN, admin);
            return "redirect:/main";
        }
    }

    /*删除cookie*/
    private void deleteAllCookies(HttpServletRequest req, HttpServletResponse resp) {
        CookieUtils.deleteCookie(req, resp, SystemConstants.REMEMBER_COOKIE);
        CookieUtils.deleteCookie(req, resp, SystemConstants.AUTO_COOKIE);
    }

    /*有无cookie要做的事*/
    private void isHaveRCookie(HttpServletRequest req, HiUser hiUser) {
        String RCookie = CookieUtils.getCookieValue(req, SystemConstants.REMEMBER_COOKIE);
        /*isNotBlank判断字符串去空后是否为空
        isEmpty判断字符串去空前是否为空,(不加trim())*/
        if (StringUtils.isNotBlank(RCookie)) {
            String[] cookies = RCookie.split("-");
            HiUser admin = userService.getByUserName(cookies[0]);
            hiUser.setIsRemember("on");
            req.getSession().setAttribute(SystemConstants.SESSION_ADMIN, admin);
        } else {
            req.getSession().removeAttribute(SystemConstants.SESSION_ADMIN);
        }
    }

/*    *//*判断是否有cookie*//*
    private boolean isHaveACookie(HttpServletRequest req) {

        String ACookie = CookieUtils.getCookieValue(req, SystemConstants.AUTO_COOKIE);
        if (StringUtils.isNotBlank(ACookie)){
            String[] cookies = ACookie.split("-");
            HiUser hiUser = new HiUser();
            hiUser.setUserName(cookies[0]);
            hiUser.setPassWord(cookies[1]);
            if (userService.checkACookie(hiUser) > 0) {
                return true;
            }
        }
        return false;
    }*/
/*判断是否有cookie*/
private boolean isHaveACookie(HttpServletRequest req) {
    String ACookie = CookieUtils.getCookieValue(req, SystemConstants.AUTO_COOKIE);
    if (StringUtils.isNotBlank(ACookie)) {
        return true;
    }
    return false;
}
}
