package com.lllm.hotinfo.ui.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @author carrot
 * @create 2018-09-26-16:25
 */
@Controller
public class UserController {

    @RequestMapping(value = "setCollection", method = RequestMethod.GET)
    public String setCollection() {
        return "modules/user/setCollection";
    }

    @RequestMapping(value = "msgBox", method = RequestMethod.GET)
    public String messageBox() {
        return "modules/user/messageBox";
    }

    @RequestMapping(value = "accountSet", method = RequestMethod.GET)
    public String accountSet() {
        return "modules/user/accountSet";
    }

    @RequestMapping(value = "accountAppeal", method = RequestMethod.GET)
    public String accountAppeal() {
        return "modules/user/accountAppeal";
    }
}
