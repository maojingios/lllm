package com.lllm.hotinfo.domain.entity;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.lllm.hotinfo.domain.entity.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = true)
public class BaseTreeEntity extends BaseEntity {
    //是否为父类
    @JsonProperty(value = "isParent")
    private boolean isParent;
    //父类id
    protected long parentId;
}
