package com.lllm.hotinfo.admin.dao;

import java.util.List;

/**
 * 树形结构通用数据访问接口
 * <p>Title: BaseTreeDao</p>
 */

public interface BaseTreeDao<T> {

    List<T> selectAll();

    void insert(T t);

    List<T> selectByPid(long parentId);

    void update(T t);

    T getTById(long id);

    void delete(long id);

    int countByPid(long parentId);
}
