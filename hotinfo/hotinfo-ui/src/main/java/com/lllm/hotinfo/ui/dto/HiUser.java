package com.lllm.hotinfo.ui.dto;

import lombok.Data;

import java.io.Serializable;

/**
 * @author carrot
 * @create 2018-09-26-14:11
 */
@Data
public class HiUser implements Serializable {
    private String username;
    private String phone;
    private String password;
    private String code;


}
