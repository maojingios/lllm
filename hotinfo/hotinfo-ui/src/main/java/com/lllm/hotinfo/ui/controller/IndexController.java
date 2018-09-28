package com.lllm.hotinfo.ui.controller;

import com.lllm.hotinfo.ui.utils.TimeUtils;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.Date;

@Controller
public class IndexController {

    @RequestMapping(value = {"","index"}, method = RequestMethod.GET)
    public String turnToIndex(Model model){
        TimeUtils.getNow(model);
        return "main";
    }
    
}
