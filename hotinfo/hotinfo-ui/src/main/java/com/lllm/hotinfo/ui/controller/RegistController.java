package com.lllm.hotinfo.ui.controller;

import com.google.code.kaptcha.Constants;
import com.lllm.hotinfo.ui.dto.HiUser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

/**
 * @author carrot
 * @create 2018-09-25-16:27
 */
@Controller
public class RegistController {

    @RequestMapping(value = "registPage", method = RequestMethod.GET)
    public String registPage() {
        return "regist";
    }

    @RequestMapping(value = "regist", method = RequestMethod.POST)
    public String regist(HiUser user, Model model, HttpServletRequest request) {
        //验证码验证错误
        if(!checkCode(user, request)) {
            model.addAttribute("message","验证码错误！");
            return "regist";
        }
        //手机是否已注册
        int count = 0;//selectByPhone(user.getPhone());
        if(count > 0) {
            model.addAttribute("msg","该手机已注册，请直接登录!");
            return "login";
        }

        //注册成功
        return "login";

    }


    /**
     * 检查验证码
     */
    private boolean checkCode(HiUser user, HttpServletRequest request) {
        String code = (String) request.getSession().getAttribute(Constants.KAPTCHA_SESSION_KEY);
        if(user.getCode().equals(code)) {
            return true;
        }

        return false;
    }
}
