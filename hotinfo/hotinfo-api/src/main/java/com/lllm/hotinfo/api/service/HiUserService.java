package com.lllm.hotinfo.api.service;

import com.lllm.hotinfo.domain.entity.HiUser;

/**
 * @author carrot
 * @create 2018-09-26-21:55
 */
public interface HiUserService {
    HiUser login(String phone, String password);

    void save(HiUser user);

    int count(HiUser user);
}
