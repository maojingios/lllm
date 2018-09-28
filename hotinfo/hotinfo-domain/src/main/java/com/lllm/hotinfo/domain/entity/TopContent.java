package com.lllm.hotinfo.domain.entity;

import lombok.Data;

@Data
public class TopContent extends BaseEntity {
    private String title;
    private String url;
    private String pic;
    private String descr;
    private String tag;
    private String classify;

}
