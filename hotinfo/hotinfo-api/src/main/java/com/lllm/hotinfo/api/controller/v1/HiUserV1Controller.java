package com.lllm.hotinfo.api.controller.v1;

import com.lllm.hotinfo.api.service.HiUserService;

import com.lllm.hotinfo.common.dto.BaseResult;
import com.lllm.hotinfo.domain.entity.HiUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author carrot
 * @create 2018-09-26-23:09
 */
@RestController
@CrossOrigin(origins = "*", maxAge = 3600)
@RequestMapping(value = "v1/users")
public class HiUserV1Controller {
    @Autowired
    private HiUserService userService;
    @RequestMapping(value = "login", method = RequestMethod.POST)
    public BaseResult login(HiUser user) {
        return null;
    }

}
