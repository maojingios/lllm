package com.lllm.hotinfo.admin.service.impl;

import com.lllm.hotinfo.admin.dao.TopContentDao;
import com.lllm.hotinfo.admin.service.TopContentService;
import com.lllm.hotinfo.domain.entity.TopContent;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service
public class TopContentServiceImpl extends BaseServiceImpl<TopContent, TopContentDao> implements TopContentService {
    /*更登陆功能的insert冲突,不能在父类写*/
    @Override
    public void insert(TopContent topContent) {

        topContent.setDelFlag(1);
        topContent.setCreated(new Date());
        topContent.setUpdated(new Date());
        dao.insert(topContent);
    }
    @Override
    public void update(TopContent topContent){
        topContent.setUpdated(new Date());
        dao.update(topContent);
    }

    @Override
    public void addUserTest(TopContent topContent) {

    }
}
