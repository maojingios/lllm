package com.lllm.hotinfo.ui.dto;

import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;

@Data
public class Navigation implements Serializable {

    private long id;
    private long parentId;

    //导航栏标题名称
    private String name;

    //导航栏对应跳转的地址
    private String url;

    //在前端页面的 id 选择器名称
    private String nav_sp;

}
