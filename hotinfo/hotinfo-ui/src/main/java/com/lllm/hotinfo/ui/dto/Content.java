package com.lllm.hotinfo.ui.dto;

import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;
import java.util.Date;

@Data
public class Content implements Serializable{
    private long id;
    private String title;
    private String classify;
    private String desc;
    private String url;
    private String pic;
    private String tag;
    private String parentName;
    private Date releaseTime;
}
