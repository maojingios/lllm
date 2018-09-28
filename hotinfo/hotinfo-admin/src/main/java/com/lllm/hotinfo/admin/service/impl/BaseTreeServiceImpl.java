package com.lllm.hotinfo.admin.service.impl;

import com.lllm.hotinfo.admin.dao.BaseTreeDao;
import com.lllm.hotinfo.admin.service.BaseTreeService;
import com.lllm.hotinfo.domain.entity.BaseEntity;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public abstract class BaseTreeServiceImpl<T extends BaseEntity, D extends BaseTreeDao<T>> implements BaseTreeService<T> {

    @Autowired
    protected D Dao;

    @Override
    public List<T> selectAll() {
        return Dao.selectAll();
    }

    @Override
    public void insert(T t){
        Dao.insert(t);
    }

    @Override
    public List<T> selectByPid(long parentId) {
        return Dao.selectByPid(parentId);
    }

    @Override
    public T getTById(long id) {
        return Dao.getTById(id);
    }

    @Override
    public void delete(long id) {
        Dao.delete(id);
    }

    @Override
    public void update(T t) {
        Dao.update(t);
    }

}
