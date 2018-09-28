package com.lllm.hotinfo.domain.entity.crawler;

import lombok.Data;

import java.util.Date;

@Data
public class CrawlerDetailContent {
    private long id;
    private long parentId;
    private String aTitle;
    private String topNav;
    private String info;
    private String aContent;
    private String todayHots;
    private String news24H;
    private int delFlag;
    private Date created;
    private Date updated;
}
