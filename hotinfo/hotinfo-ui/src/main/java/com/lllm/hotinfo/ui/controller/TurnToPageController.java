package com.lllm.hotinfo.ui.controller;

import com.lllm.hotinfo.ui.utils.TimeUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class TurnToPageController {

    @RequestMapping(value = "turn/to/detail", method = RequestMethod.GET)
    public String turnToPage(Model model){
        TimeUtils.getNow(model);
        return "content";
    }
}
