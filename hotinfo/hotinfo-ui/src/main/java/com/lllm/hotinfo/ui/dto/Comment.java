package com.lllm.hotinfo.ui.dto;

import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;
import java.util.Date;

@Data
public class Comment implements Serializable {
    private long id;
    private long parentId;
    private String userName;
    private String content;
    private Date createTime;
}
