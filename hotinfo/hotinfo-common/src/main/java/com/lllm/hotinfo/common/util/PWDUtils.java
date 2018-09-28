package com.lllm.hotinfo.common.util;

import org.springframework.util.DigestUtils;

public class PWDUtils {
    public static String EncryptedPWD(String plantPassword,int num) {
        for (int i = 0; i < num; i++) {
            plantPassword = DigestUtils.md5DigestAsHex(plantPassword.getBytes());
        }
        return plantPassword;
    }
}
