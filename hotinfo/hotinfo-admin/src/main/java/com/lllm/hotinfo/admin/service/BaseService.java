package com.lllm.hotinfo.admin.service;

import com.lllm.hotinfo.domain.entity.BaseEntity;

import java.util.List;

public interface BaseService <T extends BaseEntity>{
    /**
     * 查询全部
     *
     * @return
     */
    List<T> selectAll();

    /**
     * 分页查询
     *
     * @param start  数据位置
     * @param length 每页笔数
     * @return
     */
    List<T> page(T t, int start, int length);

    /**
     * 查询总笔数
     *
     * @return
     */
    int count(T t);

    /**
     * 根据 ID 获取信息
     *
     * @param id
     * @return
     */
    T getTById(long id);

    /**
     * 根据 ID 删除数据
     *
     * @param id
     */
    void delete(long id);

    /**
     * 批量删除
     *
     * @param array
     * @return
     */
    void batchDelete(long array[]);

    /**
     * 添加
     */
    void insert(T t);

    /**
     * 修改
     */
    void update(T t);

    /**
     * 添加测试普通用户
     */
    void addUserTest(T t);
}
