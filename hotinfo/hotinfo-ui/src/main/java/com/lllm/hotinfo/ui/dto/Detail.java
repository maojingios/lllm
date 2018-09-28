package com.lllm.hotinfo.ui.dto;

import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;

@Data
public class Detail implements Serializable{

    private long parentId;
    private String aTitle;
    private String topNav;
    private String info;
    private String aContent;
    private String keyWords;
    private String todayHots;
    private String news24H;
}
