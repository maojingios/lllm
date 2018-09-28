package com.lllm.hotinfo.domain.entity;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.lllm.hotinfo.domain.entity.BaseTreeEntity;
import lombok.Data;

@Data
public class Category extends BaseTreeEntity {

    private String parentTitle;
    @JsonProperty("getUrl")
    private String url;
    @JsonProperty("name")
    private String title;
    private int sortOrder;
}
