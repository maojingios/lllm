package com.lllm.hotinfo.admin.service.impl;

import com.lllm.hotinfo.admin.dao.ContentDao;
import com.lllm.hotinfo.admin.service.ContentService;
import com.lllm.hotinfo.domain.entity.Content;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service
public class ContentServiceImpl extends BaseServiceImpl<Content,ContentDao> implements ContentService {
    /*更登陆功能的insert冲突,不能在父类写*/
    @Override
    public void insert(Content content) {

        content.setDelFlag(1);
        content.setCreated(new Date());
        content.setUpdated(new Date());
        dao.insert(content);
    }
    @Override
    public void update(Content content){
        content.setUpdated(new Date());
        dao.update(content);
    }

    @Override
    public void addUserTest(Content content) {

    }
}
