package com.lllm.hotinfo.admin.service.impl;

import com.lllm.hotinfo.admin.dao.CategoryDao;
import com.lllm.hotinfo.admin.service.CategoryService;
import com.lllm.hotinfo.domain.entity.Category;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class CategoryServiceImpl extends BaseTreeServiceImpl<Category, CategoryDao> implements CategoryService {

    @Override
    public void insert(Category category){
        /*在加下一级分类的同时也把父类的isParent改为true*/
        Category categoryParent = Dao.getTById(category.getParentId());
        categoryParent.setParent(true);
        Dao.update(categoryParent);

        category.setDelFlag(1);
        category.setCreated(new Date());
        category.setUpdated(new Date());
        Dao.insert(category);
    }

    @Override
    public void update(Category tbContentCategory) {
        tbContentCategory.setUpdated(new Date());
        Dao.update(tbContentCategory);
    }

    @Override
    public void delete(long id) {
        /*遍历删除子类*/
        delSub(id);
        /*拿到自己的对象*/
        Category oneSelf = Dao.getTById(id);
        /*先删除自己再判断父类*/
        Dao.delete(id);
        /*拿到父类id*/
        long parentId = oneSelf.getParentId();
        if (Dao.countByPid(parentId)==0){
            Category father = Dao.getTById(parentId);
            father.setParent(false);
            Dao.update(father);
        }
    }
    private void delSub(long id){
        /*拿到子类集合*/
        List<Category> sublist = Dao.selectByPid(id);
        for (Category s : sublist) {
            Dao.delete(s.getId());
            if (Dao.selectByPid(s.getId())==null){
                return;
            }else {
                delSub(s.getId());
            }
        }
    }
}
