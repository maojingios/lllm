package com.lllm.hotinfo.domain.entity;

import lombok.Data;

import java.util.List;

@Data
public class DataTableResult<T extends BaseEntity> extends BaseEntity {
    private int draw;
    private int recordsTotal;
    private int recordsFiltered;
    private List<T> data;

}
