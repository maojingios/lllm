package com.lllm.hotinfo.admin.service;

import com.lllm.hotinfo.domain.entity.HiUser;

import java.util.List;

public interface UserService extends BaseService<HiUser> {

    HiUser getByUserName(String userName,String plantPassword);

    HiUser getByUserName(String userName);

    /**
     * 展示用户,除管理员自己外
     * @param admin
     * @return
     */
    List<HiUser> show(HiUser admin);

    /**
     * 后台输入框验证信息
     * @param hiUser
     * @param action
     * @return
     */
    String validationInfo(HiUser hiUser, String action);

    int checkACookie(HiUser hiUser);
}
