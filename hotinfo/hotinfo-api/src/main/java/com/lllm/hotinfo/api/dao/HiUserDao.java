package com.lllm.hotinfo.api.dao;

import com.lllm.hotinfo.domain.entity.HiUser;
import org.springframework.stereotype.Repository;

/**
 * @author carrot
 * @create 2018-09-26-21:52
 */
@Repository
public interface HiUserDao {
    /**
     * 通过phone获取对象
     */
    HiUser getByPhone(String phone);

    /**
     * 插入新用户对象
     */
    void insert(HiUser user);

    /**
     * 更新用户信息
     */
    void update(HiUser user);

    /**
     * 查询
     */
    int count(HiUser user);
}
