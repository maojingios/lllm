package com.lll.hotinfo.api.service.test;

import com.lllm.hotinfo.api.service.HiUserService;
import com.lllm.hotinfo.domain.entity.HiUser;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

/**
 * @author carrot
 * @create 2018-09-26-23:27
 */
@RunWith(SpringRunner.class)
@ContextConfiguration(locations = {"classpath:spring-context.xml", "classpath:spring-context-druid.xml", "classpath:spring-context-mybatis.xml"})
public class HiUserServiceTest {
    @Autowired
    private HiUserService userService;

    //@Test
    public void loginTest() {
        userService.login("138888888","123");
    }

    //@Test
    public void saveTest() {
        HiUser user = new HiUser();
        user.setPhone("15888888888");
        user.setPassWord("123");
        userService.save(user);
    }
    @Test
    public void countTest() {
        HiUser user = new HiUser();
        user.setPhone("13888");
        int i = userService.count(user);
        System.out.println(i);
    }
}
