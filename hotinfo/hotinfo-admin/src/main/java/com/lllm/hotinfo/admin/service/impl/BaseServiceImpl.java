package com.lllm.hotinfo.admin.service.impl;

import com.lllm.hotinfo.admin.dao.BaseDao;
import com.lllm.hotinfo.admin.service.BaseService;
import com.lllm.hotinfo.domain.entity.BaseEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public abstract class BaseServiceImpl  <T extends BaseEntity,D extends BaseDao<T>> implements BaseService<T> {

    @Autowired
    protected D dao;

    @Override
    public List<T> selectAll() {
        return dao.selectAll();
    }

    @Override
    public List<T> page(T t, int start, int length) {
        t.setStart(start);
        t.setLength(length);
        return dao.page(t);
    }

    @Override
    public int count(T t) {
        return dao.count(t);
    }

    /**
     * 通过id得到'T'对象
     * @param id
     * @return
     */
    @Override
    public T getTById(long id) {
        return dao.getTById(id);
    }

    @Override
    @Transactional(readOnly = false)
    public void delete(long id) {
        dao.delete(id);
    }

    /**
     * 批量删除
     * @param array
     */
    @Override
    public void batchDelete(long[] array) {
        dao.batchDelete(array);
    }

    /**
     * 修改
     */
    @Override
    @Transactional(readOnly = false)
    public void update(T t){
        dao.update(t);
    }
    /**
     * 添加
     */
    @Override
    @Transactional(readOnly = false)
    public void insert(T t){
        dao.insert(t);
    }
}
