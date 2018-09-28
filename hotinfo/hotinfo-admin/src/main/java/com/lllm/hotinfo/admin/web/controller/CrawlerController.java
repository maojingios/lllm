package com.lllm.hotinfo.admin.web.controller;

import com.lllm.hotinfo.admin.service.CrawlerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping(value = "crawler")
public class CrawlerController {
    @Autowired
    private CrawlerService crawlerService;

    @RequestMapping(value = "conditions",method = RequestMethod.GET)
    public String crawler(){
        return "modules/crawl/crawler";
    }

    @RequestMapping(value = "run" , method = RequestMethod.POST)
    public String run(HttpServletRequest req){
        String conditions = req.getParameter("conditions");
        if (conditions!=null && conditions !=""){
            crawlerService.run(conditions);
        }
        return "modules/crawl/crawler";
    }
}
