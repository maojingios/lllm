package com.lllm.hotinfo.ui.utils;

import org.springframework.ui.Model;

import java.util.Date;

public class TimeUtils {

    public static void getNow(Model model){
        Date now = new Date();
        model.addAttribute("now",now);
    }
}
