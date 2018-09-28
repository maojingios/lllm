package com.lllm.hotinfo.domain.entity;

import lombok.Data;
import java.util.Date;

@Data
public class BaseEntity {
    private long id;
    private int start;
    private int length;
    private int delFlag;
    private Date created;
    private Date updated;
}
