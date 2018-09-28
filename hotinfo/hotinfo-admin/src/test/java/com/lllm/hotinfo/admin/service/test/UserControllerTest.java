package com.lllm.hotinfo.admin.service.test;

import com.lllm.hotinfo.admin.dao.UserDao;
import com.lllm.hotinfo.admin.service.UserService;
import com.lllm.hotinfo.domain.entity.HiUser;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.Date;

@RunWith(SpringRunner.class)
@ContextConfiguration(locations = {"classpath:spring-context.xml", "classpath:spring-context-druid.xml", "classpath:spring-context-mybatis.xml"})

public class UserControllerTest {

    @Autowired
    private UserService userService;
    @Autowired
    private UserDao userDao;

    @Test
    public void select(){
        for (int i = 0;i<30;i++){
            HiUser hiUser = new HiUser();
            hiUser.setUserName("234"+i);
            hiUser.setPassWord("123"+i);
            hiUser.setEmail("12344111"+i);
            hiUser.setPhone("2323"+i);
            hiUser.setRole(0);
            hiUser.setDelFlag(1);
            hiUser.setHeadUrl("123123");
            hiUser.setCreated(new Date());
            hiUser.setUpdated(new Date());
            userService.addUserTest(hiUser);
        }
    }

    @Test
    public void selectAll (){
        userService.selectAll();
    }

    @Test
    public void getByUserName(){
        System.out.println(userService.getByUserName("lvzhekang"));

    }

    @Test
    public void uniqueUserName(){
        HiUser hiUser = new HiUser();
        hiUser.setId(5L);
        hiUser.setUserName("lvzhekang");
        System.out.println(  userDao.uniqueUserName(hiUser));
    }

    @Test
    public void uniqueEmail(){
        HiUser hiUser = new HiUser();
        hiUser.setId(5L);
        hiUser.setEmail("lvzhekang@qq.com");
        System.out.println(userDao.uniqueEmail(hiUser)+"===================================");
    }

    @Test
    public void uniquePhone(){
        HiUser hiUser = new HiUser();
        hiUser.setId(5L);
        hiUser.setPhone("13866666666");
        System.out.println(userDao.uniquePhone(hiUser)+"===================================");
    }

    @Test
    public void update(){
        HiUser hiUser = new HiUser();
        hiUser.setId(5L);
        hiUser.setUserName("111111111");
        hiUser.setPassWord("1111111111");
        hiUser.setEmail("111111111");
        hiUser.setPhone("1111111111");
        hiUser.setRole(0);
        hiUser.setDelFlag(1);
        hiUser.setHeadUrl("11111111111111");
        hiUser.setUpdated(new Date());
        userDao.update(hiUser);
    }
    @Test
    public void delete(){
        userService.delete(6L);
    }

}
