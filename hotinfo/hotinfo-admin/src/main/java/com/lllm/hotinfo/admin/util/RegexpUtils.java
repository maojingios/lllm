package com.lllm.hotinfo.admin.util;

import org.springframework.stereotype.Component;
import org.springframework.ui.Model;

@Component
public class RegexpUtils {

    /**
     * 验证手机号
     */
    public static final String PHONE = "^(17[0-9]|13[0-9]|14[579]|15[0-3,5-9]|16[6]|17[0135678]|18[0-9]|19[89])\\d{8}$";

    /**
     * 验证邮箱地址
     */
    public static final String EMAIL = "^[a-zA-Z0-9_.-]+@[a-zA-Z0-9-]+(\\.[a-zA-Z0-9-]+)*\\.[a-zA-Z0-9]{2,6}$";

    /**
     * 验证手机号
     * @param phone
     * @return
     */

    public static boolean checkPhone(String phone) {
        return phone.matches(PHONE);
    }

    /**
     * 验证邮箱
     * @param email
     * @return
     */

    public static boolean checkEmail(String email) {
        return email.matches(EMAIL);
    }

    /**
     * 信息验证
     * @param model
     */
    public static void checkInfo(String results , Model model) {
        if ("1-1".equals(results )){
            model.addAttribute(SystemConstants.ERROR_INFO,"用户名不能为空");
        }
        else if ("1-2".equals(results )){
            model.addAttribute(SystemConstants.ERROR_INFO,"用户名不合规范");
        }
        else if ("1-3".equals(results )){
            model.addAttribute(SystemConstants.ERROR_INFO,"用户名已存在");
        }
        else if ("2-1".equals(results )){
            model.addAttribute(SystemConstants.ERROR_INFO,"原密码不能为空");
        }
        else if ("2-2".equals(results)){
            model.addAttribute(SystemConstants.ERROR_INFO,"原密码错误");
        }
        else if ("3-1".equals(results )){
            model.addAttribute(SystemConstants.ERROR_INFO,"新密码不能为空");
        }
        else if ("3-2".equals(results )){
            model.addAttribute(SystemConstants.ERROR_INFO,"新密码不能与旧密码相同");
        }
        else if ("3-3".equals(results )){
            model.addAttribute(SystemConstants.ERROR_INFO,"新密码长度不足");
        }
        else if ("4-1".equals(results )){
            model.addAttribute(SystemConstants.ERROR_INFO,"确认密码不能为空");
        }
        else if ("4-2".equals(results )){
            model.addAttribute(SystemConstants.ERROR_INFO,"确认密码与新密码不一致");
        }
        else if ("5-1".equals(results )){
            model.addAttribute(SystemConstants.ERROR_INFO,"电话不能为空");
        }
        else if ("5-2".equals(results)){
            model.addAttribute(SystemConstants.ERROR_INFO,"请输入正确的电话号码");
        }
        else if ("5-3".equals(results)){
            model.addAttribute(SystemConstants.ERROR_INFO,"此电话号码已存在");
        }
        else if ("6-1".equals(results)){
            model.addAttribute(SystemConstants.ERROR_INFO,"邮箱不能为空");
        }
        else if ("6-2".equals(results)){
            model.addAttribute(SystemConstants.ERROR_INFO,"请输入正确的邮箱");
        }
        else if ("6-3".equals(results)){
            model.addAttribute(SystemConstants.ERROR_INFO,"此邮箱已存在");
        }
    }
}
