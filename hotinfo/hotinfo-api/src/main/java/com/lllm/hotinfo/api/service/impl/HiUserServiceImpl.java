package com.lllm.hotinfo.api.service.impl;

import com.lllm.hotinfo.api.dao.HiUserDao;
import com.lllm.hotinfo.api.service.HiUserService;
import com.lllm.hotinfo.domain.entity.HiUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import java.util.Date;
import java.util.Random;

/**
 * @author carrot
 * @create 2018-09-26-21:55
 */
@Service
public class HiUserServiceImpl implements HiUserService {
    @Autowired
    private HiUserDao userDao;

    @Override
    public HiUser login(String phone, String confirmPassword) {
        HiUser user = userDao.getByPhone(phone);
        if(user != null) {
            //将明文密码加密
            String password = DigestUtils.md5DigestAsHex(confirmPassword.getBytes());
            if(password.equals(user.getPassWord())) {
                return user;
            }
        }

        return null;
    }

    @Override
    public void save(HiUser user) {


        user.setUpdated(new Date());
        if(user.getId() == 0) {
            user.setCreated(new Date());
            user.setRole(0);
            user.setDelFlag(1);
            Random ran = new Random();
            int count = ran.nextInt(1000) + 7000;
            String username = "新民网友" + count;
            user.setUserName(username);

            userDao.insert(user);
        }

        else {
            userDao.update(user);
        }


    }

    @Override
    public int count(HiUser user) {
        return userDao.count(user);
    }
}
