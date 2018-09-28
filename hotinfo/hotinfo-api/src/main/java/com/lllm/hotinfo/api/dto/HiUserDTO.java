package com.lllm.hotinfo.api.dto;

import lombok.Data;

import java.io.Serializable;

/**
 * @author carrot
 * @create 2018-09-27-11:17
 */
@Data
public class HiUserDTO implements Serializable {
    private long id;
    private String userName;
    private String phone;
}
