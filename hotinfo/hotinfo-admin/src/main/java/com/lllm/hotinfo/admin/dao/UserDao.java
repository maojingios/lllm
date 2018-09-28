package com.lllm.hotinfo.admin.dao;

import com.lllm.hotinfo.domain.entity.HiUser;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserDao extends BaseDao<HiUser>{

    int uniqueUserName (HiUser hiUser);

    int uniquePhone(HiUser hiUser);

    int uniqueEmail(HiUser hiUser);

    List<HiUser> selectUsers(HiUser hiUser);

    HiUser getByUserName(String userName);

    int checkACookie(HiUser hiUser);

}
