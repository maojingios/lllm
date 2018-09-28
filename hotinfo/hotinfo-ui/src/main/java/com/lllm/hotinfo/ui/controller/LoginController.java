package com.lllm.hotinfo.ui.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @author carrot
 * @create 2018-09-25-14:51
 */
@Controller
public class LoginController {

    @RequestMapping(value = "loginPage", method = RequestMethod.GET)
    public String login() {
        return "login";
    }


    @RequestMapping(value = "findPassword", method = RequestMethod.GET)
    public String findPassWd() {
        return "modules/user/find/password";
    }

    @RequestMapping(value = "appeal", method = RequestMethod.GET)
    public String appeal() {
        return "modules/user/appeal";
    }



}
