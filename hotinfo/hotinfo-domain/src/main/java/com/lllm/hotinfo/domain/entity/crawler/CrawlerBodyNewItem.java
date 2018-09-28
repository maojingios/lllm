package com.lllm.hotinfo.domain.entity.crawler;

import lombok.Data;

import java.util.Date;

@Data
public class CrawlerBodyNewItem {
    private long id;
    private Long parentId;
    private String classify;
    private String title;
    private String url;
    private String pic;
    private String descr;
    private String tag;
    private int delFlag;
    private Date created;
    private Date updated;
}
