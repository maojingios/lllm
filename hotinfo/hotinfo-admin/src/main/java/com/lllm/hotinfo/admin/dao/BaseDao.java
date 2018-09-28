package com.lllm.hotinfo.admin.dao;

import java.util.List;

public interface BaseDao <T> {

    List<T> selectAll();

    void insert(T t);

    void update(T t);

    List<T> page(T t);

    int count(T t);

    T getTById(long id);

    void delete(long id);

    void batchDelete(long array[]);
}
