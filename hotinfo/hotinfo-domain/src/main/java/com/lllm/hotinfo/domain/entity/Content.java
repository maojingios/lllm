package com.lllm.hotinfo.domain.entity;

import lombok.Data;

@Data
public class Content extends BaseEntity {

    private Category category ;

    private String title;
    private String url;
    private String pic;
    //描述
    private String descr;
    //所属
    private String tag;

    private String classify;

    private int categoryId;
}
