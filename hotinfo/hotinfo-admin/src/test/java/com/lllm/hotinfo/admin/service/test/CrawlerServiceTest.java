package com.lllm.hotinfo.admin.service.test;

import com.lllm.hotinfo.admin.service.CrawlerService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@ContextConfiguration(locations = {"classpath:spring-context.xml", "classpath:spring-context-druid.xml", "classpath:spring-context-mybatis.xml"})
public class CrawlerServiceTest {

    @Autowired
    private CrawlerService crawlerService;

    @Test
    public void startParentCrawler(){
        String conditions = "url:http://www.xinmin.cn/;pojo:CrawlerCategory;pn_id:MainNav;tn:a;av:href;ht:true;parent:true;part:pac";
        crawlerService.run(conditions);
    }
    @Test
    public void startChildCrawler(){
        String conditions = "url:http://www.xinmin.cn/;pojo:CrawlerCategory;pn_id:MainNav;pn_cl:pull_box;tn:a;av:href;ht:true;parent:true;part:clc";
        crawlerService.run(conditions);
    }

    @Test
    public void startTopNews(){
        String conditions = "url:http://www.xinmin.cn/;part:tpn";
        crawlerService.run(conditions);
    }

    @Test
    public void startBodyCategories(){
        String conditions = "url:http://www.xinmin.cn/;part:mbn";
        crawlerService.run(conditions);
    }
}
