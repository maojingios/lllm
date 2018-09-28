package com.lllm.hotinfo.domain.entity.crawler;

import com.lllm.hotinfo.domain.entity.BaseEntity;
import lombok.Data;

@Data
public class CrawlerCategory extends BaseEntity {
    private Long parentId;
    private int isParent;
    private String dataSubId;
    private String title;
    private String url;
    private int showInBody;
}
