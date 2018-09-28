package com.lllm.hotinfo.admin.service;

import com.lllm.hotinfo.domain.entity.BaseEntity;

import java.util.List;

public interface BaseTreeService<T extends BaseEntity>{
    List<T> selectAll();

    List<T> selectByPid(long parentId);

    T getTById(long id);

    void delete(long id);

    void update(T t);

    void insert(T t);

}
