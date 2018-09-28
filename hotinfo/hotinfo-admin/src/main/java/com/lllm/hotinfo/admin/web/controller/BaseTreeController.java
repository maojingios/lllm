package com.lllm.hotinfo.admin.web.controller;

import com.lllm.hotinfo.admin.service.BaseTreeService;
import com.lllm.hotinfo.domain.entity.BaseTreeEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.ParameterizedType;
import java.util.List;

public abstract class BaseTreeController<T extends BaseTreeEntity,S extends BaseTreeService<T>> {

    @Autowired
    protected S service;

    @ModelAttribute
    public T getEntity(String id) {
        T t = null;
        if (id == null || "0".equals(id)) {
            try {
                ParameterizedType ptype = (ParameterizedType) this.getClass().getGenericSuperclass();
                Class clazz = (Class<T>) ptype.getActualTypeArguments()[0];
                t = (T) clazz.newInstance();
            } catch (InstantiationException e) {
                e.printStackTrace();
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            }
        } else {
            t = service.getTById(Long.parseLong(id));
        }
        return t;
    }

    @ResponseBody
    @RequestMapping(value = "treeData", method = RequestMethod.GET)
    public List<T> treeData(Long id) {
        System.out.println(id+"==========================================");
        List<T> tree = service.selectByPid(id == null ? 0L : id);
        return tree;
    }

    @RequestMapping(value = "show" , method = RequestMethod.GET)
    public abstract String show(T t, Model model);

    @RequestMapping(value = "form" , method = RequestMethod.GET)
    public abstract String form(T t);

    @RequestMapping(value = "delete",method = RequestMethod.GET)
    public abstract String delete(HttpServletRequest req, RedirectAttributes redirectAttributes);

    protected void sortTree(long parentId, List<T> targetList) {
        List<T> list = service.selectByPid(parentId);
        for (T t : list) {
            targetList.add(t);
            if (t.isParent()) {
                sortTree(t.getId(), targetList);
            }
        }
    }
}
