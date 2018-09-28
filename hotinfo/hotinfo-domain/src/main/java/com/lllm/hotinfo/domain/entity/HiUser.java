package com.lllm.hotinfo.domain.entity;

import lombok.Data;

@Data
public class HiUser extends BaseEntity {
    private String userName;
    private String passWord;
    private String phone;
    private String email;

    private String headUrl;
    private int role;

    /**
     * 新密码和确认密码
     */
    private String NewPWD;
    private String verificationPWD;

    /**
     * 记住账号和自动登陆
     */
    private String isRemember;
    private String autoLogin;
}
